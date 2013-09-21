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

ALTER TABLE ONLY grupos ALTER COLUMN id SET DEFAULT nextval('grupos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: johel
--

ALTER TABLE ONLY modulos ALTER COLUMN id SET DEFAULT nextval('modulos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: johel
--

ALTER TABLE ONLY permisos ALTER COLUMN id SET DEFAULT nextval('permisos_id_seq'::regclass);


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
\.


--
-- Name: aud_modulos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: johel
--

SELECT pg_catalog.setval('aud_modulos_id_seq', 8, true);


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
\.


--
-- Name: aud_operaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: johel
--

SELECT pg_catalog.setval('aud_operaciones_id_seq', 105, true);


--
-- Data for Name: ci_sessions; Type: TABLE DATA; Schema: public; Owner: johel
--

COPY ci_sessions (session_id, ip_address, user_agent, last_activity, user_data) FROM stdin;
2ce2496ab4191252b5d213edd2a1cc3b	::1	Mozilla/5.0 (X11; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0	1379786253	
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
-- Name: permisos_modulo_fkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: johel
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_modulo_fkey_fkey FOREIGN KEY (modulo_fkey) REFERENCES modulos(id);


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

