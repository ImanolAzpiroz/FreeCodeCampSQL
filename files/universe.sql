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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean,
    diameter numeric,
    star_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_in_ly numeric,
    has_black_hole boolean,
    diameter_ly integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    mass numeric(10,2),
    has_atmosphere boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    mass numeric(10,2),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_in_ly numeric,
    temperature numeric(10,2),
    age_in_million_years integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Largest asteroid in the belt, classified as a dwarf planet', true, 945, 1);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'Second largest asteroid, has a huge crater at its south pole', true, 525, 1);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'Third largest asteroid in the belt', false, 511, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral galaxy', 0, true, 100000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy to the Milky Way, on collision course with us', 2537000, true, 220000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest galaxy in the Local Group', 2730000, false, 60000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Classic spiral galaxy interacting with a companion', 23000000, true, 60000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral galaxy with a bright nucleus and large central bulge', 29000000, true, 50000);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Nearest radio galaxy to Earth', 13000000, true, 60000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earths only natural satellite', 0.07, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Largest moon of Mars, heavily cratered', 0.00, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smallest moon of Mars, irregular shape', 0.00, false, 4);
INSERT INTO public.moon VALUES (4, 'Europa', 'Jovian moon with subsurface ocean and thin oxygen atmosphere', 0.01, true, 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Largest moon in the solar system, bigger than Mercury', 0.03, true, 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 'Most heavily cratered moon in the solar system', 0.02, true, 5);
INSERT INTO public.moon VALUES (7, 'Io', 'Most volcanically active body in the solar system', 0.02, true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Largest moon of Saturn, thick nitrogen atmosphere', 0.02, true, 7);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Saturn moon with water geysers', 0.00, true, 7);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Saturn moon resembling the Death Star', 0.00, false, 7);
INSERT INTO public.moon VALUES (11, 'Rhea', 'Second largest moon of Saturn', 0.00, false, 7);
INSERT INTO public.moon VALUES (12, 'Dione', 'Saturn moon with ice cliffs', 0.00, false, 7);
INSERT INTO public.moon VALUES (13, 'Tethys', 'Saturn moon with large canyon system', 0.00, false, 7);
INSERT INTO public.moon VALUES (14, 'Triton', 'Largest moon of Neptune, orbits backwards', 0.00, true, 8);
INSERT INTO public.moon VALUES (15, 'Nereid', 'Neptune moon with highly eccentric orbit', 0.00, false, 8);
INSERT INTO public.moon VALUES (16, 'Oberon', 'Outermost major moon of Uranus', 0.00, false, 7);
INSERT INTO public.moon VALUES (17, 'Titania', 'Largest moon of Uranus', 0.00, false, 7);
INSERT INTO public.moon VALUES (18, 'Ariel', 'Brightest moon of Uranus', 0.00, false, 7);
INSERT INTO public.moon VALUES (19, 'Umbriel', 'Darkest moon of Uranus', 0.00, false, 7);
INSERT INTO public.moon VALUES (20, 'Miranda', 'Smallest major moon of Uranus, extreme terrain', 0.00, false, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Earth', 'Rocky planet with liquid water and life', true, 1.00, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Red planet with thin atmosphere', false, 0.11, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest gas giant in the solar system', false, 317.80, 1);
INSERT INTO public.planet VALUES (6, 'Venus', 'Hottest planet, thick toxic atmosphere', false, 0.82, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 'Gas giant known for its ring system', false, 95.20, 1);
INSERT INTO public.planet VALUES (8, 'Mercury', 'Smallest planet, closest to the Sun', false, 0.06, 1);
INSERT INTO public.planet VALUES (9, 'Uranus', 'Ice giant that rotates on its side', false, 14.50, 1);
INSERT INTO public.planet VALUES (10, 'Neptune', 'Farthest planet, strongest winds in solar system', false, 17.10, 1);
INSERT INTO public.planet VALUES (11, 'Kepler-442b', 'Super Earth in habitable zone, strong life candidate', true, 2.30, 2);
INSERT INTO public.planet VALUES (12, 'Proxima b', 'Rocky planet in habitable zone of Proxima Centauri', false, 1.30, 4);
INSERT INTO public.planet VALUES (13, 'Kepler-22b', 'First confirmed planet in habitable zone of sun like star', false, 35.00, 2);
INSERT INTO public.planet VALUES (14, '55 Cancri e', 'Super Earth with extremely high surface temperature', false, 8.60, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our star, a yellow dwarf at the center of the solar system', 0, 5778.00, 4600, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red supergiant star, one of the largest known stars, nearing end of life', 700, 3500.00, 8000, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'Brightest star in the night sky, a white main sequence star', 8, 9940.00, 300, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Closest star to the Sun, a small red dwarf', 4, 3042.00, 4850, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 'Blue supergiant, one of the brightest stars in the night sky', 860, 12000.00, 8, 1);
INSERT INTO public.star VALUES (6, 'Vega', 'Bright star in the constellation Lyra, relatively close to Earth', 25, 9600.00, 455, 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 14, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

