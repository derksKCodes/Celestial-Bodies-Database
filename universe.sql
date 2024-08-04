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
    name character varying(40) NOT NULL,
    description text,
    diameter numeric(10,2),
    distance_from_sun numeric(12,2)
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
    name character varying(40) NOT NULL,
    description text,
    is_spherical boolean,
    distance_from_earth numeric(12,3),
    age_in_millions_of_years integer,
    galaxy_type character varying(50)
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
    name character varying(40) NOT NULL,
    description text,
    is_spherical boolean,
    has_life boolean,
    distance_from_earth numeric(12,3),
    age_in_millions_of_years integer NOT NULL,
    planet_id integer
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
    name character varying(40) NOT NULL,
    description text,
    is_spherical boolean,
    has_life boolean,
    age_in_millions_of_years integer NOT NULL,
    star_id integer,
    planet_type character varying(50)
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    is_spherical boolean,
    distance_from_earth numeric(12,3),
    age_in_millions_of_years integer NOT NULL,
    galaxy_id integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'The largest asteroid in the asteroid belt.', 939.40, 413700000.00);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'A large asteroid with a differentiated structure.', 525.40, 353000000.00);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'One of the largest asteroids in the asteroid belt.', 512.00, 414000000.00);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 'A large asteroid with a spherical shape.', 434.00, 434000000.00);
INSERT INTO public.asteroid VALUES (5, 'Eros', 'A near-Earth asteroid with a highly irregular shape.', 16.80, 225000000.00);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy containing our solar system.', true, 0.000, 13000, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy to the Milky Way.', false, 2.537, 10000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Known for its supermassive black hole.', false, 53.500, 12000, 'Elliptical');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'A classic spiral galaxy.', true, 23.200, 10000, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 'A prominent spiral galaxy in the constellation Ursa Major.', true, 21.200, 9000, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'Recognizable by its bright nucleus.', false, 28.500, 11000, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s natural satellite.', true, false, 384400.000, 4500, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'One of Mars'' moons, known for its irregular shape.', true, false, 9377.000, 4500, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller of Mars'' two moons.', true, false, 23460.000, 4500, 2);
INSERT INTO public.moon VALUES (4, 'Io', 'A moon of Jupiter known for its volcanic activity.', true, false, 421800.000, 4500, 3);
INSERT INTO public.moon VALUES (5, 'Europa', 'A moon of Jupiter with a smooth ice-covered surface.', true, false, 671034.000, 4500, 3);
INSERT INTO public.moon VALUES (6, 'Titan', 'Saturn''s largest moon, known for its thick atmosphere.', true, false, 1221700.000, 4500, 4);
INSERT INTO public.moon VALUES (7, 'Rhea', 'A moon of Saturn with a heavily cratered surface.', true, false, 527108.000, 4500, 4);
INSERT INTO public.moon VALUES (8, 'Iapetus', 'A moon of Saturn with a unique two-tone coloration.', true, false, 356445.000, 4500, 4);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'A moon of Saturn known for its ice geysers.', true, false, 238040.000, 4500, 4);
INSERT INTO public.moon VALUES (10, 'Mimas', 'A small moon of Saturn with a large impact crater.', true, false, 185539.000, 4500, 4);
INSERT INTO public.moon VALUES (11, 'Ganymede', 'The largest moon in the solar system, orbiting Jupiter.', true, false, 1070400.000, 4500, 3);
INSERT INTO public.moon VALUES (12, 'Callisto', 'A heavily cratered moon of Jupiter with a possible subsurface ocean.', true, false, 1882700.000, 4500, 3);
INSERT INTO public.moon VALUES (13, 'Titania', 'The largest moon of Uranus, known for its extreme tilt.', true, false, 436300.000, 4500, 5);
INSERT INTO public.moon VALUES (14, 'Oberon', 'A moon of Uranus with a surface marked by craters and grooves.', true, false, 583520.000, 4500, 5);
INSERT INTO public.moon VALUES (15, 'Miranda', 'A small, irregular moon of Uranus with a diverse surface.', true, false, 129800.000, 4500, 5);
INSERT INTO public.moon VALUES (18, 'Ariel', 'A moon of Uranus with a surface marked by canyons and ridges.', true, false, 190920.000, 4500, 5);
INSERT INTO public.moon VALUES (19, 'Umbriel', 'A dark moon of Uranus with a heavily cratered surface.', true, false, 266200.000, 4500, 5);
INSERT INTO public.moon VALUES (20, 'Triton', 'The largest moon of Neptune, known for its retrograde orbit and geysers.', true, false, 354800.000, 4500, 6);
INSERT INTO public.moon VALUES (21, 'Nereid', 'A moon of Neptune with a highly elliptical orbit and a surface of ice and rock.', true, false, 1176475.000, 4500, 6);
INSERT INTO public.moon VALUES (22, 'Proteus', 'A large irregular moon of Neptune with a surface covered in craters and ridges.', true, false, 117646.000, 4500, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The third planet from the Sun, known for supporting life.', true, true, 4500, 1, 'Terrestrial');
INSERT INTO public.planet VALUES (2, 'Mars', 'The fourth planet from the Sun, known for its reddish appearance.', true, false, 4600, 1, 'Terrestrial');
INSERT INTO public.planet VALUES (3, 'Jupiter', 'The largest planet in our solar system.', true, false, 4500, 1, 'Gas Giant');
INSERT INTO public.planet VALUES (4, 'Saturn', 'Known for its extensive ring system.', true, false, 4500, 2, 'Gas Giant');
INSERT INTO public.planet VALUES (5, 'Uranus', 'The ice giant with a unique tilt.', true, false, 4500, 2, 'Ice Giant');
INSERT INTO public.planet VALUES (6, 'Neptune', 'The farthest planet from the Sun.', true, false, 4500, 2, 'Ice Giant');
INSERT INTO public.planet VALUES (7, 'Venus', 'The second planet from the Sun, known for its thick atmosphere.', true, false, 4600, 3, 'Terrestrial');
INSERT INTO public.planet VALUES (8, 'Mercury', 'The closest planet to the Sun.', true, false, 4500, 3, 'Terrestrial');
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf planet known for its orbit beyond Neptune.', true, false, 4600, 3, 'Dwarf');
INSERT INTO public.planet VALUES (10, 'Eris', 'Dwarf planet in the scattered disc region of the Solar System.', true, false, 4600, 4, 'Dwarf');
INSERT INTO public.planet VALUES (11, 'Haumea', 'Dwarf planet located in the Kuiper belt.', true, false, 4600, 4, 'Dwarf');
INSERT INTO public.planet VALUES (12, 'Makemake', 'Dwarf planet in the Kuiper belt.', true, false, 4600, 4, 'Dwarf');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our solar system.', true, 0.000, 4600, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'The brightest star in the night sky.', true, 8.600, 120, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A red supergiant star in the constellation Orion.', true, 642.500, 10, 2);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'The closest known star to the Sun.', true, 4.240, 5, 2);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'The brightest star in the Alpha Centauri system.', true, 4.370, 6, 3);
INSERT INTO public.star VALUES (6, 'Alpha Centauri B', 'A star in the Alpha Centauri system.', true, 4.370, 7, 3);
INSERT INTO public.star VALUES (7, 'Arcturus', 'A red giant star in the constellation Boötes.', true, 36.700, 7, 4);
INSERT INTO public.star VALUES (8, 'Vega', 'A bright star in the constellation Lyra.', true, 25.040, 455, 4);
INSERT INTO public.star VALUES (9, 'Rigel', 'A blue supergiant star in the constellation Orion.', true, 860.000, 8, 5);
INSERT INTO public.star VALUES (10, 'Antares', 'A red supergiant star in the constellation Scorpius.', true, 550.000, 12, 5);
INSERT INTO public.star VALUES (11, 'Altair', 'A bright star in the constellation Aquila.', true, 16.700, 1, 6);
INSERT INTO public.star VALUES (12, 'Spica', 'A binary star system in the constellation Virgo.', true, 250.000, 11, 6);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


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

