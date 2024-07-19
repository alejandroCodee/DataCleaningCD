--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 16.2

-- Started on 2024-06-15 19:06:28

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
-- TOC entry 966 (class 1247 OID 26126)
-- Name: enum_cama_tipo; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_cama_tipo AS ENUM (
    'INDIVIDUAL',
    'MATRIMONIAL',
    'CAMAROTE'
);


ALTER TYPE public.enum_cama_tipo OWNER TO postgres;

--
-- TOC entry 960 (class 1247 OID 26111)
-- Name: enum_habitacion_genero; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_habitacion_genero AS ENUM (
    'MASCULINO',
    'FEMENINO',
    'OTRO'
);


ALTER TYPE public.enum_habitacion_genero OWNER TO postgres;

--
-- TOC entry 903 (class 1247 OID 25966)
-- Name: enum_persona_genero; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_persona_genero AS ENUM (
    'MASCULINO',
    'FEMENINO',
    'OTRO'
);


ALTER TYPE public.enum_persona_genero OWNER TO postgres;

--
-- TOC entry 918 (class 1247 OID 26008)
-- Name: enum_usuario_rol; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_usuario_rol AS ENUM (
    'admin',
    'usuario',
    'otro'
);


ALTER TYPE public.enum_usuario_rol OWNER TO postgres;

--
-- TOC entry 882 (class 1247 OID 16387)
-- Name: genero; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.genero AS ENUM (
    'MASCULINO',
    'FEMENINO',
    'OTRO'
);


ALTER TYPE public.genero OWNER TO postgres;

--
-- TOC entry 885 (class 1247 OID 16394)
-- Name: rol; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.rol AS ENUM (
    'ADMIN',
    'USUARIO',
    'OTRO'
);


ALTER TYPE public.rol OWNER TO postgres;

--
-- TOC entry 888 (class 1247 OID 16402)
-- Name: tipo; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipo AS ENUM (
    'INDIVIDUAL',
    'MATRIMONIAL',
    'CAMAROTE'
);


ALTER TYPE public.tipo OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 233 (class 1259 OID 26037)
-- Name: afiliado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.afiliado (
    id_afiliado integer NOT NULL,
    condicion character varying(60),
    dni character varying(20),
    nombre character varying(100)
);


ALTER TABLE public.afiliado OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 26088)
-- Name: afiliado_huesped; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.afiliado_huesped (
    id_afiliado_huesped integer NOT NULL,
    id_afiliado integer NOT NULL,
    id_huesped integer NOT NULL
);


ALTER TABLE public.afiliado_huesped OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 26087)
-- Name: afiliado_huesped_id_afiliado_huesped_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.afiliado_huesped_id_afiliado_huesped_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.afiliado_huesped_id_afiliado_huesped_seq OWNER TO postgres;

--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 244
-- Name: afiliado_huesped_id_afiliado_huesped_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.afiliado_huesped_id_afiliado_huesped_seq OWNED BY public.afiliado_huesped.id_afiliado_huesped;


--
-- TOC entry 232 (class 1259 OID 26036)
-- Name: afiliado_id_afiliado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.afiliado_id_afiliado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.afiliado_id_afiliado_seq OWNER TO postgres;

--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 232
-- Name: afiliado_id_afiliado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.afiliado_id_afiliado_seq OWNED BY public.afiliado.id_afiliado;


--
-- TOC entry 253 (class 1259 OID 26134)
-- Name: cama; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cama (
    id_cama integer NOT NULL,
    id_habitacion integer NOT NULL,
    nomre character varying(30) NOT NULL,
    tipo public.enum_cama_tipo NOT NULL,
    disponible boolean DEFAULT true
);


ALTER TABLE public.cama OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 26133)
-- Name: cama_id_cama_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cama_id_cama_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cama_id_cama_seq OWNER TO postgres;

--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 252
-- Name: cama_id_cama_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cama_id_cama_seq OWNED BY public.cama.id_cama;


--
-- TOC entry 269 (class 1259 OID 262090)
-- Name: causa_visita; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.causa_visita (
    id_causa_visita integer NOT NULL,
    causa character varying(255)
);


ALTER TABLE public.causa_visita OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 262089)
-- Name: causa_visita_id_causa_visita_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.causa_visita_id_causa_visita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.causa_visita_id_causa_visita_seq OWNER TO postgres;

--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 268
-- Name: causa_visita_id_causa_visita_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.causa_visita_id_causa_visita_seq OWNED BY public.causa_visita.id_causa_visita;


--
-- TOC entry 251 (class 1259 OID 26118)
-- Name: habitacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.habitacion (
    id_habitacion integer NOT NULL,
    id_lugar integer NOT NULL,
    nombre character varying(30) NOT NULL,
    genero public.enum_habitacion_genero NOT NULL,
    disponible boolean DEFAULT true
);


ALTER TABLE public.habitacion OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 26117)
-- Name: habitacion_id_habitacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.habitacion_id_habitacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.habitacion_id_habitacion_seq OWNER TO postgres;

--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 250
-- Name: habitacion_id_habitacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.habitacion_id_habitacion_seq OWNED BY public.habitacion.id_habitacion;


--
-- TOC entry 214 (class 1259 OID 25943)
-- Name: hospital; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hospital (
    id_hospital integer NOT NULL,
    nombre character varying(100) NOT NULL,
    direccion text NOT NULL
);


ALTER TABLE public.hospital OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 25942)
-- Name: hospital_id_hospital_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hospital_id_hospital_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hospital_id_hospital_seq OWNER TO postgres;

--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 213
-- Name: hospital_id_hospital_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hospital_id_hospital_seq OWNED BY public.hospital.id_hospital;


--
-- TOC entry 243 (class 1259 OID 26074)
-- Name: huesped; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.huesped (
    id_huesped integer NOT NULL,
    id_persona integer NOT NULL,
    activo boolean,
    reingreso boolean NOT NULL
);


ALTER TABLE public.huesped OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 26073)
-- Name: huesped_id_huesped_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.huesped_id_huesped_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.huesped_id_huesped_seq OWNER TO postgres;

--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 242
-- Name: huesped_id_huesped_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.huesped_id_huesped_seq OWNED BY public.huesped.id_huesped;


--
-- TOC entry 241 (class 1259 OID 26067)
-- Name: iglesia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iglesia (
    id_iglesia integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.iglesia OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 26095)
-- Name: iglesia_huesped; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iglesia_huesped (
    id_iglesia_huesped integer NOT NULL,
    id_iglesia integer NOT NULL,
    id_huesped integer NOT NULL
);


ALTER TABLE public.iglesia_huesped OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 26094)
-- Name: iglesia_huesped_id_iglesia_huesped_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.iglesia_huesped_id_iglesia_huesped_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.iglesia_huesped_id_iglesia_huesped_seq OWNER TO postgres;

--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 246
-- Name: iglesia_huesped_id_iglesia_huesped_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.iglesia_huesped_id_iglesia_huesped_seq OWNED BY public.iglesia_huesped.id_iglesia_huesped;


--
-- TOC entry 240 (class 1259 OID 26066)
-- Name: iglesia_id_iglesia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.iglesia_id_iglesia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.iglesia_id_iglesia_seq OWNER TO postgres;

--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 240
-- Name: iglesia_id_iglesia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.iglesia_id_iglesia_seq OWNED BY public.iglesia.id_iglesia;


--
-- TOC entry 211 (class 1259 OID 24628)
-- Name: lista_espera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lista_espera (
    id_lista_espera integer NOT NULL,
    id_persona integer NOT NULL,
    observacion text,
    fecha_entrada timestamp with time zone NOT NULL
);


ALTER TABLE public.lista_espera OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 24627)
-- Name: lista_espera_id_lista_espera_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lista_espera_id_lista_espera_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lista_espera_id_lista_espera_seq OWNER TO postgres;

--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 210
-- Name: lista_espera_id_lista_espera_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lista_espera_id_lista_espera_seq OWNED BY public.lista_espera.id_lista_espera;


--
-- TOC entry 255 (class 1259 OID 26149)
-- Name: lista_negra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lista_negra (
    id_lista_negra integer NOT NULL,
    id_persona integer NOT NULL,
    id_regla integer NOT NULL,
    observacion text
);


ALTER TABLE public.lista_negra OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 26148)
-- Name: lista_negra_id_lista_negra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lista_negra_id_lista_negra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lista_negra_id_lista_negra_seq OWNER TO postgres;

--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 254
-- Name: lista_negra_id_lista_negra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lista_negra_id_lista_negra_seq OWNED BY public.lista_negra.id_lista_negra;


--
-- TOC entry 259 (class 1259 OID 26167)
-- Name: lista_solicitud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lista_solicitud (
    id_lista_solicitud integer NOT NULL,
    id_paciente_huesped integer NOT NULL,
    observacion text,
    becada boolean,
    fecha_entrada date NOT NULL,
    fecha_salida date
);


ALTER TABLE public.lista_solicitud OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 24586)
-- Name: lista_solicitud_id_lista_solicitud; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lista_solicitud_id_lista_solicitud
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lista_solicitud_id_lista_solicitud OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 26166)
-- Name: lista_solicitud_id_lista_solicitud_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lista_solicitud_id_lista_solicitud_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lista_solicitud_id_lista_solicitud_seq OWNER TO postgres;

--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 258
-- Name: lista_solicitud_id_lista_solicitud_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lista_solicitud_id_lista_solicitud_seq OWNED BY public.lista_solicitud.id_lista_solicitud;


--
-- TOC entry 226 (class 1259 OID 26001)
-- Name: lugar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lugar (
    id_lugar integer NOT NULL,
    codigo character varying(10) NOT NULL
);


ALTER TABLE public.lugar OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 26000)
-- Name: lugar_id_lugar_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lugar_id_lugar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lugar_id_lugar_seq OWNER TO postgres;

--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 225
-- Name: lugar_id_lugar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lugar_id_lugar_seq OWNED BY public.lugar.id_lugar;


--
-- TOC entry 222 (class 1259 OID 25985)
-- Name: ocupacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ocupacion (
    id_ocupacion integer NOT NULL,
    descripcion text NOT NULL
);


ALTER TABLE public.ocupacion OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25984)
-- Name: ocupacion_id_ocupacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ocupacion_id_ocupacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ocupacion_id_ocupacion_seq OWNER TO postgres;

--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 221
-- Name: ocupacion_id_ocupacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ocupacion_id_ocupacion_seq OWNED BY public.ocupacion.id_ocupacion;


--
-- TOC entry 265 (class 1259 OID 63017)
-- Name: ofrenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ofrenda (
    id_ofrenda integer NOT NULL,
    id_reservacion integer,
    valor numeric(10,2) NOT NULL,
    fecha date NOT NULL
);


ALTER TABLE public.ofrenda OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 63016)
-- Name: ofrenda_id_ofrenda_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ofrenda_id_ofrenda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ofrenda_id_ofrenda_seq OWNER TO postgres;

--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 264
-- Name: ofrenda_id_ofrenda_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ofrenda_id_ofrenda_seq OWNED BY public.ofrenda.id_ofrenda;


--
-- TOC entry 239 (class 1259 OID 26058)
-- Name: paciente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paciente (
    id_paciente integer NOT NULL,
    id_hospital integer,
    id_piso integer,
    id_sala integer,
    causa_visita character varying(100),
    observacion text,
    id_person integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.paciente OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 55426)
-- Name: paciente_huesped; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paciente_huesped (
    id_paciente_huesped integer NOT NULL,
    id_paciente integer NOT NULL,
    id_huesped integer NOT NULL,
    parentesco_paciente character varying(50)
);


ALTER TABLE public.paciente_huesped OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 55425)
-- Name: paciente_huesped_id_paciente_huesped_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paciente_huesped_id_paciente_huesped_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.paciente_huesped_id_paciente_huesped_seq OWNER TO postgres;

--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 260
-- Name: paciente_huesped_id_paciente_huesped_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paciente_huesped_id_paciente_huesped_seq OWNED BY public.paciente_huesped.id_paciente_huesped;


--
-- TOC entry 238 (class 1259 OID 26057)
-- Name: paciente_id_paciente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paciente_id_paciente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.paciente_id_paciente_seq OWNER TO postgres;

--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 238
-- Name: paciente_id_paciente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paciente_id_paciente_seq OWNED BY public.paciente.id_paciente;


--
-- TOC entry 263 (class 1259 OID 63005)
-- Name: pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pago (
    id_pago integer NOT NULL,
    id_reservacion integer,
    saldo_pendiente integer NOT NULL,
    fecha timestamp with time zone NOT NULL
);


ALTER TABLE public.pago OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24641)
-- Name: pago_id_pago; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pago_id_pago
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pago_id_pago OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 63004)
-- Name: pago_id_pago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pago_id_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pago_id_pago_seq OWNER TO postgres;

--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 262
-- Name: pago_id_pago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pago_id_pago_seq OWNED BY public.pago.id_pago;


--
-- TOC entry 235 (class 1259 OID 26044)
-- Name: patrono; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patrono (
    id_patrono integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.patrono OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 26051)
-- Name: patrono_afiliado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patrono_afiliado (
    id_patrono_afiliado integer NOT NULL,
    id_patrono integer NOT NULL,
    id_afiliado integer NOT NULL
);


ALTER TABLE public.patrono_afiliado OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 26050)
-- Name: patrono_afiliado_id_patrono_afiliado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patrono_afiliado_id_patrono_afiliado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.patrono_afiliado_id_patrono_afiliado_seq OWNER TO postgres;

--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 236
-- Name: patrono_afiliado_id_patrono_afiliado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patrono_afiliado_id_patrono_afiliado_seq OWNED BY public.patrono_afiliado.id_patrono_afiliado;


--
-- TOC entry 234 (class 1259 OID 26043)
-- Name: patrono_id_patrono_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patrono_id_patrono_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.patrono_id_patrono_seq OWNER TO postgres;

--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 234
-- Name: patrono_id_patrono_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patrono_id_patrono_seq OWNED BY public.patrono.id_patrono;


--
-- TOC entry 220 (class 1259 OID 25974)
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persona (
    id_persona integer NOT NULL,
    id_ocupacion integer,
    id_procedencia integer NOT NULL,
    id_lugar integer NOT NULL,
    dni character varying(20),
    primer_nombre character varying(30) NOT NULL,
    segundo_nombre character varying(30),
    primer_apellido character varying(30) NOT NULL,
    segundo_apellido character varying(30),
    direccion text,
    telefono character varying(15),
    genero public.enum_persona_genero NOT NULL,
    fecha_nacimiento date NOT NULL
);


ALTER TABLE public.persona OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25973)
-- Name: persona_id_persona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.persona_id_persona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.persona_id_persona_seq OWNER TO postgres;

--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 219
-- Name: persona_id_persona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.persona_id_persona_seq OWNED BY public.persona.id_persona;


--
-- TOC entry 218 (class 1259 OID 25959)
-- Name: piso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.piso (
    id_piso integer NOT NULL,
    id_hospital integer NOT NULL,
    nombre_piso character varying(10) NOT NULL
);


ALTER TABLE public.piso OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25958)
-- Name: piso_id_piso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.piso_id_piso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.piso_id_piso_seq OWNER TO postgres;

--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 217
-- Name: piso_id_piso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.piso_id_piso_seq OWNED BY public.piso.id_piso;


--
-- TOC entry 231 (class 1259 OID 26031)
-- Name: privilegio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privilegio (
    id_privilegio integer NOT NULL,
    descripcion character varying(355) NOT NULL
);


ALTER TABLE public.privilegio OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 25994)
-- Name: procedencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.procedencia (
    id_procedencia integer NOT NULL,
    departamento character varying(50) NOT NULL,
    municipio character varying(50) NOT NULL
);


ALTER TABLE public.procedencia OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 25993)
-- Name: procedencia_id_procedencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.procedencia_id_procedencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.procedencia_id_procedencia_seq OWNER TO postgres;

--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 223
-- Name: procedencia_id_procedencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.procedencia_id_procedencia_seq OWNED BY public.procedencia.id_procedencia;


--
-- TOC entry 257 (class 1259 OID 26158)
-- Name: reglamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reglamento (
    id_regla integer NOT NULL,
    descripcion_regla text NOT NULL
);


ALTER TABLE public.reglamento OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 26157)
-- Name: reglamento_id_regla_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reglamento_id_regla_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reglamento_id_regla_seq OWNER TO postgres;

--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 256
-- Name: reglamento_id_regla_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reglamento_id_regla_seq OWNED BY public.reglamento.id_regla;


--
-- TOC entry 249 (class 1259 OID 26102)
-- Name: reservacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservacion (
    id_reservacion integer NOT NULL,
    id_paciente_huesped integer NOT NULL,
    id_cama integer NOT NULL,
    id_hospital integer NOT NULL,
    activa boolean DEFAULT true,
    fecha_entrada date NOT NULL,
    fecha_salida date,
    becado boolean DEFAULT false NOT NULL
);


ALTER TABLE public.reservacion OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 26101)
-- Name: reservacion_id_reservacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservacion_id_reservacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reservacion_id_reservacion_seq OWNER TO postgres;

--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 248
-- Name: reservacion_id_reservacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservacion_id_reservacion_seq OWNED BY public.reservacion.id_reservacion;


--
-- TOC entry 216 (class 1259 OID 25952)
-- Name: sala; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sala (
    id_sala integer NOT NULL,
    id_piso integer NOT NULL,
    nombre_sala character varying(10) NOT NULL
);


ALTER TABLE public.sala OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 25951)
-- Name: sala_id_sala_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sala_id_sala_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sala_id_sala_seq OWNER TO postgres;

--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 215
-- Name: sala_id_sala_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sala_id_sala_seq OWNED BY public.sala.id_sala;


--
-- TOC entry 267 (class 1259 OID 63606)
-- Name: transaccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaccion (
    id_transaccion integer NOT NULL,
    id_huesped integer,
    valor numeric(6,2) NOT NULL,
    fecha timestamp with time zone NOT NULL,
    becada boolean DEFAULT false
);


ALTER TABLE public.transaccion OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 63605)
-- Name: transaccion_id_transaccion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaccion_id_transaccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaccion_id_transaccion_seq OWNER TO postgres;

--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 266
-- Name: transaccion_id_transaccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaccion_id_transaccion_seq OWNED BY public.transaccion.id_transaccion;


--
-- TOC entry 228 (class 1259 OID 26016)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    id_persona integer NOT NULL,
    id_hospital integer,
    nickname character varying(25) NOT NULL,
    contrasena character varying(100) NOT NULL,
    rol public.enum_usuario_rol NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 26015)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 227
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- TOC entry 230 (class 1259 OID 26025)
-- Name: usuario_privilegio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_privilegio (
    id_usuario_privilegio integer NOT NULL,
    id_usuario integer NOT NULL,
    id_privilegio integer NOT NULL
);


ALTER TABLE public.usuario_privilegio OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 26024)
-- Name: usuario_privilegio_id_usuario_privilegio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_privilegio_id_usuario_privilegio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_privilegio_id_usuario_privilegio_seq OWNER TO postgres;

--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 229
-- Name: usuario_privilegio_id_usuario_privilegio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_privilegio_id_usuario_privilegio_seq OWNED BY public.usuario_privilegio.id_usuario_privilegio;


--
-- TOC entry 3348 (class 2604 OID 26040)
-- Name: afiliado id_afiliado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.afiliado ALTER COLUMN id_afiliado SET DEFAULT nextval('public.afiliado_id_afiliado_seq'::regclass);


--
-- TOC entry 3355 (class 2604 OID 26091)
-- Name: afiliado_huesped id_afiliado_huesped; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.afiliado_huesped ALTER COLUMN id_afiliado_huesped SET DEFAULT nextval('public.afiliado_huesped_id_afiliado_huesped_seq'::regclass);


--
-- TOC entry 3362 (class 2604 OID 26137)
-- Name: cama id_cama; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cama ALTER COLUMN id_cama SET DEFAULT nextval('public.cama_id_cama_seq'::regclass);


--
-- TOC entry 3372 (class 2604 OID 262093)
-- Name: causa_visita id_causa_visita; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.causa_visita ALTER COLUMN id_causa_visita SET DEFAULT nextval('public.causa_visita_id_causa_visita_seq'::regclass);


--
-- TOC entry 3360 (class 2604 OID 26121)
-- Name: habitacion id_habitacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion ALTER COLUMN id_habitacion SET DEFAULT nextval('public.habitacion_id_habitacion_seq'::regclass);


--
-- TOC entry 3339 (class 2604 OID 25946)
-- Name: hospital id_hospital; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital ALTER COLUMN id_hospital SET DEFAULT nextval('public.hospital_id_hospital_seq'::regclass);


--
-- TOC entry 3354 (class 2604 OID 26077)
-- Name: huesped id_huesped; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.huesped ALTER COLUMN id_huesped SET DEFAULT nextval('public.huesped_id_huesped_seq'::regclass);


--
-- TOC entry 3353 (class 2604 OID 26070)
-- Name: iglesia id_iglesia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iglesia ALTER COLUMN id_iglesia SET DEFAULT nextval('public.iglesia_id_iglesia_seq'::regclass);


--
-- TOC entry 3356 (class 2604 OID 26098)
-- Name: iglesia_huesped id_iglesia_huesped; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iglesia_huesped ALTER COLUMN id_iglesia_huesped SET DEFAULT nextval('public.iglesia_huesped_id_iglesia_huesped_seq'::regclass);


--
-- TOC entry 3338 (class 2604 OID 24631)
-- Name: lista_espera id_lista_espera; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista_espera ALTER COLUMN id_lista_espera SET DEFAULT nextval('public.lista_espera_id_lista_espera_seq'::regclass);


--
-- TOC entry 3364 (class 2604 OID 26152)
-- Name: lista_negra id_lista_negra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista_negra ALTER COLUMN id_lista_negra SET DEFAULT nextval('public.lista_negra_id_lista_negra_seq'::regclass);


--
-- TOC entry 3366 (class 2604 OID 26170)
-- Name: lista_solicitud id_lista_solicitud; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista_solicitud ALTER COLUMN id_lista_solicitud SET DEFAULT nextval('public.lista_solicitud_id_lista_solicitud_seq'::regclass);


--
-- TOC entry 3345 (class 2604 OID 26004)
-- Name: lugar id_lugar; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugar ALTER COLUMN id_lugar SET DEFAULT nextval('public.lugar_id_lugar_seq'::regclass);


--
-- TOC entry 3343 (class 2604 OID 25988)
-- Name: ocupacion id_ocupacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ocupacion ALTER COLUMN id_ocupacion SET DEFAULT nextval('public.ocupacion_id_ocupacion_seq'::regclass);


--
-- TOC entry 3369 (class 2604 OID 63020)
-- Name: ofrenda id_ofrenda; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ofrenda ALTER COLUMN id_ofrenda SET DEFAULT nextval('public.ofrenda_id_ofrenda_seq'::regclass);


--
-- TOC entry 3351 (class 2604 OID 26061)
-- Name: paciente id_paciente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente ALTER COLUMN id_paciente SET DEFAULT nextval('public.paciente_id_paciente_seq'::regclass);


--
-- TOC entry 3367 (class 2604 OID 55429)
-- Name: paciente_huesped id_paciente_huesped; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente_huesped ALTER COLUMN id_paciente_huesped SET DEFAULT nextval('public.paciente_huesped_id_paciente_huesped_seq'::regclass);


--
-- TOC entry 3368 (class 2604 OID 63008)
-- Name: pago id_pago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago ALTER COLUMN id_pago SET DEFAULT nextval('public.pago_id_pago_seq'::regclass);


--
-- TOC entry 3349 (class 2604 OID 26047)
-- Name: patrono id_patrono; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrono ALTER COLUMN id_patrono SET DEFAULT nextval('public.patrono_id_patrono_seq'::regclass);


--
-- TOC entry 3350 (class 2604 OID 26054)
-- Name: patrono_afiliado id_patrono_afiliado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrono_afiliado ALTER COLUMN id_patrono_afiliado SET DEFAULT nextval('public.patrono_afiliado_id_patrono_afiliado_seq'::regclass);


--
-- TOC entry 3342 (class 2604 OID 25977)
-- Name: persona id_persona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona ALTER COLUMN id_persona SET DEFAULT nextval('public.persona_id_persona_seq'::regclass);


--
-- TOC entry 3341 (class 2604 OID 25962)
-- Name: piso id_piso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.piso ALTER COLUMN id_piso SET DEFAULT nextval('public.piso_id_piso_seq'::regclass);


--
-- TOC entry 3344 (class 2604 OID 25997)
-- Name: procedencia id_procedencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.procedencia ALTER COLUMN id_procedencia SET DEFAULT nextval('public.procedencia_id_procedencia_seq'::regclass);


--
-- TOC entry 3365 (class 2604 OID 26161)
-- Name: reglamento id_regla; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reglamento ALTER COLUMN id_regla SET DEFAULT nextval('public.reglamento_id_regla_seq'::regclass);


--
-- TOC entry 3357 (class 2604 OID 26105)
-- Name: reservacion id_reservacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservacion ALTER COLUMN id_reservacion SET DEFAULT nextval('public.reservacion_id_reservacion_seq'::regclass);


--
-- TOC entry 3340 (class 2604 OID 25955)
-- Name: sala id_sala; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sala ALTER COLUMN id_sala SET DEFAULT nextval('public.sala_id_sala_seq'::regclass);


--
-- TOC entry 3370 (class 2604 OID 63609)
-- Name: transaccion id_transaccion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaccion ALTER COLUMN id_transaccion SET DEFAULT nextval('public.transaccion_id_transaccion_seq'::regclass);


--
-- TOC entry 3346 (class 2604 OID 26019)
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- TOC entry 3347 (class 2604 OID 26028)
-- Name: usuario_privilegio id_usuario_privilegio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_privilegio ALTER COLUMN id_usuario_privilegio SET DEFAULT nextval('public.usuario_privilegio_id_usuario_privilegio_seq'::regclass);


--
-- TOC entry 4895 (class 0 OID 26037)
-- Dependencies: 233
-- Data for Name: afiliado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.afiliado (id_afiliado, condicion, dni, nombre) FROM stdin;
1	\N	3412341234	Juan Melendez
\.


--
-- TOC entry 4907 (class 0 OID 26088)
-- Dependencies: 245
-- Data for Name: afiliado_huesped; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.afiliado_huesped (id_afiliado_huesped, id_afiliado, id_huesped) FROM stdin;
1	1	6
\.


--
-- TOC entry 4915 (class 0 OID 26134)
-- Dependencies: 253
-- Data for Name: cama; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cama (id_cama, id_habitacion, nomre, tipo, disponible) FROM stdin;
9	9	Cama A9	CAMAROTE	t
6	6	Cama A6	CAMAROTE	f
5	5	Cama A5	MATRIMONIAL	f
1	1	Cama A1	INDIVIDUAL	t
3	3	Cama A3	CAMAROTE	f
11	5	1999	INDIVIDUAL	t
12	3	6444	INDIVIDUAL	t
13	14	607	INDIVIDUAL	t
14	10	289309	CAMAROTE	t
15	13	232323	INDIVIDUAL	t
16	14	123	INDIVIDUAL	t
17	6	23	INDIVIDUAL	t
18	12	23	INDIVIDUAL	t
19	11	4554545	INDIVIDUAL	t
7	7	Cama A7	INDIVIDUAL	t
8	8	Cama A8	MATRIMONIAL	t
10	10	Cama A10	INDIVIDUAL	t
2	2	Cama A2	MATRIMONIAL	t
4	4	Cama A4	INDIVIDUAL	t
\.


--
-- TOC entry 4931 (class 0 OID 262090)
-- Dependencies: 269
-- Data for Name: causa_visita; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.causa_visita (id_causa_visita, causa) FROM stdin;
\.


--
-- TOC entry 4913 (class 0 OID 26118)
-- Dependencies: 251
-- Data for Name: habitacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.habitacion (id_habitacion, id_lugar, nombre, genero, disponible) FROM stdin;
2	1	Habitación 102	FEMENINO	t
7	1	Habitación 107	OTRO	t
4	1	Habitación 104	FEMENINO	t
8	1	Habitación 108	MASCULINO	t
10	1	Habitación 110	OTRO	t
9	1	Habitación 109	FEMENINO	t
6	1	Habitación 106	FEMENINO	f
1	1	Habitación 101	MASCULINO	t
5	1	Habitación 105	MASCULINO	f
3	1	Habitación 103	MASCULINO	f
11	1	454545	MASCULINO	t
12	1	45454545	MASCULINO	t
13	1	testRoom	FEMENINO	t
14	1	testRoom2	FEMENINO	t
\.


--
-- TOC entry 4876 (class 0 OID 25943)
-- Dependencies: 214
-- Data for Name: hospital; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hospital (id_hospital, nombre, direccion) FROM stdin;
1	Hospital General	Calle Principal 123
2	Hospital Universitario	Avenida de la Ciencia 45
3	Clínica San Lucas	Bulevar del Pinar 78
4	Centro Médico Concordia	Calle del Olmo 9
5	Hospital del Norte	Avenida Norte 101
6	Hospital Metropolitano	Calle Central 200
7	Hospital de la Costa	Avenida Marina 300
8	Hospital Infantil	Calle de los Niños 150
9	Hospital de la Mujer	Avenida Mujeres 333
10	Centro de Salud Sol	Calle Sol 400
12	Seguro Social - IHSS	
\.


--
-- TOC entry 4905 (class 0 OID 26074)
-- Dependencies: 243
-- Data for Name: huesped; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.huesped (id_huesped, id_persona, activo, reingreso) FROM stdin;
1	1	f	f
2	2	f	f
3	3	f	f
4	4	f	f
6	14	t	t
\.


--
-- TOC entry 4903 (class 0 OID 26067)
-- Dependencies: 241
-- Data for Name: iglesia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iglesia (id_iglesia, nombre) FROM stdin;
1	Iglesia San Juan Bautista
2	Iglesia La Sagrada Familia
3	Iglesia de San Pedro
4	Iglesia de Santa Clara
5	Iglesia del Sagrado Corazón
6	Iglesia de San Francisco de Asís
7	Iglesia de Santa Teresa
8	Iglesia del Buen Pastor
9	Iglesia de San Mateo
10	Iglesia de Santa María de la Paz
\.


--
-- TOC entry 4909 (class 0 OID 26095)
-- Dependencies: 247
-- Data for Name: iglesia_huesped; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iglesia_huesped (id_iglesia_huesped, id_iglesia, id_huesped) FROM stdin;
\.


--
-- TOC entry 4873 (class 0 OID 24628)
-- Dependencies: 211
-- Data for Name: lista_espera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lista_espera (id_lista_espera, id_persona, observacion, fecha_entrada) FROM stdin;
\.


--
-- TOC entry 4917 (class 0 OID 26149)
-- Dependencies: 255
-- Data for Name: lista_negra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lista_negra (id_lista_negra, id_persona, id_regla, observacion) FROM stdin;
3	3	3	Llevó alimentos no permitidos a la sala de cuidados intensivos.
4	4	4	Trajo demasiados visitantes al mismo tiempo.
6	6	6	No respetó el horario de visitas establecido.
7	7	7	Dejó a un menor sin supervisión en los pasillos.
8	8	8	Uso indebido del teléfono móvil en área restringida.
9	9	9	No cumplió con los procedimientos de higiene requeridos.
10	10	10	Intento de ingresar con un animal no permitido.
\.


--
-- TOC entry 4921 (class 0 OID 26167)
-- Dependencies: 259
-- Data for Name: lista_solicitud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lista_solicitud (id_lista_solicitud, id_paciente_huesped, observacion, becada, fecha_entrada, fecha_salida) FROM stdin;
11	1		f	2024-06-05	2024-06-10
12	1	Ninguna	t	2024-06-10	2024-06-15
13	2	Alergia al polen	f	2024-06-11	2024-06-16
14	19	Necesita dieta especial	f	2024-06-12	2024-06-17
15	20	Requiere habitación adaptada	f	2024-06-13	2024-06-18
16	21	Requiere acceso a internet	f	2024-06-14	2024-06-19
20	26	a	f	2024-06-15	2024-06-26
21	27		t	2024-06-15	2024-06-25
22	28	J	f	2024-06-15	2024-06-16
23	29		f	2024-06-15	2024-06-26
24	30	\N	f	2024-06-15	2024-06-27
29	35	\N	f	2024-06-15	2024-06-26
\.


--
-- TOC entry 4888 (class 0 OID 26001)
-- Dependencies: 226
-- Data for Name: lugar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lugar (id_lugar, codigo) FROM stdin;
1	SPS
2	TGU
\.


--
-- TOC entry 4884 (class 0 OID 25985)
-- Dependencies: 222
-- Data for Name: ocupacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ocupacion (id_ocupacion, descripcion) FROM stdin;
1	Ingeniero
2	Médico
3	Abogado
4	Arquitecto
5	Programador
6	Profesor
7	Científico
8	Contador
9	Diseñador Gráfico
10	Psicólogo
\.


--
-- TOC entry 4927 (class 0 OID 63017)
-- Dependencies: 265
-- Data for Name: ofrenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ofrenda (id_ofrenda, id_reservacion, valor, fecha) FROM stdin;
2	8	200.00	2024-06-12
3	8	12.00	2024-06-13
4	8	34.00	2024-06-14
5	9	123.00	2024-06-14
6	9	89.00	2024-06-13
7	8	1.00	2024-06-13
8	8	2.00	2024-06-13
9	9	12.00	2024-06-13
\.


--
-- TOC entry 4901 (class 0 OID 26058)
-- Dependencies: 239
-- Data for Name: paciente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paciente (id_paciente, id_hospital, id_piso, id_sala, causa_visita, observacion, id_person) FROM stdin;
2	1	1	4	Revision Medica		1
3	1	1	5	Revision Medica		1
4	1	1	6	Revision Medica		1
5	1	1	7	Revision Medica		1
8	10	1	5	\N	Ola Paciente	15
9	10	1	5	\N	Observacion Paciente	15
10	3	1	5	\N	Nula	15
11	10	1	6	\N	\N	15
12	12	1	5	\N	\N	15
13	12	2	6	\N	\N	15
18	12	2	4	\N	\N	15
\.


--
-- TOC entry 4923 (class 0 OID 55426)
-- Dependencies: 261
-- Data for Name: paciente_huesped; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paciente_huesped (id_paciente_huesped, id_paciente, id_huesped, parentesco_paciente) FROM stdin;
1	2	1	Padre
2	3	2	Padre
19	2	2	Padre
20	2	2	Madre
21	3	3	Hermano
22	4	4	Hermana
26	9	6	Hermanos
27	10	6	Padre
28	11	6	Madre
29	12	6	Hermanos
30	13	6	Hermanos
35	18	6	Hermanos
\.


--
-- TOC entry 4925 (class 0 OID 63005)
-- Dependencies: 263
-- Data for Name: pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pago (id_pago, id_reservacion, saldo_pendiente, fecha) FROM stdin;
\.


--
-- TOC entry 4897 (class 0 OID 26044)
-- Dependencies: 235
-- Data for Name: patrono; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patrono (id_patrono, nombre) FROM stdin;
1	HBI
\.


--
-- TOC entry 4899 (class 0 OID 26051)
-- Dependencies: 237
-- Data for Name: patrono_afiliado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patrono_afiliado (id_patrono_afiliado, id_patrono, id_afiliado) FROM stdin;
1	1	1
\.


--
-- TOC entry 4882 (class 0 OID 25974)
-- Dependencies: 220
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persona (id_persona, id_ocupacion, id_procedencia, id_lugar, dni, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, direccion, telefono, genero, fecha_nacimiento) FROM stdin;
3	3	3	1	34567890X	Luis	Alberto	Martinez	Rivera	Ronda Norte 789	555-9012	MASCULINO	1982-03-09
4	4	4	1	45678901W	Elena	Beatriz	Sánchez	Molina	Calle Este 101	555-3456	FEMENINO	1975-11-30
5	5	5	1	56789012V	David	Enrique	Jimenez	Lozano	Bulevar del Sur 234	555-7890	MASCULINO	1988-01-19
6	6	6	1	67890123U	Isabel	Carmen	Fernández	Romero	Avenida de la Paz 567	555-2345	FEMENINO	1995-02-28
7	7	7	1	78901234T	Jorge	Manuel	Moreno	Castillo	Callejón del Álamo 890	555-6789	MASCULINO	1979-04-17
8	8	8	1	89012345S	Sofía	Patricia	Ruiz	Campos	Paseo Marítimo 345	555-1239	FEMENINO	1992-12-07
9	9	9	1	90123456R	Carlos	Javier	Navarro	Garrido	Ruta Occidental 678	555-4567	MASCULINO	1980-09-05
10	10	10	1	01234567Q	Teresa	Lucía	Dominguez	Prieto	Avenida del Río 901	555-7891	FEMENINO	1972-06-18
12	7	8	1	1243-1441-23413	Lola	Le	Lu	js	Ola	3423-4234	FEMENINO	2024-06-25
13	7	7	1	1324-1234-12341	Tulio	loa	Asi 	Por ahi	Por ahi	3423-4234	FEMENINO	2024-06-12
2	2	2	1	1234-5678-90123	Ana	Maria	Lopez	Diaz	Avenida Principal 456	1234-5678	FEMENINO	1990-07-22
1	1	1	1	1231-2309-80948	Juan	Roberto	Gomez	Fernandez	Calle Falsa 123	1304-8234	MASCULINO	1985-05-15
14	7	8	1	0511-2004-00551	Kelvin 	Jafeth	Melgar	Quiroz	Esparta	2345-2345	MASCULINO	2024-05-27
15	8	6	1	0511-2004-00552	Juan		BuenDia		San Francisco	5423-5423	MASCULINO	2024-05-27
\.


--
-- TOC entry 4880 (class 0 OID 25959)
-- Dependencies: 218
-- Data for Name: piso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.piso (id_piso, id_hospital, nombre_piso) FROM stdin;
1	1	Piso A
2	2	Piso B
3	3	Piso C
\.


--
-- TOC entry 4893 (class 0 OID 26031)
-- Dependencies: 231
-- Data for Name: privilegio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.privilegio (id_privilegio, descripcion) FROM stdin;
1	Acceso a información médica sensible
2	Permiso para administrar medicamentos
3	Acceso completo a historiales clínicos
4	Autorización para realizar procedimientos quirúrgicos
5	Acceso a áreas restringidas del hospital
6	Permiso para modificar horarios de visitas
7	Autorización para emitir comunicados de prensa
8	Acceso a registros financieros del hospital
9	Permiso para contratar y despedir personal
10	Acceso a la configuración de sistemas informáticos del hospital
\.


--
-- TOC entry 4886 (class 0 OID 25994)
-- Dependencies: 224
-- Data for Name: procedencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.procedencia (id_procedencia, departamento, municipio) FROM stdin;
1	Atlántida	La Ceiba
2	Atlántida	El Porvenir
3	Atlántida	Tela
4	Atlántida	Jutiapa
5	Atlántida	La Masica
6	Atlántida	San Francisco
7	Atlántida	Arizona
8	Atlántida	Esparta
9	Choluteca	Choluteca
10	Choluteca	Apacilagua
11	Choluteca	Concepción de María
12	Choluteca	Duyure
13	Choluteca	El Corpus
14	Choluteca	El Triunfo
15	Choluteca	Marcovia
16	Choluteca	Morolica
17	Choluteca	Namasigüe
18	Choluteca	Orocuina
19	Choluteca	Pespire
20	Choluteca	San Antonio de Flores
21	Choluteca	San Isidro
22	Choluteca	San José
23	Choluteca	San Marcos de Colón
24	Choluteca	Santa Ana de Yusguare
25	Colón	Trujillo
26	Colón	Balfate
27	Colón	Iriona
28	Colón	Limón
29	Colón	Sabá
30	Colón	Santa Fe
31	Colón	Santa Rosa de Aguán
32	Colón	Sonaguera
33	Colón	Tocoa
34	Colón	Bonito Oriental
35	Comayagua	Comayagua
36	Comayagua	Ajuterique
37	Comayagua	El Rosario
38	Comayagua	Esquías
39	Comayagua	Humuya
40	Comayagua	La Libertad
41	Comayagua	Lamaní
42	Comayagua	La Trinidad
43	Comayagua	Lejamaní
44	Comayagua	Meámbar
45	Comayagua	Minas de Oro
46	Comayagua	Ojos de Agua
47	Comayagua	San Jerónimo
48	Comayagua	San José de Comayagua
49	Comayagua	San José del Potrero
50	Comayagua	San Luis
51	Comayagua	San Sebastián
52	Comayagua	Siguatepeque
53	Comayagua	Villa de San Antonio
54	Comayagua	Las Lajas
55	Comayagua	Taulabé
56	Copán	Santa Rosa de Copán
57	Copán	Cabañas
58	Copán	Concepción
59	Copán	Copán Ruinas
60	Copán	Corquín
61	Copán	Cucuyagua
62	Copán	Dolores
63	Copán	Dulce Nombre
64	Copán	El Paraíso
65	Copán	Florida
66	Copán	La Jigua
67	Copán	La Unión
68	Copán	Nueva Arcadia
69	Copán	San Agustín
70	Copán	San Antonio
71	Copán	San Jerónimo
72	Copán	San José
73	Copán	San Juan de Opoa
74	Copán	San Nicolás
75	Copán	San Pedro
76	Copán	Santa Rita
77	Copán	Trinidad de Copán
78	Copán	Veracruz
79	Cortés	San Pedro Sula
80	Cortés	Choloma
81	Cortés	Omoa
82	Cortés	Pimienta
83	Cortés	Potrerillos
84	Cortés	Puerto Cortés
85	Cortés	San Antonio de Cortés
86	Cortés	San Francisco de Yojoa
87	Cortés	San Manuel
88	Cortés	Santa Cruz de Yojoa
89	Cortés	Villanueva
90	Cortés	La Lima
91	El Paraíso	Yuscarán
92	El Paraíso	Alauca
93	El Paraíso	Danlí
94	El Paraíso	El Paraíso
95	El Paraíso	Güinope
96	El Paraíso	Jacaleapa
97	El Paraíso	Liure
98	El Paraíso	Morocelí
99	El Paraíso	Oropolí
100	El Paraíso	Potrerillos
101	El Paraíso	San Antonio de Flores
102	El Paraíso	San Lucas
103	El Paraíso	San Matías
104	El Paraíso	Soledad
105	El Paraíso	Teupasenti
106	El Paraíso	Texiguat
107	El Paraíso	Vado Ancho
108	El Paraíso	Yauyupe
109	El Paraíso	Trojes
110	Francisco Morazán	Distrito Central (Tegucigalpa y Comayagüela)
111	Francisco Morazán	Alubarén
112	Francisco Morazán	Cedros
113	Francisco Morazán	Curarén
114	Francisco Morazán	El Porvenir
115	Francisco Morazán	Guaimaca
116	Francisco Morazán	La Libertad
117	Francisco Morazán	La Venta
118	Francisco Morazán	Lepaterique
119	Francisco Morazán	Maraita
120	Francisco Morazán	Marale
121	Francisco Morazán	Nueva Armenia
122	Francisco Morazán	Ojojona
123	Francisco Morazán	Orica
124	Francisco Morazán	Reitoca
125	Francisco Morazán	Sabanagrande
126	Francisco Morazán	San Antonio de Oriente
127	Francisco Morazán	San Buenaventura
128	Francisco Morazán	San Ignacio
129	Francisco Morazán	San Juan de Flores
130	Francisco Morazán	San Miguelito
131	Francisco Morazán	Santa Ana
132	Francisco Morazán	Santa Lucía
133	Francisco Morazán	Talanga
134	Francisco Morazán	Tatumbla
135	Francisco Morazán	Valle de Ángeles
136	Francisco Morazán	Villa de San Francisco
137	Francisco Morazán	Vallecillo
138	Gracias a Dios	Puerto Lempira
139	Gracias a Dios	Brus Laguna
140	Gracias a Dios	Ahuas
141	Gracias a Dios	Juan Francisco Bulnes
142	Gracias a Dios	Villeda Morales
143	Gracias a Dios	Wampusirpe
144	Intibucá	La Esperanza
145	Intibucá	Camasca
146	Intibucá	Colomoncagua
147	Intibucá	Concepción
148	Intibucá	Dolores
149	Intibucá	Intibucá
150	Intibucá	Jesús de Otoro
151	Intibucá	Magdalena
152	Intibucá	Masaguara
153	Intibucá	San Antonio
154	Intibucá	San Isidro
155	Intibucá	San Juan
156	Intibucá	San Marcos de la Sierra
157	Intibucá	San Miguelito
158	Intibucá	Santa Lucía
159	Intibucá	Yamaranguila
160	Intibucá	San Francisco de Opalaca
161	Islas de la Bahía	Roatán
162	Islas de la Bahía	Guanaja
163	Islas de la Bahía	José Santos Guardiola
164	Islas de la Bahía	Utila
165	La Paz	La Paz
166	La Paz	Aguanqueterique
167	La Paz	Cabañas
168	La Paz	Cane
169	La Paz	Chinacla
170	La Paz	Guajiquiro
171	La Paz	Lauterique
172	La Paz	Marcala
173	La Paz	Mercedes de Oriente
174	La Paz	Opatoro
175	La Paz	San Antonio del Norte
176	La Paz	San José
177	La Paz	San Juan
178	La Paz	San Pedro de Tutule
179	La Paz	Santa Ana
180	La Paz	Santa Elena
181	La Paz	Santa María
182	La Paz	Santiago de Puringla
183	La Paz	Yarula
184	Lempira	Gracias
185	Lempira	Belén
186	Lempira	Candelaria
187	Lempira	Cololaca
188	Lempira	Erandique
189	Lempira	Gualcince
190	Lempira	Guarita
191	Lempira	La Campa
192	Lempira	La Iguala
193	Lempira	Las Flores
194	Lempira	La Unión
195	Lempira	La Virtud
196	Lempira	Lepaera
197	Lempira	Mapulaca
198	Lempira	Piraera
199	Lempira	San Andrés
200	Lempira	San Francisco
201	Lempira	San Juan Guarita
202	Lempira	San Manuel Colohete
203	Lempira	San Rafael
204	Lempira	San Sebastián
205	Lempira	Santa Cruz
206	Lempira	Talgua
207	Lempira	Tambla
208	Lempira	Tomalá
209	Lempira	Valladolid
210	Lempira	Virginia
211	Lempira	San Marcos de Caiquín
212	Ocotepeque	Ocotepeque
213	Ocotepeque	Belén Gualcho
214	Ocotepeque	Concepción
215	Ocotepeque	Dolores Merendón
216	Ocotepeque	Fraternidad
217	Ocotepeque	La Encarnación
218	Ocotepeque	La Labor
219	Ocotepeque	Lucerna
220	Ocotepeque	Mercedes
221	Ocotepeque	San Fernando
222	Ocotepeque	San Francisco del Valle
223	Ocotepeque	San Jorge
224	Ocotepeque	San Marcos
225	Ocotepeque	Santa Fe
226	Ocotepeque	Sensenti
227	Ocotepeque	Sinuapa
228	Olancho	Juticalpa
229	Olancho	Campamento
230	Olancho	Catacamas
231	Olancho	Concordia
232	Olancho	Dulce Nombre de Culmí
233	Olancho	El Rosario
234	Olancho	Esquipulas del Norte
235	Olancho	Gualaco
236	Olancho	Guarizama
237	Olancho	Guata
238	Olancho	Guayape
239	Olancho	Jano
240	Olancho	La Unión
241	Olancho	Mangulile
242	Olancho	Manto
243	Olancho	Salamá
244	Olancho	San Esteban
245	Olancho	San Francisco de Becerra
246	Olancho	San Francisco de la Paz
247	Olancho	Santa María del Real
248	Olancho	Silca
249	Olancho	Yocón
250	Olancho	Patuca
251	Santa Bárbara	Santa Bárbara
252	Santa Bárbara	Arada
253	Santa Bárbara	Atima
254	Santa Bárbara	Azacualpa
255	Santa Bárbara	Ceguaca
256	Santa Bárbara	Concepción del Norte
257	Santa Bárbara	Concepción del Sur
258	Santa Bárbara	Chinda
259	Santa Bárbara	El Níspero
260	Santa Bárbara	Gualala
261	Santa Bárbara	Ilama
262	Santa Bárbara	Las Vegas
263	Santa Bárbara	Macuelizo
264	Santa Bárbara	Naranjito
265	Santa Bárbara	Nuevo Celilac
266	Santa Bárbara	Nueva Frontera
267	Santa Bárbara	Petoa
268	Santa Bárbara	Protección
269	Santa Bárbara	Quimistán
270	Santa Bárbara	San Francisco de Ojuera
271	Santa Bárbara	San José de las Colinas
272	Santa Bárbara	San Luis
273	Santa Bárbara	San Marcos
274	Santa Bárbara	San Nicolás
275	Santa Bárbara	San Pedro Zacapa
276	Santa Bárbara	San Vicente Centenario
277	Santa Bárbara	Santa Rita
278	Santa Bárbara	Trinidad
279	Valle	Nacaome
280	Valle	Alianza
281	Valle	Amapala
282	Valle	Aramecina
283	Valle	Caridad
284	Valle	Goascorán
285	Valle	Langue
286	Valle	San Francisco de Coray
287	Valle	San Lorenzo
288	Yoro	Yoro
289	Yoro	Arenal
290	Yoro	El Negrito
291	Yoro	El Progreso
292	Yoro	Jocón
293	Yoro	Morazán
294	Yoro	Olanchito
295	Yoro	Santa Rita
296	Yoro	Sulaco
297	Yoro	Victoria
298	Yoro	Yorito
\.


--
-- TOC entry 4919 (class 0 OID 26158)
-- Dependencies: 257
-- Data for Name: reglamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reglamento (id_regla, descripcion_regla) FROM stdin;
1	Todos los visitantes deben registrarse en la recepción.
2	No está permitido fumar en las instalaciones.
3	Los visitantes deben mantener un nivel de ruido bajo para no perturbar a los pacientes.
4	Las visitas están limitadas a dos personas por paciente a la vez.
5	No se permite la entrada de alimentos o bebidas externas.
6	El horario de visitas es de 8 a.m. a 8 p.m.
7	Los niños menores de 12 años deben estar acompañados por un adulto en todo momento.
8	No se permite el uso de teléfonos móviles en las salas de examen.
9	Todos los visitantes deben lavarse las manos antes de entrar a las habitaciones de los pacientes.
10	Está prohibido el ingreso de animales, excepto animales de servicio debidamente identificados.
\.


--
-- TOC entry 4911 (class 0 OID 26102)
-- Dependencies: 249
-- Data for Name: reservacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservacion (id_reservacion, id_paciente_huesped, id_cama, id_hospital, activa, fecha_entrada, fecha_salida, becado) FROM stdin;
9	2	6	1	t	2024-06-05	2024-06-11	f
8	1	5	1	t	2024-06-05	2024-06-10	f
\.


--
-- TOC entry 4878 (class 0 OID 25952)
-- Dependencies: 216
-- Data for Name: sala; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sala (id_sala, id_piso, nombre_sala) FROM stdin;
4	1	Sala A
5	1	Sala AA
6	1	Sala AAAA
7	1	Sala AAAAA
\.


--
-- TOC entry 4929 (class 0 OID 63606)
-- Dependencies: 267
-- Data for Name: transaccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaccion (id_transaccion, id_huesped, valor, fecha, becada) FROM stdin;
\.


--
-- TOC entry 4890 (class 0 OID 26016)
-- Dependencies: 228
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id_usuario, id_persona, id_hospital, nickname, contrasena, rol) FROM stdin;
2	2	2	user2	$2b$10$Kw3/BAFAs6U93H905nwHxuxWEJkO6lwbSSiNOuA.Euv34bm6L2mBW	usuario
3	3	4	user3	$2b$10$vXT95LBGj7gVuX2vH.nem.LEFDRu7bpkTnTmZ/d7.zoOgkkT3VgAa	admin
4	4	1	user4	$2b$10$cAHyC/aiMRmsSi70v6uZEevb6iq5iBU4bwg0SVtrzkIPwYoWpdudC	usuario
5	12	10	Lola	$2b$10$pdARjcq4dL4UBm1HTfSeJOFMfWlTv2hBqoLlSor7l/.rsbSSBAqS.	usuario
6	13	10	tilin	$2b$10$R2ZKBkPq4kAaNiw417FaA.NDOZyEmnZLiAOlOUmdIW.f7bW4VxTbe	admin
1	1	4	user1	$2b$10$82XZFBDjRI3kAKG8WFo/r.rOU67u.huhbiSB/lZ9SD3hiiShqUgvS	admin
\.


--
-- TOC entry 4892 (class 0 OID 26025)
-- Dependencies: 230
-- Data for Name: usuario_privilegio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario_privilegio (id_usuario_privilegio, id_usuario, id_privilegio) FROM stdin;
\.


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 244
-- Name: afiliado_huesped_id_afiliado_huesped_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.afiliado_huesped_id_afiliado_huesped_seq', 1, true);


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 232
-- Name: afiliado_id_afiliado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.afiliado_id_afiliado_seq', 1, true);


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 252
-- Name: cama_id_cama_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cama_id_cama_seq', 19, true);


--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 268
-- Name: causa_visita_id_causa_visita_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.causa_visita_id_causa_visita_seq', 1, false);


--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 250
-- Name: habitacion_id_habitacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.habitacion_id_habitacion_seq', 14, true);


--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 213
-- Name: hospital_id_hospital_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hospital_id_hospital_seq', 12, true);


--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 242
-- Name: huesped_id_huesped_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.huesped_id_huesped_seq', 6, true);


--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 246
-- Name: iglesia_huesped_id_iglesia_huesped_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iglesia_huesped_id_iglesia_huesped_seq', 1, false);


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 240
-- Name: iglesia_id_iglesia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iglesia_id_iglesia_seq', 1, false);


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 210
-- Name: lista_espera_id_lista_espera_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lista_espera_id_lista_espera_seq', 1, false);


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 254
-- Name: lista_negra_id_lista_negra_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lista_negra_id_lista_negra_seq', 2, true);


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 209
-- Name: lista_solicitud_id_lista_solicitud; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lista_solicitud_id_lista_solicitud', 10, true);


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 258
-- Name: lista_solicitud_id_lista_solicitud_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lista_solicitud_id_lista_solicitud_seq', 29, true);


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 225
-- Name: lugar_id_lugar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lugar_id_lugar_seq', 2, true);


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 221
-- Name: ocupacion_id_ocupacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ocupacion_id_ocupacion_seq', 1, false);


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 264
-- Name: ofrenda_id_ofrenda_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ofrenda_id_ofrenda_seq', 9, true);


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 260
-- Name: paciente_huesped_id_paciente_huesped_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paciente_huesped_id_paciente_huesped_seq', 35, true);


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 238
-- Name: paciente_id_paciente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paciente_id_paciente_seq', 18, true);


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 212
-- Name: pago_id_pago; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pago_id_pago', 1, false);


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 262
-- Name: pago_id_pago_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pago_id_pago_seq', 1, false);


--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 236
-- Name: patrono_afiliado_id_patrono_afiliado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patrono_afiliado_id_patrono_afiliado_seq', 1, true);


--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 234
-- Name: patrono_id_patrono_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patrono_id_patrono_seq', 1, true);


--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 219
-- Name: persona_id_persona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persona_id_persona_seq', 15, true);


--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 217
-- Name: piso_id_piso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.piso_id_piso_seq', 3, true);


--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 223
-- Name: procedencia_id_procedencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.procedencia_id_procedencia_seq', 1, false);


--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 256
-- Name: reglamento_id_regla_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reglamento_id_regla_seq', 1, false);


--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 248
-- Name: reservacion_id_reservacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservacion_id_reservacion_seq', 9, true);


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 215
-- Name: sala_id_sala_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sala_id_sala_seq', 7, true);


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 266
-- Name: transaccion_id_transaccion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaccion_id_transaccion_seq', 1, false);


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 227
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 6, true);


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 229
-- Name: usuario_privilegio_id_usuario_privilegio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_privilegio_id_usuario_privilegio_seq', 1, false);


--
-- TOC entry 4674 (class 2606 OID 26093)
-- Name: afiliado_huesped afiliado_huesped_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.afiliado_huesped
    ADD CONSTRAINT afiliado_huesped_pkey PRIMARY KEY (id_afiliado_huesped);


--
-- TOC entry 4662 (class 2606 OID 26042)
-- Name: afiliado afiliado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.afiliado
    ADD CONSTRAINT afiliado_pkey PRIMARY KEY (id_afiliado);


--
-- TOC entry 4682 (class 2606 OID 26140)
-- Name: cama cama_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cama
    ADD CONSTRAINT cama_pkey PRIMARY KEY (id_cama);


--
-- TOC entry 4698 (class 2606 OID 262095)
-- Name: causa_visita causa_visita_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.causa_visita
    ADD CONSTRAINT causa_visita_pkey PRIMARY KEY (id_causa_visita);


--
-- TOC entry 4680 (class 2606 OID 26124)
-- Name: habitacion habitacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion
    ADD CONSTRAINT habitacion_pkey PRIMARY KEY (id_habitacion);


--
-- TOC entry 3376 (class 2606 OID 25950)
-- Name: hospital hospital_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital
    ADD CONSTRAINT hospital_pkey PRIMARY KEY (id_hospital);


--
-- TOC entry 4672 (class 2606 OID 26079)
-- Name: huesped huesped_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.huesped
    ADD CONSTRAINT huesped_pkey PRIMARY KEY (id_huesped);


--
-- TOC entry 4676 (class 2606 OID 26100)
-- Name: iglesia_huesped iglesia_huesped_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iglesia_huesped
    ADD CONSTRAINT iglesia_huesped_pkey PRIMARY KEY (id_iglesia_huesped);


--
-- TOC entry 4670 (class 2606 OID 26072)
-- Name: iglesia iglesia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iglesia
    ADD CONSTRAINT iglesia_pkey PRIMARY KEY (id_iglesia);


--
-- TOC entry 3374 (class 2606 OID 24635)
-- Name: lista_espera lista_espera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista_espera
    ADD CONSTRAINT lista_espera_pkey PRIMARY KEY (id_lista_espera);


--
-- TOC entry 4684 (class 2606 OID 26156)
-- Name: lista_negra lista_negra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista_negra
    ADD CONSTRAINT lista_negra_pkey PRIMARY KEY (id_lista_negra);


--
-- TOC entry 4688 (class 2606 OID 26174)
-- Name: lista_solicitud lista_solicitud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista_solicitud
    ADD CONSTRAINT lista_solicitud_pkey PRIMARY KEY (id_lista_solicitud);


--
-- TOC entry 4044 (class 2606 OID 26006)
-- Name: lugar lugar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugar
    ADD CONSTRAINT lugar_pkey PRIMARY KEY (id_lugar);


--
-- TOC entry 4040 (class 2606 OID 25992)
-- Name: ocupacion ocupacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ocupacion
    ADD CONSTRAINT ocupacion_pkey PRIMARY KEY (id_ocupacion);


--
-- TOC entry 4694 (class 2606 OID 63022)
-- Name: ofrenda ofrenda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ofrenda
    ADD CONSTRAINT ofrenda_pkey PRIMARY KEY (id_ofrenda);


--
-- TOC entry 4690 (class 2606 OID 55431)
-- Name: paciente_huesped paciente_huesped_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente_huesped
    ADD CONSTRAINT paciente_huesped_pkey PRIMARY KEY (id_paciente_huesped);


--
-- TOC entry 4668 (class 2606 OID 26065)
-- Name: paciente paciente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT paciente_pkey PRIMARY KEY (id_paciente);


--
-- TOC entry 4692 (class 2606 OID 63010)
-- Name: pago pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (id_pago);


--
-- TOC entry 4666 (class 2606 OID 26056)
-- Name: patrono_afiliado patrono_afiliado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrono_afiliado
    ADD CONSTRAINT patrono_afiliado_pkey PRIMARY KEY (id_patrono_afiliado);


--
-- TOC entry 4664 (class 2606 OID 26049)
-- Name: patrono patrono_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrono
    ADD CONSTRAINT patrono_pkey PRIMARY KEY (id_patrono);


--
-- TOC entry 3382 (class 2606 OID 276311)
-- Name: persona persona_dni_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key UNIQUE (dni);


--
-- TOC entry 3384 (class 2606 OID 276313)
-- Name: persona persona_dni_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key1 UNIQUE (dni);


--
-- TOC entry 3386 (class 2606 OID 276305)
-- Name: persona persona_dni_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key10 UNIQUE (dni);


--
-- TOC entry 3388 (class 2606 OID 276331)
-- Name: persona persona_dni_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key100 UNIQUE (dni);


--
-- TOC entry 3390 (class 2606 OID 276323)
-- Name: persona persona_dni_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key101 UNIQUE (dni);


--
-- TOC entry 3392 (class 2606 OID 276327)
-- Name: persona persona_dni_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key102 UNIQUE (dni);


--
-- TOC entry 3394 (class 2606 OID 276325)
-- Name: persona persona_dni_key103; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key103 UNIQUE (dni);


--
-- TOC entry 3396 (class 2606 OID 276299)
-- Name: persona persona_dni_key104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key104 UNIQUE (dni);


--
-- TOC entry 3398 (class 2606 OID 276457)
-- Name: persona persona_dni_key105; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key105 UNIQUE (dni);


--
-- TOC entry 3400 (class 2606 OID 276459)
-- Name: persona persona_dni_key106; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key106 UNIQUE (dni);


--
-- TOC entry 3402 (class 2606 OID 276461)
-- Name: persona persona_dni_key107; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key107 UNIQUE (dni);


--
-- TOC entry 3404 (class 2606 OID 276297)
-- Name: persona persona_dni_key108; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key108 UNIQUE (dni);


--
-- TOC entry 3406 (class 2606 OID 276463)
-- Name: persona persona_dni_key109; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key109 UNIQUE (dni);


--
-- TOC entry 3408 (class 2606 OID 276337)
-- Name: persona persona_dni_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key11 UNIQUE (dni);


--
-- TOC entry 3410 (class 2606 OID 276465)
-- Name: persona persona_dni_key110; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key110 UNIQUE (dni);


--
-- TOC entry 3412 (class 2606 OID 276829)
-- Name: persona persona_dni_key111; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key111 UNIQUE (dni);


--
-- TOC entry 3414 (class 2606 OID 276295)
-- Name: persona persona_dni_key112; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key112 UNIQUE (dni);


--
-- TOC entry 3416 (class 2606 OID 276831)
-- Name: persona persona_dni_key113; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key113 UNIQUE (dni);


--
-- TOC entry 3418 (class 2606 OID 276833)
-- Name: persona persona_dni_key114; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key114 UNIQUE (dni);


--
-- TOC entry 3420 (class 2606 OID 276293)
-- Name: persona persona_dni_key115; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key115 UNIQUE (dni);


--
-- TOC entry 3422 (class 2606 OID 276329)
-- Name: persona persona_dni_key116; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key116 UNIQUE (dni);


--
-- TOC entry 3424 (class 2606 OID 276835)
-- Name: persona persona_dni_key117; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key117 UNIQUE (dni);


--
-- TOC entry 3426 (class 2606 OID 276837)
-- Name: persona persona_dni_key118; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key118 UNIQUE (dni);


--
-- TOC entry 3428 (class 2606 OID 276839)
-- Name: persona persona_dni_key119; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key119 UNIQUE (dni);


--
-- TOC entry 3430 (class 2606 OID 276339)
-- Name: persona persona_dni_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key12 UNIQUE (dni);


--
-- TOC entry 3432 (class 2606 OID 276291)
-- Name: persona persona_dni_key120; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key120 UNIQUE (dni);


--
-- TOC entry 3434 (class 2606 OID 276431)
-- Name: persona persona_dni_key121; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key121 UNIQUE (dni);


--
-- TOC entry 3436 (class 2606 OID 276395)
-- Name: persona persona_dni_key122; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key122 UNIQUE (dni);


--
-- TOC entry 3438 (class 2606 OID 276519)
-- Name: persona persona_dni_key123; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key123 UNIQUE (dni);


--
-- TOC entry 3440 (class 2606 OID 276521)
-- Name: persona persona_dni_key124; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key124 UNIQUE (dni);


--
-- TOC entry 3442 (class 2606 OID 276429)
-- Name: persona persona_dni_key125; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key125 UNIQUE (dni);


--
-- TOC entry 3444 (class 2606 OID 276827)
-- Name: persona persona_dni_key126; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key126 UNIQUE (dni);


--
-- TOC entry 3446 (class 2606 OID 276523)
-- Name: persona persona_dni_key127; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key127 UNIQUE (dni);


--
-- TOC entry 3448 (class 2606 OID 276525)
-- Name: persona persona_dni_key128; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key128 UNIQUE (dni);


--
-- TOC entry 3450 (class 2606 OID 276801)
-- Name: persona persona_dni_key129; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key129 UNIQUE (dni);


--
-- TOC entry 3452 (class 2606 OID 276341)
-- Name: persona persona_dni_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key13 UNIQUE (dni);


--
-- TOC entry 3454 (class 2606 OID 276825)
-- Name: persona persona_dni_key130; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key130 UNIQUE (dni);


--
-- TOC entry 3456 (class 2606 OID 276803)
-- Name: persona persona_dni_key131; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key131 UNIQUE (dni);


--
-- TOC entry 3458 (class 2606 OID 276805)
-- Name: persona persona_dni_key132; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key132 UNIQUE (dni);


--
-- TOC entry 3460 (class 2606 OID 276807)
-- Name: persona persona_dni_key133; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key133 UNIQUE (dni);


--
-- TOC entry 3462 (class 2606 OID 276815)
-- Name: persona persona_dni_key134; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key134 UNIQUE (dni);


--
-- TOC entry 3464 (class 2606 OID 276809)
-- Name: persona persona_dni_key135; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key135 UNIQUE (dni);


--
-- TOC entry 3466 (class 2606 OID 276677)
-- Name: persona persona_dni_key136; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key136 UNIQUE (dni);


--
-- TOC entry 3468 (class 2606 OID 276813)
-- Name: persona persona_dni_key137; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key137 UNIQUE (dni);


--
-- TOC entry 3470 (class 2606 OID 276679)
-- Name: persona persona_dni_key138; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key138 UNIQUE (dni);


--
-- TOC entry 3472 (class 2606 OID 276681)
-- Name: persona persona_dni_key139; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key139 UNIQUE (dni);


--
-- TOC entry 3474 (class 2606 OID 276303)
-- Name: persona persona_dni_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key14 UNIQUE (dni);


--
-- TOC entry 3476 (class 2606 OID 276811)
-- Name: persona persona_dni_key140; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key140 UNIQUE (dni);


--
-- TOC entry 3478 (class 2606 OID 276683)
-- Name: persona persona_dni_key141; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key141 UNIQUE (dni);


--
-- TOC entry 3480 (class 2606 OID 276685)
-- Name: persona persona_dni_key142; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key142 UNIQUE (dni);


--
-- TOC entry 3482 (class 2606 OID 276687)
-- Name: persona persona_dni_key143; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key143 UNIQUE (dni);


--
-- TOC entry 3484 (class 2606 OID 276797)
-- Name: persona persona_dni_key144; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key144 UNIQUE (dni);


--
-- TOC entry 3486 (class 2606 OID 276689)
-- Name: persona persona_dni_key145; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key145 UNIQUE (dni);


--
-- TOC entry 3488 (class 2606 OID 276691)
-- Name: persona persona_dni_key146; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key146 UNIQUE (dni);


--
-- TOC entry 3490 (class 2606 OID 276795)
-- Name: persona persona_dni_key147; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key147 UNIQUE (dni);


--
-- TOC entry 3492 (class 2606 OID 276693)
-- Name: persona persona_dni_key148; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key148 UNIQUE (dni);


--
-- TOC entry 3494 (class 2606 OID 276695)
-- Name: persona persona_dni_key149; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key149 UNIQUE (dni);


--
-- TOC entry 3496 (class 2606 OID 276343)
-- Name: persona persona_dni_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key15 UNIQUE (dni);


--
-- TOC entry 3498 (class 2606 OID 276793)
-- Name: persona persona_dni_key150; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key150 UNIQUE (dni);


--
-- TOC entry 3500 (class 2606 OID 276697)
-- Name: persona persona_dni_key151; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key151 UNIQUE (dni);


--
-- TOC entry 3502 (class 2606 OID 276699)
-- Name: persona persona_dni_key152; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key152 UNIQUE (dni);


--
-- TOC entry 3504 (class 2606 OID 276791)
-- Name: persona persona_dni_key153; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key153 UNIQUE (dni);


--
-- TOC entry 3506 (class 2606 OID 276701)
-- Name: persona persona_dni_key154; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key154 UNIQUE (dni);


--
-- TOC entry 3508 (class 2606 OID 276783)
-- Name: persona persona_dni_key155; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key155 UNIQUE (dni);


--
-- TOC entry 3510 (class 2606 OID 276785)
-- Name: persona persona_dni_key156; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key156 UNIQUE (dni);


--
-- TOC entry 3512 (class 2606 OID 276789)
-- Name: persona persona_dni_key157; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key157 UNIQUE (dni);


--
-- TOC entry 3514 (class 2606 OID 276787)
-- Name: persona persona_dni_key158; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key158 UNIQUE (dni);


--
-- TOC entry 3516 (class 2606 OID 276769)
-- Name: persona persona_dni_key159; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key159 UNIQUE (dni);


--
-- TOC entry 3518 (class 2606 OID 276345)
-- Name: persona persona_dni_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key16 UNIQUE (dni);


--
-- TOC entry 3520 (class 2606 OID 276517)
-- Name: persona persona_dni_key160; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key160 UNIQUE (dni);


--
-- TOC entry 3522 (class 2606 OID 276771)
-- Name: persona persona_dni_key161; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key161 UNIQUE (dni);


--
-- TOC entry 3524 (class 2606 OID 276773)
-- Name: persona persona_dni_key162; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key162 UNIQUE (dni);


--
-- TOC entry 3526 (class 2606 OID 276775)
-- Name: persona persona_dni_key163; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key163 UNIQUE (dni);


--
-- TOC entry 3528 (class 2606 OID 276515)
-- Name: persona persona_dni_key164; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key164 UNIQUE (dni);


--
-- TOC entry 3530 (class 2606 OID 276503)
-- Name: persona persona_dni_key165; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key165 UNIQUE (dni);


--
-- TOC entry 3532 (class 2606 OID 276505)
-- Name: persona persona_dni_key166; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key166 UNIQUE (dni);


--
-- TOC entry 3534 (class 2606 OID 276513)
-- Name: persona persona_dni_key167; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key167 UNIQUE (dni);


--
-- TOC entry 3536 (class 2606 OID 276507)
-- Name: persona persona_dni_key168; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key168 UNIQUE (dni);


--
-- TOC entry 3538 (class 2606 OID 276509)
-- Name: persona persona_dni_key169; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key169 UNIQUE (dni);


--
-- TOC entry 3540 (class 2606 OID 276301)
-- Name: persona persona_dni_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key17 UNIQUE (dni);


--
-- TOC entry 3542 (class 2606 OID 276511)
-- Name: persona persona_dni_key170; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key170 UNIQUE (dni);


--
-- TOC entry 3544 (class 2606 OID 276405)
-- Name: persona persona_dni_key171; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key171 UNIQUE (dni);


--
-- TOC entry 3546 (class 2606 OID 276397)
-- Name: persona persona_dni_key172; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key172 UNIQUE (dni);


--
-- TOC entry 3548 (class 2606 OID 276399)
-- Name: persona persona_dni_key173; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key173 UNIQUE (dni);


--
-- TOC entry 3550 (class 2606 OID 276401)
-- Name: persona persona_dni_key174; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key174 UNIQUE (dni);


--
-- TOC entry 3552 (class 2606 OID 276403)
-- Name: persona persona_dni_key175; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key175 UNIQUE (dni);


--
-- TOC entry 3554 (class 2606 OID 276631)
-- Name: persona persona_dni_key176; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key176 UNIQUE (dni);


--
-- TOC entry 3556 (class 2606 OID 276617)
-- Name: persona persona_dni_key177; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key177 UNIQUE (dni);


--
-- TOC entry 3558 (class 2606 OID 276619)
-- Name: persona persona_dni_key178; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key178 UNIQUE (dni);


--
-- TOC entry 3560 (class 2606 OID 276629)
-- Name: persona persona_dni_key179; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key179 UNIQUE (dni);


--
-- TOC entry 3562 (class 2606 OID 276347)
-- Name: persona persona_dni_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key18 UNIQUE (dni);


--
-- TOC entry 3564 (class 2606 OID 276621)
-- Name: persona persona_dni_key180; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key180 UNIQUE (dni);


--
-- TOC entry 3566 (class 2606 OID 276623)
-- Name: persona persona_dni_key181; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key181 UNIQUE (dni);


--
-- TOC entry 3568 (class 2606 OID 276627)
-- Name: persona persona_dni_key182; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key182 UNIQUE (dni);


--
-- TOC entry 3570 (class 2606 OID 276625)
-- Name: persona persona_dni_key183; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key183 UNIQUE (dni);


--
-- TOC entry 3572 (class 2606 OID 276817)
-- Name: persona persona_dni_key184; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key184 UNIQUE (dni);


--
-- TOC entry 3574 (class 2606 OID 276823)
-- Name: persona persona_dni_key185; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key185 UNIQUE (dni);


--
-- TOC entry 3576 (class 2606 OID 276819)
-- Name: persona persona_dni_key186; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key186 UNIQUE (dni);


--
-- TOC entry 3578 (class 2606 OID 276821)
-- Name: persona persona_dni_key187; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key187 UNIQUE (dni);


--
-- TOC entry 3580 (class 2606 OID 276487)
-- Name: persona persona_dni_key188; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key188 UNIQUE (dni);


--
-- TOC entry 3582 (class 2606 OID 276611)
-- Name: persona persona_dni_key189; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key189 UNIQUE (dni);


--
-- TOC entry 3584 (class 2606 OID 276349)
-- Name: persona persona_dni_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key19 UNIQUE (dni);


--
-- TOC entry 3586 (class 2606 OID 276489)
-- Name: persona persona_dni_key190; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key190 UNIQUE (dni);


--
-- TOC entry 3588 (class 2606 OID 276759)
-- Name: persona persona_dni_key191; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key191 UNIQUE (dni);


--
-- TOC entry 3590 (class 2606 OID 276491)
-- Name: persona persona_dni_key192; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key192 UNIQUE (dni);


--
-- TOC entry 3592 (class 2606 OID 276493)
-- Name: persona persona_dni_key193; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key193 UNIQUE (dni);


--
-- TOC entry 3594 (class 2606 OID 276757)
-- Name: persona persona_dni_key194; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key194 UNIQUE (dni);


--
-- TOC entry 3596 (class 2606 OID 276495)
-- Name: persona persona_dni_key195; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key195 UNIQUE (dni);


--
-- TOC entry 3598 (class 2606 OID 276497)
-- Name: persona persona_dni_key196; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key196 UNIQUE (dni);


--
-- TOC entry 3600 (class 2606 OID 276499)
-- Name: persona persona_dni_key197; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key197 UNIQUE (dni);


--
-- TOC entry 3602 (class 2606 OID 276755)
-- Name: persona persona_dni_key198; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key198 UNIQUE (dni);


--
-- TOC entry 3604 (class 2606 OID 276501)
-- Name: persona persona_dni_key199; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key199 UNIQUE (dni);


--
-- TOC entry 3606 (class 2606 OID 276309)
-- Name: persona persona_dni_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key2 UNIQUE (dni);


--
-- TOC entry 3608 (class 2606 OID 276351)
-- Name: persona persona_dni_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key20 UNIQUE (dni);


--
-- TOC entry 3610 (class 2606 OID 276563)
-- Name: persona persona_dni_key200; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key200 UNIQUE (dni);


--
-- TOC entry 3612 (class 2606 OID 276753)
-- Name: persona persona_dni_key201; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key201 UNIQUE (dni);


--
-- TOC entry 3614 (class 2606 OID 276565)
-- Name: persona persona_dni_key202; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key202 UNIQUE (dni);


--
-- TOC entry 3616 (class 2606 OID 276567)
-- Name: persona persona_dni_key203; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key203 UNIQUE (dni);


--
-- TOC entry 3618 (class 2606 OID 276751)
-- Name: persona persona_dni_key204; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key204 UNIQUE (dni);


--
-- TOC entry 3620 (class 2606 OID 276569)
-- Name: persona persona_dni_key205; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key205 UNIQUE (dni);


--
-- TOC entry 3622 (class 2606 OID 276571)
-- Name: persona persona_dni_key206; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key206 UNIQUE (dni);


--
-- TOC entry 3624 (class 2606 OID 276749)
-- Name: persona persona_dni_key207; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key207 UNIQUE (dni);


--
-- TOC entry 3626 (class 2606 OID 276573)
-- Name: persona persona_dni_key208; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key208 UNIQUE (dni);


--
-- TOC entry 3628 (class 2606 OID 276575)
-- Name: persona persona_dni_key209; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key209 UNIQUE (dni);


--
-- TOC entry 3630 (class 2606 OID 276455)
-- Name: persona persona_dni_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key21 UNIQUE (dni);


--
-- TOC entry 3632 (class 2606 OID 276747)
-- Name: persona persona_dni_key210; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key210 UNIQUE (dni);


--
-- TOC entry 3634 (class 2606 OID 276577)
-- Name: persona persona_dni_key211; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key211 UNIQUE (dni);


--
-- TOC entry 3636 (class 2606 OID 276745)
-- Name: persona persona_dni_key212; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key212 UNIQUE (dni);


--
-- TOC entry 3638 (class 2606 OID 276579)
-- Name: persona persona_dni_key213; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key213 UNIQUE (dni);


--
-- TOC entry 3640 (class 2606 OID 276743)
-- Name: persona persona_dni_key214; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key214 UNIQUE (dni);


--
-- TOC entry 3642 (class 2606 OID 276581)
-- Name: persona persona_dni_key215; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key215 UNIQUE (dni);


--
-- TOC entry 3644 (class 2606 OID 276741)
-- Name: persona persona_dni_key216; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key216 UNIQUE (dni);


--
-- TOC entry 3646 (class 2606 OID 276583)
-- Name: persona persona_dni_key217; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key217 UNIQUE (dni);


--
-- TOC entry 3648 (class 2606 OID 276739)
-- Name: persona persona_dni_key218; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key218 UNIQUE (dni);


--
-- TOC entry 3650 (class 2606 OID 276585)
-- Name: persona persona_dni_key219; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key219 UNIQUE (dni);


--
-- TOC entry 3652 (class 2606 OID 276353)
-- Name: persona persona_dni_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key22 UNIQUE (dni);


--
-- TOC entry 3654 (class 2606 OID 276737)
-- Name: persona persona_dni_key220; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key220 UNIQUE (dni);


--
-- TOC entry 3656 (class 2606 OID 276587)
-- Name: persona persona_dni_key221; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key221 UNIQUE (dni);


--
-- TOC entry 3658 (class 2606 OID 276735)
-- Name: persona persona_dni_key222; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key222 UNIQUE (dni);


--
-- TOC entry 3660 (class 2606 OID 276589)
-- Name: persona persona_dni_key223; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key223 UNIQUE (dni);


--
-- TOC entry 3662 (class 2606 OID 276733)
-- Name: persona persona_dni_key224; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key224 UNIQUE (dni);


--
-- TOC entry 3664 (class 2606 OID 276591)
-- Name: persona persona_dni_key225; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key225 UNIQUE (dni);


--
-- TOC entry 3666 (class 2606 OID 276731)
-- Name: persona persona_dni_key226; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key226 UNIQUE (dni);


--
-- TOC entry 3668 (class 2606 OID 276593)
-- Name: persona persona_dni_key227; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key227 UNIQUE (dni);


--
-- TOC entry 3670 (class 2606 OID 276729)
-- Name: persona persona_dni_key228; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key228 UNIQUE (dni);


--
-- TOC entry 3672 (class 2606 OID 276595)
-- Name: persona persona_dni_key229; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key229 UNIQUE (dni);


--
-- TOC entry 3674 (class 2606 OID 276407)
-- Name: persona persona_dni_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key23 UNIQUE (dni);


--
-- TOC entry 3676 (class 2606 OID 276727)
-- Name: persona persona_dni_key230; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key230 UNIQUE (dni);


--
-- TOC entry 3678 (class 2606 OID 276597)
-- Name: persona persona_dni_key231; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key231 UNIQUE (dni);


--
-- TOC entry 3680 (class 2606 OID 276725)
-- Name: persona persona_dni_key232; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key232 UNIQUE (dni);


--
-- TOC entry 3682 (class 2606 OID 276599)
-- Name: persona persona_dni_key233; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key233 UNIQUE (dni);


--
-- TOC entry 3684 (class 2606 OID 276601)
-- Name: persona persona_dni_key234; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key234 UNIQUE (dni);


--
-- TOC entry 3686 (class 2606 OID 276609)
-- Name: persona persona_dni_key235; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key235 UNIQUE (dni);


--
-- TOC entry 3688 (class 2606 OID 276603)
-- Name: persona persona_dni_key236; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key236 UNIQUE (dni);


--
-- TOC entry 3690 (class 2606 OID 276607)
-- Name: persona persona_dni_key237; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key237 UNIQUE (dni);


--
-- TOC entry 3692 (class 2606 OID 276605)
-- Name: persona persona_dni_key238; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key238 UNIQUE (dni);


--
-- TOC entry 3694 (class 2606 OID 276799)
-- Name: persona persona_dni_key239; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key239 UNIQUE (dni);


--
-- TOC entry 3696 (class 2606 OID 276453)
-- Name: persona persona_dni_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key24 UNIQUE (dni);


--
-- TOC entry 3698 (class 2606 OID 276527)
-- Name: persona persona_dni_key240; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key240 UNIQUE (dni);


--
-- TOC entry 3700 (class 2606 OID 276529)
-- Name: persona persona_dni_key241; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key241 UNIQUE (dni);


--
-- TOC entry 3702 (class 2606 OID 276675)
-- Name: persona persona_dni_key242; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key242 UNIQUE (dni);


--
-- TOC entry 3704 (class 2606 OID 276531)
-- Name: persona persona_dni_key243; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key243 UNIQUE (dni);


--
-- TOC entry 3706 (class 2606 OID 276533)
-- Name: persona persona_dni_key244; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key244 UNIQUE (dni);


--
-- TOC entry 3708 (class 2606 OID 276673)
-- Name: persona persona_dni_key245; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key245 UNIQUE (dni);


--
-- TOC entry 3710 (class 2606 OID 276535)
-- Name: persona persona_dni_key246; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key246 UNIQUE (dni);


--
-- TOC entry 3712 (class 2606 OID 276537)
-- Name: persona persona_dni_key247; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key247 UNIQUE (dni);


--
-- TOC entry 3714 (class 2606 OID 276779)
-- Name: persona persona_dni_key248; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key248 UNIQUE (dni);


--
-- TOC entry 3716 (class 2606 OID 276539)
-- Name: persona persona_dni_key249; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key249 UNIQUE (dni);


--
-- TOC entry 3718 (class 2606 OID 276479)
-- Name: persona persona_dni_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key25 UNIQUE (dni);


--
-- TOC entry 3720 (class 2606 OID 276777)
-- Name: persona persona_dni_key250; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key250 UNIQUE (dni);


--
-- TOC entry 3722 (class 2606 OID 276561)
-- Name: persona persona_dni_key251; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key251 UNIQUE (dni);


--
-- TOC entry 3724 (class 2606 OID 276541)
-- Name: persona persona_dni_key252; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key252 UNIQUE (dni);


--
-- TOC entry 3726 (class 2606 OID 276543)
-- Name: persona persona_dni_key253; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key253 UNIQUE (dni);


--
-- TOC entry 3728 (class 2606 OID 276559)
-- Name: persona persona_dni_key254; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key254 UNIQUE (dni);


--
-- TOC entry 3730 (class 2606 OID 276545)
-- Name: persona persona_dni_key255; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key255 UNIQUE (dni);


--
-- TOC entry 3732 (class 2606 OID 276557)
-- Name: persona persona_dni_key256; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key256 UNIQUE (dni);


--
-- TOC entry 3734 (class 2606 OID 276547)
-- Name: persona persona_dni_key257; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key257 UNIQUE (dni);


--
-- TOC entry 3736 (class 2606 OID 276549)
-- Name: persona persona_dni_key258; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key258 UNIQUE (dni);


--
-- TOC entry 3738 (class 2606 OID 276555)
-- Name: persona persona_dni_key259; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key259 UNIQUE (dni);


--
-- TOC entry 3740 (class 2606 OID 276481)
-- Name: persona persona_dni_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key26 UNIQUE (dni);


--
-- TOC entry 3742 (class 2606 OID 276551)
-- Name: persona persona_dni_key260; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key260 UNIQUE (dni);


--
-- TOC entry 3744 (class 2606 OID 276553)
-- Name: persona persona_dni_key261; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key261 UNIQUE (dni);


--
-- TOC entry 3746 (class 2606 OID 276707)
-- Name: persona persona_dni_key262; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key262 UNIQUE (dni);


--
-- TOC entry 3748 (class 2606 OID 276655)
-- Name: persona persona_dni_key263; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key263 UNIQUE (dni);


--
-- TOC entry 3750 (class 2606 OID 276705)
-- Name: persona persona_dni_key264; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key264 UNIQUE (dni);


--
-- TOC entry 3752 (class 2606 OID 276657)
-- Name: persona persona_dni_key265; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key265 UNIQUE (dni);


--
-- TOC entry 3754 (class 2606 OID 276659)
-- Name: persona persona_dni_key266; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key266 UNIQUE (dni);


--
-- TOC entry 3756 (class 2606 OID 276703)
-- Name: persona persona_dni_key267; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key267 UNIQUE (dni);


--
-- TOC entry 3758 (class 2606 OID 276781)
-- Name: persona persona_dni_key268; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key268 UNIQUE (dni);


--
-- TOC entry 3760 (class 2606 OID 276661)
-- Name: persona persona_dni_key269; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key269 UNIQUE (dni);


--
-- TOC entry 3762 (class 2606 OID 276483)
-- Name: persona persona_dni_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key27 UNIQUE (dni);


--
-- TOC entry 3764 (class 2606 OID 276671)
-- Name: persona persona_dni_key270; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key270 UNIQUE (dni);


--
-- TOC entry 3766 (class 2606 OID 276663)
-- Name: persona persona_dni_key271; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key271 UNIQUE (dni);


--
-- TOC entry 3768 (class 2606 OID 276669)
-- Name: persona persona_dni_key272; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key272 UNIQUE (dni);


--
-- TOC entry 3770 (class 2606 OID 276665)
-- Name: persona persona_dni_key273; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key273 UNIQUE (dni);


--
-- TOC entry 3772 (class 2606 OID 276667)
-- Name: persona persona_dni_key274; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key274 UNIQUE (dni);


--
-- TOC entry 3774 (class 2606 OID 276289)
-- Name: persona persona_dni_key275; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key275 UNIQUE (dni);


--
-- TOC entry 3776 (class 2606 OID 276841)
-- Name: persona persona_dni_key276; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key276 UNIQUE (dni);


--
-- TOC entry 3778 (class 2606 OID 276287)
-- Name: persona persona_dni_key277; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key277 UNIQUE (dni);


--
-- TOC entry 3780 (class 2606 OID 276843)
-- Name: persona persona_dni_key278; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key278 UNIQUE (dni);


--
-- TOC entry 3782 (class 2606 OID 276285)
-- Name: persona persona_dni_key279; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key279 UNIQUE (dni);


--
-- TOC entry 3784 (class 2606 OID 276451)
-- Name: persona persona_dni_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key28 UNIQUE (dni);


--
-- TOC entry 3786 (class 2606 OID 276845)
-- Name: persona persona_dni_key280; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key280 UNIQUE (dni);


--
-- TOC entry 3788 (class 2606 OID 276283)
-- Name: persona persona_dni_key281; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key281 UNIQUE (dni);


--
-- TOC entry 3790 (class 2606 OID 276847)
-- Name: persona persona_dni_key282; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key282 UNIQUE (dni);


--
-- TOC entry 3792 (class 2606 OID 276281)
-- Name: persona persona_dni_key283; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key283 UNIQUE (dni);


--
-- TOC entry 3794 (class 2606 OID 276849)
-- Name: persona persona_dni_key284; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key284 UNIQUE (dni);


--
-- TOC entry 3796 (class 2606 OID 276279)
-- Name: persona persona_dni_key285; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key285 UNIQUE (dni);


--
-- TOC entry 3798 (class 2606 OID 276851)
-- Name: persona persona_dni_key286; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key286 UNIQUE (dni);


--
-- TOC entry 3800 (class 2606 OID 276277)
-- Name: persona persona_dni_key287; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key287 UNIQUE (dni);


--
-- TOC entry 3802 (class 2606 OID 276853)
-- Name: persona persona_dni_key288; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key288 UNIQUE (dni);


--
-- TOC entry 3804 (class 2606 OID 276275)
-- Name: persona persona_dni_key289; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key289 UNIQUE (dni);


--
-- TOC entry 3806 (class 2606 OID 276485)
-- Name: persona persona_dni_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key29 UNIQUE (dni);


--
-- TOC entry 3808 (class 2606 OID 276855)
-- Name: persona persona_dni_key290; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key290 UNIQUE (dni);


--
-- TOC entry 3810 (class 2606 OID 276273)
-- Name: persona persona_dni_key291; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key291 UNIQUE (dni);


--
-- TOC entry 3812 (class 2606 OID 276857)
-- Name: persona persona_dni_key292; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key292 UNIQUE (dni);


--
-- TOC entry 3814 (class 2606 OID 276271)
-- Name: persona persona_dni_key293; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key293 UNIQUE (dni);


--
-- TOC entry 3816 (class 2606 OID 276859)
-- Name: persona persona_dni_key294; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key294 UNIQUE (dni);


--
-- TOC entry 3818 (class 2606 OID 276247)
-- Name: persona persona_dni_key295; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key295 UNIQUE (dni);


--
-- TOC entry 3820 (class 2606 OID 276269)
-- Name: persona persona_dni_key296; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key296 UNIQUE (dni);


--
-- TOC entry 3822 (class 2606 OID 276249)
-- Name: persona persona_dni_key297; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key297 UNIQUE (dni);


--
-- TOC entry 3824 (class 2606 OID 276267)
-- Name: persona persona_dni_key298; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key298 UNIQUE (dni);


--
-- TOC entry 3826 (class 2606 OID 276251)
-- Name: persona persona_dni_key299; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key299 UNIQUE (dni);


--
-- TOC entry 3828 (class 2606 OID 276315)
-- Name: persona persona_dni_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key3 UNIQUE (dni);


--
-- TOC entry 3830 (class 2606 OID 276449)
-- Name: persona persona_dni_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key30 UNIQUE (dni);


--
-- TOC entry 3832 (class 2606 OID 276265)
-- Name: persona persona_dni_key300; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key300 UNIQUE (dni);


--
-- TOC entry 3834 (class 2606 OID 276253)
-- Name: persona persona_dni_key301; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key301 UNIQUE (dni);


--
-- TOC entry 3836 (class 2606 OID 276263)
-- Name: persona persona_dni_key302; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key302 UNIQUE (dni);


--
-- TOC entry 3838 (class 2606 OID 276255)
-- Name: persona persona_dni_key303; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key303 UNIQUE (dni);


--
-- TOC entry 3840 (class 2606 OID 276261)
-- Name: persona persona_dni_key304; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key304 UNIQUE (dni);


--
-- TOC entry 3842 (class 2606 OID 276257)
-- Name: persona persona_dni_key305; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key305 UNIQUE (dni);


--
-- TOC entry 3844 (class 2606 OID 276259)
-- Name: persona persona_dni_key306; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key306 UNIQUE (dni);


--
-- TOC entry 3846 (class 2606 OID 276861)
-- Name: persona persona_dni_key307; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key307 UNIQUE (dni);


--
-- TOC entry 3848 (class 2606 OID 276245)
-- Name: persona persona_dni_key308; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key308 UNIQUE (dni);


--
-- TOC entry 3850 (class 2606 OID 276863)
-- Name: persona persona_dni_key309; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key309 UNIQUE (dni);


--
-- TOC entry 3852 (class 2606 OID 276613)
-- Name: persona persona_dni_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key31 UNIQUE (dni);


--
-- TOC entry 3854 (class 2606 OID 276243)
-- Name: persona persona_dni_key310; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key310 UNIQUE (dni);


--
-- TOC entry 3856 (class 2606 OID 276865)
-- Name: persona persona_dni_key311; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key311 UNIQUE (dni);


--
-- TOC entry 3858 (class 2606 OID 276241)
-- Name: persona persona_dni_key312; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key312 UNIQUE (dni);


--
-- TOC entry 3860 (class 2606 OID 276867)
-- Name: persona persona_dni_key313; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key313 UNIQUE (dni);


--
-- TOC entry 3862 (class 2606 OID 276239)
-- Name: persona persona_dni_key314; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key314 UNIQUE (dni);


--
-- TOC entry 3864 (class 2606 OID 276869)
-- Name: persona persona_dni_key315; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key315 UNIQUE (dni);


--
-- TOC entry 3866 (class 2606 OID 276237)
-- Name: persona persona_dni_key316; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key316 UNIQUE (dni);


--
-- TOC entry 3868 (class 2606 OID 276871)
-- Name: persona persona_dni_key317; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key317 UNIQUE (dni);


--
-- TOC entry 3870 (class 2606 OID 276235)
-- Name: persona persona_dni_key318; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key318 UNIQUE (dni);


--
-- TOC entry 3872 (class 2606 OID 276873)
-- Name: persona persona_dni_key319; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key319 UNIQUE (dni);


--
-- TOC entry 3874 (class 2606 OID 276615)
-- Name: persona persona_dni_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key32 UNIQUE (dni);


--
-- TOC entry 3876 (class 2606 OID 276233)
-- Name: persona persona_dni_key320; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key320 UNIQUE (dni);


--
-- TOC entry 3878 (class 2606 OID 276875)
-- Name: persona persona_dni_key321; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key321 UNIQUE (dni);


--
-- TOC entry 3880 (class 2606 OID 276231)
-- Name: persona persona_dni_key322; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key322 UNIQUE (dni);


--
-- TOC entry 3882 (class 2606 OID 276877)
-- Name: persona persona_dni_key323; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key323 UNIQUE (dni);


--
-- TOC entry 3884 (class 2606 OID 276229)
-- Name: persona persona_dni_key324; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key324 UNIQUE (dni);


--
-- TOC entry 3886 (class 2606 OID 276879)
-- Name: persona persona_dni_key325; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key325 UNIQUE (dni);


--
-- TOC entry 3888 (class 2606 OID 276227)
-- Name: persona persona_dni_key326; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key326 UNIQUE (dni);


--
-- TOC entry 3890 (class 2606 OID 276881)
-- Name: persona persona_dni_key327; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key327 UNIQUE (dni);


--
-- TOC entry 3892 (class 2606 OID 276633)
-- Name: persona persona_dni_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key33 UNIQUE (dni);


--
-- TOC entry 3894 (class 2606 OID 276447)
-- Name: persona persona_dni_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key34 UNIQUE (dni);


--
-- TOC entry 3896 (class 2606 OID 276635)
-- Name: persona persona_dni_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key35 UNIQUE (dni);


--
-- TOC entry 3898 (class 2606 OID 276445)
-- Name: persona persona_dni_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key36 UNIQUE (dni);


--
-- TOC entry 3900 (class 2606 OID 276637)
-- Name: persona persona_dni_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key37 UNIQUE (dni);


--
-- TOC entry 3902 (class 2606 OID 276639)
-- Name: persona persona_dni_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key38 UNIQUE (dni);


--
-- TOC entry 3904 (class 2606 OID 276443)
-- Name: persona persona_dni_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key39 UNIQUE (dni);


--
-- TOC entry 3906 (class 2606 OID 276317)
-- Name: persona persona_dni_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key4 UNIQUE (dni);


--
-- TOC entry 3908 (class 2606 OID 276441)
-- Name: persona persona_dni_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key40 UNIQUE (dni);


--
-- TOC entry 3910 (class 2606 OID 276439)
-- Name: persona persona_dni_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key41 UNIQUE (dni);


--
-- TOC entry 3912 (class 2606 OID 276641)
-- Name: persona persona_dni_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key42 UNIQUE (dni);


--
-- TOC entry 3914 (class 2606 OID 276643)
-- Name: persona persona_dni_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key43 UNIQUE (dni);


--
-- TOC entry 3916 (class 2606 OID 276645)
-- Name: persona persona_dni_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key44 UNIQUE (dni);


--
-- TOC entry 3918 (class 2606 OID 276437)
-- Name: persona persona_dni_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key45 UNIQUE (dni);


--
-- TOC entry 3920 (class 2606 OID 276435)
-- Name: persona persona_dni_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key46 UNIQUE (dni);


--
-- TOC entry 3922 (class 2606 OID 276647)
-- Name: persona persona_dni_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key47 UNIQUE (dni);


--
-- TOC entry 3924 (class 2606 OID 276649)
-- Name: persona persona_dni_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key48 UNIQUE (dni);


--
-- TOC entry 3926 (class 2606 OID 276651)
-- Name: persona persona_dni_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key49 UNIQUE (dni);


--
-- TOC entry 3928 (class 2606 OID 276319)
-- Name: persona persona_dni_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key5 UNIQUE (dni);


--
-- TOC entry 3930 (class 2606 OID 276433)
-- Name: persona persona_dni_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key50 UNIQUE (dni);


--
-- TOC entry 3932 (class 2606 OID 276393)
-- Name: persona persona_dni_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key51 UNIQUE (dni);


--
-- TOC entry 3934 (class 2606 OID 276653)
-- Name: persona persona_dni_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key52 UNIQUE (dni);


--
-- TOC entry 3936 (class 2606 OID 276709)
-- Name: persona persona_dni_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key53 UNIQUE (dni);


--
-- TOC entry 3938 (class 2606 OID 276389)
-- Name: persona persona_dni_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key54 UNIQUE (dni);


--
-- TOC entry 3940 (class 2606 OID 276391)
-- Name: persona persona_dni_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key55 UNIQUE (dni);


--
-- TOC entry 3942 (class 2606 OID 276387)
-- Name: persona persona_dni_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key56 UNIQUE (dni);


--
-- TOC entry 3944 (class 2606 OID 276711)
-- Name: persona persona_dni_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key57 UNIQUE (dni);


--
-- TOC entry 3946 (class 2606 OID 276713)
-- Name: persona persona_dni_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key58 UNIQUE (dni);


--
-- TOC entry 3948 (class 2606 OID 276715)
-- Name: persona persona_dni_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key59 UNIQUE (dni);


--
-- TOC entry 3950 (class 2606 OID 276307)
-- Name: persona persona_dni_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key6 UNIQUE (dni);


--
-- TOC entry 3952 (class 2606 OID 276385)
-- Name: persona persona_dni_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key60 UNIQUE (dni);


--
-- TOC entry 3954 (class 2606 OID 276717)
-- Name: persona persona_dni_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key61 UNIQUE (dni);


--
-- TOC entry 3956 (class 2606 OID 276383)
-- Name: persona persona_dni_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key62 UNIQUE (dni);


--
-- TOC entry 3958 (class 2606 OID 276719)
-- Name: persona persona_dni_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key63 UNIQUE (dni);


--
-- TOC entry 3960 (class 2606 OID 276721)
-- Name: persona persona_dni_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key64 UNIQUE (dni);


--
-- TOC entry 3962 (class 2606 OID 276723)
-- Name: persona persona_dni_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key65 UNIQUE (dni);


--
-- TOC entry 3964 (class 2606 OID 276381)
-- Name: persona persona_dni_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key66 UNIQUE (dni);


--
-- TOC entry 3966 (class 2606 OID 276761)
-- Name: persona persona_dni_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key67 UNIQUE (dni);


--
-- TOC entry 3968 (class 2606 OID 276763)
-- Name: persona persona_dni_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key68 UNIQUE (dni);


--
-- TOC entry 3970 (class 2606 OID 276765)
-- Name: persona persona_dni_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key69 UNIQUE (dni);


--
-- TOC entry 3972 (class 2606 OID 276321)
-- Name: persona persona_dni_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key7 UNIQUE (dni);


--
-- TOC entry 3974 (class 2606 OID 276379)
-- Name: persona persona_dni_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key70 UNIQUE (dni);


--
-- TOC entry 3976 (class 2606 OID 276767)
-- Name: persona persona_dni_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key71 UNIQUE (dni);


--
-- TOC entry 3978 (class 2606 OID 276355)
-- Name: persona persona_dni_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key72 UNIQUE (dni);


--
-- TOC entry 3980 (class 2606 OID 276357)
-- Name: persona persona_dni_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key73 UNIQUE (dni);


--
-- TOC entry 3982 (class 2606 OID 276377)
-- Name: persona persona_dni_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key74 UNIQUE (dni);


--
-- TOC entry 3984 (class 2606 OID 276359)
-- Name: persona persona_dni_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key75 UNIQUE (dni);


--
-- TOC entry 3986 (class 2606 OID 276375)
-- Name: persona persona_dni_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key76 UNIQUE (dni);


--
-- TOC entry 3988 (class 2606 OID 276361)
-- Name: persona persona_dni_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key77 UNIQUE (dni);


--
-- TOC entry 3990 (class 2606 OID 276363)
-- Name: persona persona_dni_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key78 UNIQUE (dni);


--
-- TOC entry 3992 (class 2606 OID 276365)
-- Name: persona persona_dni_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key79 UNIQUE (dni);


--
-- TOC entry 3994 (class 2606 OID 276333)
-- Name: persona persona_dni_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key8 UNIQUE (dni);


--
-- TOC entry 3996 (class 2606 OID 276373)
-- Name: persona persona_dni_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key80 UNIQUE (dni);


--
-- TOC entry 3998 (class 2606 OID 276367)
-- Name: persona persona_dni_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key81 UNIQUE (dni);


--
-- TOC entry 4000 (class 2606 OID 276369)
-- Name: persona persona_dni_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key82 UNIQUE (dni);


--
-- TOC entry 4002 (class 2606 OID 276371)
-- Name: persona persona_dni_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key83 UNIQUE (dni);


--
-- TOC entry 4004 (class 2606 OID 276477)
-- Name: persona persona_dni_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key84 UNIQUE (dni);


--
-- TOC entry 4006 (class 2606 OID 276409)
-- Name: persona persona_dni_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key85 UNIQUE (dni);


--
-- TOC entry 4008 (class 2606 OID 276411)
-- Name: persona persona_dni_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key86 UNIQUE (dni);


--
-- TOC entry 4010 (class 2606 OID 276475)
-- Name: persona persona_dni_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key87 UNIQUE (dni);


--
-- TOC entry 4012 (class 2606 OID 276473)
-- Name: persona persona_dni_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key88 UNIQUE (dni);


--
-- TOC entry 4014 (class 2606 OID 276413)
-- Name: persona persona_dni_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key89 UNIQUE (dni);


--
-- TOC entry 4016 (class 2606 OID 276335)
-- Name: persona persona_dni_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key9 UNIQUE (dni);


--
-- TOC entry 4018 (class 2606 OID 276415)
-- Name: persona persona_dni_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key90 UNIQUE (dni);


--
-- TOC entry 4020 (class 2606 OID 276471)
-- Name: persona persona_dni_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key91 UNIQUE (dni);


--
-- TOC entry 4022 (class 2606 OID 276469)
-- Name: persona persona_dni_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key92 UNIQUE (dni);


--
-- TOC entry 4024 (class 2606 OID 276417)
-- Name: persona persona_dni_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key93 UNIQUE (dni);


--
-- TOC entry 4026 (class 2606 OID 276419)
-- Name: persona persona_dni_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key94 UNIQUE (dni);


--
-- TOC entry 4028 (class 2606 OID 276467)
-- Name: persona persona_dni_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key95 UNIQUE (dni);


--
-- TOC entry 4030 (class 2606 OID 276427)
-- Name: persona persona_dni_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key96 UNIQUE (dni);


--
-- TOC entry 4032 (class 2606 OID 276421)
-- Name: persona persona_dni_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key97 UNIQUE (dni);


--
-- TOC entry 4034 (class 2606 OID 276423)
-- Name: persona persona_dni_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key98 UNIQUE (dni);


--
-- TOC entry 4036 (class 2606 OID 276425)
-- Name: persona persona_dni_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_dni_key99 UNIQUE (dni);


--
-- TOC entry 4038 (class 2606 OID 25981)
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id_persona);


--
-- TOC entry 3380 (class 2606 OID 25964)
-- Name: piso piso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.piso
    ADD CONSTRAINT piso_pkey PRIMARY KEY (id_piso);


--
-- TOC entry 4660 (class 2606 OID 26035)
-- Name: privilegio privilegio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilegio
    ADD CONSTRAINT privilegio_pkey PRIMARY KEY (id_privilegio);


--
-- TOC entry 4042 (class 2606 OID 25999)
-- Name: procedencia procedencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.procedencia
    ADD CONSTRAINT procedencia_pkey PRIMARY KEY (id_procedencia);


--
-- TOC entry 4686 (class 2606 OID 26165)
-- Name: reglamento reglamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reglamento
    ADD CONSTRAINT reglamento_pkey PRIMARY KEY (id_regla);


--
-- TOC entry 4678 (class 2606 OID 26109)
-- Name: reservacion reservacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservacion
    ADD CONSTRAINT reservacion_pkey PRIMARY KEY (id_reservacion);


--
-- TOC entry 3378 (class 2606 OID 25957)
-- Name: sala sala_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sala
    ADD CONSTRAINT sala_pkey PRIMARY KEY (id_sala);


--
-- TOC entry 4696 (class 2606 OID 63612)
-- Name: transaccion transaccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaccion
    ADD CONSTRAINT transaccion_pkey PRIMARY KEY (id_transaccion);


--
-- TOC entry 4046 (class 2606 OID 277337)
-- Name: usuario usuario_nickname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key UNIQUE (nickname);


--
-- TOC entry 4048 (class 2606 OID 277339)
-- Name: usuario usuario_nickname_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key1 UNIQUE (nickname);


--
-- TOC entry 4050 (class 2606 OID 277331)
-- Name: usuario usuario_nickname_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key10 UNIQUE (nickname);


--
-- TOC entry 4052 (class 2606 OID 277413)
-- Name: usuario usuario_nickname_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key100 UNIQUE (nickname);


--
-- TOC entry 4054 (class 2606 OID 277409)
-- Name: usuario usuario_nickname_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key101 UNIQUE (nickname);


--
-- TOC entry 4056 (class 2606 OID 277411)
-- Name: usuario usuario_nickname_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key102 UNIQUE (nickname);


--
-- TOC entry 4058 (class 2606 OID 277353)
-- Name: usuario usuario_nickname_key103; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key103 UNIQUE (nickname);


--
-- TOC entry 4060 (class 2606 OID 277355)
-- Name: usuario usuario_nickname_key104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key104 UNIQUE (nickname);


--
-- TOC entry 4062 (class 2606 OID 277357)
-- Name: usuario usuario_nickname_key105; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key105 UNIQUE (nickname);


--
-- TOC entry 4064 (class 2606 OID 277397)
-- Name: usuario usuario_nickname_key106; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key106 UNIQUE (nickname);


--
-- TOC entry 4066 (class 2606 OID 277131)
-- Name: usuario usuario_nickname_key107; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key107 UNIQUE (nickname);


--
-- TOC entry 4068 (class 2606 OID 277133)
-- Name: usuario usuario_nickname_key108; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key108 UNIQUE (nickname);


--
-- TOC entry 4070 (class 2606 OID 277395)
-- Name: usuario usuario_nickname_key109; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key109 UNIQUE (nickname);


--
-- TOC entry 4072 (class 2606 OID 277369)
-- Name: usuario usuario_nickname_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key11 UNIQUE (nickname);


--
-- TOC entry 4074 (class 2606 OID 277135)
-- Name: usuario usuario_nickname_key110; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key110 UNIQUE (nickname);


--
-- TOC entry 4076 (class 2606 OID 277149)
-- Name: usuario usuario_nickname_key111; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key111 UNIQUE (nickname);


--
-- TOC entry 4078 (class 2606 OID 277153)
-- Name: usuario usuario_nickname_key112; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key112 UNIQUE (nickname);


--
-- TOC entry 4080 (class 2606 OID 277445)
-- Name: usuario usuario_nickname_key113; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key113 UNIQUE (nickname);


--
-- TOC entry 4082 (class 2606 OID 277431)
-- Name: usuario usuario_nickname_key114; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key114 UNIQUE (nickname);


--
-- TOC entry 4084 (class 2606 OID 277433)
-- Name: usuario usuario_nickname_key115; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key115 UNIQUE (nickname);


--
-- TOC entry 4086 (class 2606 OID 277443)
-- Name: usuario usuario_nickname_key116; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key116 UNIQUE (nickname);


--
-- TOC entry 4088 (class 2606 OID 277441)
-- Name: usuario usuario_nickname_key117; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key117 UNIQUE (nickname);


--
-- TOC entry 4090 (class 2606 OID 277435)
-- Name: usuario usuario_nickname_key118; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key118 UNIQUE (nickname);


--
-- TOC entry 4092 (class 2606 OID 277437)
-- Name: usuario usuario_nickname_key119; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key119 UNIQUE (nickname);


--
-- TOC entry 4094 (class 2606 OID 277371)
-- Name: usuario usuario_nickname_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key12 UNIQUE (nickname);


--
-- TOC entry 4096 (class 2606 OID 277439)
-- Name: usuario usuario_nickname_key120; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key120 UNIQUE (nickname);


--
-- TOC entry 4098 (class 2606 OID 277091)
-- Name: usuario usuario_nickname_key121; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key121 UNIQUE (nickname);


--
-- TOC entry 4100 (class 2606 OID 277287)
-- Name: usuario usuario_nickname_key122; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key122 UNIQUE (nickname);


--
-- TOC entry 4102 (class 2606 OID 277093)
-- Name: usuario usuario_nickname_key123; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key123 UNIQUE (nickname);


--
-- TOC entry 4104 (class 2606 OID 277095)
-- Name: usuario usuario_nickname_key124; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key124 UNIQUE (nickname);


--
-- TOC entry 4106 (class 2606 OID 277285)
-- Name: usuario usuario_nickname_key125; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key125 UNIQUE (nickname);


--
-- TOC entry 4108 (class 2606 OID 277097)
-- Name: usuario usuario_nickname_key126; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key126 UNIQUE (nickname);


--
-- TOC entry 4110 (class 2606 OID 277099)
-- Name: usuario usuario_nickname_key127; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key127 UNIQUE (nickname);


--
-- TOC entry 4112 (class 2606 OID 277243)
-- Name: usuario usuario_nickname_key128; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key128 UNIQUE (nickname);


--
-- TOC entry 4114 (class 2606 OID 277101)
-- Name: usuario usuario_nickname_key129; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key129 UNIQUE (nickname);


--
-- TOC entry 4116 (class 2606 OID 277459)
-- Name: usuario usuario_nickname_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key13 UNIQUE (nickname);


--
-- TOC entry 4118 (class 2606 OID 277103)
-- Name: usuario usuario_nickname_key130; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key130 UNIQUE (nickname);


--
-- TOC entry 4120 (class 2606 OID 277241)
-- Name: usuario usuario_nickname_key131; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key131 UNIQUE (nickname);


--
-- TOC entry 4122 (class 2606 OID 277105)
-- Name: usuario usuario_nickname_key132; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key132 UNIQUE (nickname);


--
-- TOC entry 4124 (class 2606 OID 277107)
-- Name: usuario usuario_nickname_key133; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key133 UNIQUE (nickname);


--
-- TOC entry 4126 (class 2606 OID 277239)
-- Name: usuario usuario_nickname_key134; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key134 UNIQUE (nickname);


--
-- TOC entry 4128 (class 2606 OID 277115)
-- Name: usuario usuario_nickname_key135; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key135 UNIQUE (nickname);


--
-- TOC entry 4130 (class 2606 OID 277117)
-- Name: usuario usuario_nickname_key136; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key136 UNIQUE (nickname);


--
-- TOC entry 4132 (class 2606 OID 277237)
-- Name: usuario usuario_nickname_key137; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key137 UNIQUE (nickname);


--
-- TOC entry 4134 (class 2606 OID 277123)
-- Name: usuario usuario_nickname_key138; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key138 UNIQUE (nickname);


--
-- TOC entry 4136 (class 2606 OID 277125)
-- Name: usuario usuario_nickname_key139; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key139 UNIQUE (nickname);


--
-- TOC entry 4138 (class 2606 OID 277329)
-- Name: usuario usuario_nickname_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key14 UNIQUE (nickname);


--
-- TOC entry 4140 (class 2606 OID 277489)
-- Name: usuario usuario_nickname_key140; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key140 UNIQUE (nickname);


--
-- TOC entry 4142 (class 2606 OID 277281)
-- Name: usuario usuario_nickname_key141; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key141 UNIQUE (nickname);


--
-- TOC entry 4144 (class 2606 OID 277283)
-- Name: usuario usuario_nickname_key142; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key142 UNIQUE (nickname);


--
-- TOC entry 4146 (class 2606 OID 277487)
-- Name: usuario usuario_nickname_key143; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key143 UNIQUE (nickname);


--
-- TOC entry 4148 (class 2606 OID 277245)
-- Name: usuario usuario_nickname_key144; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key144 UNIQUE (nickname);


--
-- TOC entry 4150 (class 2606 OID 277247)
-- Name: usuario usuario_nickname_key145; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key145 UNIQUE (nickname);


--
-- TOC entry 4152 (class 2606 OID 277485)
-- Name: usuario usuario_nickname_key146; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key146 UNIQUE (nickname);


--
-- TOC entry 4154 (class 2606 OID 277249)
-- Name: usuario usuario_nickname_key147; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key147 UNIQUE (nickname);


--
-- TOC entry 4156 (class 2606 OID 277253)
-- Name: usuario usuario_nickname_key148; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key148 UNIQUE (nickname);


--
-- TOC entry 4158 (class 2606 OID 277255)
-- Name: usuario usuario_nickname_key149; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key149 UNIQUE (nickname);


--
-- TOC entry 4160 (class 2606 OID 277463)
-- Name: usuario usuario_nickname_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key15 UNIQUE (nickname);


--
-- TOC entry 4162 (class 2606 OID 277211)
-- Name: usuario usuario_nickname_key150; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key150 UNIQUE (nickname);


--
-- TOC entry 4164 (class 2606 OID 277259)
-- Name: usuario usuario_nickname_key151; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key151 UNIQUE (nickname);


--
-- TOC entry 4166 (class 2606 OID 277261)
-- Name: usuario usuario_nickname_key152; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key152 UNIQUE (nickname);


--
-- TOC entry 4168 (class 2606 OID 277217)
-- Name: usuario usuario_nickname_key153; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key153 UNIQUE (nickname);


--
-- TOC entry 4170 (class 2606 OID 277209)
-- Name: usuario usuario_nickname_key154; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key154 UNIQUE (nickname);


--
-- TOC entry 4172 (class 2606 OID 277219)
-- Name: usuario usuario_nickname_key155; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key155 UNIQUE (nickname);


--
-- TOC entry 4174 (class 2606 OID 277221)
-- Name: usuario usuario_nickname_key156; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key156 UNIQUE (nickname);


--
-- TOC entry 4176 (class 2606 OID 277207)
-- Name: usuario usuario_nickname_key157; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key157 UNIQUE (nickname);


--
-- TOC entry 4178 (class 2606 OID 277223)
-- Name: usuario usuario_nickname_key158; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key158 UNIQUE (nickname);


--
-- TOC entry 4180 (class 2606 OID 277205)
-- Name: usuario usuario_nickname_key159; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key159 UNIQUE (nickname);


--
-- TOC entry 4182 (class 2606 OID 277327)
-- Name: usuario usuario_nickname_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key16 UNIQUE (nickname);


--
-- TOC entry 4184 (class 2606 OID 277177)
-- Name: usuario usuario_nickname_key160; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key160 UNIQUE (nickname);


--
-- TOC entry 4186 (class 2606 OID 277225)
-- Name: usuario usuario_nickname_key161; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key161 UNIQUE (nickname);


--
-- TOC entry 4188 (class 2606 OID 277227)
-- Name: usuario usuario_nickname_key162; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key162 UNIQUE (nickname);


--
-- TOC entry 4190 (class 2606 OID 277481)
-- Name: usuario usuario_nickname_key163; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key163 UNIQUE (nickname);


--
-- TOC entry 4192 (class 2606 OID 277229)
-- Name: usuario usuario_nickname_key164; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key164 UNIQUE (nickname);


--
-- TOC entry 4194 (class 2606 OID 277231)
-- Name: usuario usuario_nickname_key165; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key165 UNIQUE (nickname);


--
-- TOC entry 4196 (class 2606 OID 277479)
-- Name: usuario usuario_nickname_key166; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key166 UNIQUE (nickname);


--
-- TOC entry 4198 (class 2606 OID 277233)
-- Name: usuario usuario_nickname_key167; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key167 UNIQUE (nickname);


--
-- TOC entry 4200 (class 2606 OID 277235)
-- Name: usuario usuario_nickname_key168; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key168 UNIQUE (nickname);


--
-- TOC entry 4202 (class 2606 OID 277477)
-- Name: usuario usuario_nickname_key169; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key169 UNIQUE (nickname);


--
-- TOC entry 4204 (class 2606 OID 277325)
-- Name: usuario usuario_nickname_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key17 UNIQUE (nickname);


--
-- TOC entry 4206 (class 2606 OID 277045)
-- Name: usuario usuario_nickname_key170; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key170 UNIQUE (nickname);


--
-- TOC entry 4208 (class 2606 OID 277047)
-- Name: usuario usuario_nickname_key171; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key171 UNIQUE (nickname);


--
-- TOC entry 4210 (class 2606 OID 277475)
-- Name: usuario usuario_nickname_key172; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key172 UNIQUE (nickname);


--
-- TOC entry 4212 (class 2606 OID 277049)
-- Name: usuario usuario_nickname_key173; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key173 UNIQUE (nickname);


--
-- TOC entry 4214 (class 2606 OID 277051)
-- Name: usuario usuario_nickname_key174; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key174 UNIQUE (nickname);


--
-- TOC entry 4216 (class 2606 OID 277473)
-- Name: usuario usuario_nickname_key175; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key175 UNIQUE (nickname);


--
-- TOC entry 4218 (class 2606 OID 277053)
-- Name: usuario usuario_nickname_key176; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key176 UNIQUE (nickname);


--
-- TOC entry 4220 (class 2606 OID 277467)
-- Name: usuario usuario_nickname_key177; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key177 UNIQUE (nickname);


--
-- TOC entry 4222 (class 2606 OID 277471)
-- Name: usuario usuario_nickname_key178; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key178 UNIQUE (nickname);


--
-- TOC entry 4224 (class 2606 OID 277469)
-- Name: usuario usuario_nickname_key179; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key179 UNIQUE (nickname);


--
-- TOC entry 4226 (class 2606 OID 277465)
-- Name: usuario usuario_nickname_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key18 UNIQUE (nickname);


--
-- TOC entry 4228 (class 2606 OID 277179)
-- Name: usuario usuario_nickname_key180; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key180 UNIQUE (nickname);


--
-- TOC entry 4230 (class 2606 OID 277203)
-- Name: usuario usuario_nickname_key181; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key181 UNIQUE (nickname);


--
-- TOC entry 4232 (class 2606 OID 277181)
-- Name: usuario usuario_nickname_key182; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key182 UNIQUE (nickname);


--
-- TOC entry 4234 (class 2606 OID 277201)
-- Name: usuario usuario_nickname_key183; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key183 UNIQUE (nickname);


--
-- TOC entry 4236 (class 2606 OID 277295)
-- Name: usuario usuario_nickname_key184; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key184 UNIQUE (nickname);


--
-- TOC entry 4238 (class 2606 OID 277263)
-- Name: usuario usuario_nickname_key185; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key185 UNIQUE (nickname);


--
-- TOC entry 4240 (class 2606 OID 277265)
-- Name: usuario usuario_nickname_key186; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key186 UNIQUE (nickname);


--
-- TOC entry 4242 (class 2606 OID 277215)
-- Name: usuario usuario_nickname_key187; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key187 UNIQUE (nickname);


--
-- TOC entry 4244 (class 2606 OID 277271)
-- Name: usuario usuario_nickname_key188; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key188 UNIQUE (nickname);


--
-- TOC entry 4246 (class 2606 OID 277273)
-- Name: usuario usuario_nickname_key189; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key189 UNIQUE (nickname);


--
-- TOC entry 4248 (class 2606 OID 277009)
-- Name: usuario usuario_nickname_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key19 UNIQUE (nickname);


--
-- TOC entry 4250 (class 2606 OID 277427)
-- Name: usuario usuario_nickname_key190; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key190 UNIQUE (nickname);


--
-- TOC entry 4252 (class 2606 OID 276971)
-- Name: usuario usuario_nickname_key191; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key191 UNIQUE (nickname);


--
-- TOC entry 4254 (class 2606 OID 276993)
-- Name: usuario usuario_nickname_key192; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key192 UNIQUE (nickname);


--
-- TOC entry 4256 (class 2606 OID 277257)
-- Name: usuario usuario_nickname_key193; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key193 UNIQUE (nickname);


--
-- TOC entry 4258 (class 2606 OID 276973)
-- Name: usuario usuario_nickname_key194; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key194 UNIQUE (nickname);


--
-- TOC entry 4260 (class 2606 OID 277363)
-- Name: usuario usuario_nickname_key195; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key195 UNIQUE (nickname);


--
-- TOC entry 4262 (class 2606 OID 277161)
-- Name: usuario usuario_nickname_key196; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key196 UNIQUE (nickname);


--
-- TOC entry 4264 (class 2606 OID 277175)
-- Name: usuario usuario_nickname_key197; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key197 UNIQUE (nickname);


--
-- TOC entry 4266 (class 2606 OID 277163)
-- Name: usuario usuario_nickname_key198; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key198 UNIQUE (nickname);


--
-- TOC entry 4268 (class 2606 OID 277173)
-- Name: usuario usuario_nickname_key199; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key199 UNIQUE (nickname);


--
-- TOC entry 4270 (class 2606 OID 277335)
-- Name: usuario usuario_nickname_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key2 UNIQUE (nickname);


--
-- TOC entry 4272 (class 2606 OID 276953)
-- Name: usuario usuario_nickname_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key20 UNIQUE (nickname);


--
-- TOC entry 4274 (class 2606 OID 277167)
-- Name: usuario usuario_nickname_key200; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key200 UNIQUE (nickname);


--
-- TOC entry 4276 (class 2606 OID 277171)
-- Name: usuario usuario_nickname_key201; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key201 UNIQUE (nickname);


--
-- TOC entry 4278 (class 2606 OID 277071)
-- Name: usuario usuario_nickname_key202; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key202 UNIQUE (nickname);


--
-- TOC entry 4280 (class 2606 OID 277121)
-- Name: usuario usuario_nickname_key203; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key203 UNIQUE (nickname);


--
-- TOC entry 4282 (class 2606 OID 277213)
-- Name: usuario usuario_nickname_key204; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key204 UNIQUE (nickname);


--
-- TOC entry 4284 (class 2606 OID 277461)
-- Name: usuario usuario_nickname_key205; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key205 UNIQUE (nickname);


--
-- TOC entry 4286 (class 2606 OID 277073)
-- Name: usuario usuario_nickname_key206; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key206 UNIQUE (nickname);


--
-- TOC entry 4288 (class 2606 OID 277367)
-- Name: usuario usuario_nickname_key207; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key207 UNIQUE (nickname);


--
-- TOC entry 4290 (class 2606 OID 277365)
-- Name: usuario usuario_nickname_key208; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key208 UNIQUE (nickname);


--
-- TOC entry 4292 (class 2606 OID 277127)
-- Name: usuario usuario_nickname_key209; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key209 UNIQUE (nickname);


--
-- TOC entry 4294 (class 2606 OID 277089)
-- Name: usuario usuario_nickname_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key21 UNIQUE (nickname);


--
-- TOC entry 4296 (class 2606 OID 277075)
-- Name: usuario usuario_nickname_key210; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key210 UNIQUE (nickname);


--
-- TOC entry 4298 (class 2606 OID 277077)
-- Name: usuario usuario_nickname_key211; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key211 UNIQUE (nickname);


--
-- TOC entry 4300 (class 2606 OID 276987)
-- Name: usuario usuario_nickname_key212; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key212 UNIQUE (nickname);


--
-- TOC entry 4302 (class 2606 OID 276915)
-- Name: usuario usuario_nickname_key213; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key213 UNIQUE (nickname);


--
-- TOC entry 4304 (class 2606 OID 277305)
-- Name: usuario usuario_nickname_key214; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key214 UNIQUE (nickname);


--
-- TOC entry 4306 (class 2606 OID 277119)
-- Name: usuario usuario_nickname_key215; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key215 UNIQUE (nickname);


--
-- TOC entry 4308 (class 2606 OID 277109)
-- Name: usuario usuario_nickname_key216; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key216 UNIQUE (nickname);


--
-- TOC entry 4310 (class 2606 OID 277113)
-- Name: usuario usuario_nickname_key217; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key217 UNIQUE (nickname);


--
-- TOC entry 4312 (class 2606 OID 277111)
-- Name: usuario usuario_nickname_key218; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key218 UNIQUE (nickname);


--
-- TOC entry 4314 (class 2606 OID 277275)
-- Name: usuario usuario_nickname_key219; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key219 UNIQUE (nickname);


--
-- TOC entry 4316 (class 2606 OID 276955)
-- Name: usuario usuario_nickname_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key22 UNIQUE (nickname);


--
-- TOC entry 4318 (class 2606 OID 276991)
-- Name: usuario usuario_nickname_key220; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key220 UNIQUE (nickname);


--
-- TOC entry 4320 (class 2606 OID 277277)
-- Name: usuario usuario_nickname_key221; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key221 UNIQUE (nickname);


--
-- TOC entry 4322 (class 2606 OID 276989)
-- Name: usuario usuario_nickname_key222; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key222 UNIQUE (nickname);


--
-- TOC entry 4324 (class 2606 OID 277279)
-- Name: usuario usuario_nickname_key223; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key223 UNIQUE (nickname);


--
-- TOC entry 4326 (class 2606 OID 276999)
-- Name: usuario usuario_nickname_key224; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key224 UNIQUE (nickname);


--
-- TOC entry 4328 (class 2606 OID 277453)
-- Name: usuario usuario_nickname_key225; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key225 UNIQUE (nickname);


--
-- TOC entry 4330 (class 2606 OID 276923)
-- Name: usuario usuario_nickname_key226; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key226 UNIQUE (nickname);


--
-- TOC entry 4332 (class 2606 OID 276945)
-- Name: usuario usuario_nickname_key227; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key227 UNIQUE (nickname);


--
-- TOC entry 4334 (class 2606 OID 276943)
-- Name: usuario usuario_nickname_key228; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key228 UNIQUE (nickname);


--
-- TOC entry 4336 (class 2606 OID 276925)
-- Name: usuario usuario_nickname_key229; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key229 UNIQUE (nickname);


--
-- TOC entry 4338 (class 2606 OID 277087)
-- Name: usuario usuario_nickname_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key23 UNIQUE (nickname);


--
-- TOC entry 4340 (class 2606 OID 276941)
-- Name: usuario usuario_nickname_key230; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key230 UNIQUE (nickname);


--
-- TOC entry 4342 (class 2606 OID 276927)
-- Name: usuario usuario_nickname_key231; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key231 UNIQUE (nickname);


--
-- TOC entry 4344 (class 2606 OID 276939)
-- Name: usuario usuario_nickname_key232; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key232 UNIQUE (nickname);


--
-- TOC entry 4346 (class 2606 OID 276929)
-- Name: usuario usuario_nickname_key233; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key233 UNIQUE (nickname);


--
-- TOC entry 4348 (class 2606 OID 276937)
-- Name: usuario usuario_nickname_key234; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key234 UNIQUE (nickname);


--
-- TOC entry 4350 (class 2606 OID 276935)
-- Name: usuario usuario_nickname_key235; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key235 UNIQUE (nickname);


--
-- TOC entry 4352 (class 2606 OID 276931)
-- Name: usuario usuario_nickname_key236; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key236 UNIQUE (nickname);


--
-- TOC entry 4354 (class 2606 OID 276933)
-- Name: usuario usuario_nickname_key237; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key237 UNIQUE (nickname);


--
-- TOC entry 4356 (class 2606 OID 277165)
-- Name: usuario usuario_nickname_key238; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key238 UNIQUE (nickname);


--
-- TOC entry 4358 (class 2606 OID 277147)
-- Name: usuario usuario_nickname_key239; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key239 UNIQUE (nickname);


--
-- TOC entry 4360 (class 2606 OID 276957)
-- Name: usuario usuario_nickname_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key24 UNIQUE (nickname);


--
-- TOC entry 4362 (class 2606 OID 277137)
-- Name: usuario usuario_nickname_key240; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key240 UNIQUE (nickname);


--
-- TOC entry 4364 (class 2606 OID 277145)
-- Name: usuario usuario_nickname_key241; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key241 UNIQUE (nickname);


--
-- TOC entry 4366 (class 2606 OID 277151)
-- Name: usuario usuario_nickname_key242; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key242 UNIQUE (nickname);


--
-- TOC entry 4368 (class 2606 OID 277139)
-- Name: usuario usuario_nickname_key243; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key243 UNIQUE (nickname);


--
-- TOC entry 4370 (class 2606 OID 277141)
-- Name: usuario usuario_nickname_key244; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key244 UNIQUE (nickname);


--
-- TOC entry 4372 (class 2606 OID 277143)
-- Name: usuario usuario_nickname_key245; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key245 UNIQUE (nickname);


--
-- TOC entry 4374 (class 2606 OID 277251)
-- Name: usuario usuario_nickname_key246; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key246 UNIQUE (nickname);


--
-- TOC entry 4376 (class 2606 OID 277495)
-- Name: usuario usuario_nickname_key247; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key247 UNIQUE (nickname);


--
-- TOC entry 4378 (class 2606 OID 277011)
-- Name: usuario usuario_nickname_key248; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key248 UNIQUE (nickname);


--
-- TOC entry 4380 (class 2606 OID 277013)
-- Name: usuario usuario_nickname_key249; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key249 UNIQUE (nickname);


--
-- TOC entry 4382 (class 2606 OID 276959)
-- Name: usuario usuario_nickname_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key25 UNIQUE (nickname);


--
-- TOC entry 4384 (class 2606 OID 277493)
-- Name: usuario usuario_nickname_key250; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key250 UNIQUE (nickname);


--
-- TOC entry 4386 (class 2606 OID 277015)
-- Name: usuario usuario_nickname_key251; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key251 UNIQUE (nickname);


--
-- TOC entry 4388 (class 2606 OID 277491)
-- Name: usuario usuario_nickname_key252; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key252 UNIQUE (nickname);


--
-- TOC entry 4390 (class 2606 OID 277017)
-- Name: usuario usuario_nickname_key253; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key253 UNIQUE (nickname);


--
-- TOC entry 4392 (class 2606 OID 277019)
-- Name: usuario usuario_nickname_key254; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key254 UNIQUE (nickname);


--
-- TOC entry 4394 (class 2606 OID 277043)
-- Name: usuario usuario_nickname_key255; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key255 UNIQUE (nickname);


--
-- TOC entry 4396 (class 2606 OID 277037)
-- Name: usuario usuario_nickname_key256; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key256 UNIQUE (nickname);


--
-- TOC entry 4398 (class 2606 OID 277041)
-- Name: usuario usuario_nickname_key257; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key257 UNIQUE (nickname);


--
-- TOC entry 4400 (class 2606 OID 277039)
-- Name: usuario usuario_nickname_key258; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key258 UNIQUE (nickname);


--
-- TOC entry 4402 (class 2606 OID 277195)
-- Name: usuario usuario_nickname_key259; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key259 UNIQUE (nickname);


--
-- TOC entry 4404 (class 2606 OID 276967)
-- Name: usuario usuario_nickname_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key26 UNIQUE (nickname);


--
-- TOC entry 4406 (class 2606 OID 277183)
-- Name: usuario usuario_nickname_key260; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key260 UNIQUE (nickname);


--
-- TOC entry 4408 (class 2606 OID 277193)
-- Name: usuario usuario_nickname_key261; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key261 UNIQUE (nickname);


--
-- TOC entry 4410 (class 2606 OID 277185)
-- Name: usuario usuario_nickname_key262; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key262 UNIQUE (nickname);


--
-- TOC entry 4412 (class 2606 OID 277191)
-- Name: usuario usuario_nickname_key263; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key263 UNIQUE (nickname);


--
-- TOC entry 4414 (class 2606 OID 277187)
-- Name: usuario usuario_nickname_key264; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key264 UNIQUE (nickname);


--
-- TOC entry 4416 (class 2606 OID 277189)
-- Name: usuario usuario_nickname_key265; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key265 UNIQUE (nickname);


--
-- TOC entry 4418 (class 2606 OID 277065)
-- Name: usuario usuario_nickname_key266; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key266 UNIQUE (nickname);


--
-- TOC entry 4420 (class 2606 OID 277067)
-- Name: usuario usuario_nickname_key267; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key267 UNIQUE (nickname);


--
-- TOC entry 4422 (class 2606 OID 277345)
-- Name: usuario usuario_nickname_key268; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key268 UNIQUE (nickname);


--
-- TOC entry 4424 (class 2606 OID 277347)
-- Name: usuario usuario_nickname_key269; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key269 UNIQUE (nickname);


--
-- TOC entry 4426 (class 2606 OID 277083)
-- Name: usuario usuario_nickname_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key27 UNIQUE (nickname);


--
-- TOC entry 4428 (class 2606 OID 277197)
-- Name: usuario usuario_nickname_key270; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key270 UNIQUE (nickname);


--
-- TOC entry 4430 (class 2606 OID 277199)
-- Name: usuario usuario_nickname_key271; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key271 UNIQUE (nickname);


--
-- TOC entry 4432 (class 2606 OID 277387)
-- Name: usuario usuario_nickname_key272; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key272 UNIQUE (nickname);


--
-- TOC entry 4434 (class 2606 OID 277269)
-- Name: usuario usuario_nickname_key273; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key273 UNIQUE (nickname);


--
-- TOC entry 4436 (class 2606 OID 277267)
-- Name: usuario usuario_nickname_key274; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key274 UNIQUE (nickname);


--
-- TOC entry 4438 (class 2606 OID 277001)
-- Name: usuario usuario_nickname_key275; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key275 UNIQUE (nickname);


--
-- TOC entry 4440 (class 2606 OID 277063)
-- Name: usuario usuario_nickname_key276; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key276 UNIQUE (nickname);


--
-- TOC entry 4442 (class 2606 OID 277003)
-- Name: usuario usuario_nickname_key277; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key277 UNIQUE (nickname);


--
-- TOC entry 4444 (class 2606 OID 277061)
-- Name: usuario usuario_nickname_key278; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key278 UNIQUE (nickname);


--
-- TOC entry 4446 (class 2606 OID 277059)
-- Name: usuario usuario_nickname_key279; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key279 UNIQUE (nickname);


--
-- TOC entry 4448 (class 2606 OID 277085)
-- Name: usuario usuario_nickname_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key28 UNIQUE (nickname);


--
-- TOC entry 4450 (class 2606 OID 277005)
-- Name: usuario usuario_nickname_key280; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key280 UNIQUE (nickname);


--
-- TOC entry 4452 (class 2606 OID 277057)
-- Name: usuario usuario_nickname_key281; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key281 UNIQUE (nickname);


--
-- TOC entry 4454 (class 2606 OID 277055)
-- Name: usuario usuario_nickname_key282; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key282 UNIQUE (nickname);


--
-- TOC entry 4456 (class 2606 OID 277169)
-- Name: usuario usuario_nickname_key283; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key283 UNIQUE (nickname);


--
-- TOC entry 4458 (class 2606 OID 277007)
-- Name: usuario usuario_nickname_key284; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key284 UNIQUE (nickname);


--
-- TOC entry 4460 (class 2606 OID 277483)
-- Name: usuario usuario_nickname_key285; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key285 UNIQUE (nickname);


--
-- TOC entry 4462 (class 2606 OID 277451)
-- Name: usuario usuario_nickname_key286; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key286 UNIQUE (nickname);


--
-- TOC entry 4464 (class 2606 OID 277129)
-- Name: usuario usuario_nickname_key287; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key287 UNIQUE (nickname);


--
-- TOC entry 4466 (class 2606 OID 277021)
-- Name: usuario usuario_nickname_key288; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key288 UNIQUE (nickname);


--
-- TOC entry 4468 (class 2606 OID 277035)
-- Name: usuario usuario_nickname_key289; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key289 UNIQUE (nickname);


--
-- TOC entry 4470 (class 2606 OID 276969)
-- Name: usuario usuario_nickname_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key29 UNIQUE (nickname);


--
-- TOC entry 4472 (class 2606 OID 277023)
-- Name: usuario usuario_nickname_key290; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key290 UNIQUE (nickname);


--
-- TOC entry 4474 (class 2606 OID 277033)
-- Name: usuario usuario_nickname_key291; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key291 UNIQUE (nickname);


--
-- TOC entry 4476 (class 2606 OID 277025)
-- Name: usuario usuario_nickname_key292; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key292 UNIQUE (nickname);


--
-- TOC entry 4478 (class 2606 OID 277031)
-- Name: usuario usuario_nickname_key293; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key293 UNIQUE (nickname);


--
-- TOC entry 4480 (class 2606 OID 277027)
-- Name: usuario usuario_nickname_key294; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key294 UNIQUE (nickname);


--
-- TOC entry 4482 (class 2606 OID 277029)
-- Name: usuario usuario_nickname_key295; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key295 UNIQUE (nickname);


--
-- TOC entry 4484 (class 2606 OID 276963)
-- Name: usuario usuario_nickname_key296; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key296 UNIQUE (nickname);


--
-- TOC entry 4486 (class 2606 OID 276965)
-- Name: usuario usuario_nickname_key297; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key297 UNIQUE (nickname);


--
-- TOC entry 4488 (class 2606 OID 276903)
-- Name: usuario usuario_nickname_key298; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key298 UNIQUE (nickname);


--
-- TOC entry 4490 (class 2606 OID 276905)
-- Name: usuario usuario_nickname_key299; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key299 UNIQUE (nickname);


--
-- TOC entry 4492 (class 2606 OID 277497)
-- Name: usuario usuario_nickname_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key3 UNIQUE (nickname);


--
-- TOC entry 4494 (class 2606 OID 277081)
-- Name: usuario usuario_nickname_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key30 UNIQUE (nickname);


--
-- TOC entry 4496 (class 2606 OID 277499)
-- Name: usuario usuario_nickname_key300; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key300 UNIQUE (nickname);


--
-- TOC entry 4498 (class 2606 OID 276897)
-- Name: usuario usuario_nickname_key301; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key301 UNIQUE (nickname);


--
-- TOC entry 4500 (class 2606 OID 277501)
-- Name: usuario usuario_nickname_key302; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key302 UNIQUE (nickname);


--
-- TOC entry 4502 (class 2606 OID 276895)
-- Name: usuario usuario_nickname_key303; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key303 UNIQUE (nickname);


--
-- TOC entry 4504 (class 2606 OID 277503)
-- Name: usuario usuario_nickname_key304; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key304 UNIQUE (nickname);


--
-- TOC entry 4506 (class 2606 OID 276995)
-- Name: usuario usuario_nickname_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key31 UNIQUE (nickname);


--
-- TOC entry 4508 (class 2606 OID 276997)
-- Name: usuario usuario_nickname_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key32 UNIQUE (nickname);


--
-- TOC entry 4510 (class 2606 OID 277069)
-- Name: usuario usuario_nickname_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key33 UNIQUE (nickname);


--
-- TOC entry 4512 (class 2606 OID 276975)
-- Name: usuario usuario_nickname_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key34 UNIQUE (nickname);


--
-- TOC entry 4514 (class 2606 OID 277079)
-- Name: usuario usuario_nickname_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key35 UNIQUE (nickname);


--
-- TOC entry 4516 (class 2606 OID 276983)
-- Name: usuario usuario_nickname_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key36 UNIQUE (nickname);


--
-- TOC entry 4518 (class 2606 OID 276977)
-- Name: usuario usuario_nickname_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key37 UNIQUE (nickname);


--
-- TOC entry 4520 (class 2606 OID 276979)
-- Name: usuario usuario_nickname_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key38 UNIQUE (nickname);


--
-- TOC entry 4522 (class 2606 OID 276981)
-- Name: usuario usuario_nickname_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key39 UNIQUE (nickname);


--
-- TOC entry 4524 (class 2606 OID 276899)
-- Name: usuario usuario_nickname_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key4 UNIQUE (nickname);


--
-- TOC entry 4526 (class 2606 OID 276985)
-- Name: usuario usuario_nickname_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key40 UNIQUE (nickname);


--
-- TOC entry 4528 (class 2606 OID 277159)
-- Name: usuario usuario_nickname_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key41 UNIQUE (nickname);


--
-- TOC entry 4530 (class 2606 OID 277425)
-- Name: usuario usuario_nickname_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key42 UNIQUE (nickname);


--
-- TOC entry 4532 (class 2606 OID 277429)
-- Name: usuario usuario_nickname_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key43 UNIQUE (nickname);


--
-- TOC entry 4534 (class 2606 OID 277155)
-- Name: usuario usuario_nickname_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key44 UNIQUE (nickname);


--
-- TOC entry 4536 (class 2606 OID 277157)
-- Name: usuario usuario_nickname_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key45 UNIQUE (nickname);


--
-- TOC entry 4538 (class 2606 OID 277323)
-- Name: usuario usuario_nickname_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key46 UNIQUE (nickname);


--
-- TOC entry 4540 (class 2606 OID 277289)
-- Name: usuario usuario_nickname_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key47 UNIQUE (nickname);


--
-- TOC entry 4542 (class 2606 OID 277293)
-- Name: usuario usuario_nickname_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key48 UNIQUE (nickname);


--
-- TOC entry 4544 (class 2606 OID 277297)
-- Name: usuario usuario_nickname_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key49 UNIQUE (nickname);


--
-- TOC entry 4546 (class 2606 OID 277349)
-- Name: usuario usuario_nickname_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key5 UNIQUE (nickname);


--
-- TOC entry 4548 (class 2606 OID 277321)
-- Name: usuario usuario_nickname_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key50 UNIQUE (nickname);


--
-- TOC entry 4550 (class 2606 OID 277319)
-- Name: usuario usuario_nickname_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key51 UNIQUE (nickname);


--
-- TOC entry 4552 (class 2606 OID 277299)
-- Name: usuario usuario_nickname_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key52 UNIQUE (nickname);


--
-- TOC entry 4554 (class 2606 OID 277301)
-- Name: usuario usuario_nickname_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key53 UNIQUE (nickname);


--
-- TOC entry 4556 (class 2606 OID 277317)
-- Name: usuario usuario_nickname_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key54 UNIQUE (nickname);


--
-- TOC entry 4558 (class 2606 OID 277303)
-- Name: usuario usuario_nickname_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key55 UNIQUE (nickname);


--
-- TOC entry 4560 (class 2606 OID 277315)
-- Name: usuario usuario_nickname_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key56 UNIQUE (nickname);


--
-- TOC entry 4562 (class 2606 OID 277307)
-- Name: usuario usuario_nickname_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key57 UNIQUE (nickname);


--
-- TOC entry 4564 (class 2606 OID 277309)
-- Name: usuario usuario_nickname_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key58 UNIQUE (nickname);


--
-- TOC entry 4566 (class 2606 OID 277311)
-- Name: usuario usuario_nickname_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key59 UNIQUE (nickname);


--
-- TOC entry 4568 (class 2606 OID 277351)
-- Name: usuario usuario_nickname_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key6 UNIQUE (nickname);


--
-- TOC entry 4570 (class 2606 OID 277313)
-- Name: usuario usuario_nickname_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key60 UNIQUE (nickname);


--
-- TOC entry 4572 (class 2606 OID 276961)
-- Name: usuario usuario_nickname_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key61 UNIQUE (nickname);


--
-- TOC entry 4574 (class 2606 OID 276901)
-- Name: usuario usuario_nickname_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key62 UNIQUE (nickname);


--
-- TOC entry 4576 (class 2606 OID 276907)
-- Name: usuario usuario_nickname_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key63 UNIQUE (nickname);


--
-- TOC entry 4578 (class 2606 OID 276909)
-- Name: usuario usuario_nickname_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key64 UNIQUE (nickname);


--
-- TOC entry 4580 (class 2606 OID 277343)
-- Name: usuario usuario_nickname_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key65 UNIQUE (nickname);


--
-- TOC entry 4582 (class 2606 OID 276911)
-- Name: usuario usuario_nickname_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key66 UNIQUE (nickname);


--
-- TOC entry 4584 (class 2606 OID 276913)
-- Name: usuario usuario_nickname_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key67 UNIQUE (nickname);


--
-- TOC entry 4586 (class 2606 OID 276917)
-- Name: usuario usuario_nickname_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key68 UNIQUE (nickname);


--
-- TOC entry 4588 (class 2606 OID 277341)
-- Name: usuario usuario_nickname_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key69 UNIQUE (nickname);


--
-- TOC entry 4590 (class 2606 OID 277333)
-- Name: usuario usuario_nickname_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key7 UNIQUE (nickname);


--
-- TOC entry 4592 (class 2606 OID 276919)
-- Name: usuario usuario_nickname_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key70 UNIQUE (nickname);


--
-- TOC entry 4594 (class 2606 OID 276921)
-- Name: usuario usuario_nickname_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key71 UNIQUE (nickname);


--
-- TOC entry 4596 (class 2606 OID 276947)
-- Name: usuario usuario_nickname_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key72 UNIQUE (nickname);


--
-- TOC entry 4598 (class 2606 OID 276951)
-- Name: usuario usuario_nickname_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key73 UNIQUE (nickname);


--
-- TOC entry 4600 (class 2606 OID 277373)
-- Name: usuario usuario_nickname_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key74 UNIQUE (nickname);


--
-- TOC entry 4602 (class 2606 OID 277457)
-- Name: usuario usuario_nickname_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key75 UNIQUE (nickname);


--
-- TOC entry 4604 (class 2606 OID 277375)
-- Name: usuario usuario_nickname_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key76 UNIQUE (nickname);


--
-- TOC entry 4606 (class 2606 OID 277377)
-- Name: usuario usuario_nickname_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key77 UNIQUE (nickname);


--
-- TOC entry 4608 (class 2606 OID 277379)
-- Name: usuario usuario_nickname_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key78 UNIQUE (nickname);


--
-- TOC entry 4610 (class 2606 OID 277455)
-- Name: usuario usuario_nickname_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key79 UNIQUE (nickname);


--
-- TOC entry 4612 (class 2606 OID 277359)
-- Name: usuario usuario_nickname_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key8 UNIQUE (nickname);


--
-- TOC entry 4614 (class 2606 OID 277381)
-- Name: usuario usuario_nickname_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key80 UNIQUE (nickname);


--
-- TOC entry 4616 (class 2606 OID 277423)
-- Name: usuario usuario_nickname_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key81 UNIQUE (nickname);


--
-- TOC entry 4618 (class 2606 OID 277383)
-- Name: usuario usuario_nickname_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key82 UNIQUE (nickname);


--
-- TOC entry 4620 (class 2606 OID 277421)
-- Name: usuario usuario_nickname_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key83 UNIQUE (nickname);


--
-- TOC entry 4622 (class 2606 OID 277385)
-- Name: usuario usuario_nickname_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key84 UNIQUE (nickname);


--
-- TOC entry 4624 (class 2606 OID 277389)
-- Name: usuario usuario_nickname_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key85 UNIQUE (nickname);


--
-- TOC entry 4626 (class 2606 OID 277447)
-- Name: usuario usuario_nickname_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key86 UNIQUE (nickname);


--
-- TOC entry 4628 (class 2606 OID 277391)
-- Name: usuario usuario_nickname_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key87 UNIQUE (nickname);


--
-- TOC entry 4630 (class 2606 OID 277393)
-- Name: usuario usuario_nickname_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key88 UNIQUE (nickname);


--
-- TOC entry 4632 (class 2606 OID 277291)
-- Name: usuario usuario_nickname_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key89 UNIQUE (nickname);


--
-- TOC entry 4634 (class 2606 OID 277361)
-- Name: usuario usuario_nickname_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key9 UNIQUE (nickname);


--
-- TOC entry 4636 (class 2606 OID 276949)
-- Name: usuario usuario_nickname_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key90 UNIQUE (nickname);


--
-- TOC entry 4638 (class 2606 OID 277449)
-- Name: usuario usuario_nickname_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key91 UNIQUE (nickname);


--
-- TOC entry 4640 (class 2606 OID 277399)
-- Name: usuario usuario_nickname_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key92 UNIQUE (nickname);


--
-- TOC entry 4642 (class 2606 OID 277401)
-- Name: usuario usuario_nickname_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key93 UNIQUE (nickname);


--
-- TOC entry 4644 (class 2606 OID 277419)
-- Name: usuario usuario_nickname_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key94 UNIQUE (nickname);


--
-- TOC entry 4646 (class 2606 OID 277403)
-- Name: usuario usuario_nickname_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key95 UNIQUE (nickname);


--
-- TOC entry 4648 (class 2606 OID 277405)
-- Name: usuario usuario_nickname_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key96 UNIQUE (nickname);


--
-- TOC entry 4650 (class 2606 OID 277417)
-- Name: usuario usuario_nickname_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key97 UNIQUE (nickname);


--
-- TOC entry 4652 (class 2606 OID 277415)
-- Name: usuario usuario_nickname_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key98 UNIQUE (nickname);


--
-- TOC entry 4654 (class 2606 OID 277407)
-- Name: usuario usuario_nickname_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nickname_key99 UNIQUE (nickname);


--
-- TOC entry 4656 (class 2606 OID 26021)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 4658 (class 2606 OID 26030)
-- Name: usuario_privilegio usuario_privilegio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_privilegio
    ADD CONSTRAINT usuario_privilegio_pkey PRIMARY KEY (id_usuario_privilegio);


--
-- TOC entry 4715 (class 2606 OID 277559)
-- Name: afiliado_huesped afiliado_huesped_id_afiliado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.afiliado_huesped
    ADD CONSTRAINT afiliado_huesped_id_afiliado_fkey FOREIGN KEY (id_afiliado) REFERENCES public.afiliado(id_afiliado) ON UPDATE CASCADE;


--
-- TOC entry 4716 (class 2606 OID 277564)
-- Name: afiliado_huesped afiliado_huesped_id_huesped_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.afiliado_huesped
    ADD CONSTRAINT afiliado_huesped_id_huesped_fkey FOREIGN KEY (id_huesped) REFERENCES public.huesped(id_huesped) ON UPDATE CASCADE;


--
-- TOC entry 4723 (class 2606 OID 277586)
-- Name: cama cama_id_habitacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cama
    ADD CONSTRAINT cama_id_habitacion_fkey FOREIGN KEY (id_habitacion) REFERENCES public.habitacion(id_habitacion) ON UPDATE CASCADE;


--
-- TOC entry 4722 (class 2606 OID 277579)
-- Name: habitacion habitacion_id_lugar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion
    ADD CONSTRAINT habitacion_id_lugar_fkey FOREIGN KEY (id_lugar) REFERENCES public.lugar(id_lugar) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4714 (class 2606 OID 277544)
-- Name: huesped huesped_id_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.huesped
    ADD CONSTRAINT huesped_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona) ON UPDATE CASCADE;


--
-- TOC entry 4717 (class 2606 OID 277574)
-- Name: iglesia_huesped iglesia_huesped_id_huesped_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iglesia_huesped
    ADD CONSTRAINT iglesia_huesped_id_huesped_fkey FOREIGN KEY (id_huesped) REFERENCES public.huesped(id_huesped) ON UPDATE CASCADE;


--
-- TOC entry 4718 (class 2606 OID 277569)
-- Name: iglesia_huesped iglesia_huesped_id_iglesia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iglesia_huesped
    ADD CONSTRAINT iglesia_huesped_id_iglesia_fkey FOREIGN KEY (id_iglesia) REFERENCES public.iglesia(id_iglesia) ON UPDATE CASCADE;


--
-- TOC entry 4724 (class 2606 OID 277618)
-- Name: lista_negra lista_negra_id_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista_negra
    ADD CONSTRAINT lista_negra_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona) ON UPDATE CASCADE;


--
-- TOC entry 4725 (class 2606 OID 277623)
-- Name: lista_negra lista_negra_id_regla_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista_negra
    ADD CONSTRAINT lista_negra_id_regla_fkey FOREIGN KEY (id_regla) REFERENCES public.reglamento(id_regla) ON UPDATE CASCADE;


--
-- TOC entry 4726 (class 2606 OID 277628)
-- Name: lista_solicitud lista_solicitud_id_paciente_huesped_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista_solicitud
    ADD CONSTRAINT lista_solicitud_id_paciente_huesped_fkey FOREIGN KEY (id_paciente_huesped) REFERENCES public.paciente_huesped(id_paciente_huesped) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4730 (class 2606 OID 277612)
-- Name: ofrenda ofrenda_id_reservacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ofrenda
    ADD CONSTRAINT ofrenda_id_reservacion_fkey FOREIGN KEY (id_reservacion) REFERENCES public.reservacion(id_reservacion) ON UPDATE CASCADE;


--
-- TOC entry 4727 (class 2606 OID 277554)
-- Name: paciente_huesped paciente_huesped_id_huesped_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente_huesped
    ADD CONSTRAINT paciente_huesped_id_huesped_fkey FOREIGN KEY (id_huesped) REFERENCES public.huesped(id_huesped) ON UPDATE CASCADE;


--
-- TOC entry 4728 (class 2606 OID 277549)
-- Name: paciente_huesped paciente_huesped_id_paciente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente_huesped
    ADD CONSTRAINT paciente_huesped_id_paciente_fkey FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente) ON UPDATE CASCADE;


--
-- TOC entry 4710 (class 2606 OID 277524)
-- Name: paciente paciente_id_hospital_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT paciente_id_hospital_fkey FOREIGN KEY (id_hospital) REFERENCES public.hospital(id_hospital) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4711 (class 2606 OID 277539)
-- Name: paciente paciente_id_person_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT paciente_id_person_fkey FOREIGN KEY (id_person) REFERENCES public.persona(id_persona) ON UPDATE CASCADE;


--
-- TOC entry 4712 (class 2606 OID 277529)
-- Name: paciente paciente_id_piso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT paciente_id_piso_fkey FOREIGN KEY (id_piso) REFERENCES public.piso(id_piso) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4713 (class 2606 OID 277534)
-- Name: paciente paciente_id_sala_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT paciente_id_sala_fkey FOREIGN KEY (id_sala) REFERENCES public.sala(id_sala) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4729 (class 2606 OID 203959)
-- Name: pago pago_id_reservacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_id_reservacion_fkey FOREIGN KEY (id_reservacion) REFERENCES public.reservacion(id_reservacion) ON UPDATE CASCADE;


--
-- TOC entry 4708 (class 2606 OID 277519)
-- Name: patrono_afiliado patrono_afiliado_id_afiliado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrono_afiliado
    ADD CONSTRAINT patrono_afiliado_id_afiliado_fkey FOREIGN KEY (id_afiliado) REFERENCES public.afiliado(id_afiliado) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4709 (class 2606 OID 277514)
-- Name: patrono_afiliado patrono_afiliado_id_patrono_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrono_afiliado
    ADD CONSTRAINT patrono_afiliado_id_patrono_fkey FOREIGN KEY (id_patrono) REFERENCES public.patrono(id_patrono) ON UPDATE CASCADE;


--
-- TOC entry 4701 (class 2606 OID 276219)
-- Name: persona persona_id_lugar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_id_lugar_fkey FOREIGN KEY (id_lugar) REFERENCES public.lugar(id_lugar) ON UPDATE CASCADE;


--
-- TOC entry 4702 (class 2606 OID 276209)
-- Name: persona persona_id_ocupacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_id_ocupacion_fkey FOREIGN KEY (id_ocupacion) REFERENCES public.ocupacion(id_ocupacion) ON UPDATE CASCADE;


--
-- TOC entry 4703 (class 2606 OID 276214)
-- Name: persona persona_id_procedencia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_id_procedencia_fkey FOREIGN KEY (id_procedencia) REFERENCES public.procedencia(id_procedencia) ON UPDATE CASCADE;


--
-- TOC entry 4700 (class 2606 OID 276199)
-- Name: piso piso_id_hospital_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.piso
    ADD CONSTRAINT piso_id_hospital_fkey FOREIGN KEY (id_hospital) REFERENCES public.hospital(id_hospital) ON UPDATE CASCADE;


--
-- TOC entry 4719 (class 2606 OID 277598)
-- Name: reservacion reservacion_id_cama_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservacion
    ADD CONSTRAINT reservacion_id_cama_fkey FOREIGN KEY (id_cama) REFERENCES public.cama(id_cama) ON UPDATE CASCADE;


--
-- TOC entry 4720 (class 2606 OID 277603)
-- Name: reservacion reservacion_id_hospital_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservacion
    ADD CONSTRAINT reservacion_id_hospital_fkey FOREIGN KEY (id_hospital) REFERENCES public.hospital(id_hospital) ON UPDATE CASCADE;


--
-- TOC entry 4721 (class 2606 OID 277593)
-- Name: reservacion reservacion_id_paciente_huesped_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservacion
    ADD CONSTRAINT reservacion_id_paciente_huesped_fkey FOREIGN KEY (id_paciente_huesped) REFERENCES public.paciente_huesped(id_paciente_huesped) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4699 (class 2606 OID 276204)
-- Name: sala sala_id_piso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sala
    ADD CONSTRAINT sala_id_piso_fkey FOREIGN KEY (id_piso) REFERENCES public.piso(id_piso) ON UPDATE CASCADE;


--
-- TOC entry 4731 (class 2606 OID 63613)
-- Name: transaccion transaccion_id_huesped_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaccion
    ADD CONSTRAINT transaccion_id_huesped_fkey FOREIGN KEY (id_huesped) REFERENCES public.huesped(id_huesped) ON UPDATE CASCADE;


--
-- TOC entry 4704 (class 2606 OID 276887)
-- Name: usuario usuario_id_hospital_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_hospital_fkey FOREIGN KEY (id_hospital) REFERENCES public.hospital(id_hospital) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4705 (class 2606 OID 276882)
-- Name: usuario usuario_id_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona) ON UPDATE CASCADE;


--
-- TOC entry 4706 (class 2606 OID 277509)
-- Name: usuario_privilegio usuario_privilegio_id_privilegio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_privilegio
    ADD CONSTRAINT usuario_privilegio_id_privilegio_fkey FOREIGN KEY (id_privilegio) REFERENCES public.privilegio(id_privilegio) ON UPDATE CASCADE;


--
-- TOC entry 4707 (class 2606 OID 277504)
-- Name: usuario_privilegio usuario_privilegio_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_privilegio
    ADD CONSTRAINT usuario_privilegio_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) ON UPDATE CASCADE;


--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-06-15 19:07:00

--
-- PostgreSQL database dump complete
--

