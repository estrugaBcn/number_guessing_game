--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22),
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (35, 'Jacinta', 2, 6);
INSERT INTO public.users VALUES (38, 'user_1675498391243', 2, 125);
INSERT INTO public.users VALUES (51, 'user_1675503621121', 2, 56);
INSERT INTO public.users VALUES (50, 'user_1675503621122', 5, 190);
INSERT INTO public.users VALUES (37, 'user_1675498391244', 5, 57);
INSERT INTO public.users VALUES (52, 'Joan', 1, 7);
INSERT INTO public.users VALUES (40, 'user_1675499103725', 1, 966);
INSERT INTO public.users VALUES (39, 'user_1675499103726', 4, 145);
INSERT INTO public.users VALUES (41, 'Patrice', 0, 0);
INSERT INTO public.users VALUES (36, 'Alice', 3, 12);
INSERT INTO public.users VALUES (43, 'user_1675502124815', 1, 189);
INSERT INTO public.users VALUES (54, 'user_1675506264498', 2, 381);
INSERT INTO public.users VALUES (42, 'user_1675502124816', 4, 30);
INSERT INTO public.users VALUES (44, 'Jonathan', 0, 0);
INSERT INTO public.users VALUES (45, 'Jonat', 1, 2);
INSERT INTO public.users VALUES (53, 'user_1675506264499', 5, 257);
INSERT INTO public.users VALUES (47, 'user_1675502280553', 2, 556);
INSERT INTO public.users VALUES (56, 'user_1675506282078', 2, 273);
INSERT INTO public.users VALUES (46, 'user_1675502280554', 5, 170);
INSERT INTO public.users VALUES (55, 'user_1675506282079', 5, 14);
INSERT INTO public.users VALUES (49, 'user_1675503509353', 2, 379);
INSERT INTO public.users VALUES (48, 'user_1675503509354', 5, 108);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 56, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

