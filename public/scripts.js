document.addEventListener('DOMContentLoaded', function() {
  const urlParams = new URLSearchParams(window.location.search);
  const email = urlParams.get('email');
  if (email) {
    document.getElementById('correo-estudiante').value = email;
    document.querySelector('.login-container').style.display = 'none';
    document.querySelector('.form-container').style.display = 'block';
  }
});

function validateLogin() {
  return false; // Desactivado porque ya no se usa este formulario
}

document.getElementById('form-combinado').addEventListener('submit', function (event) {
  event.preventDefault();
  const formData = new FormData(this);

  fetch('/submit', {
    method: 'POST',
    body: formData,
  })
  .then(response => response.text())
  .then(data => {
    document.querySelector('.form-container').style.display = 'none';
    document.getElementById('successMessage').style.display = 'block';
  })
  .catch(error => {
    console.error('Error:', error);
    document.getElementById('errorMessage').style.display = 'block';
  });
});

function registerNewRequest() {
  document.getElementById('form-combinado').reset();
  document.getElementById('facultad').innerHTML = '<option value="">Seleccione una facultad</option>';
  document.getElementById('carrera').innerHTML = '<option value="">Seleccione una carrera</option>';
  document.getElementById('successMessage').style.display = 'none';
  document.querySelector('.form-container').style.display = 'block';
}

// Función para actualizar facultades y carreras
function updateFacultades() {
  const facultadIntegrada = document.getElementById('facultad-integrada').value;
  const facultadSelect = document.getElementById('facultad');
  const carreraSelect = document.getElementById('carrera');

  facultadSelect.innerHTML = '<option value="">Seleccione una facultad</option>';
  carreraSelect.innerHTML = '<option value="">Seleccione una carrera</option>';

  let facultades = [];
  let carreras = [];

  switch (facultadIntegrada) {
    case 'FAMED-FAEST-FAENF':
      facultades = ['MEDICINA', 'ENFERMERIA', 'TECNOLOGIA MEDICA', 'ESTOMATOLOGIA'];
      break;
    case 'UFBI':
      facultades = ['UFBI'];
      break;
    case 'FASPA-FAPSI-FAEDU':
      facultades = ['SALUD PUBLICA', 'PSICOLOGIA', 'EDUCACION'];
      break;
    case 'FACIE-FAVEZ':
      facultades = ['VETERINARIA', 'CIENCIAS E INGENIERIA'];
      break;
  }

  facultadSelect.innerHTML += facultades.map(facultad => `<option value="${facultad}">${facultad}</option>`).join('');
  facultadSelect.addEventListener('change', updateCarreras);
}

function updateCarreras() {
  const facultad = document.getElementById('facultad').value;
  const carreraSelect = document.getElementById('carrera');

  carreraSelect.innerHTML = '<option value="">Seleccione una carrera</option>';

  let carreras = [];

  switch (facultad) {
    case 'MEDICINA':
      carreras = ['MEDICINA'];
      break;
    case 'ENFERMERIA':
      carreras = ['ENFERMERIA'];
      break;
    case 'TECNOLOGIA MEDICA':
      carreras = ['RADIOLOGIA', 'TERAPIA DE AUDICION VOZ Y LENGUAJE', 'TERAPIA FISICA Y REHABILITACION', 'URGENCIAS MEDICAS'];
      break;
    case 'ESTOMATOLOGIA':
      carreras = ['ESTOMATOLOGIA'];
      break;
    case 'UFBI':
      carreras = ['UFBI'];
      break;
    case 'SALUD PUBLICA':
      carreras = ['ADMINISTRACION EN SALUD', 'ADMINISTRACION', 'SALUD PUBLICA Y SALUD GLOBAL'];
      break;
    case 'PSICOLOGIA':
      carreras = ['PSICOLOGIA'];
      break;
    case 'EDUCACION':
      carreras = ['EDUCACION PRIMARIA', 'EDUCACION INICIAL'];
      break;
    case 'VETERINARIA':
      carreras = ['VETERINARIA'];
      break;
    case 'CIENCIAS E INGENIERIA':
      carreras = ['BIOLOGIA', 'FARMACIA Y BIOQUIMICA', 'NUTRICIÓN', 'QUIMICA', 'ING. INFORMATICA', 'ING. BIOMEDICA', 'ING. AMBIENTAL', 'ING. INDUSTRIAL'];
      break;
  }

  carreraSelect.innerHTML += carreras.map(carrera => `<option value="${carrera}">${carrera}</option>`).join('');
}

function addTipoTramiteToAsunto() {
  const tipoTramite = document.getElementById('tipo-tramite').value;
  const asuntoField = document.getElementById('asunto');
  asuntoField.value = `Tramite: ${tipoTramite} - ${asuntoField.value}`;
  return true;
}

