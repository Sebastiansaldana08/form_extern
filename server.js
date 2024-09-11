const express = require('express');
const multer = require('multer');
const { Pool } = require('pg');
const session = require('express-session');
const passport = require('passport');
const { google } = require('googleapis');
const path = require('path');
const upload = multer();
const app = express();
const port = 3001;

const GOOGLE_CLIENT_ID = '634494971392-8pkieltc9jitmsnob37b930oqrhbqgia.apps.googleusercontent.com';
const GOOGLE_CLIENT_SECRET = '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';
const GOOGLE_REDIRECT_URL = process.env.NODE_ENV === 'production'
  ? 'https://form-extern.vercel.app/auth/google/callback'
  : 'http://localhost:3001/auth/google/callback';

let userProfile;
let oauth2Client;

// Configuración de la base de datos PostgreSQL
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'estudiantesdb',
  password: 'Sebas1011',
  port: 5432,
});

// Servir archivos estáticos desde la carpeta 'public'
app.use(express.static(path.join(__dirname, 'public')));
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Middleware para configurar la codificación UTF-8
app.use((req, res, next) => {
    res.setHeader('Content-Type', 'text/html; charset=UTF-8');
    next();
});

app.use(session({
  resave: false,
  saveUninitialized: true,
  secret: 'SECRET'
}));
app.use(passport.initialize());
app.use(passport.session());

passport.serializeUser(function(user, done) {
  done(null, user);
});

passport.deserializeUser(function(obj, done) {
  done(null, obj);
});

passport.use(new (require('passport-google-oauth').OAuth2Strategy)({
  clientID: GOOGLE_CLIENT_ID,
  clientSecret: GOOGLE_CLIENT_SECRET,
  callbackURL: GOOGLE_REDIRECT_URL
},
function(accessToken, refreshToken, profile, done) {
  userProfile = profile;
  oauth2Client = new google.auth.OAuth2(
    GOOGLE_CLIENT_ID,
    GOOGLE_CLIENT_SECRET,
    GOOGLE_REDIRECT_URL
  );
  oauth2Client.setCredentials({
    access_token: accessToken,
    refresh_token: refreshToken
  });
  profile.refreshToken = refreshToken;
  return done(null, { profile, accessToken, refreshToken });
}
));

app.get('/auth/google',
  passport.authenticate('google', {
    scope: ['profile', 'email', 'https://www.googleapis.com/auth/gmail.send'],
    accessType: 'offline',
    prompt: 'consent'
  }));

app.get('/auth/google/callback',
  passport.authenticate('google', { failureRedirect: '/error' }),
  function(req, res) {
    res.redirect('/form');
  });

app.get('/form', (req, res) => {
  res.render('pages/form', { email: req.user.profile.emails[0].value });
});

// RUTA PARA LA PÁGINA PRINCIPAL
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html')); // Usa el módulo path para construir la ruta correctamente
});

app.post('/submit', upload.fields([{ name: 'archivo1' }, { name: 'archivo2' }, { name: 'correo-archivo1' }, { name: 'correo-archivo2' }]), async (req, res) => {
  const { 'tipo-tramite': tipoTramite, documento, nombres, apellidos, celular, 'correo-alternativo': correoAlternativo, 'facultad-integrada': facultadIntegrada, facultad, carrera, 'anio-estudio': anioEstudio, descripcion, asunto, 'descripcion-correo': descripcionCorreo } = req.body;

  const correoEstudiante = req.user.profile.emails[0].value;

  if (!req.user.refreshToken) {
    return res.status(500).send('Error: No refresh token available.');
  }

  oauth2Client.setCredentials({
    refresh_token: req.user.refreshToken
  });

  try {
    const { token } = await oauth2Client.getAccessToken();
    oauth2Client.setCredentials({
      access_token: token,
      refresh_token: req.user.refreshToken
    });
  } catch (error) {
    console.error('Error getting access token:', error);
    return res.status(500).send('Error al obtener el token de acceso.');
  }

  const gmail = google.gmail({ version: 'v1', auth: oauth2Client });

  const encodeMessage = (message) => {
    return Buffer.from(message, 'utf-8')
      .toString('base64')
      .replace(/\+/g, '-')
      .replace(/\//g, '_')
      .replace(/=+$/, '');
  };

  let facultadIntegradaCorreo;
  let carreraCorreo;

  switch (facultadIntegrada) {
    case 'FAMED-FAEST-FAENF':
      facultadIntegradaCorreo = 'famed-faest-faenf.sac@oficinas-upch.pe';
      break;
    case 'UFBI':
      facultadIntegradaCorreo = 'ufbi.secretaria.academica@oficinas-upch.pe';
      break;
    case 'FASPA-FAPSI-FAEDU':
      facultadIntegradaCorreo = 'faedu-faspa-fapsi.sac@oficinas-upch.pe';
      break;
    case 'FACIE-FAVEZ':
      facultadIntegradaCorreo = 'facien-favez.sac@oficinas-upch.pe';
      break;
    default:
      facultadIntegradaCorreo = '';
  }

  switch (facultad) {
    case 'MEDICINA':
      carreraCorreo = 'silvana.sarabia@upch.pe';
      break;
    case 'ENFERMERIA':
      carreraCorreo = 'ALISSON.LIMAYLLA.V@upch.pe';
      break;
    case 'TECNOLOGIA MEDICA':
      carreraCorreo = 'rocio.aliaga@upch.pe';
      break;
    case 'ESTOMATOLOGIA':
      carreraCorreo = 'natalie.hadad@upch.pe';
      break;
    case 'UFBI':
      carreraCorreo = 'johanna.saldana@upch.pe';
      break;
    case 'SALUD PUBLICA':
    case 'PSICOLOGIA':
    case 'EDUCACION':
      carreraCorreo = 'melania.gutierrez.y@upch.pe';
      break;
    case 'VETERINARIA':
    case 'CIENCIAS E INGENIERIA':
      carreraCorreo = 'jose.abanto.q@upch.pe';
      break;
    default:
      carreraCorreo = '';
  }

  const messageParts = [
    `From: ${correoEstudiante}`,
    `To: ${facultadIntegradaCorreo}`,
    `Cc: ${carreraCorreo}`,
    'Bcc: matricula.pregrado@oficinas-upch.pe',
    `Subject: [FORMULARIO] ${asunto}`,
    'Content-Type: text/plain; charset="UTF-8"',
    '',
    descripcionCorreo,
  ];
  const message = messageParts.join('\n');

  gmail.users.messages.send({
    userId: 'me',
    requestBody: {
      raw: encodeMessage(message),
    },
  }, (err, result) => {
    if (err) {
      console.error('Error:', err);
      return res.status(500).send('Error al enviar el correo.');
    } else {
      console.log('Correo enviado:', result.data);
      return res.status(200).send('Correo enviado exitosamente!');
    }
  });
});

// Inicia el servidor en el puerto especificado
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});



