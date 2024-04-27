--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

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
-- Name: dcv; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "dcv" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';


ALTER DATABASE "dcv" OWNER TO postgres;

\connect "dcv"

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
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: generate_unique_userid(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_unique_userid() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.userid := LEFT(MD5(random()::text), 5);
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.generate_unique_userid() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    fileid integer NOT NULL,
    userid character varying(10),
    filename character varying(255) NOT NULL
);


ALTER TABLE public.files OWNER TO postgres;

--
-- Name: files_fileid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_fileid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_fileid_seq OWNER TO postgres;

--
-- Name: files_fileid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_fileid_seq OWNED BY public.files.fileid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    userid character(5) NOT NULL,
    fname character varying(100),
    lname character varying(100),
    phno character varying(100),
    email character varying(100) NOT NULL,
    hash character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: files fileid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN fileid SET DEFAULT nextval('public.files_fileid_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (fileid, userid, filename) FROM stdin;
57	0c4d3	file-1709569554799resume.pdf
58	be57a	file-1711899848985resume.pdf
59	807f6	file-1712133559713resume.pdf
60	842b5	file-1713807587203resume.pdf
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, userid, fname, lname, phno, email, hash, created_at) FROM stdin;
42	0c4d3	Chinmay	Bharadwaj	9019473197	struntgaming55@gmail.com	$2b$10$AjF3lFvt9rJWiHy1Eh8zPuOew9eHvd/HAEJhBxl9NLdc1ooCtA6Oy	2024-03-04 21:54:26.87995
43	2fb57	look	loook	123	look	$2b$10$gWFB.ztFPK52IjcfRLsIUuUnNQuaXTFqRqdplZfxbUiojMHxA75mK	2024-03-05 21:32:24.330482
44	be57a	Kiran	Bharadwaj	9164	asd@kiran	$2b$10$O0fP1nuBolxJ42wlN6vC6uPI13ltYTmBu4wSamyvSbr1Iu/oDRk5m	2024-03-31 21:13:51.20306
45	807f6	Kiran	Bharadwaj H D	9164552388	hdkiranbharadwaj@gmail.com	$2b$10$.4ZI3cy1LPgV.IW9qVqWweX3MCSOSi7HmBYI/P6X8Sk31l0cmSrvG	2024-04-03 14:08:54.169477
46	842b5	Kiran	B	91	hd	$2b$10$nfa4YoTSDramMDQoxREnrelJzYZZeaR2LrKxg.cbquBKSC9vOlj42	2024-04-22 23:09:06.331204
47	4d253	Kiran	qwe	913	hdk	$2b$10$q11QKC1/5h3cSpTkQ1G8bOdb8TfpDNMHElNKXjlkHvoMObjeZmaB2	2024-04-26 10:28:05.585887
\.


--
-- Name: files_fileid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_fileid_seq', 60, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 47, true);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (fileid);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_userid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_userid_key UNIQUE (userid);


--
-- Name: users generate_userid_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER generate_userid_trigger BEFORE INSERT ON public.users FOR EACH ROW EXECUTE FUNCTION public.generate_unique_userid();


--
-- Name: files files_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- PostgreSQL database dump complete
--

