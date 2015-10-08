--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.5
-- Dumped by pg_dump version 9.3.5
-- Started on 2015-10-08 16:56:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1963 (class 1262 OID 36927)
-- Name: bookstore; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE bookstore WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Paraguay.1252' LC_CTYPE = 'Spanish_Paraguay.1252';


ALTER DATABASE bookstore OWNER TO postgres;

\connect bookstore

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 176 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1966 (class 0 OID 0)
-- Dependencies: 176
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 175 (class 1259 OID 36951)
-- Name: author; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE author (
    id integer NOT NULL,
    book_id integer NOT NULL,
    first_name character varying(60) NOT NULL,
    last_name character varying(120) NOT NULL
);


ALTER TABLE public.author OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 36949)
-- Name: author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.author_id_seq OWNER TO postgres;

--
-- TOC entry 1967 (class 0 OID 0)
-- Dependencies: 174
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE author_id_seq OWNED BY author.id;


--
-- TOC entry 173 (class 1259 OID 36938)
-- Name: book; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE book (
    id integer NOT NULL,
    category_id integer NOT NULL,
    book_title character varying(120) NOT NULL,
    publisher character varying(60) NOT NULL
);


ALTER TABLE public.book OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 36936)
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_id_seq OWNER TO postgres;

--
-- TOC entry 1968 (class 0 OID 0)
-- Dependencies: 172
-- Name: book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE book_id_seq OWNED BY book.id;


--
-- TOC entry 171 (class 1259 OID 36930)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE category (
    id integer NOT NULL,
    category_description character varying(120) NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 36928)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 1969 (class 0 OID 0)
-- Dependencies: 170
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE category_id_seq OWNED BY category.id;


--
-- TOC entry 1837 (class 2604 OID 36954)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);


--
-- TOC entry 1836 (class 2604 OID 36941)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY book ALTER COLUMN id SET DEFAULT nextval('book_id_seq'::regclass);


--
-- TOC entry 1835 (class 2604 OID 36933)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category ALTER COLUMN id SET DEFAULT nextval('category_id_seq'::regclass);


--
-- TOC entry 1958 (class 0 OID 36951)
-- Dependencies: 175
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO author (id, book_id, first_name, last_name) VALUES (1, 1, 'Luke', 'VanderHart');
INSERT INTO author (id, book_id, first_name, last_name) VALUES (2, 2, 'Vishal', 'Layka');
INSERT INTO author (id, book_id, first_name, last_name) VALUES (3, 3, 'Jeff', 'Brown');
INSERT INTO author (id, book_id, first_name, last_name) VALUES (4, 4, 'Bashar', 'Jawad');
INSERT INTO author (id, book_id, first_name, last_name) VALUES (5, 5, 'Vishal', 'Layka');
INSERT INTO author (id, book_id, first_name, last_name) VALUES (6, 6, 'Josh', 'Juneau');
INSERT INTO author (id, book_id, first_name, last_name) VALUES (7, 7, 'Josh', 'Juneau');
INSERT INTO author (id, book_id, first_name, last_name) VALUES (8, 8, 'Jeff', 'Friesen');
INSERT INTO author (id, book_id, first_name, last_name) VALUES (9, 9, 'Anghel', 'Leonard');
INSERT INTO author (id, book_id, first_name, last_name) VALUES (10, 10, 'Jay', 'Bryant');
INSERT INTO author (id, book_id, first_name, last_name) VALUES (11, 11, 'B V', 'Kumar');
INSERT INTO author (id, book_id, first_name, last_name) VALUES (12, 12, 'David', 'Pollak');


--
-- TOC entry 1970 (class 0 OID 0)
-- Dependencies: 174
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('author_id_seq', 12, true);


--
-- TOC entry 1956 (class 0 OID 36938)
-- Dependencies: 173
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO book (id, category_id, book_title, publisher) VALUES (1, 1, 'Practical Clojure', 'Apress');
INSERT INTO book (id, category_id, book_title, publisher) VALUES (2, 2, 'Beginning Groovy, Grails and
Griffon', 'Apress');
INSERT INTO book (id, category_id, book_title, publisher) VALUES (3, 2, 'Definitive Guide to Grails 2', 'Apress');
INSERT INTO book (id, category_id, book_title, publisher) VALUES (4, 2, 'Groovy and Grails Recipes', 'Apress');
INSERT INTO book (id, category_id, book_title, publisher) VALUES (5, 3, 'Modern Java Web Development', 'Apress');
INSERT INTO book (id, category_id, book_title, publisher) VALUES (6, 3, 'Java 7 Recipes', 'Apress');
INSERT INTO book (id, category_id, book_title, publisher) VALUES (7, 3, 'Java EE 7 Recipes', 'Apress');
INSERT INTO book (id, category_id, book_title, publisher) VALUES (8, 3, 'Beginning Java 7 ', 'Apress');
INSERT INTO book (id, category_id, book_title, publisher) VALUES (9, 3, 'Pro Java 7 NIO.2', 'Apress');
INSERT INTO book (id, category_id, book_title, publisher) VALUES (10, 3, 'Java 7 for Absolute Beginners', 'Apress');
INSERT INTO book (id, category_id, book_title, publisher) VALUES (11, 3, 'Oracle Certified Java Enterprise
Architect Java EE7', 'Apress');
INSERT INTO book (id, category_id, book_title, publisher) VALUES (12, 4, 'Beginning Scala', 'Apress');


--
-- TOC entry 1971 (class 0 OID 0)
-- Dependencies: 172
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('book_id_seq', 12, true);


--
-- TOC entry 1954 (class 0 OID 36930)
-- Dependencies: 171
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO category (id, category_description) VALUES (1, 'Clojure');
INSERT INTO category (id, category_description) VALUES (2, 'Groovy');
INSERT INTO category (id, category_description) VALUES (3, 'Java');
INSERT INTO category (id, category_description) VALUES (4, 'Scala');


--
-- TOC entry 1972 (class 0 OID 0)
-- Dependencies: 170
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('category_id_seq', 4, true);


--
-- TOC entry 1843 (class 2606 OID 36956)
-- Name: author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id);


--
-- TOC entry 1841 (class 2606 OID 36943)
-- Name: book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 1839 (class 2606 OID 36935)
-- Name: category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 1845 (class 2606 OID 36957)
-- Name: fk_author_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY author
    ADD CONSTRAINT fk_author_1 FOREIGN KEY (book_id) REFERENCES book(id);


--
-- TOC entry 1844 (class 2606 OID 36944)
-- Name: fk_book_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY book
    ADD CONSTRAINT fk_book_1 FOREIGN KEY (category_id) REFERENCES category(id);


--
-- TOC entry 1965 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-10-08 16:56:41

--
-- PostgreSQL database dump complete
--

