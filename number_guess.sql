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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    number_to_guess integer NOT NULL,
    user_id integer NOT NULL,
    number_of_guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22)
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (75, 661, 57, 2);
INSERT INTO public.games VALUES (76, 313, 57, 1);
INSERT INTO public.games VALUES (77, 706, 58, 2);
INSERT INTO public.games VALUES (78, 830, 59, 830);
INSERT INTO public.games VALUES (79, 774, 59, 774);
INSERT INTO public.games VALUES (80, 236, 60, 236);
INSERT INTO public.games VALUES (81, 511, 60, 511);
INSERT INTO public.games VALUES (82, 690, 59, 692);
INSERT INTO public.games VALUES (83, 329, 59, 329);
INSERT INTO public.games VALUES (84, 521, 59, 521);
INSERT INTO public.games VALUES (85, 937, 57, 6);
INSERT INTO public.games VALUES (86, 362, 61, 363);
INSERT INTO public.games VALUES (87, 247, 61, 248);
INSERT INTO public.games VALUES (88, 824, 62, 825);
INSERT INTO public.games VALUES (89, 370, 62, 371);
INSERT INTO public.games VALUES (90, 500, 61, 503);
INSERT INTO public.games VALUES (91, 47, 61, 49);
INSERT INTO public.games VALUES (92, 614, 61, 615);
INSERT INTO public.games VALUES (93, 381, 63, 382);
INSERT INTO public.games VALUES (94, 695, 63, 696);
INSERT INTO public.games VALUES (95, 388, 64, 389);
INSERT INTO public.games VALUES (96, 556, 64, 557);
INSERT INTO public.games VALUES (97, 37, 63, 40);
INSERT INTO public.games VALUES (98, 619, 63, 621);
INSERT INTO public.games VALUES (99, 770, 63, 771);
INSERT INTO public.games VALUES (100, 686, 65, 687);
INSERT INTO public.games VALUES (101, 246, 65, 247);
INSERT INTO public.games VALUES (102, 469, 66, 470);
INSERT INTO public.games VALUES (103, 807, 66, 808);
INSERT INTO public.games VALUES (104, 398, 65, 401);
INSERT INTO public.games VALUES (105, 731, 65, 733);
INSERT INTO public.games VALUES (106, 267, 65, 268);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (57, 'Kate');
INSERT INTO public.users VALUES (58, 'Ales');
INSERT INTO public.users VALUES (59, 'user_1697388438947');
INSERT INTO public.users VALUES (60, 'user_1697388438946');
INSERT INTO public.users VALUES (61, 'user_1697388972171');
INSERT INTO public.users VALUES (62, 'user_1697388972170');
INSERT INTO public.users VALUES (63, 'user_1697389579186');
INSERT INTO public.users VALUES (64, 'user_1697389579185');
INSERT INTO public.users VALUES (65, 'user_1697389746245');
INSERT INTO public.users VALUES (66, 'user_1697389746244');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 106, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 66, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


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
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

