--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-07-30 14:12:59

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4844 (class 1262 OID 16399)
-- Name: estudiantesdb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE estudiantesdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';


ALTER DATABASE estudiantesdb OWNER TO postgres;

\connect estudiantesdb

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4838 (class 0 OID 16412)
-- Dependencies: 218
-- Data for Name: formularios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (3, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, NULL, 'MEDICINA', 'MEDICINA', NULL, 'bffdfbfbbfbfd');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (4, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, NULL, 'PSICOLOGIA', 'PSICOLOGIA', NULL, 'vddsvdvdsv');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (5, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, NULL, 'MEDICINA', 'MEDICINA', NULL, 'btrbtbtrbtrbbtb');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (6, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, NULL, 'MEDICINA', 'MEDICINA', NULL, 'ntynytntymty');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (7, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, NULL, 'MEDICINA', 'MEDICINA', NULL, 'nnyntynytnnnty');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (8, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, NULL, 'MEDICINA', 'MEDICINA', NULL, 'Buenfkofjeifeiferifnr');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (9, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, NULL, 'MEDICINA', 'MEDICINA', NULL, 'ferfrgrrtgtrgttbt');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (10, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, NULL, 'MEDICINA', 'MEDICINA', NULL, 'ferfrgrrtgtrgttbt');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (11, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, NULL, 'SALUD PUBLICA', 'ADMINISTRACION EN SALUD', NULL, 'fewfefefvevvqevrvre');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (12, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, NULL, 'SALUD PUBLICA', 'ADMINISTRACION EN SALUD', NULL, 'dwdefewewrrverreverbebeee');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (13, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, 'FAMED-FAEST-FAENF', 'MEDICINA', 'MEDICINA', NULL, 'hjjukkukkikukkgukiukk');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (14, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, 'FAMED-FAEST-FAENF', 'MEDICINA', 'MEDICINA', NULL, 'fregrgrrtgrtgrtgrtggtrg');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (15, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, NULL, 'MEDICINA', 'MEDICINA', NULL, 'tjtyjtyjyjjty');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (16, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, NULL, 'MEDICINA', 'MEDICINA', NULL, 'ynyumuymu');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (17, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, 'FAMED-FAEST-FAENF', 'MEDICINA', 'MEDICINA', NULL, 'fbrbtrbbrtb');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (18, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, NULL, 'MEDICINA', 'MEDICINA', NULL, 'hyhythyujyujyuj');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (19, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, 'FAMED-FAEST-FAENF', 'MEDICINA', 'MEDICINA', NULL, 'erergrgrrgrg');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (20, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, 'UFBI', 'UFBI', 'UFBI', NULL, 'fferfegegergreg');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (21, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, 'FASPA-FAPSI-FAEDU', 'SALUD PUBLICA', 'ADMINISTRACION EN SALUD', NULL, 'ttytytbtyjjyjyjyjj');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (22, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, 'FACIE-FAVEZ', 'CIENCIAS E INGENIERIA', 'ING. INFORMATICA', NULL, 'rertertrettet');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (23, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, 'FASPA-FAPSI-FAEDU', 'PSICOLOGIA', 'PSICOLOGIA', NULL, 'vrbrbrtbtrbb');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (24, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, 'FASPA-FAPSI-FAEDU', 'EDUCACION', 'EDUCACION INICIAL', NULL, 'trbtbbrtbtbtr');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (25, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, 'FASPA-FAPSI-FAEDU', 'EDUCACION', 'EDUCACION INICIAL', NULL, 'grgrtgtg');
INSERT INTO public.formularios (id, tipo_tramite, documento, nombres, apellidos, celular, correo_alternativo, facultad_integrada, facultad, carrera, anio_estudio, descripcion) VALUES (26, NULL, '72733152', 'Sebastián Antonio', 'Saldaña Rodríguez', '97254199', NULL, 'FASPA-FAPSI-FAEDU', 'EDUCACION', 'EDUCACION INICIAL', NULL, 'gttgtgtgtgtgt');


--
-- TOC entry 4846 (class 0 OID 0)
-- Dependencies: 217
-- Name: formularios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formularios_id_seq', 26, true);


-- Completed on 2024-07-30 14:12:59

--
-- PostgreSQL database dump complete
--

