--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: fn_insertar_operacion(integer, character varying, character varying, text); Type: FUNCTION; Schema: public; Owner: johel
--

CREATE FUNCTION fn_insertar_operacion(_usuario_id integer, _aud_modulo character varying, _aud_accion character varying, _operacion text) RETURNS void
    LANGUAGE plpgsql
    AS $$
declare
_aud_modulo_id integer;
_aud_accion_id integer;
begin
	select id into _aud_modulo_id from aud_modulos where modulo=_aud_modulo;
	if _aud_modulo_id is null then
		insert into aud_modulos(modulo) values(_aud_modulo);
		select last_value into _aud_modulo_id from aud_modulos_id_seq;
	end if;

	select id into _aud_accion_id from aud_acciones where accion=_aud_accion;
	if _aud_accion_id is null then
		insert into aud_acciones(accion) values(_aud_accion);
		select last_value into _aud_accion_id from aud_acciones_id_seq;
	end if;

	insert into aud_operaciones(usuario_fkey,aud_modulo_fkey,aud_accion_fkey,operacion,creado)
	values(_usuario_id,_aud_modulo_id,_aud_accion_id,_operacion,extract('epoch' from LOCALTIMESTAMP(0)));
end;
$$;


ALTER FUNCTION public.fn_insertar_operacion(_usuario_id integer, _aud_modulo character varying, _aud_accion character varying, _operacion text) OWNER TO johel;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: administradores; Type: TABLE; Schema: public; Owner: johel; Tablespace: 
--

CREATE TABLE administradores (
    id integer NOT NULL,
    cedula character varying(15) NOT NULL,
    primer_nombre character varying(30) NOT NULL,
    segundo_nombre character varying(30),
    primer_apellido character varying(30) NOT NULL,
    segundo_apellido character varying(30)
);


ALTER TABLE public.administradores OWNER TO johel;

--
-- Name: administradores_id_seq; Type: SEQUENCE; Schema: public; Owner: johel
--

CREATE SEQUENCE administradores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.administradores_id_seq OWNER TO johel;

--
-- Name: administradores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: johel
--

ALTER SEQUENCE administradores_id_seq OWNED BY administradores.id;


--
-- Name: administrativos; Type: TABLE; Schema: public; Owner: johel; Tablespace: 
--

CREATE TABLE administrativos (
    id integer NOT NULL,
    cedula character varying(15) NOT NULL,
    primer_nombre character varying(30) NOT NULL,
    segundo_nombre character varying(30),
    primer_apellido character varying(30) NOT NULL,
    segundo_apellido character varying(30)
);


ALTER TABLE public.administrativos OWNER TO johel;

--
-- Name: administrativos_id_seq; Type: SEQUENCE; Schema: public; Owner: johel
--

CREATE SEQUENCE administrativos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.administrativos_id_seq OWNER TO johel;

--
-- Name: administrativos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: johel
--

ALTER SEQUENCE administrativos_id_seq OWNED BY administrativos.id;


--
-- Name: alumnos; Type: TABLE; Schema: public; Owner: johel; Tablespace: 
--

CREATE TABLE alumnos (
    id integer NOT NULL,
    cedula character varying(15) NOT NULL,
    primer_nombre character varying(30) NOT NULL,
    segundo_nombre character varying(30),
    primer_apellido character varying(30) NOT NULL,
    segundo_apellido character varying(30)
);


ALTER TABLE public.alumnos OWNER TO johel;

--
-- Name: alumnos_id_seq; Type: SEQUENCE; Schema: public; Owner: johel
--

CREATE SEQUENCE alumnos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alumnos_id_seq OWNER TO johel;

--
-- Name: alumnos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: johel
--

ALTER SEQUENCE alumnos_id_seq OWNED BY alumnos.id;


--
-- Name: aud_acciones; Type: TABLE; Schema: public; Owner: johel; Tablespace: 
--

CREATE TABLE aud_acciones (
    id integer NOT NULL,
    accion character varying(50) NOT NULL
);


ALTER TABLE public.aud_acciones OWNER TO johel;

--
-- Name: aud_acciones_id_seq; Type: SEQUENCE; Schema: public; Owner: johel
--

CREATE SEQUENCE aud_acciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aud_acciones_id_seq OWNER TO johel;

--
-- Name: aud_acciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: johel
--

ALTER SEQUENCE aud_acciones_id_seq OWNED BY aud_acciones.id;


--
-- Name: aud_modulos; Type: TABLE; Schema: public; Owner: johel; Tablespace: 
--

CREATE TABLE aud_modulos (
    id integer NOT NULL,
    modulo character varying(50) NOT NULL
);


ALTER TABLE public.aud_modulos OWNER TO johel;

--
-- Name: aud_modulos_id_seq; Type: SEQUENCE; Schema: public; Owner: johel
--

CREATE SEQUENCE aud_modulos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aud_modulos_id_seq OWNER TO johel;

--
-- Name: aud_modulos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: johel
--

ALTER SEQUENCE aud_modulos_id_seq OWNED BY aud_modulos.id;


--
-- Name: aud_operaciones; Type: TABLE; Schema: public; Owner: johel; Tablespace: 
--

CREATE TABLE aud_operaciones (
    id integer NOT NULL,
    usuario_fkey integer NOT NULL,
    aud_modulo_fkey integer NOT NULL,
    aud_accion_fkey integer NOT NULL,
    operacion text NOT NULL,
    creado integer NOT NULL
);


ALTER TABLE public.aud_operaciones OWNER TO johel;

--
-- Name: aud_operaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: johel
--

CREATE SEQUENCE aud_operaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aud_operaciones_id_seq OWNER TO johel;

--
-- Name: aud_operaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: johel
--

ALTER SEQUENCE aud_operaciones_id_seq OWNED BY aud_operaciones.id;


--
-- Name: ci_sessions; Type: TABLE; Schema: public; Owner: johel; Tablespace: 
--

CREATE TABLE ci_sessions (
    session_id character varying(40) DEFAULT '0'::character varying NOT NULL,
    ip_address character varying(45) DEFAULT '0'::character varying NOT NULL,
    user_agent character varying(120) NOT NULL,
    last_activity integer DEFAULT 0 NOT NULL,
    user_data text NOT NULL
);


ALTER TABLE public.ci_sessions OWNER TO johel;

--
-- Name: docentes; Type: TABLE; Schema: public; Owner: johel; Tablespace: 
--

CREATE TABLE docentes (
    id integer NOT NULL,
    cedula character varying(15) NOT NULL,
    primer_nombre character varying(20) NOT NULL,
    segundo_nombre character varying(20),
    primer_apellido character varying(20) NOT NULL,
    segundo_apellido character varying(20),
    sexo character varying(10) NOT NULL,
    fecha_nacimiento date NOT NULL,
    CONSTRAINT docentes_sexo_check CHECK ((((sexo)::text = 'masculino'::text) OR ((sexo)::text = 'femenino'::text)))
);


ALTER TABLE public.docentes OWNER TO johel;

--
-- Name: docentes_id_seq; Type: SEQUENCE; Schema: public; Owner: johel
--

CREATE SEQUENCE docentes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.docentes_id_seq OWNER TO johel;

--
-- Name: docentes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: johel
--

ALTER SEQUENCE docentes_id_seq OWNED BY docentes.id;


--
-- Name: estados; Type: TABLE; Schema: public; Owner: johel; Tablespace: 
--

CREATE TABLE estados (
    id integer NOT NULL,
    estado character varying(50) NOT NULL
);


ALTER TABLE public.estados OWNER TO johel;

--
-- Name: estados_id_seq; Type: SEQUENCE; Schema: public; Owner: johel
--

CREATE SEQUENCE estados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estados_id_seq OWNER TO johel;

--
-- Name: estados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: johel
--

ALTER SEQUENCE estados_id_seq OWNED BY estados.id;


--
-- Name: grupos; Type: TABLE; Schema: public; Owner: johel; Tablespace: 
--

CREATE TABLE grupos (
    id integer NOT NULL,
    grupo character varying(50) NOT NULL,
    tabla character varying(50) NOT NULL,
    status character varying(15) DEFAULT 'activo'::character varying NOT NULL
);


ALTER TABLE public.grupos OWNER TO johel;

--
-- Name: grupos_id_seq; Type: SEQUENCE; Schema: public; Owner: johel
--

CREATE SEQUENCE grupos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupos_id_seq OWNER TO johel;

--
-- Name: grupos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: johel
--

ALTER SEQUENCE grupos_id_seq OWNED BY grupos.id;


--
-- Name: modulos; Type: TABLE; Schema: public; Owner: johel; Tablespace: 
--

CREATE TABLE modulos (
    id integer NOT NULL,
    modulo character varying(50) NOT NULL,
    alias character varying(50) NOT NULL,
    status character varying(20) DEFAULT 'activo'::character varying NOT NULL
);


ALTER TABLE public.modulos OWNER TO johel;

--
-- Name: modulos_id_seq; Type: SEQUENCE; Schema: public; Owner: johel
--

CREATE SEQUENCE modulos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modulos_id_seq OWNER TO johel;

--
-- Name: modulos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: johel
--

ALTER SEQUENCE modulos_id_seq OWNED BY modulos.id;


--
-- Name: municipios; Type: TABLE; Schema: public; Owner: johel; Tablespace: 
--

CREATE TABLE municipios (
    id integer NOT NULL,
    municipio character varying(50) NOT NULL,
    estado_fkey integer NOT NULL
);


ALTER TABLE public.municipios OWNER TO johel;

--
-- Name: municipios_id_seq; Type: SEQUENCE; Schema: public; Owner: johel
--

CREATE SEQUENCE municipios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.municipios_id_seq OWNER TO johel;

--
-- Name: municipios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: johel
--

ALTER SEQUENCE municipios_id_seq OWNED BY municipios.id;


--
-- Name: parroquias; Type: TABLE; Schema: public; Owner: johel; Tablespace: 
--

CREATE TABLE parroquias (
    id integer NOT NULL,
    parroquia character varying(50) NOT NULL,
    municipio_fkey integer NOT NULL
);


ALTER TABLE public.parroquias OWNER TO johel;

--
-- Name: parroquias_id_seq; Type: SEQUENCE; Schema: public; Owner: johel
--

CREATE SEQUENCE parroquias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parroquias_id_seq OWNER TO johel;

--
-- Name: parroquias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: johel
--

ALTER SEQUENCE parroquias_id_seq OWNED BY parroquias.id;


--
-- Name: permisos; Type: TABLE; Schema: public; Owner: johel; Tablespace: 
--

CREATE TABLE permisos (
    id integer NOT NULL,
    permiso character varying(50) NOT NULL,
    status character varying(15) NOT NULL,
    orden integer DEFAULT 0 NOT NULL,
    modulo_fkey integer NOT NULL
);


ALTER TABLE public.permisos OWNER TO johel;

--
-- Name: permisos_id_seq; Type: SEQUENCE; Schema: public; Owner: johel
--

CREATE SEQUENCE permisos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permisos_id_seq OWNER TO johel;

--
-- Name: permisos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: johel
--

ALTER SEQUENCE permisos_id_seq OWNED BY permisos.id;


--
-- Name: planteles; Type: TABLE; Schema: public; Owner: johel; Tablespace: 
--

CREATE TABLE planteles (
    id integer NOT NULL,
    dea character varying(15) NOT NULL,
    rif character varying(15) NOT NULL,
    nombre character varying(50) NOT NULL,
    direccion text NOT NULL,
    parroquia_fkey integer NOT NULL,
    telefono_plantel character varying(15) NOT NULL,
    email_plantel character varying(100) NOT NULL,
    cedula_director character varying(10) NOT NULL,
    titulo_director character varying(10) NOT NULL,
    nombre_director character varying(50) NOT NULL,
    telefono_director character varying(15) NOT NULL,
    email_director character varying(50) NOT NULL
);


ALTER TABLE public.planteles OWNER TO johel;

--
-- Name: planteles_id_seq; Type: SEQUENCE; Schema: public; Owner: johel
--

CREATE SEQUENCE planteles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planteles_id_seq OWNER TO johel;

--
-- Name: planteles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: johel
--

ALTER SEQUENCE planteles_id_seq OWNED BY planteles.id;


--
-- Name: representantes; Type: TABLE; Schema: public; Owner: johel; Tablespace: 
--

CREATE TABLE representantes (
    id integer NOT NULL,
    cedula character varying(15) NOT NULL,
    primer_nombre character varying(30) NOT NULL,
    segundo_nombre character varying(30),
    primer_apellido character varying(30) NOT NULL,
    segundo_apellido character varying(30)
);


ALTER TABLE public.representantes OWNER TO johel;

--
-- Name: representantes_id_seq; Type: SEQUENCE; Schema: public; Owner: johel
--

CREATE SEQUENCE representantes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.representantes_id_seq OWNER TO johel;

--
-- Name: representantes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: johel
--

ALTER SEQUENCE representantes_id_seq OWNED BY representantes.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: johel; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    rol character varying(50) NOT NULL,
    status character varying(15) NOT NULL
);


ALTER TABLE public.roles OWNER TO johel;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: johel
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO johel;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: johel
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: johel; Tablespace: 
--

CREATE TABLE usuarios (
    id integer NOT NULL,
    usuario character varying(20) NOT NULL,
    email character varying(50) NOT NULL,
    clave character varying(128),
    status character varying(15) NOT NULL,
    rol_fkey integer NOT NULL,
    grupo_fkey integer NOT NULL,
    grupo_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.usuarios OWNER TO johel;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: johel
--

CREATE SEQUENCE usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_seq OWNER TO johel;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: johel
--

ALTER SEQUENCE usuarios_id_seq OWNED BY usuarios.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: johel
--

ALTER TABLE ONLY administradores ALTER COLUMN id SET DEFAULT nextval('administradores_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: johel
--

ALTER TABLE ONLY administrativos ALTER COLUMN id SET DEFAULT nextval('administrativos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: johel
--

ALTER TABLE ONLY alumnos ALTER COLUMN id SET DEFAULT nextval('alumnos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: johel
--

ALTER TABLE ONLY aud_acciones ALTER COLUMN id SET DEFAULT nextval('aud_acciones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: johel
--

ALTER TABLE ONLY aud_modulos ALTER COLUMN id SET DEFAULT nextval('aud_modulos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: johel
--

ALTER TABLE ONLY aud_operaciones ALTER COLUMN id SET DEFAULT nextval('aud_operaciones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: johel
--

ALTER TABLE ONLY docentes ALTER COLUMN id SET DEFAULT nextval('docentes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: johel
--

ALTER TABLE ONLY estados ALTER COLUMN id SET DEFAULT nextval('estados_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: johel
--

ALTER TABLE ONLY grupos ALTER COLUMN id SET DEFAULT nextval('grupos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: johel
--

ALTER TABLE ONLY modulos ALTER COLUMN id SET DEFAULT nextval('modulos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: johel
--

ALTER TABLE ONLY municipios ALTER COLUMN id SET DEFAULT nextval('municipios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: johel
--

ALTER TABLE ONLY parroquias ALTER COLUMN id SET DEFAULT nextval('parroquias_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: johel
--

ALTER TABLE ONLY permisos ALTER COLUMN id SET DEFAULT nextval('permisos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: johel
--

ALTER TABLE ONLY planteles ALTER COLUMN id SET DEFAULT nextval('planteles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: johel
--

ALTER TABLE ONLY representantes ALTER COLUMN id SET DEFAULT nextval('representantes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: johel
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: johel
--

ALTER TABLE ONLY usuarios ALTER COLUMN id SET DEFAULT nextval('usuarios_id_seq'::regclass);


--
-- Data for Name: administradores; Type: TABLE DATA; Schema: public; Owner: johel
--

COPY administradores (id, cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido) FROM stdin;
\.


--
-- Name: administradores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: johel
--

SELECT pg_catalog.setval('administradores_id_seq', 1, false);


--
-- Data for Name: administrativos; Type: TABLE DATA; Schema: public; Owner: johel
--

COPY administrativos (id, cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido) FROM stdin;
\.


--
-- Name: administrativos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: johel
--

SELECT pg_catalog.setval('administrativos_id_seq', 1, false);


--
-- Data for Name: alumnos; Type: TABLE DATA; Schema: public; Owner: johel
--

COPY alumnos (id, cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido) FROM stdin;
\.


--
-- Name: alumnos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: johel
--

SELECT pg_catalog.setval('alumnos_id_seq', 1, false);


--
-- Data for Name: aud_acciones; Type: TABLE DATA; Schema: public; Owner: johel
--

COPY aud_acciones (id, accion) FROM stdin;
2	b
3	login
5	logout
6	insertar
7	editar
\.


--
-- Name: aud_acciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: johel
--

SELECT pg_catalog.setval('aud_acciones_id_seq', 7, true);


--
-- Data for Name: aud_modulos; Type: TABLE DATA; Schema: public; Owner: johel
--

COPY aud_modulos (id, modulo) FROM stdin;
4	m4
5	usuarios
6	modulos
9	planteles
\.


--
-- Name: aud_modulos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: johel
--

SELECT pg_catalog.setval('aud_modulos_id_seq', 9, true);


--
-- Data for Name: aud_operaciones; Type: TABLE DATA; Schema: public; Owner: johel
--

COPY aud_operaciones (id, usuario_fkey, aud_modulo_fkey, aud_accion_fkey, operacion, creado) FROM stdin;
84	1	5	6	{usuario:johel, email:johel@localhost.com, grupo_fkey:1, rol_fkey:2}	1379287000
85	1	5	5	Cierre de sesión	1379287037
86	1	5	3	Inicio de sesión	1379287045
87	1	5	5	Cierre de sesión	1379288282
88	1	5	3	Inicio de sesión	1379288643
89	1	5	5	Cierre de sesión	1379288688
90	1	5	3	Inicio de sesión	1379289132
91	1	5	5	Cierre de sesión	1379289151
92	1	5	3	Inicio de sesión	1379289202
93	1	5	5	Cierre de sesión	1379289246
94	1	5	3	Inicio de sesión	1379289266
95	1	5	5	Cierre de sesión	1379289269
96	1	5	3	Inicio de sesión	1379289359
97	1	5	5	Cierre de sesión	1379289600
98	1	5	3	Inicio de sesión	1379289614
99	1	5	5	Cierre de sesión	1379291915
100	1	5	3	Inicio de sesión	1379292092
101	1	5	3	Inicio de sesión	1379763368
102	1	6	6	{modulo:Usuarios,alias:usuarios,descripcion:Administrador de usuarios}	1379763990
103	1	6	6	{modulo:Grupos,alias:grupos,descripcion:Administrador de Grupos}	1379764025
104	1	6	6	{modulo:Permisos,alias:permisos,descripcion:Administrador de permisos y roles}	1379764047
105	1	6	6	{modulo:Módulos,alias:modulos,descripcion:Administrador de módulos}	1379764068
106	1	5	3	Inicio de sesión	1380054377
107	1	5	5	Cierre de sesión	1380059090
108	1	5	3	Inicio de sesión	1380113604
109	1	5	3	Inicio de sesión	1380141560
110	1	5	3	Inicio de sesión	1380311021
111	1	5	3	Inicio de sesión	1380583285
112	1	5	3	Inicio de sesión	1380651068
113	1	9	6	{"dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380651894
114	1	9	6	{"dea":"S000000002","rif":"J172580265","nombre_plantel":"U. E. LUIS ALFREDO COLOMINE","direccion":"AVENIDA 32","estado":"7","municipio":"90","parroquia":"295","telefono_plantel":"0241-8887845","email_plantel":"admin@colomine.com","cedula_director":"V17258026","titulo_director":"LIC.","nombre_director":"JAILYN A. SANCHEZ DE CEDIEL","telefono_director":"0416-6482400","email_director":"JAILYN8@GMAIL.COM"}	1380653001
115	1	5	5	Cierre de sesión	1380653453
116	1	5	3	Inicio de sesión	1380723039
117	1	5	3	Inicio de sesión	1380735801
118	1	5	7	{id:,usuario:,email:,status:, rol_fkey:}	1380746654
119	1	5	7	{id:,usuario:,email:,status:, rol_fkey:}	1380746729
120	1	9	7	{"dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380747046
121	1	9	7	{"dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380747051
122	1	9	7	{"dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380747066
123	1	9	7	{"dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380747078
124	1	9	7	{"dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380747110
125	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380747150
126	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380747202
127	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380747216
174	1	9	7	{"plantel_id":"11","dea":"C000000001","rif":"J178916370","nombre_plantel":"U. E. MARCO POLO","direccion":"CALLE 99","estado":"7","municipio":"90","parroquia":"296","telefono_plantel":"0241-8784574","email_plantel":"cediel@localhost.com","cedula_director":"V17891637","titulo_director":"LIC.","nombre_director":"MARCO GUEVARA","telefono_director":"0426-4300086","email_director":"ADMIN@COLEGIO.COM"}	1380751228
128	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380747279
129	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380747306
130	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748344
131	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748355
132	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748365
138	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748611
139	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748612
141	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748695
133	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748377
140	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748681
134	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748526
137	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748578
135	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748539
142	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748710
136	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748548
143	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748717
144	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748737
145	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748799
146	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748801
147	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748801
148	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748802
149	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748802
150	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748803
151	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748804
152	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748804
153	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748806
154	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748808
155	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748812
156	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748822
157	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748827
158	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748838
175	1	5	3	Inicio de sesión	1380751285
159	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748849
160	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748852
161	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748861
162	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748862
163	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748877
164	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0416-3302541","email_director":"CEDIEL16@GMAIL.COM"}	1380748903
166	1	9	6	{"dea":"C000000001","rif":"J178916370","nombre_plantel":"U. E. MARCO POLO","direccion":"GUACARA CALLE 30","estado":"7","municipio":"80","parroquia":"268","telefono_plantel":"0245-0244444","email_plantel":"admin@localhost.com","cedula_director":"V17891637","titulo_director":"LIC.","nombre_director":"MARCO GUEVARA","telefono_director":"0426-4300086","email_director":"ADMIN@COLEGIO.COM"}	1380749490
168	1	5	3	Inicio de sesión	1380749799
169	1	9	7	{"plantel_id":"10","dea":"C000000001","rif":"J178916370","nombre_plantel":"U. E. MARCO POLO","direccion":"GUACARA CALLE 30","estado":"7","municipio":"80","parroquia":"269","telefono_plantel":"0245-0244444","email_plantel":"admin@localhost.com","cedula_director":"V17891637","titulo_director":"LIC.","nombre_director":"MARCO GUEVARA","telefono_director":"0426-4300086","email_director":"ADMIN@COLEGIO.COM"}	1380749836
172	1	5	3	Inicio de sesión	1380749874
173	1	5	5	Cierre de sesión	1380750567
176	1	9	6	{"dea":"S000000001","rif":"J175150940","nombre_plantel":"U. E. SANTA ROSA","direccion":"ASDASDASDASD","estado":"16","municipio":"206","parroquia":"709","telefono_plantel":"0245-5555555","email_plantel":"asdasd@asdasd.com","cedula_director":"V12315645","titulo_director":"TSU","nombre_director":"JOHEL CEDIEL","telefono_director":"0245-5554888","email_director":"ASDASDASD@ASDASDASD.COM.VE"}	1380752008
180	1	9	6	{"dea":"S2831D1303","rif":"J283101303","nombre_plantel":"U.E.N. HECTOR CASTILLO REYES","direccion":"AV. FUERZAS ARMADAS ENTRE CALLES 61 Y 66","estado":"13","municipio":"147","parroquia":"488","telefono_plantel":"0241-0000000","email_plantel":"asdasda@asdasda.com","cedula_director":"V28310130","titulo_director":"LIC","nombre_director":"HECTOR CASTILLO REYES","telefono_director":"0241-0000000","email_director":"ASDASDA@ASDASDA.COM"}	1380753393
165	1	9	7	{"plantel_id":"8","dea":"S000000001","rif":"J175150940","nombre_plantel":"U.E. URIMARE","direccion":"URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO","estado":"7","municipio":"90","parroquia":"293","telefono_plantel":"0241-8782490","email_plantel":"admin@urimare.com","cedula_director":"V17515094","titulo_director":"LIC.","nombre_director":"JOHEL A. CEDIEL T.","telefono_director":"0426-4300086","email_director":"CEDIEL16@GMAIL.COM"}	1380748915
167	1	9	6	{"dea":"C000000002","rif":"J178916370","nombre_plantel":"U. E. MARCO POLO","direccion":"CALLE 99","estado":"7","municipio":"90","parroquia":"296","telefono_plantel":"0241-8784574","email_plantel":"cediel@localhost.com","cedula_director":"V17891637","titulo_director":"LIC.","nombre_director":"MARCO GUEVARA","telefono_director":"0426-4300086","email_director":"ADMIN@COLEGIO.COM"}	1380749600
170	1	9	7	{"plantel_id":"10","dea":"C000000001","rif":"J178916370","nombre_plantel":"U. E. MARCO POLO","direccion":"GUACARA CALLE 30","estado":"7","municipio":"80","parroquia":"268","telefono_plantel":"0245-0244444","email_plantel":"admin@localhost.com","cedula_director":"V17891637","titulo_director":"LIC.","nombre_director":"MARCO GUEVARA","telefono_director":"0426-4300086","email_director":"ADMIN@COLEGIO.COM"}	1380749842
171	1	5	5	Cierre de sesión	1380749862
177	1	9	6	{"dea":"OD05090301","rif":"J005090301","nombre_plantel":"ESC. BOLIVARIANA ALI  PRIMERA TAPIJEHA  EUNURU","direccion":"AV. PPAL LOS PILONES","estado":"2","municipio":"8","parroquia":"30","telefono_plantel":"0241-0000000","email_plantel":"sdasdads@asdasdasda.com","cedula_director":"V00509030","titulo_director":"LIC","nombre_director":"ALI  PRIMERA","telefono_director":"0241-0000000","email_director":"SDASDADS@ASDASDASDA.COM"}	1380752786
178	1	9	6	{"dea":"S1012D0504","rif":"J101200504","nombre_plantel":"U. E. N. CARLOS RAM\\u00d3N APONTE","direccion":"PROLONGACI\\u00d3N CALLE HERN\\u00c1NDEZ NADAL SECTOR EL REMANSO V\\u00cdA TURAGUA S\\/N","estado":"4","municipio":"40","parroquia":"125","telefono_plantel":"0241-0000000","email_plantel":"sdasdad@asdasda.com","cedula_director":"V10120050","titulo_director":"LIC","nombre_director":"CARLOS RAM\\u00d3N APONTE","telefono_director":"0241-0000000","email_director":"SDASDAD@ASDASDA.COM"}	1380752978
179	1	9	6	{"dea":"OD00080103","rif":"J000080103","nombre_plantel":"LICEO CARACAS","direccion":"AV EL EJERCITO FINAL DE LA CALLE LICEO CARACAS (TALENTO MADARIAGA URB EL PARAISO DETR\\u00c1S DEL DEPORTIVO) PQUE. NACIONES UNIDAS","estado":"10","municipio":"104","parroquia":"341","telefono_plantel":"0241-0000000","email_plantel":"asdasda@asdasdasd.com","cedula_director":"V00008010","titulo_director":"LIC","nombre_director":"LICEO CARACAS","telefono_director":"0241-0000000","email_director":"ASDASDA@ASDASDASD.COM"}	1380753307
181	1	9	6	{"dea":"OD07121609","rif":"J007121609","nombre_plantel":"G.E. CACIQUE TAGUAY","direccion":"CALLE MIRANDA NO 15","estado":"16","municipio":"207","parroquia":"713","telefono_plantel":"0241-0000000","email_plantel":"asdasda@asdasdaq.com","cedula_director":"V00712160","titulo_director":"LIC","nombre_director":"0241-0000000","telefono_director":"0241-0000000","email_director":"ASDASDA@ASDASDAQ.COM"}	1380753531
182	1	9	6	{"dea":"OD01421809","rif":"J001421809","nombre_plantel":"E.B.N. BOLIV. CIUDAD DE  SAN FELIPE","direccion":"BARRIO 19 DE ABRIL, CALLE 5 ENTRE 2 Y 3","estado":"18","municipio":"231","parroquia":"766","telefono_plantel":"0241-0000000","email_plantel":"adsasda@frwervwervw.com","cedula_director":"V00142180","titulo_director":"LIC","nombre_director":"CIUDAD DE  SAN FELIPE","telefono_director":"0241-0000000","email_director":"ADSASDA@FRWERVWERVW.COM"}	1380753616
\.


--
-- Name: aud_operaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: johel
--

SELECT pg_catalog.setval('aud_operaciones_id_seq', 182, true);


--
-- Data for Name: ci_sessions; Type: TABLE DATA; Schema: public; Owner: johel
--

COPY ci_sessions (session_id, ip_address, user_agent, last_activity, user_data) FROM stdin;
a8405ea1d18fa0128d43b7b1ff5758aa	::1	Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.76 Safari/537.36	1380751563	
3f0d1095575e9360a0ff05a7041b2786	::1	Mozilla/5.0 (X11; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0	1380753586	a:5:{s:10:"usuario_id";s:1:"1";s:7:"usuario";s:5:"johel";s:6:"status";s:6:"activo";s:6:"cedula";N;s:6:"nombre";N;}
cafd9f61cd958a369c15ffe7ca9c157e	172.16.230.1	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.76 Safari/537.36	1380751280	a:5:{s:10:"usuario_id";s:1:"1";s:7:"usuario";s:5:"johel";s:6:"status";s:6:"activo";s:6:"cedula";N;s:6:"nombre";N;}
d1ee735d09216f5f9fc9edbedd9ae2aa	172.16.230.1	Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)	1380751321	
\.


--
-- Data for Name: docentes; Type: TABLE DATA; Schema: public; Owner: johel
--

COPY docentes (id, cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, sexo, fecha_nacimiento) FROM stdin;
1	V17515094	Johel	Alexander	Cediel	Teran	masculino	1985-07-22
\.


--
-- Name: docentes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: johel
--

SELECT pg_catalog.setval('docentes_id_seq', 1, true);


--
-- Data for Name: estados; Type: TABLE DATA; Schema: public; Owner: johel
--

COPY estados (id, estado) FROM stdin;
1	AMAZONAS
2	ANZOÁTEGUI
3	APURE
4	ARAGUA
5	BARINAS
6	BOLÍVAR
7	CARABOBO
8	COJEDES
9	DELTA AMACURO
10	DISTRITO CAPITAL
11	FALCÓN
12	GUÁRICO
13	LARA
14	MÉRIDA
15	MIRANDA
16	MONAGAS
17	NUEVA ESPARTA
18	PORTUGUESA
19	SUCRE
20	TÁCHIRA
21	TRUJILLO
22	VARGAS
23	YARACUY
24	ZULIA
\.


--
-- Name: estados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: johel
--

SELECT pg_catalog.setval('estados_id_seq', 1, false);


--
-- Data for Name: grupos; Type: TABLE DATA; Schema: public; Owner: johel
--

COPY grupos (id, grupo, tabla, status) FROM stdin;
2	Empleados administrativos	administrativos	activo
3	Personal docente	docentes	activo
4	Representantes	representantes	activo
5	Alumnos	alumnos	activo
1	Administradores del sitio	administradores	activo
\.


--
-- Name: grupos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: johel
--

SELECT pg_catalog.setval('grupos_id_seq', 5, true);


--
-- Data for Name: modulos; Type: TABLE DATA; Schema: public; Owner: johel
--

COPY modulos (id, modulo, alias, status) FROM stdin;
1	Usuarios	usuarios	activo
2	Grupos	grupos	activo
3	Permisos	permisos	activo
4	Módulos	modulos	activo
\.


--
-- Name: modulos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: johel
--

SELECT pg_catalog.setval('modulos_id_seq', 4, true);


--
-- Data for Name: municipios; Type: TABLE DATA; Schema: public; Owner: johel
--

COPY municipios (id, municipio, estado_fkey) FROM stdin;
1	ALTO ORINOCO	1
2	ATABAPO	1
3	ATURES	1
4	AUTANA	1
5	MANAPIARE	1
6	MAROA	1
7	RIO NEGRO	1
8	ANACO	2
9	ARAGUA	2
10	BOLIVAR	2
11	BRUZUAL	2
12	CAJIGAL	2
13	CARVAJAL	2
14	FREITES	2
15	GUANIPA	2
16	GUANTA	2
17	INDEPENDENCIA	2
18	L/DIEGO BAUTISTA	2
19	LIBERTAD	2
20	MC GREGOR	2
21	MIRANDA	2
22	MONAGAS	2
23	PEÑALVER	2
24	PIRITU	2
25	S JUAN CAPISTRANO	2
26	SANTA ANA	2
27	SIMON RODRIGUEZ	2
28	SOTILLO	2
29	ACHAGUAS	3
30	BIRUACA	3
31	MUÑOZ	3
32	PAEZ	3
33	PEDRO CAMEJO	3
34	ROMULO GALLEGOS	3
35	SAN FERNANDO	3
36	BOLIVAR	4
37	CAMATAGUA	4
38	FRANCISCO LINARES	4
39	GIRARDOT	4
40	JOSE ANGEL LAMAS	4
41	JOSE FELIX RIVAS	4
42	JOSE R REVENGA	4
43	LIBERTADOR	4
44	MARIO B IRAGORRY	4
45	OCUMARE D L COSTA	4
46	SAN CASIMIRO	4
47	SAN SEBASTIAN	4
48	SANTIAGO MARI#O	4
49	SANTOS MICHELENA	4
50	SUCRE	4
51	TOVAR	4
52	URDANETA	4
53	ZAMORA	4
54	A JOSE DE SUCRE	5
55	ALBERTO ARVELO T	5
56	ANDRES E BLANCO	5
57	ARISMENDI	5
58	BARINAS	5
59	BOLIVAR	5
60	CRUZ PAREDES	5
61	EZEQUIEL ZAMORA	5
62	OBISPOS	5
63	PEDRAZA	5
64	ROJAS	5
65	SOSA	5
66	BLVNO ANGOSTURA	6
67	CARONI	6
68	CEDEÑO	6
69	EL CALLAO	6
70	GRAN SABANA	6
71	HERES	6
72	PADRE PEDRO CHIEN	6
73	PIAR	6
74	ROSCIO	6
75	SIFONTES	6
76	SUCRE	6
77	BEJUMA	7
78	CARLOS ARVELO	7
79	DIEGO IBARRA	7
80	GUACARA	7
81	JUAN JOSE MORA	7
82	LIBERTADOR	7
83	LOS GUAYOS	7
84	MIRANDA	7
85	MONTALBAN	7
86	NAGUANAGUA	7
87	PUERTO CABELLO	7
88	SAN DIEGO	7
89	SAN JOAQUIN	7
90	VALENCIA	7
91	ANZOATEGUI	8
92	EZEQUIEL ZAMORA	8
93	FALCON	8
94	GIRARDOT	8
95	LIMA BLANCO	8
96	PAO S J BAUTISTA	8
97	RICAURTE	8
98	ROMULO GALLEGOS	8
99	TINACO	8
100	ANTONIO DIAZ	9
101	CASACOIMA	9
102	PEDERNALES	9
103	TUCUPITA	9
104	BLVNO LIBERTADOR	10
105	ACOSTA	11
106	BOLIVAR	11
107	BUCHIVACOA	11
108	CACIQUE MANAURE	11
109	CARIRUBANA	11
110	COLINA	11
111	DABAJURO	11
112	DEMOCRACIA	11
113	FALCON	11
114	FEDERACION	11
115	JACURA	11
116	LOS TAQUES	11
117	MAUROA	11
118	MIRANDA	11
119	MONS ITURRIZA	11
120	PALMA SOLA	11
121	PETIT	11
122	PIRITU	11
123	SAN FRANCISCO	11
124	SILVA	11
125	SUCRE	11
126	TOCOPERO	11
127	UNION	11
128	URUMACO	11
129	ZAMORA	11
130	CAMAGUAN	12
131	CHAGUARAMAS	12
132	EL SOCORRO	12
133	INFANTE	12
134	LAS MERCEDES	12
135	MELLADO	12
136	MIRANDA	12
137	MONAGAS	12
138	ORTIZ	12
139	RIBAS	12
140	ROSCIO	12
141	S JOSE DE GUARIBE	12
142	S MARIA DE IPIRE	12
143	SAN GERONIMO DE G	12
144	ZARAZA	12
145	ANDRES E BLANCO	13
146	CRESPO	13
147	IRIBARREN	13
148	JIMENEZ	13
149	MORAN	13
150	PALAVECINO	13
151	SIMON PLANAS	13
152	TORRES	13
153	URDANETA	13
154	ALBERTO ADRIANI	14
155	ANDRES BELLO	14
156	ANTONIO PINTO S	14
157	ARICAGUA	14
158	ARZOBISPO CHACON	14
159	CAMPO ELIAS	14
160	CARACCIOLO PARRA	14
161	CARDENAL QUINTERO	14
162	GUARAQUE	14
163	JULIO CESAR SALAS	14
164	JUSTO BRICEÑO	14
165	LIBERTADOR	14
166	MIRANDA	14
167	OB RAMOS DE LORA	14
168	PADRE NOGUERA	14
169	PUEBLO LLANO	14
170	RANGEL	14
171	RIVAS DAVILA	14
172	SANTOS MARQUINA	14
173	SUCRE	14
174	TOVAR	14
175	TULIO F CORDERO	14
176	ZEA	14
177	ACEVEDO	15
178	ANDRES BELLO	15
179	BARUTA	15
180	BRION	15
181	BUROZ	15
182	CARRIZAL	15
183	CHACAO	15
184	CRISTOBAL ROJAS	15
185	EL HATILLO	15
186	GUAICAIPURO	15
187	INDEPENDENCIA	15
188	LANDER	15
189	LOS SALIAS	15
190	PAEZ	15
191	PAZ CASTILLO	15
192	PEDRO GUAL	15
193	PLAZA	15
194	SIMON BOLIVAR	15
195	SUCRE	15
196	URDANETA	15
197	ZAMORA	15
198	ACOSTA	16
199	AGUASAY	16
200	BOLIVAR	16
201	CARIPE	16
202	CEDEÑO	16
203	EZEQUIEL ZAMORA	16
204	LIBERTADOR	16
205	MATURIN	16
206	PIAR	16
207	PUNCERES	16
208	SANTA BARBARA	16
209	SOTILLO	16
210	URACOA	16
211	ANTOLIN DEL CAMPO	17
212	ARISMENDI	17
213	DIAZ	17
214	GARCIA	17
215	GOMEZ	17
216	MANEIRO	17
217	MARCANO	17
218	MARIÑO	17
219	PENIN DE MACANAO	17
220	TUBORES	17
221	VILLALBA (COCHE)	17
222	AGUA BLANCA	18
223	ARAURE	18
224	ESTELLER	18
225	GENARO BOCONOITO	18
226	GUANARE	18
227	GUANARITO	18
228	M JOSE V DE UNDA	18
229	OSPINO	18
230	PAEZ	18
231	PAPELON	18
232	S RAFAEL DE ONOTO	18
233	SANTA ROSALIA	18
234	SUCRE	18
235	TUREN	18
236	ANDRES E BLANCO	19
237	ANDRES MATA	19
238	ARISMENDI	19
239	BENITEZ	19
240	BERMUDEZ	19
241	BOLIVAR	19
242	CAJIGAL	19
243	CRUZ S ACOSTA	19
244	LIBERTADOR	19
245	MARIÑO	19
246	MEJIA	19
247	MONTES	19
248	RIBERO	19
249	SUCRE	19
250	VALDEZ	19
251	ANDRES BELLO	20
252	ANTONIO ROMULO C	20
253	AYACUCHO	20
254	BOLIVAR	20
255	CARDENAS	20
256	CORDOBA	20
257	FCO DE MIRANDA	20
258	FERNANDEZ FEO	20
259	GARCIA DE HEVIA	20
260	GUASIMOS	20
261	INDEPENDENCIA	20
262	JAUREGUI	20
263	JOSE MARIA VARGA	20
264	JUNIN	20
265	LIBERTAD	20
266	LIBERTADOR	20
267	LOBATERA	20
268	MICHELENA	20
269	PANAMERICANO	20
270	PEDRO MARIA UREÑA	20
271	RAFAEL URDANETA	20
272	SAMUEL MALDONADO	20
273	SAN CRISTOBAL	20
274	SAN JUDAS TADEO	20
275	SEBORUCO	20
276	SIMON RODRIGUEZ	20
277	SUCRE	20
278	TORBES	20
279	URIBANTE	20
280	ANDRES BELLO	21
281	BOCONO	21
282	BOLIVAR	21
283	CANDELARIA	21
284	CARACHE	21
285	ESCUQUE	21
286	JOSE F M CAÑIZAL	21
287	JUAN V CAMPO ELI	21
288	LA CEIBA	21
289	MIRANDA	21
290	MONTE CARMELO	21
291	MOTATAN	21
292	PAMPAN	21
293	PAMPANITO	21
294	RAFAEL RANGEL	21
295	S RAFAEL CARVAJAL	21
296	SUCRE	21
297	TRUJILLO	21
298	URDANETA	21
299	VALERA	21
300	VARGAS	22
301	ARISTIDES BASTID	23
302	BOLIVAR	23
303	BRUZUAL	23
304	COCOROTE	23
305	INDEPENDENCIA	23
306	JOSE ANTONIO PAEZ	23
307	LA TRINIDAD	23
308	MANUEL MONGE	23
309	NIRGUA	23
310	PEÑA	23
311	SAN FELIPE	23
312	SUCRE	23
313	URACHICHE	23
314	VEROES	23
315	ALMIRANTE P	24
316	BARALT	24
317	CABIMAS	24
318	CATATUMBO	24
319	COLON	24
320	FRANCISCO J PULG	24
321	IDJ BLVNO GUAJIRA	24
322	JESUS E LOSSADA	24
323	JESUS M SEMPRUN	24
324	LA CAÑADA DE U	24
325	LAGUNILLAS	24
326	MACHIQUES DE P	24
327	MARA	24
328	MARACAIBO	24
329	MIRANDA	24
330	ROSARIO DE PERIJA	24
331	SAN FRANCISCO	24
332	SANTA RITA	24
333	SIMON BOLIVAR	24
334	SUCRE	24
335	VALMORE RODRIGUEZ	24
\.


--
-- Name: municipios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: johel
--

SELECT pg_catalog.setval('municipios_id_seq', 1, false);


--
-- Data for Name: parroquias; Type: TABLE DATA; Schema: public; Owner: johel
--

COPY parroquias (id, parroquia, municipio_fkey) FROM stdin;
1	HUACHAMACARE	1
2	LA ESMERALDA	1
3	MARAWAKA	1
4	MAVACA	1
5	SIERRA PARIMA	1
6	CANAME	2
7	SAN FERNANDO DE ATABA	2
8	UCATA	2
9	YAPACANA	2
10	FERNANDO GIRON TOVAR	3
11	LUIS ALBERTO GOMEZ	3
12	PARHUEÑA	3
13	PLATANILLAL	3
14	GUAYAPO	4
15	ISLA DE RATON	4
16	MUNDUAPO	4
17	SAMARIAPO	4
18	SIPAPO	4
19	ALTO VENTUARI	5
20	BAJO VENTUARI	5
21	MEDIO VENTUARI	5
22	SAN JUAN DE MANAPIARE	5
23	COMUNIDAD	6
24	MAROA	6
25	VICTORINO	6
26	CASIQUIARE	7
27	COCUY	7
28	SAN CARLOS DE RIO NEG	7
29	SOLANO	7
30	ANACO	8
31	SAN JOAQUIN	8
32	ARAGUA DE BARCELONA	9
33	CACHIPO	9
34	BERGANTIN	10
35	CAIGUA	10
36	EL CARMEN	10
37	EL PILAR	10
38	NARICUAL	10
39	SAN CRISTOBAL	10
40	CLARINES	11
41	GUANAPE	11
42	SABANA DE UCHIRE	11
43	ONOTO	12
44	SAN PABLO	12
45	SANTA BARBARA	13
46	VALLE GUANAPE	13
47	CANTAURA	14
48	LIBERTADOR	14
49	SANTA ROSA	14
50	URICA	14
51	SAN JOSE DE GUANIPA	15
52	CHORRERON	16
53	GUANTA	16
54	MAMO	17
55	SOLEDAD	17
56	EL MORRO	18
57	LECHERIAS	18
58	EL CARITO	19
59	SAN MATEO	19
60	SANTA INES	19
61	EL CHAPARRO	20
62	TOMAS ALFARO CALATRAVA	20
63	ATAPIRIRE	21
64	BOCA DEL PAO	21
65	EL PAO	21
66	PARIAGUAN	21
67	MAPIRE	22
68	PIAR	22
69	SANTA CLARA	22
70	SN DIEGO DE CABRUTICA	22
71	UVERITO	22
72	ZUATA	22
73	PUERTO PIRITU	23
74	SAN MIGUEL	23
75	SUCRE	23
76	PIRITU	24
77	SAN FRANCISCO	24
78	BOCA DE CHAVEZ	25
79	BOCA UCHIRE	25
80	PUEBLO NUEVO	26
81	SANTA ANA	26
82	EL TIGRE	27
83	POZUELOS	28
84	PUERTO LA CRUZ	28
85	ACHAGUAS	29
86	APURITO	29
87	EL YAGUAL	29
88	GUACHARA	29
89	MUCURITAS	29
90	QUESERAS DEL MEDIO	29
91	BIRUACA	30
92	BRUZUAL	31
93	MANTECAL	31
94	QUINTERO	31
95	RINCON HONDO	31
96	SAN VICENTE	31
97	ARAMENDI	32
98	EL AMPARO	32
99	GUASDUALITO	32
100	SAN CAMILO	32
101	URDANETA	32
102	CODAZZI	33
103	CUNAVICHE	33
104	SAN JUAN DE PAYARA	33
105	ELORZA	34
106	LA TRINIDAD	34
107	EL RECREO	35
108	PEÑALVER	35
109	SAN FERNANDO	35
110	SN RAFAEL DE ATAMAICA	35
111	SAN MATEO	36
112	CAMATAGUA	37
113	CARMEN DE CURA	37
114	FRANCISCO DE MIRANDA	38
115	MONS FELICIANO G	38
116	SANTA RITA	38
117	ANDRES ELOY BLANCO	39
118	CHORONI	39
119	JOAQUIN CRESPO	39
120	JOSE CASANOVA GODOY	39
121	LAS DELICIAS	39
122	LOS TACARIGUAS	39
123	MADRE MA DE SAN JOSE	39
124	PEDRO JOSE OVALLES	39
125	SANTA CRUZ	40
126	CASTOR NIEVES RIOS	41
127	JUAN VICENTE BOLIVAR	41
128	LAS GUACAMAYAS	41
129	PAO DE ZARATE	41
130	ZUATA	41
131	EL CONSEJO	42
132	PALO NEGRO	43
133	SAN MARTIN DE PORRES	43
134	CA A DE AZUCAR	44
135	EL LIMON	44
136	OCUMARE DE LA COSTA	45
137	GUIRIPA	46
138	OLLAS DE CARAMACATE	46
139	SAN CASIMIRO	46
140	VALLE MORIN	46
141	SAN SEBASTIAN	47
142	ALFREDO PACHECO M	48
143	AREVALO APONTE	48
144	CHUAO	48
145	SAMAN DE GUERE	48
146	TURMERO	48
147	LAS TEJERIAS	49
148	TIARA	49
149	BELLA VISTA	50
150	CAGUA	50
151	COLONIA TOVAR	51
152	BARBACOAS	52
153	LAS PEÑITAS	52
154	Voy	52
155	TAGUAY	52
156	MAGDALENO	53
157	PQ AUGUSTO MIJARES	53
158	SAN FRANCISCO DE ASIS	53
159	VALLES DE TUCUTUNEMO	53
160	VILLA DE CURA	53
161	ANDRES BELLO	54
162	NICOLAS PULIDO	54
163	TICOPORO	54
164	RODRIGUEZ DOMINGUEZ	55
165	SABANETA	55
166	EL CANTON	56
167	PUERTO VIVAS	56
168	SANTA CRUZ DE GUACAS	56
169	ARISMENDI	57
170	GUADARRAMA	57
171	LA UNION	57
172	SAN ANTONIO	57
173	ALFREDO A LARRIVA	58
174	ALTO BARINAS	58
175	BARINAS	58
176	CORAZON DE JESUS	58
177	DOMINGA ORTIZ P	58
178	EL CARMEN	58
179	JUAN A RODRIGUEZ D	58
180	MANUEL P FAJARDO	58
181	RAMON I MENDEZ	58
182	ROMULO BETANCOURT	58
183	SAN SILVESTRE	58
184	SANTA INES	58
185	SANTA LUCIA	58
186	TORUNOS	58
187	ALTAMIRA	59
188	BARINITAS	59
189	CALDERAS	59
190	BARRANCAS	60
191	EL SOCORRO	60
192	MASPARRITO	60
193	JOSE IGNACIO DEL PUMAR	61
194	PEDRO BRICEÑO MENDEZ	61
195	RAMON IGNACIO MENDEZ	61
196	SANTA BARBARA	61
197	EL REAL	62
198	LA LUZ	62
199	LOS GUASIMITOS	62
200	OBISPOS	62
201	CIUDAD BOLIVIA	63
202	IGNACIO BRICEÑO	63
203	JOSE FELIX RIBAS	63
204	PAEZ	63
205	DOLORES	64
206	LIBERTAD	64
207	PALACIO FAJARDO	64
208	SANTA ROSA	64
209	CIUDAD DE NUTRIAS	65
210	EL REGALO	65
211	PUERTO DE NUTRIAS	65
212	SANTA CATALINA	65
213	BARCELONETA	66
214	CIUDAD PIAR	66
215	SAN FRANCISCO	66
216	SANTA BARBARA	66
217	CACHAMAY	67
218	CHIRICA	67
219	DALLA COSTA	67
220	ONCE DE ABRIL	67
221	POZO VERDE	67
222	SIMON BOLIVAR	67
223	UNARE	67
224	UNIVERSIDAD	67
225	VISTA AL SOL	67
226	YOCOIMA	67
227	ALTAGRACIA	68
228	ASCENSION FARRERAS	68
229	CAICARA DEL ORINOCO	68
230	GUANIAMO	68
231	LA URBANA	68
232	PIJIGUAOS	68
233	EL CALLAO	69
234	IKABARU	70
235	SANTA ELENA DE UAIREN	70
236	AGUA SALADA	71
237	CATEDRAL	71
238	JOSE ANTONIO PAEZ	71
239	LA SABANITA	71
240	MARHUANTA	71
241	ORINOCO	71
242	PANAPANA	71
243	VISTA HERMOSA	71
244	ZEA	71
245	EL PALMAR	72
246	ANDRES ELOY BLANCO	73
247	PEDRO COVA	73
248	UPATA	73
249	GUASIPATI	74
250	SALOM	74
251	DALLA COSTA	75
252	SAN ISIDRO	75
253	TUMEREMO	75
254	ARIPAO	76
255	GUARATARO	76
256	LAS MAJADAS	76
257	MARIPA	76
258	MOITACO	76
259	BEJUMA	77
260	CANOABO	77
261	SIMON BOLIVAR	77
262	BELEN	78
263	GUIGUE	78
264	TACARIGUA	78
265	AGUAS CALIENTES	79
266	MARIARA	79
267	CIUDAD ALIANZA	80
268	GUACARA	80
269	YAGUA	80
270	MORON	81
271	URAMA	81
272	U INDEPENDENCIA	82
273	U TOCUYITO	82
274	U LOS GUAYOS	83
275	MIRANDA	84
276	MONTALBAN	85
277	NAGUANAGUA	86
278	BARTOLOME SALOM	87
279	BORBURATA	87
280	DEMOCRACIA	87
281	FRATERNIDAD	87
282	GOAIGOAZA	87
283	JUAN JOSE FLORES	87
284	PATANEMO	87
285	UNION	87
286	URB SAN DIEGO	88
287	SAN JOAQUIN	89
288	CANDELARIA	90
289	CATEDRAL	90
290	EL SOCORRO	90
291	MIGUEL PEÑA	90
292	NEGRO PRIMERO	90
293	RAFAEL URDANETA	90
294	SAN BLAS	90
295	SAN JOSE	90
296	SANTA ROSA	90
297	COJEDES	91
298	JUAN DE MATA SUAREZ	91
299	JUAN ANGEL BRAVO	92
300	MANUEL MANRIQUE	92
301	SAN CARLOS DE AUSTRIA	92
302	TINAQUILLO	93
303	EL BAUL	94
304	SUCRE	94
305	LA AGUADITA	95
306	MACAPO	95
307	EL PAO	96
308	EL AMPARO	97
309	LIBERTAD DE COJEDES	97
310	ROMULO GALLEGOS	98
311	GRL/JEFE JOSE L SILVA	99
312	ALMIRANTE LUIS BRION	100
313	ANICETO LUGO	100
314	CURIAPO	100
315	MANUEL RENAUD	100
316	PADRE BARRAL	100
317	SANTOS DE ABELGAS	100
318	5 DE JULIO	101
319	IMATACA	101
320	JUAN BAUTISTA ARISMEN	101
321	MANUEL PIAR	101
322	ROMULO GALLEGOS	101
323	LUIS B PRIETO FIGUERO	102
324	PEDERNALES	102
325	JOSE VIDAL MARCANO	103
326	JUAN MILLAN	103
327	LEONARDO RUIZ PINEDA	103
328	MCL ANTONIO J DE SUCRE	103
329	MONS. ARGIMIRO GARCIA	103
330	SAN JOSE	103
331	SAN RAFAEL	103
332	VIRGEN DEL VALLE	103
333	23 DE ENERO	104
334	ALTAGRACIA	104
335	ANTIMANO	104
336	CANDELARIA	104
337	CARICUAO	104
338	CATEDRAL	104
339	COCHE	104
340	EL JUNQUITO	104
341	EL PARAISO	104
342	EL RECREO	104
343	EL VALLE	104
344	LA PASTORA	104
345	LA VEGA	104
346	MACARAO	104
347	SAN AGUSTIN	104
348	SAN BERNARDINO	104
349	SAN JOSE	104
350	SAN JUAN	104
351	SAN PEDRO	104
352	SANTA ROSALIA	104
353	SANTA TERESA	104
354	SUCRE	104
355	CAPADARE	105
356	LA PASTORA	105
357	LIBERTADOR	105
358	SAN JUAN DE LOS CAYOS	105
359	ARACUA	106
360	LA PEÑA	106
361	SAN LUIS	106
362	BARIRO	107
363	BOROJO	107
364	CAPATARIDA	107
365	GUAJIRO	107
366	SEQUE	107
367	ZAZARIDA	107
368	YARACAL	108
369	CARIRUBANA	109
370	NORTE	109
371	PUNTA CARDON	109
372	SANTA ANA	109
373	ACURIGUA	110
374	GUAIBACOA	110
375	LA VELA DE CORO	110
376	LAS CALDERAS	110
377	MACORUCA	110
378	DABAJURO	111
379	AGUA CLARA	112
380	AVARIA	112
381	PEDREGAL	112
382	PIEDRA GRANDE	112
383	PURURECHE	112
384	ADAURE	113
385	ADICORA	113
386	BARAIVED	113
387	BUENA VISTA	113
388	EL HATO	113
389	EL VINCULO	113
390	JADACAQUIVA	113
391	MORUY	113
392	PUEBLO NUEVO	113
393	AGUA LARGA	114
394	CHURUGUARA	114
395	EL PAUJI	114
396	INDEPENDENCIA	114
397	MAPARARI	114
398	AGUA LINDA	115
399	ARAURIMA	115
400	JACURA	115
401	JUDIBANA	116
402	LOS TAQUES	116
403	CASIGUA	117
404	MENE DE MAUROA	117
405	SAN FELIX	117
406	GUZMAN GUILLERMO	118
407	MITARE	118
408	RIO SECO	118
409	SABANETA	118
410	SAN ANTONIO	118
411	SAN GABRIEL	118
412	SANTA ANA	118
413	BOCA DE TOCUYO	119
414	CHICHIRIVICHE	119
415	TOCUYO DE LA COSTA	119
416	PALMA SOLA	120
417	CABURE	121
418	COLINA	121
419	CURIMAGUA	121
420	PIRITU	122
421	SAN JOSE DE LA COSTA	122
422	MIRIMIRE	123
423	BOCA DE AROA	124
424	TUCACAS	124
425	PECAYA	125
426	SUCRE	125
427	TOCOPERO	126
428	EL CHARAL	127
429	LAS VEGAS DEL TUY	127
430	STA.CRUZ DE BUCARAL	127
431	BRUZUAL	128
432	URUMACO	128
433	LA CIENAGA	129
434	LA SOLEDAD	129
435	PUEBLO CUMAREBO	129
436	PUERTO CUMAREBO	129
437	ZAZARIDA	129
438	CAMAGUAN	130
439	PUERTO MIRANDA	130
440	UVERITO	130
441	CHAGUARAMAS	131
442	EL SOCORRO	132
443	ESPINO	133
444	VALLE DE LA PASCUA	133
445	CABRUTA	134
446	LAS MERCEDES	134
447	STA RITA DE MANAPIRE	134
448	EL SOMBRERO	135
449	SOSA	135
450	CALABOZO	136
451	EL CALVARIO	136
452	EL RASTRO	136
453	GUARDATINAJAS	136
454	ALTAGRACIA DE ORITUCO	137
455	LEZAMA	137
456	LIBERTAD DE ORITUCO	137
457	PASO REAL DE MACAIRA	137
458	SAN FCO DE MACAIRA	137
459	SAN RAFAEL DE ORITUCO	137
460	SOUBLETTE	137
461	ORTIZ	138
462	S LORENZO DE TIZNADOS	138
463	SAN FCO. DE TIZNADOS	138
464	SAN JOSE DE TIZNADOS	138
465	SAN RAFAEL DE LAYA	139
466	TUCUPIDO	139
467	CANTAGALLO	140
468	PARAPARA	140
469	SAN JOSE DE GUARIBE	140
470	SAN JUAN DE LOS MORROS	141
471	ALTAMIRA	142
472	SANTA MARIA DE IPIRE	142
473	CAZORLA	143
474	GUAYABAL	143
475	SAN JOSE DE UNARE	144
476	ZARAZA	144
477	PIO TAMAYO	145
478	QBDA. HONDA DE GUACHE	145
479	YACAMBU	145
480	FREITEZ	146
481	JOSE MARIA BLANCO	146
482	AGUEDO F. ALVARADO	147
483	BUENA VISTA	147
484	CATEDRAL	147
485	EL CUJI	147
486	JUAN DE VILLEGAS	147
487	JUAREZ	147
488	LA CONCEPCION	147
489	SANTA ROSA	147
490	TAMACA	147
491	UNION	147
492	CRNEL. MARIANO PERAZA	148
493	CUARA	148
494	DIEGO DE LOZADA	148
495	JOSE BERNARDO DORANTE	148
496	JUAN B RODRIGUEZ	148
497	PARAISO DE SAN JOSE	148
498	SAN MIGUEL	148
499	TINTORERO	148
500	ANZOATEGUI	149
501	BOLIVAR	149
502	GUARICO	149
503	HILARIO LUNA Y LUNA	149
504	HUMOCARO ALTO	149
505	HUMOCARO BAJO	149
506	LA CANDELARIA	149
507	MORAN	149
508	AGUA VIVA	150
509	CABUDARE	150
510	JOSE G. BASTIDAS	150
511	BURIA	151
512	GUSTAVO VEGAS LEON	151
513	SARARE	151
514	ALTAGRACIA	152
515	ANTONIO DIAZ	152
516	CAMACARO	152
517	CASTAÑEDA	152
518	CECILIO ZUBILLAGA	152
519	CHIQUINQUIRA	152
520	EL BLANCO	152
521	ESPINOZA LOS MONTEROS	152
522	HERIBERTO ARROYO	152
523	LARA	152
524	LAS MERCEDES	152
525	MANUEL MORILLO	152
526	MONTA A VERDE	152
527	MONTES DE OCA	152
528	REYES VARGAS	152
529	TORRES	152
530	TRINIDAD SAMUEL	152
531	MOROTURO	153
532	SAN MIGUEL	153
533	SIQUISIQUE	153
534	XAGUAS	153
535	GABRIEL PICON G.	154
536	HECTOR AMABLE MORA	154
537	JOSE NUCETE SARDI	154
538	PRESIDENTE BETANCOURT	154
539	PRESIDENTE PAEZ	154
540	PTE. ROMULO GALLEGOS	154
541	PULIDO MENDEZ	154
542	LA AZULITA	155
543	MESA BOLIVAR	156
544	MESA DE LAS PALMAS	156
545	STA CRUZ DE MORA	156
546	ARICAGUA	157
547	SAN ANTONIO	157
548	CANAGUA	158
549	CAPURI	158
550	CHACANTA	158
551	EL MOLINO	158
552	GUAIMARAL	158
553	MUCUCHACHI	158
554	MUCUTUY	158
555	ACEQUIAS	159
556	FERNANDEZ PEÑA	159
557	JAJI	159
558	LA MESA	159
559	MATRIZ	159
560	MONTALBAN	159
561	SAN JOSE	159
562	FLORENCIO RAMIREZ	160
563	TUCANI	160
564	LAS PIEDRAS	161
565	SANTO DOMINGO	161
566	GUARAQUE	162
567	MESA DE QUINTERO	162
568	RIO NEGRO	162
569	ARAPUEY	163
570	PALMIRA	163
571	SAN CRISTOBAL DE T	164
572	TORONDOY	164
573	ANTONIO SPINETTI DINI	165
574	ARIAS	165
575	CARACCIOLO PARRA P	165
576	DOMINGO PEÑA	165
577	EL LLANO	165
578	EL MORRO	165
579	GONZALO PICON FEBRES	165
580	JACINTO PLAZA	165
581	JUAN RODRIGUEZ SUAREZ	165
582	LASSO DE LA VEGA	165
583	LOS NEVADOS	165
584	MARIANO PICON SALAS	165
585	MILLA	165
586	OSUNA RODRIGUEZ	165
587	SAGRARIO	165
588	ANDRES ELOY BLANCO	166
589	CHACHOPO	166
590	LA VENTA	166
591	PIÑANGO	166
592	ELOY PAREDES	167
593	PQ R DE ALCAZAR	167
594	STA ELENA DE ARENALES	167
595	STA MARIA DE CAPARO	168
596	PUEBLO LLANO	169
597	CACUTE	170
598	LA TOMA	170
599	MUCUCHIES	170
600	MUCURUBA	170
601	SAN RAFAEL	170
602	BAILADORES	171
603	GERONIMO MALDONADO	171
604	TABAY	172
605	CHIGUARA	173
606	ESTANQUES	173
607	LA TRAMPA	173
608	LAGUNILLAS	173
609	PUEBLO NUEVO DEL SUR	173
610	SAN JUAN	173
611	EL AMPARO	174
612	EL LLANO	174
613	SAN FRANCISCO	174
614	TOVAR	174
615	INDEPENDENCIA	175
616	MARIA C PALACIOS	175
617	NUEVA BOLIVIA	175
618	SANTA APOLONIA	175
619	CAÑO EL TIGRE	176
620	ZEA	176
621	ARAGUITA	177
622	AREVALO GONZALEZ	177
623	CAPAYA	177
624	CAUCAGUA	177
625	EL CAFE	177
626	MARIZAPA	177
627	PANAQUIRE	177
628	RIBAS	177
629	CUMBO	178
630	SAN JOSE DE BARLOVENTO	178
631	BARUTA	179
632	EL CAFETAL	179
633	LAS MINAS DE BARUTA	179
634	CURIEPE	180
635	HIGUEROTE	180
636	TACARIGUA	180
637	MAMPORAL	181
638	CARRIZAL	182
639	CHACAO	183
640	CHARALLAVE	184
641	LAS BRISAS	184
642	EL HATILLO	185
643	ALTAGRACIA DE LA M	186
644	CECILIO ACOSTA	186
645	EL JARILLO	186
646	LOS TEQUES	186
647	PARACOTOS	186
648	SAN PEDRO	186
649	TACATA	186
650	EL CARTANAL	187
651	STA TERESA DEL TUY	187
652	LA DEMOCRACIA	188
653	OCUMARE DEL TUY	188
654	SANTA BARBARA	188
655	SAN ANTONIO LOS ALTOS	189
656	EL GUAPO	190
657	PAPARO	190
658	RIO CHICO	190
659	SN FERNANDO DEL GUAPO	190
660	TACARIGUA DE LA LAGUNA	190
661	SANTA LUCIA	191
662	CUPIRA	192
663	MACHURUCUTO	192
664	GUARENAS	193
665	S ANTONIO DE YARE	194
666	SAN FCO DE YARE	194
667	CAUCAGUITA	195
668	FILAS DE MARICHES	195
669	LA DOLORITA	195
670	LEONCIO MARTINEZ	195
671	PETARE	195
672	CUA	196
673	NUEVA CUA	196
674	BOLIVAR	197
675	GUATIRE	197
676	SAN ANTONIO	198
677	SAN FRANCISCO	198
678	AGUASAY	199
679	CARIPITO	200
680	CARIPE	201
681	EL GUACHARO	201
682	LA GUANOTA	201
683	SABANA DE PIEDRA	201
684	SAN AGUSTIN	201
685	TERESEN	201
686	AREO	202
687	CAICARA	202
688	SAN FELIX	202
689	VIENTO FRESCO	202
690	EL TEJERO	203
691	PUNTA DE MATA	203
692	CHAGUARAMAS	204
693	LAS ALHUACAS	204
694	TABASCA	204
695	TEMBLADOR	204
696	ALTO DE LOS GODOS	205
697	BOQUERON	205
698	EL COROZO	205
699	EL FURRIAL	205
700	JUSEPIN	205
701	LA PICA	205
702	LAS COCUIZAS	205
703	SAN SIMON	205
704	SAN VICENTE	205
705	SANTA CRUZ	205
706	APARICIO	206
707	ARAGUA	206
708	CHAGUARAMAL	206
709	EL PINTO	206
710	GUANAGUANA	206
711	LA TOSCANA	206
712	TAGUAYA	206
713	CACHIPO	207
714	QUIRIQUIRE	207
715	SANTA BARBARA	208
716	BARRANCAS	209
717	LOS BARRANCOS DE FAJARDO	209
718	URACOA	210
719	LA ASUNCION	211
720	LA PLAZA DE PARAGUACHI	212
721	SAN JUAN BAUTISTA	213
722	ZABALA	213
723	FRANCISCO FAJARDO	214
724	VALLE ESP SANTO	214
725	BOLIVAR	215
726	GUEVARA	215
727	MATASIETE	215
728	SANTA ANA	215
729	SUCRE	215
730	AGUIRRE	216
731	PAMPATAR	216
732	ADRIAN	217
733	JUAN GRIEGO	217
734	PORLAMAR	218
735	BOCA DEL RIO	219
736	SAN FRANCISCO	219
737	LOS BARALES	220
738	PUNTA DE PIEDRAS	220
739	SAN PEDRO DE COCHE	221
740	VICENTE FUENTES	221
741	AGUA BLANCA	222
742	ARAURE	223
743	RIO ACARIGUA	223
744	PIRITU	224
745	UVERAL	224
746	ANTOLIN TOVAR AQUINO	225
747	BOCONOITO	225
748	CORDOBA	226
749	GUANARE	226
750	SAN JOSE DE LA MONTAÑA	226
751	SAN JUAN GUANAGUANARE	226
752	VIRGEN DE LA COROMOTO	226
753	DIVINA PASTORA	227
754	GUANARITO	227
755	TRINIDAD DE LA CAPILLA	227
756	CHABASQUEN	228
757	PEÑA BLANCA	228
758	APARICION	229
759	LA ESTACION	229
760	OSPINO	229
761	ACARIGUA	230
762	PAYARA	230
763	PIMPINELA	230
764	RAMON PERAZA	230
765	CAÑO DELGADITO	231
766	PAPELON	231
767	SAN RAFAEL DE ONOTO	232
768	SANTA FE	232
769	THERMO MORLES	232
770	EL PLAYON	233
771	FLORIDA	233
772	BISCUCUY	234
773	CONCEPCION	234
774	SAN RAFAEL PALO ALZADO	234
775	SAN JOSE DE SAGUAZ	234
776	UVENCIO A VELASQUEZ	234
777	VILLA ROSA	234
778	CANELONES	235
779	SAN ISIDRO LABRADOR	235
780	SANTA CRUZ	235
781	VILLA BRUZUAL	235
782	MARIÑO	236
783	ROMULO GALLEGOS	236
784	SAN JOSE DE AREOCUAR	237
785	TAVERA ACOSTA	237
786	ANTONIO JOSE DE SUCRE	238
787	EL MORRO DE PTO SANTO	238
788	PUERTO SANTO	238
789	RIO CARIBE	238
790	SAN JUAN GALDONAS	238
791	EL PILAR	239
792	EL RINCON	239
793	GRAL FCO. A VASQUEZ	239
794	GUARAUNOS	239
795	TUNAPUICITO	239
796	UNION	239
797	BOLIVAR	240
798	MACARAPANA	240
799	SANTA CATALINA	240
800	SANTA ROSA	240
801	SANTA TERESA	240
802	MARIGUITAR	241
803	LIBERTAD	242
804	PAUJIL	242
805	YAGUARAPARO	242
806	ARAYA	243
807	CHACOPATA	243
808	MANICUARE	243
809	CAMPO ELIAS	244
810	TUNAPUY	244
811	CAMPO CLARO	245
812	IRAPA	245
813	MARABAL	245
814	SAN ANTONIO DE IRAPA	245
815	SORO	245
816	SAN ANT DEL GOLFO	246
817	ARENAS	247
818	ARICAGUA	247
819	COCOLLAR	247
820	CUMANACOA	247
821	SAN FERNANDO	247
822	SAN LORENZO	247
823	CARIACO	248
824	CATUARO	248
825	RENDON	248
826	SANTA CRUZ	248
827	SANTA MARIA	248
828	ALTAGRACIA	249
829	AYACUCHO	249
830	GRAN MARISCAL	249
831	RAUL LEONI	249
832	SAN JUAN	249
833	SANTA INES	249
834	VALENTIN VALIENTE	249
835	BIDEAU	250
836	CRISTOBAL COLON	250
837	GUIRIA	250
838	PUNTA DE PIEDRA	250
839	CORDERO	251
840	LAS MESAS	252
841	COLON	253
842	RIVAS BERTI	253
843	SAN PEDRO DEL RIO	253
844	ISAIAS MEDINA ANGARIT	254
845	JUAN VICENTE GOMEZ	254
846	PALOTAL	254
847	SAN ANT DEL TACHIRA	254
848	AMENODORO RANGEL LAMU	255
849	LA FLORIDA	255
850	TARIBA	255
851	STA. ANA  DEL TACHIRA	256
852	SAN JOSE DE BOLIVAR	257
853	ALBERTO ADRIANI	258
854	SAN RAFAEL DEL PINAL	258
855	SANTO DOMINGO	258
856	BOCA DE GRITA	259
857	JOSE ANTONIO PAEZ	259
858	LA FRIA	259
859	PALMIRA	260
860	CAPACHO NUEVO	261
861	JUAN GERMAN ROSCIO	261
862	ROMAN CARDENAS	261
863	EMILIO C. GUERRERO	262
864	LA GRITA	262
865	MONS. MIGUEL A SALAS	262
866	EL COBRE	263
867	BRAMON	264
868	LA PETROLEA	264
869	QUINIMARI	264
870	RUBIO	264
871	CAPACHO VIEJO	265
872	CIPRIANO CASTRO	265
873	MANUEL FELIPE RUGELES	265
874	ABEJALES	266
875	DORADAS	266
876	EMETERIO OCHOA	266
877	SAN JOAQUIN DE NAVAY	266
878	CONSTITUCION	267
879	LOBATERA	267
880	MICHELENA	268
881	COLONCITO	269
882	LA PALMITA	269
883	NUEVA ARCADIA	270
884	UREÑA	270
885	DELICIAS	271
886	BOCONO	272
887	HERNANDEZ	272
888	LA TENDIDA	272
889	DR. FCO. ROMERO LOBO	273
890	LA CONCORDIA	273
891	PEDRO MARIA MORANTES	273
892	SAN SEBASTIAN	273
893	SN JUAN BAUTISTA	273
894	UMUQUENA	274
895	SEBORUCO	275
896	SAN SIMON	276
897	ELEAZAR LOPEZ CONTRERA	277
898	QUENIQUEA	277
899	SAN PABLO	277
900	SAN JOSECITO	278
901	CARDENAS	279
902	JUAN PABLO PEÑALOZA	279
903	POTOSI	279
904	PREGONERO	279
905	ARAGUANEY	280
906	EL JAGUITO	280
907	LA ESPERANZA	280
908	SANTA ISABEL	280
909	AYACUCHO	281
910	BOCONO	281
911	BURBUSAY	281
912	EL CARMEN	281
913	GENERAL RIVAS	281
914	GUARAMACAL	281
915	LA VEGA DE GUARAMACAL	281
916	MONSEÑOR JAUREGUI	281
917	MOSQUEY	281
918	RAFAEL RANGEL	281
919	SAN JOSE	281
920	SAN MIGUEL	281
921	CHEREGUE	282
922	GRANADOS	282
923	SABANA GRANDE	282
924	ARNOLDO GABALDON	283
925	BOLIVIA	283
926	CARRILLO	283
927	CEGARRA	283
928	CHEJENDE	283
929	MANUEL SALVADOR ULLOA	283
930	SAN JOSE	283
931	CARACHE	284
932	CUICAS	284
933	LA CONCEPCION	284
934	PANAMERICANA	284
935	SANTA CRUZ	284
936	ESCUQUE	285
937	LA UNION	285
938	SABANA LIBRE	285
939	SANTA RITA	285
940	ANTONIO JOSE DE SUCRE	286
941	EL SOCORRO	286
942	LOS CAPRICHOS	286
943	ARNOLDO GABALDON	287
944	CAMPO ELIAS	287
945	EL PROGRESO	288
946	LA CEIBA	288
947	SANTA APOLONIA	288
948	TRES DE FEBRERO	288
949	AGUA CALIENTE	289
950	AGUA SANTA	289
951	EL CENIZO	289
952	EL DIVIDIVE	289
953	VALERITA	289
954	BUENA VISTA	290
955	MONTE CARMELO	290
956	STA MARIA DEL HORCON	290
957	EL BAÑO	291
958	JALISCO	291
959	MOTATAN	291
960	FLOR DE PATRIA	292
961	LA PAZ	292
962	PAMPAN	292
963	SANTA ANA	292
964	LA CONCEPCION	293
965	PAMPANITO	293
966	PAMPANITO II	293
967	BETIJOQUE	294
968	EL CEDRO	294
969	JOSE G HERNANDEZ	294
970	LA PUEBLITA	294
971	ANTONIO N BRICEÑO	295
972	CAMPO ALEGRE	295
973	CARVAJAL	295
974	JOSE LEONARDO SUAREZ	295
975	EL PARAISO	296
976	JUNIN	296
977	SABANA DE MENDOZA	296
978	VALMORE RODRIGUEZ	296
979	ANDRES LINARES	297
980	CHIQUINQUIRA	297
981	CRISTOBAL MENDOZA	297
982	CRUZ CARRILLO	297
983	MATRIZ	297
984	MONSEÑOR CARRILLO	297
985	TRES ESQUINAS	297
986	CABIMBU	298
987	JAJO	298
988	LA MESA	298
989	LA QUEBRADA	298
990	SANTIAGO	298
991	TUÑAME	298
992	JUAN IGNACIO MONTILLA	299
993	LA BEATRIZ	299
994	LA PUERTA	299
995	MENDOZA	299
996	MERCEDES DIAZ	299
997	SAN LUIS	299
998	CARABALLEDA	300
999	CARAYACA	300
1000	CARLOS SOUBLETTE	300
1001	CARUAO	300
1002	CATIA LA MAR	300
1003	EL JUNKO	300
1004	LA GUAIRA	300
1005	MACUTO	300
1006	MAIQUETIA	300
1007	NAIGUATA	300
1008	URIMARE	300
1009	SAN PABLO	301
1010	AROA	302
1011	CAMPO ELIAS	303
1012	CHIVACOA	303
1013	COCOROTE	304
1014	INDEPENDENCIA	305
1015	SABANA DE PARRA	306
1016	BORAURE	307
1017	YUMARE	308
1018	NIRGUA	309
1019	SALOM	309
1020	TEMERLA	309
1021	SAN ANDRES	310
1022	YARITAGUA	310
1023	ALBARICO	311
1024	SAN FELIPE	311
1025	SAN JAVIER	311
1026	GUAMA	312
1027	URACHICHE	313
1028	EL GUAYABO	314
1029	FARRIAR	314
1030	ISLA DE TOAS	315
1031	MONAGAS	315
1032	GENERAL URDANETA	316
1033	LIBERTADOR	316
1034	MANUEL GUANIPA MATOS	316
1035	MARCELINO BRICEÑO	316
1036	PUEBLO NUEVO	316
1037	SAN TIMOTEO	316
1038	AMBROSIO	317
1039	ARISTIDES CALVANI	317
1040	CARMEN HERRERA	317
1041	GERMAN RIOS LINARES	317
1042	JORGE HERNANDEZ	317
1043	LA ROSA	317
1044	PUNTA GORDA	317
1045	ROMULO BETANCOURT	317
1046	SAN BENITO	317
1047	ENCONTRADOS	318
1048	UDON PEREZ	318
1049	MORALITO	319
1050	SAN CARLOS DEL ZULIA	319
1051	SANTA BARBARA	319
1052	SANTA CRUZ DEL ZULIA	319
1053	URRIBARRI	319
1054	CARLOS QUEVEDO	320
1055	FRANCISCO J PULGAR	320
1056	SIMON RODRIGUEZ	320
1057	ALTA GUAJIRA	321
1058	ELIAS SANCHEZ RUBIO	321
1059	GUAJIRA	321
1060	SINAMAICA	321
1061	JOSE RAMON YEPEZ	322
1062	LA CONCEPCION	322
1063	MARIANO PARRA LEON	322
1064	SAN JOSE	322
1065	BARI	323
1066	JESUS M SEMPRUN	323
1067	ANDRES BELLO (KM 48)	324
1068	CHIQUINQUIRA	324
1069	CONCEPCION	324
1070	EL CARMELO	324
1071	POTRERITOS	324
1072	ALONSO DE OJEDA	325
1073	CAMPO LARA	325
1074	ELEAZAR LOPEZ C	325
1075	LIBERTAD	325
1076	VENEZUELA	325
1077	BARTOLOME DE LAS CASAS	326
1078	LIBERTAD	326
1079	RIO NEGRO	326
1080	SAN JOSE DE PERIJA	326
1081	LA SIERRITA	327
1082	LAS PARCELAS	327
1083	LUIS DE VICENTE	327
1084	MONS.MARCOS SERGIO G	327
1085	RICAURTE	327
1086	SAN RAFAEL	327
1087	TAMARE	327
1088	ANTONIO BORJAS ROMERO	328
1089	BOLIVAR	328
1090	CACIQUE MARA	328
1091	CARACCIOLO PARRA PEREZ	328
1092	CECILIO ACOSTA	328
1093	CHIQUINQUIRA	328
1094	COQUIVACOA	328
1095	CRISTO DE ARANZA	328
1096	FRANCISCO EUGENIO B	328
1097	IDELFONZO VASQUEZ	328
1098	JUANA DE AVILA	328
1099	LUIS HURTADO HIGUERA	328
1100	MANUEL DAGNINO	328
1101	OLEGARIO VILLALOBOS	328
1102	RAUL LEONI	328
1103	SAN ISIDRO	328
1104	SANTA LUCIA	328
1105	VENANCIO PULGAR	328
1106	ALTAGRACIA	329
1107	ANA MARIA CAMPOS	329
1108	FARIA	329
1109	SAN ANTONIO	329
1110	SAN JOSE	329
1111	DONALDO GARCIA	330
1112	EL ROSARIO	330
1113	SIXTO ZAMBRANO	330
1114	DOMITILA FLORES	331
1115	EL BAJO	331
1116	FRANCISCO OCHOA	331
1117	LOS CORTIJOS	331
1118	MARCIAL HERNANDEZ	331
1119	SAN FRANCISCO	331
1120	EL MENE	332
1121	JOSE CENOVIO URRIBARR	332
1122	PEDRO LUCAS URRIBARRI	332
1123	SANTA RITA	332
1124	MANUEL MANRIQUE	333
1125	RAFAEL MARIA BARALT	333
1126	RAFAEL URDANETA	333
1127	BOBURES	334
1128	EL BATEY	334
1129	GIBRALTAR	334
1130	HERAS	334
1131	M.ARTURO CELESTINO A	334
1132	ROMULO GALLEGOS	334
1133	LA VICTORIA	335
1134	RAFAEL URDANETA	335
1135	RAUL CUENCA	335
\.


--
-- Name: parroquias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: johel
--

SELECT pg_catalog.setval('parroquias_id_seq', 1, false);


--
-- Data for Name: permisos; Type: TABLE DATA; Schema: public; Owner: johel
--

COPY permisos (id, permiso, status, orden, modulo_fkey) FROM stdin;
15	Ver lista de usuarios	activo	1	1
16	Añadir usuario	activo	2	1
17	Editar usuario	activo	3	1
18	Ver lista de permisos	activo	4	3
19	Asignar permisos	activo	5	3
20	Ver lista de roles	activo	6	3
21	Añadir rol	activo	7	3
22	Editar rol	activo	8	3
23	Ver lista de módulos	activo	1	4
24	Ver lista de grupos	activo	1	2
\.


--
-- Name: permisos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: johel
--

SELECT pg_catalog.setval('permisos_id_seq', 24, true);


--
-- Data for Name: planteles; Type: TABLE DATA; Schema: public; Owner: johel
--

COPY planteles (id, dea, rif, nombre, direccion, parroquia_fkey, telefono_plantel, email_plantel, cedula_director, titulo_director, nombre_director, telefono_director, email_director) FROM stdin;
9	S000000002	J172580265	U. E. LUIS ALFREDO COLOMINE	AVENIDA 32	295	0241-8887845	admin@colomine.com	V17258026	LIC.	JAILYN A. SANCHEZ DE CEDIEL	0416-6482400	JAILYN8@GMAIL.COM
8	S000000001	J175150940	U.E. URIMARE	URB. QUINTAS DE FLOR AMARILLO, CALLE LAS TRINCHERAS, CASA Q-11 SECTOR FLOR AMARILLO	293	0241-8782490	admin@urimare.com	V17515094	LIC.	JOHEL A. CEDIEL T.	0426-4300086	CEDIEL16@GMAIL.COM
10	C000000001	J178916370	U. E. MARCO POLO	GUACARA CALLE 30	268	0245-0244444	admin@localhost.com	V17891637	LIC.	MARCO GUEVARA	0426-4300086	ADMIN@COLEGIO.COM
11	C000000001	J178916370	U. E. MARCO POLO	CALLE 99	296	0241-8784574	cediel@localhost.com	V17891637	LIC.	MARCO GUEVARA	0426-4300086	ADMIN@COLEGIO.COM
12	S000000001	J175150940	U. E. SANTA ROSA	ASDASDASDASD	709	0245-5555555	asdasd@asdasd.com	V12315645	TSU	JOHEL CEDIEL	0245-5554888	ASDASDASD@ASDASDASD.COM.VE
13	OD05090301	J005090301	ESC. BOLIVARIANA ALI  PRIMERA TAPIJEHA  EUNURU	AV. PPAL LOS PILONES	30	0241-0000000	sdasdads@asdasdasda.com	V00509030	LIC	ALI  PRIMERA	0241-0000000	SDASDADS@ASDASDASDA.COM
14	S1012D0504	J101200504	U. E. N. CARLOS RAMÓN APONTE	PROLONGACIÓN CALLE HERNÁNDEZ NADAL SECTOR EL REMANSO VÍA TURAGUA S/N	125	0241-0000000	sdasdad@asdasda.com	V10120050	LIC	CARLOS RAMÓN APONTE	0241-0000000	SDASDAD@ASDASDA.COM
15	OD00080103	J000080103	LICEO CARACAS	AV EL EJERCITO FINAL DE LA CALLE LICEO CARACAS (TALENTO MADARIAGA URB EL PARAISO DETRÁS DEL DEPORTIVO) PQUE. NACIONES UNIDAS	341	0241-0000000	asdasda@asdasdasd.com	V00008010	LIC	LICEO CARACAS	0241-0000000	ASDASDA@ASDASDASD.COM
16	S2831D1303	J283101303	U.E.N. HECTOR CASTILLO REYES	AV. FUERZAS ARMADAS ENTRE CALLES 61 Y 66	488	0241-0000000	asdasda@asdasda.com	V28310130	LIC	HECTOR CASTILLO REYES	0241-0000000	ASDASDA@ASDASDA.COM
17	OD07121609	J007121609	G.E. CACIQUE TAGUAY	CALLE MIRANDA NO 15	713	0241-0000000	asdasda@asdasdaq.com	V00712160	LIC	0241-0000000	0241-0000000	ASDASDA@ASDASDAQ.COM
18	OD01421809	J001421809	E.B.N. BOLIV. CIUDAD DE  SAN FELIPE	BARRIO 19 DE ABRIL, CALLE 5 ENTRE 2 Y 3	766	0241-0000000	adsasda@frwervwervw.com	V00142180	LIC	CIUDAD DE  SAN FELIPE	0241-0000000	ADSASDA@FRWERVWERVW.COM
\.


--
-- Name: planteles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: johel
--

SELECT pg_catalog.setval('planteles_id_seq', 18, true);


--
-- Data for Name: representantes; Type: TABLE DATA; Schema: public; Owner: johel
--

COPY representantes (id, cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido) FROM stdin;
\.


--
-- Name: representantes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: johel
--

SELECT pg_catalog.setval('representantes_id_seq', 1, false);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: johel
--

COPY roles (id, rol, status) FROM stdin;
1	Personal administrativo	activo
2	Administrador del sitio	activo
3	Docente	activo
4	Representante	activo
5	Alumno	activo
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: johel
--

SELECT pg_catalog.setval('roles_id_seq', 5, true);


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: johel
--

COPY usuarios (id, usuario, email, clave, status, rol_fkey, grupo_fkey, grupo_id) FROM stdin;
1	johel	johel@localhost.com	e10adc3949ba59abbe56e057f20f883e	activo	2	1	0
\.


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: johel
--

SELECT pg_catalog.setval('usuarios_id_seq', 1, true);


--
-- Name: administradores_cedula_key; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY administradores
    ADD CONSTRAINT administradores_cedula_key UNIQUE (cedula);


--
-- Name: administradores_pkey; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY administradores
    ADD CONSTRAINT administradores_pkey PRIMARY KEY (id);


--
-- Name: administrativos_cedula_key; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY administrativos
    ADD CONSTRAINT administrativos_cedula_key UNIQUE (cedula);


--
-- Name: administrativos_pkey; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY administrativos
    ADD CONSTRAINT administrativos_pkey PRIMARY KEY (id);


--
-- Name: alumnos_cedula_key; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY alumnos
    ADD CONSTRAINT alumnos_cedula_key UNIQUE (cedula);


--
-- Name: alumnos_pkey; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY alumnos
    ADD CONSTRAINT alumnos_pkey PRIMARY KEY (id);


--
-- Name: aud_acciones_accion_key; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY aud_acciones
    ADD CONSTRAINT aud_acciones_accion_key UNIQUE (accion);


--
-- Name: aud_acciones_pkey; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY aud_acciones
    ADD CONSTRAINT aud_acciones_pkey PRIMARY KEY (id);


--
-- Name: aud_modulos_modulo_key; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY aud_modulos
    ADD CONSTRAINT aud_modulos_modulo_key UNIQUE (modulo);


--
-- Name: aud_modulos_pkey; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY aud_modulos
    ADD CONSTRAINT aud_modulos_pkey PRIMARY KEY (id);


--
-- Name: ci_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY ci_sessions
    ADD CONSTRAINT ci_sessions_pkey PRIMARY KEY (session_id);


--
-- Name: docentes_cedula_key; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY docentes
    ADD CONSTRAINT docentes_cedula_key UNIQUE (cedula);


--
-- Name: docentes_pkey; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY docentes
    ADD CONSTRAINT docentes_pkey PRIMARY KEY (id);


--
-- Name: estados_pkey; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY estados
    ADD CONSTRAINT estados_pkey PRIMARY KEY (id);


--
-- Name: grupos_pkey; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY grupos
    ADD CONSTRAINT grupos_pkey PRIMARY KEY (id);


--
-- Name: modulos_alias_key; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_alias_key UNIQUE (alias);


--
-- Name: modulos_modulo_key; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_modulo_key UNIQUE (modulo);


--
-- Name: modulos_pkey; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_pkey PRIMARY KEY (id);


--
-- Name: municipios_pkey; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY municipios
    ADD CONSTRAINT municipios_pkey PRIMARY KEY (id);


--
-- Name: parroquias_pkey; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY parroquias
    ADD CONSTRAINT parroquias_pkey PRIMARY KEY (id);


--
-- Name: permisos_permiso_key; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_permiso_key UNIQUE (permiso);


--
-- Name: permisos_pkey; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_pkey PRIMARY KEY (id);


--
-- Name: planteles_pkey; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY planteles
    ADD CONSTRAINT planteles_pkey PRIMARY KEY (id);


--
-- Name: representantes_cedula_key; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY representantes
    ADD CONSTRAINT representantes_cedula_key UNIQUE (cedula);


--
-- Name: representantes_pkey; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY representantes
    ADD CONSTRAINT representantes_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: roles_rol_key; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_rol_key UNIQUE (rol);


--
-- Name: usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: usuarios_usuario_key; Type: CONSTRAINT; Schema: public; Owner: johel; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_usuario_key UNIQUE (usuario);


--
-- Name: ci_sessions_last_activity_idx; Type: INDEX; Schema: public; Owner: johel; Tablespace: 
--

CREATE INDEX ci_sessions_last_activity_idx ON ci_sessions USING btree (last_activity);


--
-- Name: grupos_grupo_key; Type: INDEX; Schema: public; Owner: johel; Tablespace: 
--

CREATE UNIQUE INDEX grupos_grupo_key ON grupos USING btree (grupo);


--
-- Name: grupos_tabla_key; Type: INDEX; Schema: public; Owner: johel; Tablespace: 
--

CREATE UNIQUE INDEX grupos_tabla_key ON grupos USING btree (tabla);


--
-- Name: aud_operaciones_aud_accion_fkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: johel
--

ALTER TABLE ONLY aud_operaciones
    ADD CONSTRAINT aud_operaciones_aud_accion_fkey_fkey FOREIGN KEY (aud_accion_fkey) REFERENCES aud_acciones(id);


--
-- Name: aud_operaciones_aud_modulo_fkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: johel
--

ALTER TABLE ONLY aud_operaciones
    ADD CONSTRAINT aud_operaciones_aud_modulo_fkey_fkey FOREIGN KEY (aud_modulo_fkey) REFERENCES aud_modulos(id);


--
-- Name: aud_operaciones_usuario_fkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: johel
--

ALTER TABLE ONLY aud_operaciones
    ADD CONSTRAINT aud_operaciones_usuario_fkey_fkey FOREIGN KEY (usuario_fkey) REFERENCES usuarios(id);


--
-- Name: municipios_estado_fkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: johel
--

ALTER TABLE ONLY municipios
    ADD CONSTRAINT municipios_estado_fkey_fkey FOREIGN KEY (estado_fkey) REFERENCES estados(id);


--
-- Name: parroquias_municipio_fkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: johel
--

ALTER TABLE ONLY parroquias
    ADD CONSTRAINT parroquias_municipio_fkey_fkey FOREIGN KEY (municipio_fkey) REFERENCES municipios(id);


--
-- Name: permisos_modulo_fkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: johel
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_modulo_fkey_fkey FOREIGN KEY (modulo_fkey) REFERENCES modulos(id);


--
-- Name: planteles_parroquia_fkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: johel
--

ALTER TABLE ONLY planteles
    ADD CONSTRAINT planteles_parroquia_fkey_fkey FOREIGN KEY (parroquia_fkey) REFERENCES parroquias(id);


--
-- Name: usuarios_grupo_fkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: johel
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_grupo_fkey_fkey FOREIGN KEY (grupo_fkey) REFERENCES grupos(id);


--
-- Name: usuarios_rol_fkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: johel
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_rol_fkey_fkey FOREIGN KEY (rol_fkey) REFERENCES roles(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

