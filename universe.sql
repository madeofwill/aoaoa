--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric,
    is_spherical boolean NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric,
    type character varying(50)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    avg_diameter_km integer NOT NULL,
    can_support_life boolean NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric,
    is_spherical boolean NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral galaxy', 13600, 0, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large galaxy to the Milky Way', 10000, 2537000, true, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest galaxy in the Local Group', 10000, 2730000, true, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Classic example of a grand-design spiral galaxy', 400, 23160000, true, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral galaxy with a bright nucleus', 13250, 29350000, true, false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Face-on spiral galaxy in Ursa Major', 10000, 20900000, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, true, false, 4500, 384400);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, false, 4500, 9376);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, false, 4500, 23460);
INSERT INTO public.moon VALUES (4, 'Io', 5, true, false, 4500, 421800);
INSERT INTO public.moon VALUES (5, 'Europa', 5, true, false, 4500, 671100);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, true, false, 4500, 1070400);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, true, false, 4500, 1882700);
INSERT INTO public.moon VALUES (8, 'Titan', 6, true, false, 4500, 1221870);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, true, false, 4500, 238020);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, false, false, 4500, 185520);
INSERT INTO public.moon VALUES (11, 'Tethys', 6, true, false, 4500, 294660);
INSERT INTO public.moon VALUES (12, 'Dione', 6, true, false, 4500, 377400);
INSERT INTO public.moon VALUES (13, 'Rhea', 6, true, false, 4500, 527040);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, true, false, 4500, 3560820);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, false, false, 4500, 129900);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, true, false, 4500, 190900);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, true, false, 4500, 266000);
INSERT INTO public.moon VALUES (18, 'Titania', 7, true, false, 4500, 436300);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, true, false, 4500, 583500);
INSERT INTO public.moon VALUES (20, 'Triton', 8, true, false, 4500, 354759);
INSERT INTO public.moon VALUES (21, 'Nereid', 8, false, false, 4500, 5513813);
INSERT INTO public.moon VALUES (22, 'Proteus', 8, false, false, 4500, 117647);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, true, 4503, 77000000, 'Terrestrial');
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, true, 4503, 261000000, 'Terrestrial');
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, true, 4543, 0, 'Terrestrial');
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, true, 4503, 225000000, 'Terrestrial');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, true, 4503, 628000000, 'Gas Giant');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, true, 4503, 1275000000, 'Gas Giant');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, true, 4503, 2724000000, 'Ice Giant');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, true, 4503, 4351000000, 'Ice Giant');
INSERT INTO public.planet VALUES (9, 'Proxima b', 4, false, true, 4853, 25000000000, 'Terrestrial');
INSERT INTO public.planet VALUES (10, 'Proxima c', 4, false, true, 4853, 25000000000, 'Super-Earth');
INSERT INTO public.planet VALUES (11, 'Alpha Cen Bb', 7, false, true, 5300, 25600000000, 'Terrestrial');
INSERT INTO public.planet VALUES (12, 'Vega b', 5, false, true, 455, 147000000000, 'Gas Giant');
INSERT INTO public.planet VALUES (13, 'Sirius Ab', 2, false, true, 242, 50700000000, 'Hot Jupiter');


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planets with solid surfaces', 10000, true);
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Large planets composed mainly of hydrogen and helium', 120000, false);
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Planets with icy mantles and hydrogen or helium atmospheres', 50000, false);
INSERT INTO public.planet_type VALUES (4, 'Super-Earth', 'Rocky planets larger than Earth but smaller than Neptune', 15000, true);
INSERT INTO public.planet_type VALUES (5, 'Hot Jupiter', 'Gas giants orbiting very close to their host stars', 130000, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4603, 0, true, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 242, 8.60, true, false);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 8, 700, true, false);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 4853, 4.24, true, false);
INSERT INTO public.star VALUES (5, 'Vega', 1, 455, 25, true, false);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 8, 860, true, false);
INSERT INTO public.star VALUES (7, 'Alpha Centauri A', 1, 5300, 4.37, true, false);
INSERT INTO public.star VALUES (8, 'Antares', 1, 12, 550, true, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

