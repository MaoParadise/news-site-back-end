-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-08-2019 a las 04:03:14
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `newbd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `current_socialnetwork`
--

CREATE TABLE `current_socialnetwork` (
  `IDSOCIALNETWORK` int(11) NOT NULL,
  `IDRELEASE` int(11) NOT NULL,
  `CREATEDDATESN` datetime DEFAULT NULL,
  `MODIFIEDDATESN` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gallery`
--

CREATE TABLE `gallery` (
  `IDIMAGE` int(11) NOT NULL,
  `IDRELEASE` int(11) NOT NULL,
  `UPLOADEDDATEGALLERY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helper`
--

CREATE TABLE `helper` (
  `USERNAMEHELPER` varchar(25) NOT NULL,
  `IDHELPERTYPE` int(11) NOT NULL,
  `NAMEHELPER` varchar(100) DEFAULT NULL,
  `LASTNAMEHELPER` varchar(100) DEFAULT NULL,
  `EMAILHELPER` varchar(100) DEFAULT NULL,
  `PASSWORDHELPER` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `helper`
--

INSERT INTO `helper` (`USERNAMEHELPER`, `IDHELPERTYPE`, `NAMEHELPER`, `LASTNAMEHELPER`, `EMAILHELPER`, `PASSWORDHELPER`) VALUES
('a', 2, 'a', 'a', 'a', '$2a$10$ITSjQ7gR/.R97xoS/jY5Iereh78ayg6yqxRdV.kSSsdy4je.tI0Kq'),
('MaoParadise', 1, 'Carlos', 'Pastén', 'carlos92.pastenbravo@gmail.com', '$2a$10$FM52hlG8JLxhUYi9GS8F8uyavFcE5gZa/smMMhOPLcr3.Upn9ag2a'),
('Prueba', 2, 'Prueba', 'Prueba', 'Prueba@gmail.com', '$2a$10$WlxzUq./SusbQRCSQvvsLeVOBDypxioC1QF5Je1hVRphm5vr26pEe'),
('Test', 2, 'Test', 'prove', 'test@test.com', '$2a$10$BQQwcE91Yu3eegdzCwP0guz3YFzpWglOnZVKr8FyrPaAlBDj.UASe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helper_type`
--

CREATE TABLE `helper_type` (
  `IDHELPERTYPE` int(11) NOT NULL,
  `NAMEHELPERTYPE` varchar(50) DEFAULT NULL,
  `DESCRIPTIONHELPERTYPE` varchar(350) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `helper_type`
--

INSERT INTO `helper_type` (`IDHELPERTYPE`, `NAMEHELPERTYPE`, `DESCRIPTIONHELPERTYPE`) VALUES
(1, 'Editor', 'Modifica, Aprueba o crea releases, acceso a los releases propios y de los demas colaboradores'),
(2, 'Journalist', 'Crea. Modifica o da de baja sus propios releases.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `image`
--

CREATE TABLE `image` (
  `IDIMAGE` int(11) NOT NULL,
  `URLIMAGE` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `outstanding_record`
--

CREATE TABLE `outstanding_record` (
  `IDRELEASE` int(11) NOT NULL,
  `IDOUTTYPE` int(11) NOT NULL,
  `DATEOUT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `outstanding_record`
--

INSERT INTO `outstanding_record` (`IDRELEASE`, `IDOUTTYPE`, `DATEOUT`) VALUES
(13, 1, '2019-07-03 12:20:35'),
(20, 1, '2019-07-01 18:45:40'),
(21, 1, '2019-07-03 16:22:51'),
(22, 1, '2019-07-01 18:28:52'),
(23, 1, '2019-07-01 17:17:32'),
(25, 1, '2019-07-01 17:48:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `outstanding_type`
--

CREATE TABLE `outstanding_type` (
  `IDOUTTYPE` int(11) NOT NULL,
  `NAMEOUTTYPE` varchar(350) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `outstanding_type`
--

INSERT INTO `outstanding_type` (`IDOUTTYPE`, `NAMEOUTTYPE`) VALUES
(1, 'Destacado'),
(2, 'Interesante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `release_record`
--

CREATE TABLE `release_record` (
  `IDRELEASE` int(11) NOT NULL,
  `USERNAMEHELPER` varchar(25) NOT NULL,
  `CREATEDDATERELEASE` datetime DEFAULT NULL,
  `MODIFIEDDATERELEASE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `release_record`
--

INSERT INTO `release_record` (`IDRELEASE`, `USERNAMEHELPER`, `CREATEDDATERELEASE`, `MODIFIEDDATERELEASE`) VALUES
(13, 'MaoParadise', '2019-06-22 16:33:54', '2019-07-03 13:23:26'),
(14, 'MaoParadise', '2019-06-22 16:32:53', '2019-06-24 12:06:52'),
(15, 'MaoParadise', '2019-06-23 11:08:06', '2019-07-03 13:23:30'),
(16, 'MaoParadise', '2019-06-23 11:10:09', '2019-06-24 12:06:51'),
(17, 'MaoParadise', '2019-06-23 11:11:09', '2019-06-24 12:06:53'),
(18, 'MaoParadise', '2019-06-23 11:13:17', '2019-06-24 12:06:55'),
(19, 'Test', '2019-06-23 21:26:06', '2019-06-26 00:00:50'),
(20, 'MaoParadise', '2019-06-24 10:27:46', '2019-07-03 13:23:29'),
(21, 'MaoParadise', '2019-06-24 11:38:10', '2019-07-03 13:23:28'),
(22, 'MaoParadise', '2019-06-26 00:07:47', '2019-07-03 13:23:25'),
(23, 'MaoParadise', '2019-06-27 23:42:49', '2019-07-03 13:23:24'),
(24, 'MaoParadise', '2019-06-30 12:36:35', '2019-07-03 13:23:28'),
(25, 'MaoParadise', '2019-06-30 13:05:22', '2019-07-03 13:23:23'),
(26, 'MaoParadise', '2019-08-05 21:37:19', '2019-08-05 21:38:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `r_elease`
--

CREATE TABLE `r_elease` (
  `IDRELEASE` int(11) NOT NULL,
  `IDRELEASESTATE` int(11) NOT NULL,
  `IDRELEASETYPE` int(11) NOT NULL,
  `IDSECTION` int(11) NOT NULL,
  `TITLERELEASE` varchar(1000) DEFAULT NULL,
  `FIRSTSTATEMENTRELEASE` varchar(1000) DEFAULT NULL,
  `CONTENTRELEASE` longtext,
  `SUBSECTION` varchar(380) DEFAULT NULL,
  `MAINIMAGE` varchar(1000) DEFAULT NULL,
  `SINGLETITLE` varchar(1000) DEFAULT NULL,
  `SINGLEIMG` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `r_elease`
--

INSERT INTO `r_elease` (`IDRELEASE`, `IDRELEASESTATE`, `IDRELEASETYPE`, `IDSECTION`, `TITLERELEASE`, `FIRSTSTATEMENTRELEASE`, `CONTENTRELEASE`, `SUBSECTION`, `MAINIMAGE`, `SINGLETITLE`, `SINGLEIMG`) VALUES
(13, 11, 10, 3, '<div _ngcontent-mol-c4=\"\" class=\"titleCard\"><img _ngcontent-mol-c4=\"\" alt=\"\" class=\"img-fluid\" src=\"https://media.metrolatam.com/2018/12/10/strangerthings3jakf-a5462580d34b633d8e53b64288e09698.jpg\"><div _ngcontent-mol-c4=\"\" class=\"titleStatement-1 d-none d-sm-block\"><h2 _ngcontent-mol-c4=\"\" class=\"text-justify\">Netflix Julio 2019: Todos los estrenos del séptimo mes del año</h2></div></div><div _ngcontent-mol-c4=\"\" class=\"titleStatement-2 d-block d-sm-none\"><h2 _ngcontent-mol-c4=\"\" class=\"text-justify\">Netflix Julio 2019: Todos los estrenos del séptimo mes del año</h2></div>', 'El regreso de Stranger Things, Tres Reyes y la séptima temporada de Orange is the new black destacan en Netflix de julio 2019.', 'Netflix trae una refrescada cartelera para julio, y así queda de manifiesto en este adelanto oficial de cinco minutos con los principales estrenos para Latinoamérica.Por supuesto que lo más esperado por los fanáticos será la tercera temporada de Stranger Things, pero también habrá otros estrenos como la séptima temporada de \"The Orange is the new Black\".Netflix trae una refrescada cartelera para julio, y así queda de manifiesto en este adelanto oficial de cinco minutos con los principales estrenos para Latinoamérica.Por supuesto que lo más esperado por los fanáticos será la tercera temporada de Stranger Things, pero también habrá otros estrenos como la séptima temporada de \"The Orange is the new Black\".Netflix trae una refrescada cartelera para julio, y así queda de manifiesto en este adelanto oficial de cinco minutos con los principales estrenos para Latinoamérica.Por supuesto que lo más esperado por los fanáticos será la tercera temporada de Stranger Things, pero también habrá otros estrenos como la séptima temporada de \"The Orange is the new Black\".Netflix trae una refrescada cartelera para julio, y así queda de manifiesto en este adelanto oficial de cinco minutos con los principales estrenos para Latinoamérica.Por supuesto que lo más esperado por los fanáticos será la tercera temporada de Stranger Things, pero también habrá otros estrenos como la séptima temporada de \"The Orange is the new Black\".Netflix trae una refrescada cartelera para julio, y así queda de manifiesto en este adelanto oficial de cinco minutos con los principales estrenos para Latinoamérica.Por supuesto que lo más esperado por los fanáticos será la tercera temporada de Stranger Things, pero también habrá otros estrenos como la séptima temporada de \"The Orange is the new Black\".', 'Strange;netflix;estreno;Streaming;test;serie-', 'https://media.metrolatam.com/2018/12/10/strangerthings3jakf-a5462580d34b633d8e53b64288e09698.jpg', 'Netflix Julio 2019: Todos los estrenos del séptimo mes del año', 'https://media.metrolatam.com/2018/12/10/strangerthings3jakf-a5462580d34b633d8e53b64288e09698.jpg'),
(14, 11, 10, 4, '<div _ngcontent-rhy-c4=\"\" class=\"titleCard\"><img _ngcontent-rhy-c4=\"\" alt=\"\" class=\"img-fluid\" src=\"https://media.metrolatam.com/2019/06/22/avengersendgamet-ae6b466f697df126290e0afe20560039-1200x600.jpg\"><div _ngcontent-rhy-c4=\"\" class=\"titleStatement-1 d-none d-sm-block\"><h2 _ngcontent-rhy-c4=\"\" class=\"text-justify\">\"Avengers: Endgame\": seis nuevas escenas que se agregarían al reestreno</h2></div></div><div _ngcontent-rhy-c4=\"\" class=\"titleStatement-2 d-block d-sm-none\"><h2 _ngcontent-rhy-c4=\"\" class=\"text-justify\">\"Avengers: Endgame\": seis nuevas escenas que se agregarían al reestreno</h2></div>', '<strong>Para eso, Feige y el estudio tienen un plan: lanzar una versión \'extendida\' del filme que incluiría seis nuevas escenas. Esto&nbsp;no incluiría una posible nueva escena post-créditos, que probablemente le entregue nueva información al triunfo de los Avengers contra Thanos.El propio Marvel fue quien adelantó parte del contenido que podríamos ver en la pantalla grande.</strong>', '<p style=\"text-align: justify;\">Para eso, Feige y el estudio tienen un plan: lanzar una versión \'extendida\' del filme que incluiría seis nuevas escenas. Esto&nbsp;no incluiría una posible nueva escena post-créditos, que probablemente le entregue nueva información al triunfo de los Avengers\n    contra Thanos.El propio Marvel fue quien adela<br>ntó parte del contenido que podríamos ver en la pantalla grande.Para eso, Feige y el estudio tienen un plan: lanzar una versión \'extendida\' del filme que incluiría seis nuevas escenas. Esto&nbsp;no\n    incluiría una posible nueva escena post-créditos, que probablemente le entregue nueva información al triunfo de los Avengers contra Thanos.El propio Marvel fue quien adelantó parte del contenido que podríamos ver en la pantalla grande.Para eso, Feige\n    y el estudio tienen un plan: lanzar una versión \'extendida\' del filme que incluiría seis nuevas escenas. Esto&nbsp;no incluiría una posible nueva escena post-créditos, que probablemente le entregue nueva información al triunfo de los Avengers contra\n    Thanos.El propio Marvel fue quien adelantó parte del contenido que podríamos ver en la pantalla grande.Para eso, Feige y el estudio tienen un plan: lanzar una versión \'extendida\' del filme que incluiría seis nuevas escenas. Esto&nbsp;no incluiría\n    una posible nueva escena post-créditos, que probablemente le entregue nueva información al triunfo de los Avengers contra Thanos.El propio Marvel fue quien adelantó parte del contenido que podríamos ver en la pantalla grande.Para eso, Feige y el estudio\n    tienen un plan: lanzar una versión \'extendida\' del filme que incluiría seis nuevas escenas. Esto&nbsp;no\n    incluiría una posible nueva escena post-créditos, que probablemente le entregue nueva información al triunfo de los Avengers contra Thanos.El propio Marvel fue quien adelantó parte del contenido que podríamos ver en la pantalla grande.</p>', 'Avengers', 'https://media.metrolatam.com/2019/04/30/avengersendgamep-9377761eb2897f16c9ddae3d3fd1330b-800x800.jpg', '\"Avengers: Endgame\": seis nuevas escenas que se agregarían al reestreno', 'https://media.metrolatam.com/2019/06/22/avengersendgamet-ae6b466f697df126290e0afe20560039-1200x600.jpg'),
(15, 11, 10, 2, '<div _ngcontent-mol-c4=\"\" class=\"titleCard\"><img _ngcontent-mol-c4=\"\" alt=\"\" class=\"img-fluid\" src=\"https://media.metrolatam.com/2019/06/23/551041mainpia141-e2119231c0b5580ebd27af152a030680-1200x600.jpg\"><div _ngcontent-mol-c4=\"\" class=\"titleStatement-1 d-none d-sm-block\"><h2 _ngcontent-mol-c4=\"\" class=\"text-justify\">¿Vida en Marte? El Rover Curiosity encuentra signos de vida marciana</h2></div></div><div _ngcontent-mol-c4=\"\" class=\"titleStatement-2 d-block d-sm-none\"><h2 _ngcontent-mol-c4=\"\" class=\"text-justify\">¿Vida en Marte? El Rover Curiosity encuentra signos de vida marciana</h2></div>', 'Superando los hallazgos de 2013.', '<p style=\"text-align: justify;\">Sospechábamos que había vida en Marte, pero ahora la evidencia es más fuerte que nunca.Sucede que según lo que informa el&nbsp;New York Times,&nbsp; el Rover Curiosity de la NASA ha dado con un descubrimiento impresionante.El vehículo encontró alto contenido de gas metano en la atmósfera marciana, un compuesto producido principalmente por seres vivos.Esto confirmaría la existencia d microorganismos en el planeta rojo, aunque la NASA aún no hace el anuncio oficial.Cuidado, que no es primera vez que hayan metano en Marte. A través de los años los descubrimientos del Curiosity datan del 2012 y 2013, pero la medición de la semana pasada supera en tres veces la última vez, lo que no es algo menor según especialistas.Hay que seguir atentos a lo que se vaya informando respecto a esta noticia, porque cabe la posibilidad de que los organismos internacionales reconozcan abiertamente y de forma oficial que no hay dudas: hay vida en Marte, aunque sea en forma de microorganismos.</p>', 'ciencia;marte;test', 'https://media.metrolatam.com/2019/06/23/551041mainpia141-e2119231c0b5580ebd27af152a030680-1200x600.jpg', '¿Vida en Marte? El Rover Curiosity encuentra signos de vida marciana', 'https://media.metrolatam.com/2019/06/23/551041mainpia141-e2119231c0b5580ebd27af152a030680-1200x600.jpg'),
(16, 11, 10, 2, '<div _ngcontent-cdd-c3=\"\" class=\"titleCard\"><img _ngcontent-cdd-c3=\"\" alt=\"\" class=\"img-fluid\" src=\"https://media.metrolatam.com/2019/06/21/template5-bea55037fed72cb326f4548664b9533a-1200x600.jpg\"><div _ngcontent-cdd-c3=\"\" class=\"titleStatement-1 d-none d-sm-block\"><h2 _ngcontent-cdd-c3=\"\" class=\"text-justify\">Huawei te regala todo un año de seguro gratis en equipos nuevos en México</h2></div></div><div _ngcontent-cdd-c3=\"\" class=\"titleStatement-2 d-block d-sm-none\"><h2 _ngcontent-cdd-c3=\"\" class=\"text-justify\">Huawei te regala todo un año de seguro gratis en equipos nuevos en México</h2></div>', 'Si tenías pensado comprar un Huawei pero aún no te convence, entonces la promoción que la compañía china sacó en México te va a interesar mucho.', '<p style=\"text-align: justify;\"><img src=\"https://media.metrolatam.com/2019/06/21/screenshot201906-d844b350c77469ff2fa0ec72f9b17182.jpg\" style=\"float: right; width: 496px; height: 227px; margin: 20px;\">Después de toda la incertidumbre que han vivido los clientes de Huawei en los últimos meses, tenemos buenas noticias. Ya que&nbsp;la compañía china anunció que ampliará la garantía de los equipos des marca en México.Aún tiene mucha fuerzaDe acuerdo con las declaraciones de Huawei en su misma página web, hay noticias bastante alentadoras. Ya que&nbsp;los nuevos clientes que decidan comprar un equipo estos días, tendrán una garantía extendida.Después de toda la incertidumbre que han vivido los clientes de Huawei en los últimos meses, tenemos buenas noticias. Ya que&nbsp;la compañía china anunció que ampliará la garantía de los equipos des marca en México.Aún tiene mucha fuerzaDe acuerdo con las declaraciones de Huawei en su misma página web, hay noticias bastante alentadoras. Ya que&nbsp;los nuevos clientes que decidan comprar un equipo estos días, tendrán una garantía extendida.Después de toda la incertidumbre que han vivido los clientes de Huawei en los últimos meses, tenemos buenas noticias. Ya que&nbsp;la compañía china anunció que ampliará la garantía de los equipos des marca en México.Aún tiene mucha fuerzaDe acuerdo con las declaraciones de Huawei en su misma página web, hay noticias bastante alentadoras. Ya que&nbsp;los nuevos clientes que decidan comprar un equipo estos días, tendrán una garantía extendida.</p>', '', 'https://media.metrolatam.com/2019/06/21/template5-bea55037fed72cb326f4548664b9533a-1200x600.jpg', 'Huawei te regala todo un año de seguro gratis en equipos nuevos en México', 'https://media.metrolatam.com/2019/06/21/template5-bea55037fed72cb326f4548664b9533a-1200x600.jpg'),
(17, 11, 10, 4, '<div _ngcontent-rhy-c4=\"\" class=\"titleCard\"><img _ngcontent-rhy-c4=\"\" alt=\"\" class=\"img-fluid\" src=\"https://media.metrolatam.com/2019/06/21/1535610951523915-eeb5eed8f73f8d58d563a8e7b0cdeb81-1200x600.jpg\"><div _ngcontent-rhy-c4=\"\" class=\"titleStatement-1 d-none d-sm-block\"><h2 _ngcontent-rhy-c4=\"\" class=\"text-justify\">Un estudio demuestra que los gatos adoptan la forma de ser de los humanos</h2></div></div><div _ngcontent-rhy-c4=\"\" class=\"titleStatement-2 d-block d-sm-none\"><h2 _ngcontent-rhy-c4=\"\" class=\"text-justify\">Un estudio demuestra que los gatos adoptan la forma de ser de los humanos</h2></div>', 'Los gatos no son todos unos hermosos desalmados, cada uno tiene personalidad propia, pero parece que la toman prestada de sus dueños.', '<p style=\"text-align: justify;\">Si eres amante de los gatos, entonces seguramente has llegado a sentir un cariño tan enorme que te vuelve loco. Pero&nbsp;a pesar de que muchos piensan que los gatos realmente no sienten nada por los humanos, están equivocados.&nbsp;Ya que al parecer los gatos tienden a crear una conexión con los humanos que no se sabía hasta hace poco.Los mishis son un reflejo de nosotrosDe acuerdo con un estudio publicado en The Telegraph, los gatos adoptan las personalidades de sus dueños. Lo quequiere decir que si amas a tu gato por ser egoísta, poco afectivo y flojo, entonces te tenemos muy malas noticias.Si eres amante de los gatos, entonces seguramente has llegado a sentir un cariño tan enorme que te vuelve loco. Pero&nbsp;a pesar de que muchos piensan que los gatos realmente no sienten nada por los humanos, están equivocados.&nbsp;Ya que al parecer los gatos tienden a crear una conexión con los humanos que no se sabía hasta hace poco.Los mishis son un reflejo de nosotrosDe acuerdo con un estudio publicado en The Telegraph, los gatos adoptan las personalidades de sus dueños. Lo quequiere decir que si amas a tu gato por ser egoísta, poco afectivo y flojo, entonces te tenemos muy malas noticias.Si eres amante de los gatos, entonces seguramente has llegado a sentir un cariño tan enorme que te vuelve loco. Pero&nbsp;a pesar de que muchos piensan que los gatos realmente no sienten nada por los humanos, están equivocados.&nbsp;Ya que al parecer los gatos tienden a crear una conexión con los humanos que no se sabía hasta hace poco.Los mishis son un reflejo de nosotrosDe acuerdo con un estudio publicado en The Telegraph, los gatos adoptan las personalidades de sus dueños. Lo quequiere decir que si amas a tu gato por ser egoísta, poco afectivo y flojo, entonces te tenemos muy malas noticias.</p>', '', 'https://media.metrolatam.com/2019/06/21/1535610951523915-eeb5eed8f73f8d58d563a8e7b0cdeb81-1200x600.jpg', 'Un estudio demuestra que los gatos adoptan la forma de ser de los humanos', 'https://media.metrolatam.com/2019/06/21/1535610951523915-eeb5eed8f73f8d58d563a8e7b0cdeb81-1200x600.jpg'),
(18, 11, 10, 3, '<div _ngcontent-djo-c3=\"\" class=\"titleCard\"><img _ngcontent-djo-c3=\"\" alt=\"\" class=\"img-fluid\" src=\"https://media.metrolatam.com/2019/06/22/dims1-571d8060d26c92d591edc93c23ddbad2-1200x600.jpg\"><div _ngcontent-djo-c3=\"\" class=\"titleStatement-1 d-none d-sm-block\"><h2 _ngcontent-djo-c3=\"\" class=\"text-justify\">Netflix está probando una opción \'picture-in-picture\' en equipos de escritorio</h2></div></div><div _ngcontent-djo-c3=\"\" class=\"titleStatement-2 d-block d-sm-none\"><h2 _ngcontent-djo-c3=\"\" class=\"text-justify\">Netflix está probando una opción \'picture-in-picture\' en equipos de escritorio</h2></div>', 'Para que nunca dejes de ver tus series favoritas, incluso aunque estés en la oficina.', '<p style=\"text-align: justify;\">Una de las nuevas características que Netflix está implementando es un reproductor flotante para su versión de navegador en&nbsp;desktop.La idea es que puedas elegir la opción de \'sacar\' el streaming del navegador y posicionarlo donde quieras. Esto es similar a lo que ocurre en la aplicación de Android, donde el video queda sobre el resto de las aplicaciones.Hay algunos usuarios que ya encontraron la característica y la están usando actualmente. Netflix no le avisó a sus suscriptores precisamente porque es un&nbsp;feature&nbsp;que todavía está en beta, y que aparentemente todavía está en desarrollo para ser lo más compatible posible.Netflix usa su propio reproductorLa compañía de streaming y casa de series como Stranger Things o House Of Cards tuvo que desarrollar desde cero su propio reproductor para todas las plataformas. La razón detrás es claramente el copyright, y detener lo mejor posible los esfuerzos de piratear su contenido.Ésta es la razón por la que dicha característica, presente por ejemplo en el reproductor orgánico de Safari, no había podido ser implementada directamente.De todas formas, este desarrollo independiente tiene su beneficio: debería llegar rápidamente tanto a PC como a Mac, sin necesidad de hacer distinción entre plataformas.</p>', 'netflix', 'https://media.metrolatam.com/2019/06/22/dims1-571d8060d26c92d591edc93c23ddbad2-1200x600.jpg', 'Netflix está probando una opción \'picture-in-picture\' en equipos de escritorio', 'https://media.metrolatam.com/2019/06/22/dims1-571d8060d26c92d591edc93c23ddbad2-1200x600.jpg'),
(19, 11, 10, 1, '<div _ngcontent-yex-c3=\"\" class=\"titleCard\"><img _ngcontent-yex-c3=\"\" alt=\"\" class=\"img-fluid\" src=\"https://www.hd-tecnologia.com/imagenes/articulos/2019/06/No-hacemos-plata-con-Fortnite-es-F2P-dijo-Epic-ante-un-comit%C3%A9-de-Reino-Unido.jpg\"><div _ngcontent-yex-c3=\"\" class=\"titleStatement-1 d-none d-sm-block\"><h2 _ngcontent-yex-c3=\"\" class=\"text-justify\">“No hacemos dinero con Fortnite, es free to play”, dijo Epic</h2></div></div><div _ngcontent-yex-c3=\"\" class=\"titleStatement-2 d-block d-sm-none\"><h2 _ngcontent-yex-c3=\"\" class=\"text-justify\">“No hacemos dinero con Fortnite, es free to play”, dijo Epic</h2></div>', 'Al igual que EA, Epic Games usó su audición con el Comité del Parlamento Digital, de Cultura, Medios y Deportes del Reino Unido (DMSC) para demostrar una completa falta de responsabilidad con su compañía. El principal tema de la declaración de Epic fue Fortnite, uno de los juegos más populares del mundo actualmente. Es free to play, obviamente, pero también está saturado de compras de artículos cosméticos y el famoso “Pase de Batalla”.', '<p style=\"text-align: justify;\">Al igual que EA, Epic Games usó su audición con el Comité del Parlamento Digital, de Cultura, Medios y Deportes del Reino Unido (DMSC) para demostrar una completa falta de responsabilidad con su compañía. El principal tema de la declaración de Epic fue Fortnite, uno de los juegos más populares del mundo actualmente. Es free to play, obviamente, pero también está saturado de compras de artículos cosméticos y el famoso “Pase de Batalla”.Fortnite tiene un problema muy diferente a EA con sus loot boxes. Fortnite no tiene ningún tipo de compra “aleatoria”, y todos sus ingresos derivan de los Pases de Batalla y cosméticos. No hay ningún elemento de azar, aunque existe la posibilidad de gastar grandes cantidades de dinero en poco tiempo, especialmente por niños.En una página normal de apuestas de Reino Unido, por ejemplo, existe la posibilidad de configurar límites de gastos para ayudar a potenciales problemas de adicción, o incluso bloquear tu cuenta por un período de tiempo. Fortnite no tiene nada de esto, y Epic no quiere reconocer que esto es un problema.El consejero legal de Epic Games, Canon Pence, recibió quejas del comité, y no pudo dar información sobre&nbsp;cuánto gastan los jugadores de Fortnite, que tan seguido juegan, cuanto juegan, o incluso si los jugadores son menores o no. “Desgraciadamente, como somos una compañía privada, consideramos que esa es información competitiva que preferimos no compartir,” dijo Pence.“No creo que usted no conozca esta información y, para mí, genera sospechas de que esto no es algo que podamos discutir”, dijo Collins, el presidente de la audiencia.Sorprendentemente, Canon Pence continuó diciendo&nbsp;que verificar que los jugadores de Fortnite tengan 12 años&nbsp;(la clasificación de edad asignada en el Reino Unido)&nbsp;no es un paso necesario, que mejor miraran para Sony, que posee los datos de la cuenta del usuario.“Si eres un jugador de Epic, y tienes una cuenta de Epic, necesitamos menos datos de ti al ser un jugador gratuito que no paga dinero”, explicó Canon Pence.&nbsp;“En un nivel alto, nuestra opinión es que tenemos la intención de recaudar la cantidad mínima y no creemos que, en el servicio de cuentas de Epic, necesitemos una edad para poder entregar lo que solicita el titular de la cuenta”.“¿Entonces no crees que sea necesario cumplir con las regulaciones y leyes de datos al establecer la edad de las personas que juegan tu juego?”&nbsp;La respuesta de Canon fue simple:&nbsp;“Nosotros no”.El resto de la audición se puso peor, cuando Mathew Weissinger, el director de Marketing de Epic Games, llegó a decir que Epic no recauda dinero con Fortnite. “No estaría de acuerdo con la afirmación de que Epic gana dinero con las personas que juegan su juego.&nbsp;El modo Battle Royale es gratis para jugar“.</p>', '', 'https://www.hd-tecnologia.com/imagenes/articulos/2019/06/No-hacemos-plata-con-Fortnite-es-F2P-dijo-Epic-ante-un-comit%C3%A9-de-Reino-Unido.jpg', '“No hacemos dinero con Fortnite, es free to play”, dijo Epic', 'https://www.hd-tecnologia.com/imagenes/articulos/2019/06/No-hacemos-plata-con-Fortnite-es-F2P-dijo-Epic-ante-un-comit%C3%A9-de-Reino-Unido.jpg'),
(20, 11, 10, 1, '<div _ngcontent-mol-c4=\"\" class=\"titleCard\"><img _ngcontent-mol-c4=\"\" alt=\"\" class=\"img-fluid\" src=\"https://i2.wp.com/www.pcmrace.com/wp-content/uploads/2018/12/fortnite-playground-lg.jpg?resize=750%2C400\"><div _ngcontent-mol-c4=\"\" class=\"titleStatement-1 d-none d-sm-block\"><h2 _ngcontent-mol-c4=\"\" class=\"text-justify\">Fortnite ya no se podrá jugar con GPUs que no Soporten DirectX 11 a partir de la Temporada 10</h2></div></div><div _ngcontent-mol-c4=\"\" class=\"titleStatement-2 d-block d-sm-none\"><h2 _ngcontent-mol-c4=\"\" class=\"text-justify\">Fortnite ya no se podrá jugar con GPUs que no Soporten DirectX 11 a partir de la Temporada 10</h2></div>', 'Epic Games anunció hoy que Fornite, a partir de la Temporada 10, ya no será compatible con GPUs que no soporten DirectX 11. Si bien este siempre fue un requerimiento mínimo para jugar Fornite, se mantuvo la compatibilidad con GPUs que soportan DirectX 10, para que los jugadores con estas pudieran jugar con aquellos con tarjetas Direct 11.', '<p style=\"text-align: justify;\">Epic Games anunció hoy que Fornite, a partir de la Temporada 10, ya no será compatible con GPUs que no soporten DirectX 11. Si bien este siempre fue un requerimiento mínimo para jugar Fornite, se mantuvo la compatibilidad con GPUs que soportan DirectX 10, para que los jugadores con estas pudieran jugar con aquellos con tarjetas Direct 11.Cuando comience la temporada 10, no obstante, Fortnite ya no será compatible con placas de video que no soporten hasta DirectX 11. Según Epic Games, esto les «permitirá centrar su trabajo de desarrollo y pruebas en optimizar la experiencia de Fortnite para todos los jugadores.»Debajo encontrarán el listado de GPUs de Nvidia y AMD que no soportan DirectX 11, los cuales fueron lanzados hace ya varios años:</p>', 'videojuego;fortnait', 'https://i2.wp.com/www.pcmrace.com/wp-content/uploads/2018/12/fortnite-playground-lg.jpg?resize=750%2C400', 'Fortnite ya no se podrá jugar con GPUs que no Soporten DirectX 11 a partir de la Temporada 10', 'https://i2.wp.com/www.pcmrace.com/wp-content/uploads/2018/12/fortnite-playground-lg.jpg?resize=750%2C400'),
(21, 11, 10, 3, '<div _ngcontent-mol-c4=\"\" class=\"titleCard\"><img _ngcontent-mol-c4=\"\" alt=\"\" class=\"img-fluid\" src=\"https://sm.ign.com/ign_es/screenshot/default/blob_m97j.jpg\"><div _ngcontent-mol-c4=\"\" class=\"titleStatement-1 d-none d-sm-block\"><h2 _ngcontent-mol-c4=\"\" class=\"text-justify\">LOS 10 PRIMEROS MINUTOS DE EVANGELION 3.0+1.0 SE MOSTRARÁN EN JULIO</h2></div></div><div _ngcontent-mol-c4=\"\" class=\"titleStatement-2 d-block d-sm-none\"><h2 _ngcontent-mol-c4=\"\" class=\"text-justify\">LOS 10 PRIMEROS MINUTOS DE EVANGELION 3.0+1.0 SE MOSTRARÁN EN JULIO</h2></div>', 'Evangelion: 3.0+1.0&nbsp;está llamada a ser el cierre perfecto para&nbsp;Rebuild of Evangelion&nbsp;y por lo que eso significa tiene detrás a toda una legión de seguidores esperando que sean lo mejor que han visto en su vida.', '<p style=\"margin: 0px 0px 1.2em; padding: 0px; color: rgb(51, 52, 53); font-family: ars-maquette-web, proxima-nova, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><a href=\"https://es.ign.com/evangelion-3010\" style=\"background: linear-gradient(to top, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0) 2px, rgb(252, 197, 197) 2px, rgb(252, 197, 197) 3px, rgba(0, 0, 0, 0) 3px) 0px 2px repeat-x transparent; text-decoration: none; color: rgb(242, 24, 24); transition: color 80ms ease 0s; position: relative;\"><strong style=\"font-weight: 700;\">Evangelion: 3.0+1.0</strong></a><span>&nbsp;</span>está llamada a ser el cierre perfecto para<span>&nbsp;</span><strong style=\"font-weight: 700;\">Rebuild of Evangelion</strong><span>&nbsp;</span>y por lo que eso significa tiene detrás a toda una legión de seguidores esperando que sean lo mejor que han visto en su vida.</p><figure itemscope=\"\" itemtype=\"https://schema.org/ImageObject\" style=\"display: block; margin: 0px; color: rgb(51, 52, 53); font-family: ars-maquette-web, proxima-nova, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><p style=\"margin: 0px 0px 1.2em; padding: 0px;\"><img alt=\"&nbsp;\" class=\"image screenshot\" data-model=\"image\" data-pk=\"251244\" itemprop=\"contentUrl\" src=\"https://sm.ign.com/ign_es/screenshot/default/blob_m97j.jpg\" style=\"border: 0px; max-width: 100%; height: auto;\"></p></figure><p style=\"margin: 0px 0px 1.2em; padding: 0px; color: rgb(51, 52, 53); font-family: ars-maquette-web, proxima-nova, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Para poder hacernos una idea de lo que nos espera con esta película vamos a tener 10 minutos de adelanto a lo largo del mes de julio, pues se proyectarán en eventos como la Japan Expo de Paris, la Anime Expo de Los Ángeles y más.</p><center style=\"color: rgb(51, 52, 53); font-family: ars-maquette-web, proxima-nova, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><twitter-widget class=\"twitter-tweet twitter-tweet-rendered\" id=\"twitter-widget-0\" data-tweet-id=\"1143097160839389184\" style=\"position: static; visibility: visible; display: block; transform: rotate(0deg); max-width: 100%; width: 500px; min-width: 220px; margin-top: 10px; margin-bottom: 10px;\"><div data-twitter-event-id=\"0\" class=\"SandboxRoot env-bp-350\" style=\"display: block; max-height: 10000px; direction: ltr; text-align: left; background: 0px 0px; font: 16px/1.4 Helvetica, Roboto, &quot;Segoe UI&quot;, Calibri, sans-serif; color: rgb(28, 32, 34); white-space: initial; position: relative;\"><div class=\"EmbeddedTweet EmbeddedTweet--cta EmbeddedTweet--mediaForward media-forward js-clickToOpenTarget js-tweetIdInfo tweet-InformationCircle-widgetParent\" data-click-to-open-target=\"https://twitter.com/Nibellion/status/1143097160839389184\" data-iframe-title=\"Tweet de Twitter\" data-scribe=\"page:tweet\" data-tweet-id=\"1143097160839389184\" id=\"twitter-widget-0\" lang=\"es\" data-twitter-event-id=\"1\" style=\"overflow: hidden; cursor: pointer; background-color: rgb(255, 255, 255); border: 0px; border-radius: 5px; max-width: 520px; position: relative;\"><article class=\"MediaCard\n           MediaCard--mediaForward\n           \n           customisable-border\" data-scribe=\"component:card\" dir=\"ltr\" style=\"display: block;\"><div class=\"MediaCard-media\" data-scribe=\"element:photo\" style=\"position: relative; width: 500px; overflow: hidden; background-color: rgb(245, 248, 250);\"><a class=\"MediaCard-borderOverlay\" href=\"https://twitter.com/Nibellion/status/1143097160839389184/photo/1\" role=\"presentation\" tabindex=\"-1\" title=\"Ver imagen en Twitter\" style=\"background-color: transparent; color: rgb(43, 123, 185); text-decoration: none; position: absolute; top: 0px; left: 0px; z-index: 10; width: 500px; height: 328.125px; border: 1px solid rgba(225, 232, 237, 0.75); border-radius: 4px 4px 0px 0px; box-sizing: border-box; outline: 0px;\"><span class=\"u-hiddenVisually\" style=\"position: absolute !important; overflow: hidden !important; width: 1px !important; height: 1px !important; padding: 0px !important; border: 0px !important; clip: rect(1px, 1px, 1px, 1px) !important;\">Ver imagen en Twitter</span></a><div class=\"MediaCard-widthConstraint js-cspForcedStyle\" data-style=\"max-width: 640px\" style=\"max-width: 640px; margin: 0px auto;\"><div class=\"MediaCard-mediaContainer js-cspForcedStyle\" data-style=\"padding-bottom: 65.6250%\" style=\"position: relative; padding-bottom: 328.125px; background-color: rgb(245, 248, 250);\"><a href=\"https://twitter.com/Nibellion/status/1143097160839389184/photo/1\" class=\"MediaCard-mediaAsset NaturalImage\" style=\"background-color: rgb(255, 255, 255); color: rgb(43, 123, 185); text-decoration: none; position: absolute; display: block; top: 0px; left: 0px; width: 500px; height: 328.125px; line-height: 0; transition: opacity 0.5s ease 0s; outline: 0px;\"><img class=\"NaturalImage-image\" data-image=\"https://pbs.twimg.com/media/D90YvSjXkAERPm8\" width=\"640\" height=\"420\" title=\"Ver imagen en Twitter\" alt=\"Ver imagen en Twitter\" src=\"https://pbs.twimg.com/media/D90YvSjXkAERPm8?format=jpg&amp;name=small\" style=\"border: 0px; max-width: 100%; line-height: 0; height: auto;\"></a></div></div></div></article><div class=\"EmbeddedTweet-tweetContainer\"><div class=\"EmbeddedTweet-tweet\" style=\"padding: 14.4px 20px 10px; border-style: solid solid none; border-top-color: rgb(225, 232, 237); border-right-color: rgb(225, 232, 237); border-bottom-color: initial; border-left-color: rgb(225, 232, 237); border-image: initial; border-top-width: 0px; border-right-width: 1px; border-bottom-width: initial; border-left-width: 1px; border-radius: 0px;\"><blockquote class=\"Tweet h-entry js-tweetIdInfo subject expanded\" cite=\"https://twitter.com/Nibellion/status/1143097160839389184\" data-tweet-id=\"1143097160839389184\" data-scribe=\"section:subject\" style=\"margin: 0px; padding: 0px; list-style: none; border: none;\"><div class=\"Tweet-header\" style=\"display: flex;\"><a class=\"TweetAuthor-avatar  Identity-avatar u-linkBlend\" data-scribe=\"element:user_link\" href=\"https://twitter.com/Nibellion\" aria-label=\"Nibel (nombre de pantalla: Nibellion)\" style=\"background-color: transparent; color: inherit; text-decoration: inherit; -webkit-box-flex: 0; flex: 0 0 auto; height: 36px; margin-right: 9px; outline: 0px; font-weight: inherit;\"><img class=\"Avatar\" data-scribe=\"element:avatar\" data-src-2x=\"https://pbs.twimg.com/profile_images/1121019626211741696/MC7mZygD_bigger.png\" alt=\"\" data-src-1x=\"https://pbs.twimg.com/profile_images/1121019626211741696/MC7mZygD_normal.png\" src=\"https://pbs.twimg.com/profile_images/1121019626211741696/MC7mZygD_normal.png\" style=\"border: 0px; max-width: 100%; max-height: 100%; border-radius: 50%;\"></a><div class=\"TweetAuthor js-inViewportScribingTarget\" data-scribe=\"component:author\" style=\"display: flex; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: column; overflow: hidden;\"><a class=\"TweetAuthor-link Identity u-linkBlend\" data-scribe=\"element:user_link\" href=\"https://twitter.com/Nibellion\" aria-label=\"Nibel (nombre de pantalla: Nibellion)\" style=\"background-color: transparent; color: inherit; text-decoration: inherit; display: flex; -webkit-box-align: start; align-items: flex-start; outline: 0px; font-weight: inherit;\"><div class=\"TweetAuthor-nameScreenNameContainer\" style=\"display: flex; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: column; line-height: 1.2; -webkit-box-align: start; align-items: flex-start; min-width: 0px;\"><span class=\"TweetAuthor-decoratedName\" style=\"display: flex; -webkit-box-align: center; align-items: center; min-width: 0px;\"><span class=\"TweetAuthor-name Identity-name customisable-highlight\" title=\"Nibel\" data-scribe=\"element:name\" style=\"font-weight: 700; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; padding-right: 4px;\">Nibel</span></span><span class=\"TweetAuthor-screenName Identity-screenName\" title=\"@Nibellion\" data-scribe=\"element:screen_name\" dir=\"ltr\" style=\"color: rgb(105, 120, 130); font-size: 14px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; flex-shrink: 1;\">@Nibellion</span></div></a></div><div class=\"Tweet-brand\" style=\"margin-left: auto;\"><a href=\"https://twitter.com/Nibellion/status/1143097160839389184\" data-scribe=\"element:logo\" style=\"background-color: transparent; color: rgb(43, 123, 185); text-decoration: none; outline: 0px;\"><span class=\"FollowButton-bird\"><div class=\"Icon Icon--twitter \" aria-label=\"Ver en Twitter\" title=\"Ver en Twitter\" role=\"presentation\" style=\"display: inline-block; height: 1.25em; background-repeat: no-repeat; background-size: contain; vertical-align: text-bottom; width: 1.25em; background-image: url(&quot;data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2072%2072%22%3E%3Cpath%20fill%3D%22none%22%20d%3D%22M0%200h72v72H0z%22%2F%3E%3Cpath%20class%3D%22icon%22%20fill%3D%22%231da1f2%22%20d%3D%22M68.812%2015.14c-2.348%201.04-4.87%201.744-7.52%202.06%202.704-1.62%204.78-4.186%205.757-7.243-2.53%201.5-5.33%202.592-8.314%203.176C56.35%2010.59%2052.948%209%2049.182%209c-7.23%200-13.092%205.86-13.092%2013.093%200%201.026.118%202.02.338%202.98C25.543%2024.527%2015.9%2019.318%209.44%2011.396c-1.125%201.936-1.77%204.184-1.77%206.58%200%204.543%202.312%208.552%205.824%2010.9-2.146-.07-4.165-.658-5.93-1.64-.002.056-.002.11-.002.163%200%206.345%204.513%2011.638%2010.504%2012.84-1.1.298-2.256.457-3.45.457-.845%200-1.666-.078-2.464-.23%201.667%205.2%206.5%208.985%2012.23%209.09-4.482%203.51-10.13%205.605-16.26%205.605-1.055%200-2.096-.06-3.122-.184%205.794%203.717%2012.676%205.882%2020.067%205.882%2024.083%200%2037.25-19.95%2037.25-37.25%200-.565-.013-1.133-.038-1.693%202.558-1.847%204.778-4.15%206.532-6.774z%22%2F%3E%3C%2Fsvg%3E&quot;);\"><br></div></span></a></div></div><div class=\"Tweet-body e-entry-content\" data-scribe=\"component:tweet\" style=\"margin-top: 13px;\"><div class=\"Tweet-target js-inViewportScribingTarget\" style=\"height: 1px; width: 1px;\"><br></div><p class=\"Tweet-text e-entry-title\" lang=\"en\" dir=\"ltr\" style=\"margin: 0px; padding: 0px; list-style: none; border: none; white-space: pre-wrap; cursor: text; overflow-wrap: break-word; text-align: left; direction: ltr;\">The first 10 minutes of Evangelion 3.0+1.0 will be screened at Japan Expo in Paris, LA Anime Expo and other locations on July 6 <a href=\"https://t.co/G9gnTfFRpK\" rel=\"nofollow noopener\" dir=\"ltr\" data-expanded-url=\"https://www.evangelion.co.jp/news/shin_eva_0706/\" class=\"link customisable\" target=\"_blank\" title=\"https://www.evangelion.co.jp/news/shin_eva_0706/\" data-scribe=\"element:url\" style=\"background-color: transparent; color: rgb(43, 123, 185); text-decoration: none; outline: 0px;\"><span class=\"u-hiddenVisually\" style=\"position: absolute !important; overflow: hidden !important; width: 1px !important; height: 1px !important; padding: 0px !important; border: 0px !important; clip: rect(1px, 1px, 1px, 1px) !important;\">https://www.</span>evangelion.co.jp/news/shin_eva_<span class=\"u-hiddenVisually\" style=\"position: absolute !important; overflow: hidden !important; width: 1px !important; height: 1px !important; padding: 0px !important; border: 0px !important; clip: rect(1px, 1px, 1px, 1px) !important;\">0706/&nbsp;</span>…</a></p><div class=\"TweetInfo\" style=\"display: flex; margin-top: 3.2px; font-size: 14px;\"><div class=\"TweetInfo-like\"><a class=\"TweetInfo-heart\" title=\"Me gusta\" href=\"https://twitter.com/intent/like?tweet_id=1143097160839389184\" data-scribe=\"component:actions\" style=\"background-color: transparent; color: rgb(43, 123, 185); text-decoration: none; display: flex; outline: 0px;\"><div data-scribe=\"element:heart\"><div class=\"Icon Icon--heart \" aria-label=\"Me gusta\" title=\"Me gusta\" role=\"img\" style=\"display: inline-block; height: 1.25em; background-repeat: no-repeat; background-size: contain; vertical-align: text-bottom; width: 1.25em; background-image: url(&quot;data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2224%22%20height%3D%2224%22%20viewBox%3D%220%200%2024%2024%22%3E%3Cpath%20class%3D%22icon%22%20fill%3D%22%23697882%22%20d%3D%22M12%2021.638h-.014C9.403%2021.59%201.95%2014.856%201.95%208.478c0-3.064%202.525-5.754%205.403-5.754%202.29%200%203.83%201.58%204.646%202.73.813-1.148%202.353-2.73%204.644-2.73%202.88%200%205.404%202.69%205.404%205.755%200%206.375-7.454%2013.11-10.037%2013.156H12zM7.354%204.225c-2.08%200-3.903%201.988-3.903%204.255%200%205.74%207.035%2011.596%208.55%2011.658%201.52-.062%208.55-5.917%208.55-11.658%200-2.267-1.822-4.255-3.902-4.255-2.528%200-3.94%202.936-3.952%202.965-.23.562-1.156.562-1.387%200-.015-.03-1.426-2.965-3.955-2.965z%22%2F%3E%3C%2Fsvg%3E&quot;);\"><br></div></div><span class=\"TweetInfo-heartStat\" data-scribe=\"element:heart_count\" style=\"margin-left: 3px;\">886</span></a></div><div class=\"TweetInfo-timeGeo\" style=\"margin-left: 12px; color: rgb(105, 120, 130); -webkit-box-flex: 1; flex: 1 1 0%;\"><a class=\"u-linkBlend u-url customisable-highlight long-permalink\" data-datetime=\"2019-06-24T10:02:55+0000\" data-scribe=\"element:full_timestamp\" href=\"https://twitter.com/Nibellion/status/1143097160839389184\" style=\"background-color: transparent; color: inherit; text-decoration: inherit; outline: 0px; font-weight: inherit;\"><time class=\"dt-updated\" datetime=\"2019-06-24T10:02:55+0000\" pubdate=\"\" title=\"Publicado a las: 24 de junio de 2019 10:02:55 (UTC)\">6:02 - 24 jun. 2019</time></a></div></div></div></blockquote></div><a class=\"CallToAction CallToAction--mediaForward\" title=\"Ver la conversación en Twitter\" href=\"https://twitter.com/Nibellion/status/1143097160839389184\" data-scribe=\"section:cta component:news\" style=\"background-color: transparent; color: rgb(43, 123, 185); text-decoration: none; display: flex; -webkit-box-align: center; align-items: center; border-color: rgb(225, 232, 237); border-style: solid; border-radius: 0px 0px 4px 4px; border-width: 1px; padding: 9px 20px; font-size: 14px; outline: 0px;\"><div class=\"CallToAction-icon\" data-scribe=\"element:conversation_icon\" style=\"display: inline;\"><div class=\"Icon Icon--replyCTA \" aria-label=\"Ver conversación en Twitter\" title=\"Ver conversación en Twitter\" role=\"img\" style=\"display: block; height: 1.25em; background-repeat: no-repeat; background-size: contain; vertical-align: text-bottom; width: 1.25em; background-image: url(&quot;data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2024%2024%22%3E%3Cpath%20class%3D%22icon%22%20fill%3D%22%232b7bb9%22%20d%3D%22M14.046%202.242l-4.148-.01h-.002c-4.374%200-7.8%203.427-7.8%207.802%200%204.098%203.186%207.206%207.465%207.37v3.828c0%20.108.045.286.12.403.143.225.385.347.633.347.138%200%20.277-.038.402-.118.264-.168%206.473-4.14%208.088-5.506%201.902-1.61%203.04-3.97%203.043-6.312v-.017c-.006-4.368-3.43-7.788-7.8-7.79zm3.787%2012.972c-1.134.96-4.862%203.405-6.772%204.643V16.67c0-.414-.334-.75-.75-.75h-.395c-3.66%200-6.318-2.476-6.318-5.886%200-3.534%202.768-6.302%206.3-6.302l4.147.01h.002c3.532%200%206.3%202.766%206.302%206.296-.003%201.91-.942%203.844-2.514%205.176z%22%2F%3E%3C%2Fsvg%3E&quot;); transform: scaleX(1);\"><br></div></div><div class=\"CallToAction-text\" data-scribe=\"element:conversation_text\" style=\"margin-left: 4px; color: rgb(43, 123, 185);\">356 personas están hablando de esto</div><div class=\"CallToAction-chevron\" data-scribe=\"element:cta_chevron\" style=\"margin-left: auto; display: inline;\"><div class=\"Icon Icon--chevronRightCTA \" aria-label=\"Ver en Twitter\" title=\"Ver en Twitter\" role=\"img\" style=\"display: block; height: 1.25em; background-repeat: no-repeat; background-size: contain; vertical-align: text-bottom; width: 1.25em; background-image: url(&quot;data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2224%22%20height%3D%2224%22%20viewBox%3D%220%200%2024%2024%22%3E%3Cpath%20class%3D%22icon%22%20fill%3D%22%23697882%22%20d%3D%22M17.207%2011.293l-7.5-7.5c-.39-.39-1.023-.39-1.414%200s-.39%201.023%200%201.414L15.086%2012l-6.793%206.793c-.39.39-.39%201.023%200%201.414.195.195.45.293.707.293s.512-.098.707-.293l7.5-7.5c.39-.39.39-1.023%200-1.414z%22%2F%3E%3C%2Fsvg%3E&quot;); transform: scaleX(1);\"><br></div></div></a></div><div class=\"tweet-InformationCircle--top tweet-InformationCircle\" data-scribe=\"element:notice\" style=\"position: absolute; right: 0px; top: 0px; margin: 0px; line-height: 0; padding: 6px 6px 5px 5px; z-index: 20;\"><a href=\"https://support.twitter.com/articles/20175256\" class=\"Icon Icon--informationCircleWhite js-inViewportScribingTarget\" title=\"Información y privacidad de Twitter Ads\" style=\"background-color: transparent; color: rgb(43, 123, 185); text-decoration: none; display: inline-block; height: 18px; background-repeat: no-repeat; background-size: contain; vertical-align: text-bottom; width: 18px; background-image: url(&quot;data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2072%2072%22%3E%3Cg%20transform%3D%22translate(8%208)%22%3E%3Cpath%20fill%3D%22%23657786%22%20fill-opacity%3D%22.8%22%20d%3D%22M28%203.11C14.278%203.11%203.11%2014.276%203.11%2028c0%2013.723%2011.166%2024.887%2024.89%2024.887S52.89%2041.723%2052.89%2028C52.89%2014.274%2041.724%203.11%2028%203.11z%22%2F%3E%3Cpath%20fill%3D%22%23FFF%22%20d%3D%22M28%2044.593c-1.718%200-3.11-1.393-3.11-3.112V30.076c0-1.718%201.392-3.11%203.11-3.11s3.11%201.392%203.11%203.11V41.48c0%201.72-1.392%203.113-3.11%203.113z%22%2F%3E%3Ccircle%20fill%3D%22%23FFF%22%20cx%3D%2228%22%20cy%3D%2218.148%22%20r%3D%224.667%22%2F%3E%3Cpath%20fill%3D%22%23FFF%22%20d%3D%22M28%2056C12.56%2056%200%2043.44%200%2028S12.56%200%2028%200s28%2012.56%2028%2028-12.56%2028-28%2028zm0-49.778C15.99%206.222%206.222%2015.992%206.222%2028S15.992%2049.778%2028%2049.778c12.01%200%2021.778-9.77%2021.778-21.778S40.008%206.222%2028%206.222z%22%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E&quot;); outline: 0px;\"><span class=\"u-hiddenVisually\" style=\"position: absolute !important; overflow: hidden !important; width: 1px !important; height: 1px !important; padding: 0px !important; border: 0px !important; clip: rect(1px, 1px, 1px, 1px) !important;\">Información y privacidad de Twitter Ads</span></a></div></div><div class=\"resize-sensor\" style=\"position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; z-index: -1; visibility: hidden;\"><div class=\"resize-sensor-expand\" style=\"position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; z-index: -1; visibility: hidden;\"><div style=\"position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 10px; height: 10px;\"><br></div></div><div class=\"resize-sensor-shrink\" style=\"position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; z-index: -1; visibility: hidden;\"><div style=\"position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 1000px; height: 1060.41px;\"><br></div></div></div></div></twitter-widget></center><p style=\"margin: 0px 0px 1.2em; padding: 0px; color: rgb(51, 52, 53); font-family: ars-maquette-web, proxima-nova, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">El estreno de esta cinta estaba fechado para el año 2015, por lo que os podéis hacer una idea del tiempo que llevan los enamorados de Shinji Ikari y sus amigos esperando a que salga adelante de una vez por todas.</p>', 'anime;evangelion;test', 'https://sm.ign.com/ign_es/screenshot/default/blob_m97j.jpg', 'LOS 10 PRIMEROS MINUTOS DE EVANGELION 3.0+1.0 SE MOSTRARÁN EN JULIO', 'https://sm.ign.com/ign_es/screenshot/default/blob_m97j.jpg'),
(22, 11, 10, 4, '<div _ngcontent-mol-c4=\"\" class=\"titleCard\"><img _ngcontent-mol-c4=\"\" alt=\"\" class=\"img-fluid\" src=\"https://media.metrolatam.com/2018/07/17/solareclipsebdx6pl-461c6af21a7e4405dab6d5eaf06e11a1-1200x600.jpg\"><div _ngcontent-mol-c4=\"\" class=\"titleStatement-1 d-none d-sm-block\"><h2 _ngcontent-mol-c4=\"\" class=\"text-justify\">Eclipse solar: Cómo hacer un proyector casero y evitar con esto daños en tus ojos</h2></div></div><div _ngcontent-mol-c4=\"\" class=\"titleStatement-2 d-block d-sm-none\"><h2 _ngcontent-mol-c4=\"\" class=\"text-justify\">Eclipse solar: Cómo hacer un proyector casero y evitar con esto daños en tus ojos</h2></div>', 'A solo una semana del esperado Eclipse solar te explicamos como construir un dispositivo casero el cual evitará que puedas dañar tus ojos al observarlo.', '<p style=\"text-align: justify;\">A solo una semana exacta que se produzca el esperado Eclipse Solar en el país, son muchos los que aún están tratando de conseguir&nbsp;lentes especiales y certificados&nbsp;para observar el evento o incluso&nbsp;quieren dejar llevar su creatividad y hacer sus propios implementos para observar el fenómeno.Es por esto que, si eres uno de esos usuarios que se considera creativo y tiene ganas de crear sus propios métodos para observare el eclipse,&nbsp;en este articulo te explicaremos como armar un proyector especial para observar el esperado evento.Recordemos que el próximo martes seremos testigos del esperado evento el cual podrá ser observado en gran parte del país en diferentes porcentajes de oscuridad pero será en la&nbsp;Región de Coquimbo&nbsp;donde este registre la total umbra haciendo que durante esos días la zona sea totalmente llamativa para personas provenientes de todo el mundo.A solo una semana exacta que se produzca el esperado Eclipse Solar en el país, son muchos los que aún están tratando de conseguir&nbsp;lentes especiales y certificados&nbsp;para observar el evento o incluso&nbsp;quieren dejar llevar su creatividad y hacer sus propios implementos para observar el fenómeno.Es por esto que, si eres uno de esos usuarios que se considera creativo y tiene ganas de crear sus propios métodos para observare el eclipse,&nbsp;en este articulo te explicaremos como armar un proyector especial para observar el esperado evento.Recordemos que el próximo martes seremos testigos del esperado evento el cual podrá ser observado en gran parte del país en diferentes porcentajes de oscuridad pero será en la&nbsp;Región de Coquimbo&nbsp;donde este registre la total umbra haciendo que durante esos días la zona sea totalmente llamativa para personas provenientes de todo el mundo.</p>', 'ciencia;test', 'https://media.metrolatam.com/2018/07/17/solareclipsebdx6pl-461c6af21a7e4405dab6d5eaf06e11a1-1200x600.jpg', 'Eclipse solar: Cómo hacer un proyector casero y evitar con esto daños en tus ojos', 'https://media.metrolatam.com/2018/07/17/solareclipsebdx6pl-461c6af21a7e4405dab6d5eaf06e11a1-1200x600.jpg');
INSERT INTO `r_elease` (`IDRELEASE`, `IDRELEASESTATE`, `IDRELEASETYPE`, `IDSECTION`, `TITLERELEASE`, `FIRSTSTATEMENTRELEASE`, `CONTENTRELEASE`, `SUBSECTION`, `MAINIMAGE`, `SINGLETITLE`, `SINGLEIMG`) VALUES
(23, 11, 11, 4, '<div _ngcontent-mol-c4=\"\" class=\"titleCard\"><img _ngcontent-mol-c4=\"\" alt=\"\" class=\"img-fluid\" src=\"https://media.metrolatam.com/2019/06/27/titan-4e925ca563a667961ccd7e2fafa9235e-1200x600.jpg\"><div _ngcontent-mol-c4=\"\" class=\"titleStatement-1 d-none d-sm-block\"><h2 _ngcontent-mol-c4=\"\" class=\"text-justify\">NASA anuncia misión espacial a Titán: La luna helada de Saturno</h2></div></div><div _ngcontent-mol-c4=\"\" class=\"titleStatement-2 d-block d-sm-none\"><h2 _ngcontent-mol-c4=\"\" class=\"text-justify\">NASA anuncia misión espacial a Titán: La luna helada de Saturno</h2></div>', 'La misión Dragonfly de la NASA será la encargada por primera vez de explorar la luna de Titán en Saturno. Llegará en 2034', '<p style=\"text-align: justify;\"><img src=\"https://media.metrolatam.com/2019/06/27/vueloprivado-90823be9c52878e7bf47867956bbd2fe.jpg\" style=\"float: right; width: 456px; height: 272px; margin: 20px;\" class=\"img-fluid\">Titán, la luna helada de Saturno es el próximo objetivo en la&nbsp;carrera espacial de la NASA, ya que la agencia anunció este jueves 27 el lanzamiento del programa \"DragonFly\".Dragonfly se lanzará en 2026 y llegará en 2034. El helicóptero volará a docenas de lugares prometedores en Titán en busca de procesos químicos prebióticos comunes tanto en Titán como en la Tierra.Dragonfly marca la primera vez que la NASA volará un vehículo de múltiples rotores para la ciencia en otro planeta; Tiene ocho rotores y vuela como un gran dron. Aprovechará la densa atmósfera de Titán, cuatro veces más densa que la de la Tierra, para convertirse en el primer vehículo en llevar toda su carga científica a nuevos lugares para un acceso repetitivo y específico a materiales de superficie\", sostuvo la NASA en un comunicado.</p><p style=\"text-align: justify;\">Titán, la luna helada de Saturno es el próximo objetivo en la&nbsp;carrera espacial de la NASA, ya que la agencia anunció este jueves 27 el lanzamiento del programa \"DragonFly\".Dragonfly se lanzará en 2026 y llegará en 2034. El helicóptero volará a docenas de lugares prometedores en Titán en busca de procesos químicos prebióticos comunes tanto en Titán como en la Tierra.Dragonfly marca la primera vez que la NASA volará un vehículo de múltiples rotores para la ciencia en otro planeta; Tiene ocho rotores y vuela como un gran dron. Aprovechará la densa atmósfera de Titán, cuatro veces más densa que la de la Tierra, para convertirse en el primer vehículo en llevar toda su carga científica a nuevos lugares para un acceso repetitivo y específico a materiales de superficie\", sostuvo la NASA en un comunicado.</p><p style=\"text-align: justify;\">El administrador de la NASA, Jim Bridenstine, comentó sobre la misión.\"Con la misión Dragonfly, la NASA volverá a hacer lo que nadie más puede hacer. Visitar este misterioso mundo oceánico podría revolucionar lo que sabemos sobre la vida en el universo. Esta misión de vanguardia hubiera sido impensable incluso hace unos años, pero ahora estamos listos para el increíble vuelo de Dragonfly \".La ruta de DragonflyLa misión&nbsp;aterrizará&nbsp;en las dunas ecuatoriales \"Shangri-La\", similares a las dunas lineales de Namibia en el sur de África, luego&nbsp;explorará esta región en vuelos cortos, acumulando una serie de vuelos más largos de hasta 8 kilómetros.&nbsp;Finalmente alcanzará el cráter de impacto Selk, donde hay evidencia de agua líquida pasada, sustancias orgánicas, las moléculas complejas que contienen carbono, combinadas con hidrógeno, oxígeno y nitrógeno, y energía, esenciales para explicar la vida.Thomas Zurbuchen, administrador asociado de Ciencia de la NASA en la sede de la agencia en Washington, manifestó sobre este viaje que llegará en 2034 a la luna de Saturno:&nbsp;\"Es sorprendente pensar en este helicóptero volando millas y millas a través de las dunas de arena orgánica de la luna más grande de Saturno, explorando los procesos que dan forma a este entorno extraordinario.&nbsp;Dragonfly visitará un mundo lleno de una gran variedad de compuestos orgánicos, que son los bloques de construcción de la vida y podrían enseñarnos sobre el origen de la vida misma \".</p>', 'ciencia;test;serie', 'https://media.metrolatam.com/2019/06/27/titan-4e925ca563a667961ccd7e2fafa9235e-1200x600.jpg', 'NASA anuncia misión espacial a Titán: La luna helada de Saturno', 'https://media.metrolatam.com/2019/06/27/titan-4e925ca563a667961ccd7e2fafa9235e-1200x600.jpg'),
(24, 11, 11, 3, '<div _ngcontent-mol-c4=\"\" class=\"titleCard\"><img _ngcontent-mol-c4=\"\" alt=\"\" class=\"img-fluid\" src=\"https://media.metrolatam.com/2019/06/29/thesimpsonsseaso-63e19ab203f0ff728f150a10d538e7ae-1200x600.jpg\"><div _ngcontent-mol-c4=\"\" class=\"titleStatement-1 d-none d-sm-block\"><h2 _ngcontent-mol-c4=\"\" class=\"text-justify\">Conoce al peor episodio de Los Simpson de la historia</h2></div></div><div _ngcontent-mol-c4=\"\" class=\"titleStatement-2 d-block d-sm-none\"><h2 _ngcontent-mol-c4=\"\" class=\"text-justify\">Conoce al peor episodio de Los Simpson de la historia</h2></div>', 'En sus ya 30 temporadas al aire, Los Simpson han tenido muy buenos episodios, pero hay uno que sobresale por ser el peor de todos los tiempos.', '<p style=\"text-align: justify;\"><img src=\"https://media.metrolatam.com/2019/06/29/capturadepantall-55a92548a75bcdf14aa567c695153a0c.jpg\" style=\"float: left; width: 419px; height: 233px; margin: 20px;\" class=\"img-fluid\">En todos los años en que Los Simpson han estado presentes en nuestras vidas, hemos vivido cosas maravillosas. Gracias&nbsp;a que estos tienen temporadas y episodios que marcaron nuestras vidas para siempre.Y a pesar de todo esto, hay veces que algunos episodios, ya sea por un mal guión o por su temática, nos decepcionan. Pero&nbsp;ninguno es peor que el episodio que veremos a continuación. El cual es catalogado por la critica y los fanáticos como uno de los peores episodios jamás hechos. Pero&nbsp;no solamente como uno de los peores de Los Simpson, es uno de los peores episodios en la historia de la televisión.Lisa y su depresiónEl episodio en cuestión&nbsp;es el llamado “Lisa Goes Gaga” y pertenece a las temporada 23 y es el episodio 22. En este capítulo, Lady Gaga está de gira y casualmente pasa por Springfield. Al pasar por esta ciudad,&nbsp;se da cuenta que la mayoría de la población sufre de baja autoestima. Pero nadie le gana en baja autoestima a Lisa Simpson.El episodio&nbsp;pone a Lisa como una niña indefensa que necesita urgentemente ayuda. Gracias a que en la escuela hicieron una votación de popularidad y&nbsp;ella ganó el titulo a la menos popular.</p><p style=\"text-align: justify;\">Es por eso que Lisa se encuentra inconsolablemente triste y Lady Gaga decide ayudarla a ella. Gracias&nbsp;a sus poderes psíquicos con los que logra sentir que Lisa necesita específicamente de su ayuda.Es cuando la cantante llega con Lisa y esta le grita por querer ayudarla. Después de una serie de cosas sin sentido y humor rebuscado y mal logrado.&nbsp;Lisa se da cuenta que tanto gritarle a Lady Gaga era lo que necesitaba para externar su odio y no guardarlo dentro. Con lo que Lady Gaga decide que fue misión cumplida y se marcha.Pero antes de irse, claro,&nbsp;hace un dueto con Lisa y al final, Homero termina cantando Poker Face.¿Por qué es tan odiado?Este episodio demuestra la decadencia de la serie como tal. Sus chistes&nbsp;se quedan de lado con la finalidad de tratar de hacer quedar bien a Lady Gaga. Cuya participación en este episodio&nbsp;estuvo forzada a más no poder.A diferencia de los cameos de celebridades que tuvo la serie antes de este,&nbsp;el de Lady Gaga es básicamente propaganda de media hora para la actriz y cantante. Los cameos anteriores mostraban personajes más humanos y mejores historias. Como ejemplo&nbsp;tenemos a un Michael Jackson blanco, gordo y feo, haciendo parodia de si mismo, con una enseñanza real: Los más grandes regalos son los que vienen del corazón.Aquí la enseñanza que buscan dejar es que debes ser como Lady Gaga. Y si no lo eres,&nbsp;gritarle a todos y volverte tóxico para lograr sentirte mejor contigo mismo.</p>', 'simpson;serie;fox;critica', 'https://media.metrolatam.com/2019/06/29/thesimpsonsseaso-63e19ab203f0ff728f150a10d538e7ae-1200x600.jpg', 'Conoce al peor episodio de Los Simpson de la historia', 'https://media.metrolatam.com/2019/06/29/thesimpsonsseaso-63e19ab203f0ff728f150a10d538e7ae-1200x600.jpg'),
(25, 11, 12, 1, '<div _ngcontent-mol-c4=\"\" class=\"titleCard\"><img _ngcontent-mol-c4=\"\" alt=\"\" class=\"img-fluid\" src=\"https://cl.buscafs.com/www.levelup.com/public/uploads/images/607960_1140x516.jpg\"><div _ngcontent-mol-c4=\"\" class=\"titleStatement-1 d-none d-sm-block\"><h2 _ngcontent-mol-c4=\"\" class=\"text-justify\">Square Enix achicó el busto de Tifa en FF VII Remake para no tener problemas</h2></div></div><div _ngcontent-mol-c4=\"\" class=\"titleStatement-2 d-block d-sm-none\"><h2 _ngcontent-mol-c4=\"\" class=\"text-justify\">Square Enix achicó el busto de Tifa en FF VII Remake para no tener problemas</h2></div>', 'Como no solo una de las desarrolladoras más grandes la industria de los videojuegos, sino que también como editora y distribuidora de terceros títulos que pasan por sus manos para buscar ganarse un lugar en el mercado,&nbsp;Square Enix&nbsp;se centra como un equipo multidisciplinario que busca mantener al márgen cualquier tipo de error en su compañía', '<p style=\"text-align: justify;\">Editorial:&nbsp;Gaming&nbsp;/&nbsp;Facebook&nbsp;/&nbsp;Twitter&nbsp;/&nbsp;CoberturaComo no solo una de las desarrolladoras más grandes la industria de los videojuegos, sino que también como editora y distribuidora de terceros títulos que pasan por sus manos para buscar ganarse un lugar en el mercado,&nbsp;Square Enix&nbsp;se centra como un equipo multidisciplinario que busca mantener al márgen cualq<img src=\"https://f.rpp-noticias.io/2019/06/19/330233_804105.jpg\" style=\"width: 543px; height: 306px; float: right; margin: 20px;\" class=\"img-fluid\">uier tipo de error en su compañía.Puedes leer:&nbsp;ES OFICIAL: Final Fantasy VII Remake llegará en marzo de 2020A pesar de que pueda parecer lógico, es importante destacar que&nbsp;Final Fantasy VII&nbsp;Remake&nbsp;es desarrollado por un equipo interno dentro de la gigante tecnológica que depende de decisiones de otros departamentos que tienen injerencia sobre las decisiones de sus juegos.Como un mismo conjunto subdividio, el estudio apostó por realizar el regreso de una de su más clásica y reconocida entrega, la cual&nbsp;debió ser mesurada&nbsp;en el diseño de personajes femeninos, para no llegar a un límite que roce con lo obsceno.Según consignó&nbsp;EuroGamer, la misma&nbsp;Square Enix&nbsp;consignó que fue el&nbsp;departamento de ética&nbsp;de la compañía, quien&nbsp;solicitó&nbsp;al equipo de trabajo&nbsp;moderar el busto de Tifa&nbsp;en su nueva entrega.\"Era necesario restringir su pecho\", dice Testuya Nomura, director de la entrega a Famitsu. \"Tifa no debería verse \"antinatural\" durante las escenas de acción\".Final Fantasy VII&nbsp;Remake&nbsp;llegará en marzo de 2020 como exclusivo para PlayStation 4.Editorial:&nbsp;Gaming&nbsp;/&nbsp;Facebook&nbsp;/&nbsp;Twitter&nbsp;/&nbsp;CoberturaComo no solo una de las desarrolladoras más grandes la industria de los videojuegos, sino que también como editora y distribuidora de terceros títulos que pasan por sus manos para buscar ganarse un lugar en el mercado,&nbsp;Square Enix&nbsp;se centra como un equipo multidisciplinario que busca mantener al márgen cualquier tipo de error en su compañía.Puedes leer:&nbsp;ES OFICIAL: Final Fantasy VII Remake llegará en marzo de 2020A pesar de que pueda parecer lógico, es importante destacar que&nbsp;Final Fantasy VII&nbsp;Remake&nbsp;es desarrollado por un equipo interno dentro de la gigante tecnológica que depende de decisiones de otros departamentos que tienen injerencia sobre las decisiones de sus juegos.Como un mismo conjunto subdividio, el estudio apostó por realizar el regreso de una de su más clásica y reconocida entrega, la cual&nbsp;debió ser mesurada&nbsp;en el diseño de personajes femeninos, para no llegar a un límite que roce con lo obsceno.Según consignó&nbsp;EuroGamer, la misma&nbsp;Square Enix&nbsp;consignó que fue el&nbsp;departamento de ética&nbsp;de la compañía, quien&nbsp;solicitó&nbsp;al equipo de trabajo&nbsp;moderar el busto de Tifa&nbsp;en su nueva entrega.\"Era necesario restringir su pecho\", dice Testuya Nomura, director de la entrega a Famitsu. \"Tifa no debería verse \"antinatural\" durante las escenas de acción\".Final Fantasy VII&nbsp;Remake&nbsp;llegará en marzo de 2020 como exclusivo para PlayStation 4.</p>', 'FinalFantasyVII;videojuego;test', 'https://www.hd-tecnologia.com/imagenes/articulos/2019/06/Square-Enix-pidi%C3%B3-achicar-el-tama%C3%B1o-del-pecho-de-Tifa-en-FF7-Remake.jpg', 'Square Enix achicó el busto de Tifa en FF VII Remake para no tener problemas', 'https://cl.buscafs.com/www.levelup.com/public/uploads/images/607960_1140x516.jpg'),
(26, 11, 10, 2, '<div _ngcontent-xtt-c3=\"\" class=\"titleCard\"><img _ngcontent-xtt-c3=\"\" alt=\"\" class=\"img-fluid\" src=\"https://media.metrolatam.com/2019/08/05/20190805image11-cc24890965ac1891645e1eff61e5842d-1200x600.jpg\"><div _ngcontent-xtt-c3=\"\" class=\"titleStatement-1 d-none d-sm-block\"><h2 _ngcontent-xtt-c3=\"\" class=\"text-justify\">NVIDIA parcha cinco vulnerabilidades críticas en su última actualización de GPU</h2></div></div><div _ngcontent-xtt-c3=\"\" class=\"titleStatement-2 d-block d-sm-none\"><h2 _ngcontent-xtt-c3=\"\" class=\"text-justify\">NVIDIA parcha cinco vulnerabilidades críticas en su última actualización de GPU</h2></div>', 'Si tienes una GeForce o Quadro -o quizá NVS o Tesla en un entorno más empresarial- actualiza, por si acaso.', '<p style=\"text-align: justify;\"><img src=\"https://media.metrolatam.com/2019/08/05/cqierczlxyy4lox3-759570a83e907b6bfd77a3964c65fec3.jpg\" style=\"width: 552px; height: 311px; float: right; margin: 20px;\" class=\"img-fluid\">Al menos tres de ellas fueron clasificadas de alto riesgo, y permiten la ejecución de código malicioso en tu equipo. Sin embargo, dichas fallas no pueden ser explotadas de manera remota, por lo que precisan de un acceso físico al sistema.Según el reporte de seguridad de NVIDIA,&nbsp;el parche 431.60 disponible en&nbsp;GeForce Experience ya incorpora el&nbsp;fix&nbsp;para las cinco vulnerabilidades.Al menos tres de ellas fueron clasificadas de alto riesgo, y permiten la ejecución de código malicioso en tu equipo. Sin embargo, dichas fallas no pueden ser explotadas de manera remota, por lo que precisan de un acceso físico al sistema.Según el reporte de seguridad de NVIDIA,&nbsp;el parche 431.60 disponible en&nbsp;GeForce Experience ya incorpora el&nbsp;fix&nbsp;para las cinco vulnerabilidades.El fabricante NVIDIA ha parchado cinco vulnerabilidades encontradas en tarjetas gráficas GeForce, Quadro, NVS y Tesla. Dichas vulnerabilidades pueden causar denegación de servicio, escalado de privilegios y ejecución local de código, desde Windows 7 hasta Windows 10.Al menos tres de ellas fueron clasificadas de alto riesgo, y permiten la ejecución de código malicioso en tu equipo. Sin embargo, dichas fallas no pueden ser explotadas de manera remota, por lo que precisan de un acceso físico al sistema.Según el reporte de seguridad de NVIDIA,&nbsp;el parche 431.60 disponible en&nbsp;GeForce Experience ya incorpora el&nbsp;fix&nbsp;para las cinco vulnerabilidades.Al menos tres de ellas fueron clasificadas de alto riesgo, y permiten la ejecución de código malicioso en tu equipo. Sin embargo, dichas fallas no pueden ser explotadas de manera remota, por lo que precisan de un acceso físico al sistema.Según el reporte de seguridad de NVIDIA,&nbsp;el parche 431.60 disponible en&nbsp;GeForce Experience ya incorpora el&nbsp;fix&nbsp;para las cinco vulnerabilidades.</p>', 'nvidia;gpu', 'https://media.metrolatam.com/2019/08/05/20190805image11-cc24890965ac1891645e1eff61e5842d-1200x600.jpg', 'NVIDIA parcha cinco vulnerabilidades críticas en su última actualización de GPU', 'https://media.metrolatam.com/2019/08/05/20190805image11-cc24890965ac1891645e1eff61e5842d-1200x600.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `section`
--

CREATE TABLE `section` (
  `IDSECTION` int(11) NOT NULL,
  `NAMESECTION` varchar(50) DEFAULT NULL,
  `CREATEDDATESECTION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `section`
--

INSERT INTO `section` (`IDSECTION`, `NAMESECTION`, `CREATEDDATESECTION`) VALUES
(1, 'Videojuegos', '2019-06-14'),
(2, 'Tecnología ', '2019-06-14'),
(3, 'Geek', '2019-06-14'),
(4, 'Entretenimiento', '2019-06-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('xkrzkPn7A8kqt8VjXr-W23wTGnqYW70a', 1565415515, '{\"cookie\":{\"originalMaxAge\":360000000,\"expires\":\"2019-08-10T05:37:12.002Z\",\"secure\":false,\"httpOnly\":false,\"path\":\"/\"},\"passport\":{\"user\":\"MaoParadise\"}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socialnetwork`
--

CREATE TABLE `socialnetwork` (
  `IDSOCIALNETWORK` int(11) NOT NULL,
  `IDTYPESN` int(11) DEFAULT NULL,
  `URLSOCIALNETWORK` varchar(1500) DEFAULT NULL,
  `CONTENT` varchar(1500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state`
--

CREATE TABLE `state` (
  `IDRELEASESTATE` int(11) NOT NULL,
  `NAMERELEASESTATE` varchar(50) DEFAULT NULL,
  `DESCRIPTIONRELEASESTATE` varchar(350) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `state`
--

INSERT INTO `state` (`IDRELEASESTATE`, `NAMERELEASESTATE`, `DESCRIPTIONRELEASESTATE`) VALUES
(10, 'En Revisión', 'El Release necesita ser aprobado por un editor antes de su publicación '),
(11, 'Aprobado', 'El Release se encuentra aprobado y se puede visualizar desde la página pública'),
(12, 'Rechazado', 'El Release se rechazó por lo que no es visible y eventualmente será eliminado por el editor, previo un aviso al colaborador de dicho reléase.'),
(13, 'Desactivado', 'El Release se encuentra desactivado por parte del usuario, este puede volver a activarlo cuando quiera, al estar desactivado no aparecerá en la sección para aprobar del editor ni el los encabezados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sub_section`
--

CREATE TABLE `sub_section` (
  `IDSUBSECTION` int(11) NOT NULL,
  `IDSECTION` int(11) DEFAULT NULL,
  `NAMESUBSECTION` varchar(50) DEFAULT NULL,
  `CREATEDDATESUBSECTION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type`
--

CREATE TABLE `type` (
  `IDRELEASETYPE` int(11) NOT NULL,
  `NAMERELEASETYPE` varchar(50) DEFAULT NULL,
  `DESCRIPTIONRELEASETYPE` varchar(350) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `type`
--

INSERT INTO `type` (`IDRELEASETYPE`, `NAMERELEASETYPE`, `DESCRIPTIONRELEASETYPE`) VALUES
(10, 'Noticia', 'Comunicación o informe que se da acerca de un hecho o un suceso reciente, en especial si se divulga en un medio de comunicación.'),
(11, 'Columna', 'Una columna de opinión es un artículo en el cual el/la autor/a expone sus reflexiones personales sobre distintos temas de actualidad. Generalmente, las personas que escriben esta clase de artículos son conocidas, incluso famosas, y sus palabras pueden cambiar la opinión de mucha gente.'),
(12, 'Crítica', 'Conjunto de opiniones o juicios que responden a un análisis y que pueden resultar positivos o negativos.'),
(13, 'Carta al director', 'as cartas al editor(a) son comunicaciones cortas. En general, con comentarios de desacuerdo o acuerdo conceptual, metodológico, inter- pretativo, de contenido, etc., sobre algún artículo original, de revisión, editorial u otro formato de publicación publicado previamente en una revista.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_socialnetwork`
--

CREATE TABLE `type_socialnetwork` (
  `IDTYPESN` int(11) NOT NULL,
  `NAMETYPESN` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `current_socialnetwork`
--
ALTER TABLE `current_socialnetwork`
  ADD PRIMARY KEY (`IDSOCIALNETWORK`,`IDRELEASE`),
  ADD KEY `FK_RELEASECURRENTSN` (`IDRELEASE`);

--
-- Indices de la tabla `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`IDIMAGE`,`IDRELEASE`),
  ADD KEY `FK_RELEASEGALLERY` (`IDRELEASE`);

--
-- Indices de la tabla `helper`
--
ALTER TABLE `helper`
  ADD PRIMARY KEY (`USERNAMEHELPER`),
  ADD KEY `FK_HELPERTYPEHELPER` (`IDHELPERTYPE`);

--
-- Indices de la tabla `helper_type`
--
ALTER TABLE `helper_type`
  ADD PRIMARY KEY (`IDHELPERTYPE`);

--
-- Indices de la tabla `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`IDIMAGE`);

--
-- Indices de la tabla `outstanding_record`
--
ALTER TABLE `outstanding_record`
  ADD PRIMARY KEY (`IDRELEASE`,`IDOUTTYPE`),
  ADD KEY `FK_OUTSTANDING_T_R` (`IDOUTTYPE`);

--
-- Indices de la tabla `outstanding_type`
--
ALTER TABLE `outstanding_type`
  ADD PRIMARY KEY (`IDOUTTYPE`);

--
-- Indices de la tabla `release_record`
--
ALTER TABLE `release_record`
  ADD PRIMARY KEY (`IDRELEASE`,`USERNAMEHELPER`),
  ADD KEY `FK_HELPERRELEASERECORD` (`USERNAMEHELPER`);

--
-- Indices de la tabla `r_elease`
--
ALTER TABLE `r_elease`
  ADD PRIMARY KEY (`IDRELEASE`),
  ADD KEY `FK_SECTIONRELEASE` (`IDSECTION`),
  ADD KEY `FK_STATERELEASE` (`IDRELEASESTATE`),
  ADD KEY `FK_TYPERELEASE` (`IDRELEASETYPE`);

--
-- Indices de la tabla `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`IDSECTION`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `socialnetwork`
--
ALTER TABLE `socialnetwork`
  ADD PRIMARY KEY (`IDSOCIALNETWORK`),
  ADD KEY `FK_TYPESNSOCIALNETWORK` (`IDTYPESN`);

--
-- Indices de la tabla `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`IDRELEASESTATE`);

--
-- Indices de la tabla `sub_section`
--
ALTER TABLE `sub_section`
  ADD PRIMARY KEY (`IDSUBSECTION`),
  ADD KEY `FK_SECTIONSUBSECTION` (`IDSECTION`);

--
-- Indices de la tabla `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`IDRELEASETYPE`);

--
-- Indices de la tabla `type_socialnetwork`
--
ALTER TABLE `type_socialnetwork`
  ADD PRIMARY KEY (`IDTYPESN`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `outstanding_type`
--
ALTER TABLE `outstanding_type`
  MODIFY `IDOUTTYPE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `r_elease`
--
ALTER TABLE `r_elease`
  MODIFY `IDRELEASE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `current_socialnetwork`
--
ALTER TABLE `current_socialnetwork`
  ADD CONSTRAINT `FK_RELEASECURRENTSN` FOREIGN KEY (`IDRELEASE`) REFERENCES `r_elease` (`IDRELEASE`),
  ADD CONSTRAINT `FK_SOCIALNETWORKCURRENTSN` FOREIGN KEY (`IDSOCIALNETWORK`) REFERENCES `socialnetwork` (`IDSOCIALNETWORK`);

--
-- Filtros para la tabla `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `FK_IMAGEGALLERY` FOREIGN KEY (`IDIMAGE`) REFERENCES `image` (`IDIMAGE`),
  ADD CONSTRAINT `FK_RELEASEGALLERY` FOREIGN KEY (`IDRELEASE`) REFERENCES `r_elease` (`IDRELEASE`);

--
-- Filtros para la tabla `helper`
--
ALTER TABLE `helper`
  ADD CONSTRAINT `FK_HELPERTYPEHELPER` FOREIGN KEY (`IDHELPERTYPE`) REFERENCES `helper_type` (`IDHELPERTYPE`);

--
-- Filtros para la tabla `outstanding_record`
--
ALTER TABLE `outstanding_record`
  ADD CONSTRAINT `FK_OUTSTANDING_T_R` FOREIGN KEY (`IDOUTTYPE`) REFERENCES `outstanding_type` (`IDOUTTYPE`),
  ADD CONSTRAINT `FK_R_ELEASEOUTSTANDING_R` FOREIGN KEY (`IDRELEASE`) REFERENCES `r_elease` (`IDRELEASE`);

--
-- Filtros para la tabla `release_record`
--
ALTER TABLE `release_record`
  ADD CONSTRAINT `FK_HELPERRELEASERECORD` FOREIGN KEY (`USERNAMEHELPER`) REFERENCES `helper` (`USERNAMEHELPER`),
  ADD CONSTRAINT `FK_RELEASERELEASERECORD` FOREIGN KEY (`IDRELEASE`) REFERENCES `r_elease` (`IDRELEASE`);

--
-- Filtros para la tabla `r_elease`
--
ALTER TABLE `r_elease`
  ADD CONSTRAINT `FK_SECTIONRELEASE` FOREIGN KEY (`IDSECTION`) REFERENCES `section` (`IDSECTION`),
  ADD CONSTRAINT `FK_STATERELEASE` FOREIGN KEY (`IDRELEASESTATE`) REFERENCES `state` (`IDRELEASESTATE`),
  ADD CONSTRAINT `FK_TYPERELEASE` FOREIGN KEY (`IDRELEASETYPE`) REFERENCES `type` (`IDRELEASETYPE`);

--
-- Filtros para la tabla `socialnetwork`
--
ALTER TABLE `socialnetwork`
  ADD CONSTRAINT `FK_TYPESNSOCIALNETWORK` FOREIGN KEY (`IDTYPESN`) REFERENCES `type_socialnetwork` (`IDTYPESN`);

--
-- Filtros para la tabla `sub_section`
--
ALTER TABLE `sub_section`
  ADD CONSTRAINT `FK_SECTIONSUBSECTION` FOREIGN KEY (`IDSECTION`) REFERENCES `section` (`IDSECTION`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
