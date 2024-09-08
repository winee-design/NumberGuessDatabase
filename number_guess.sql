--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE numberguess;
--
-- Name: numberguess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE numberguess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE numberguess OWNER TO freecodecamp;

\connect numberguess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    username character varying(22) NOT NULL,
    games_played integer NOT NULL,
    best_game integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES ('user_1725777633444', 2, 28);
INSERT INTO public.games VALUES ('user_1725777633445', 5, 42);
INSERT INTO public.games VALUES ('user_1725777744902', 2, 30);
INSERT INTO public.games VALUES ('user_1725777744903', 5, 37);
INSERT INTO public.games VALUES ('user_1725777783441', 2, 39);
INSERT INTO public.games VALUES ('user_1725777783442', 5, 253);
INSERT INTO public.games VALUES ('user_1725777828271', 2, 318);
INSERT INTO public.games VALUES ('user_1725777828272', 5, 240);
INSERT INTO public.games VALUES ('Ezra', 2, 3);
INSERT INTO public.games VALUES ('user_1725777926086', 2, 353);
INSERT INTO public.games VALUES ('user_1725777926087', 5, 144);
INSERT INTO public.games VALUES ('user_1725777959252', 2, 123);
INSERT INTO public.games VALUES ('user_1725777959253', 5, 62);


--
-- Name: games games_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

