-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-08-2024 a las 01:21:53
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurante`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BUSCAR_ADMIN` (IN `_USUARIO` VARCHAR(100))   BEGIN

SELECT * FROM administrador WHERE USUARIO = _USUARIO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_ADMIN` (IN `_NOMBRE` VARCHAR(225), IN `_USUARIO` VARCHAR(200), IN `_CLAVE` VARCHAR(500))   BEGIN

INSERT INTO administrador(NOMBRE, USUARIO, CLAVE) VALUES (_NOMBRE, _USUARIO, _CLAVE);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_FACTURA` (IN `_ORDEN` INT(11), IN `_USUARIO` INT(11), IN `_CATEGORIA` INT(11), IN `_PLATO` INT(11), IN `_FECHA` TIMESTAMP(6), IN `_METODO` INT(11), IN `_CANTIDAD` INT(11), IN `_TOTAL` DOUBLE(12,5), IN `_MODALIDAD` INT(11))   BEGIN

INSERT INTO facturas(ID_ORDEN, ID_USUARIO, ID_CATEGORIA, ID_PLATO, FECHA, ID_METODO, CANTIDAD, TOTAL, ID_MODALIDAD) VALUES (_ORDEN, _USUARIO, _CATEGORIA, _PLATO, _FECHA, _METODO, _CANTIDAD, TOTAL, _MODALIDAD);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_HORARIO` (IN `_DIA` VARCHAR(10), IN `_APERTURA` TIME, IN `_CIERRE` TIME)   BEGIN

INSERT INTO horario_establecimiento(DIA, APERTURA, CIERRE) VALUES (_DIA, _APERTURA, _CIERRE);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_HORARIO_PERSONAL` (IN `_DIA` VARCHAR(11), IN `_ENTRADA` VARCHAR(25), IN `_SALIDA` VARCHAR(25))   BEGIN

INSERT INTO horario_personal(DIA, ENTRADA, SALIDA) VALUES (_DIA, _ENTRADA, _SALIDA);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_LIMITE_CREDITO` (IN `_FECHA` TIMESTAMP(6), IN `_LIMITE` DOUBLE(12,5))   BEGIN

INSERT INTO limite_credito(FECHA, LIMITE) VALUES (_FECHA, _LIMITE);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_PERSONAL` (IN `_NOMBRE` VARCHAR(50), IN `_DOCUMENTO` INT(11), IN `_CELULAR` VARCHAR(11), IN `_TIPOS` VARCHAR(11), IN `_FECHA` TIMESTAMP(6), IN `_ESTADO` VARCHAR(11))   BEGIN

INSERT INTO personal(NOMBRE, DOCUMENTO, CELULAR, TIPOS, FECHA, ESTADO) VALUES (_NOMBRE, _DOCUMENTO, _CELULAR, _TIPOS, _FECHA, _ESTADO);
                                                                              
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_USUARIO` (IN `_NOMBRE` VARCHAR(40), IN `_DOCUMENTO` VARCHAR(12), IN `_CELULAR` VARCHAR(10), IN `_DIRECCION` VARCHAR(40), IN `_ROL` VARCHAR(20), IN `_LIMITE` DOUBLE(12,5), IN `_INICIA` DATE, IN `_VENCE` DATE, IN `_ESTADO` VARCHAR(25))   BEGIN

INSERT INTO usuarios(NOMBRE, DOCUMENTO, CELULAR, DIRECCION, ROL, LIMITE, INICIA, VENCE, ESTADO) VALUES (_NOMBRE, _DOCUMENTO, _CELULAR, _DIRECCION, _ROL, _LIMITE, _INICIA, _VENCE, _ESTADO);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_HORARIO` (IN `_ID` INT(11))   BEGIN

DELETE FROM horario_establecimiento WHERE ID_HORARIO = _ID;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_HORARIO_PERSONAL` (IN `_ID` INT(11))   BEGIN

DELETE FROM horario_personal WHERE ID_HORARIOP = _ID; 

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_LIMITE_CREDITO` (IN `_ID` INT(11))   BEGIN

DELETE FROM limite_credito WHERE ID_CREDITO = _ID;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_PERSONAL` (IN `_ID` INT)   BEGIN

DELETE FROM personal WHERE ID_PERSONAL = _ID;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_PLATO` (IN `_ID` INT(11))   BEGIN

DELETE FROM platos WHERE ID_PLATO = _ID;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_USUARIO` (IN `_ID` INT(11))   BEGIN

DELETE FROM usuarios WHERE ID_USUARIOS = _ID;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_CLIENTE` ()   BEGIN

SELECT 
    usuarios.*, 
    limite_credito.LIMITE, 
    modalidad.TIPO 
FROM usuarios 
INNER JOIN limite_credito 
ON limite_credito.ID_CREDITO = usuarios.ID_CREDITO 
INNER JOIN  modalidad ON modalidad.ID_MODALIDAD = usuarios.FK_MODALIDAD WHERE usuarios.ROL = 'cliente';

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_FIADOS` ()   SELECT * FROM usuarios WHERE estado = "fiado"$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_HORARIO` ()   BEGIN

SELECT * FROM horario_establecimiento;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_HORARIO_PERSONAL` ()   BEGIN

SELECT * FROM horario_personal;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_LIMITE_CREDITO` ()   BEGIN

SELECT * FROM limite_credito;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_ORDENES` ()   SELECT 
    orden.*, 
    usuarios.NOMBRE, 
    metodo_pago.TIPO, 
    platos.NOMBRES 
FROM 
    orden 
INNER JOIN 
    usuarios ON usuarios.ID_USUARIOS = orden.ID_USUARIO
INNER JOIN 
    metodo_pago ON metodo_pago.ID_METODO = orden.FK_METODO
INNER JOIN 
    platos ON platos.ID_PLATO = orden.FK_PLATO$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PERSONAL` ()   BEGIN

SELECT * FROM personal;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PLATOS` ()   BEGIN

SELECT * FROM platos;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_QUINCENA` ()   BEGIN

SELECT * FROM quincena;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_USUARIO` ()   BEGIN

SELECT * FROM usuarios;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_VENTAS` ()   BEGIN

SELECT ventas.*, usuarios.NOMBRE FROM ventas INNER JOIN usuarios ON usuarios.ID_USUARIOS = ventas.FK_USUARIO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_HORARIO` (IN `_ID` INT(11), IN `_DIA` VARCHAR(10), IN `_APERTURA` VARCHAR(25), IN `_CIERRE` VARCHAR(25))   BEGIN

UPDATE horario_establecimiento SET DIA = _DIA, APERTURA = _APERTURA, CIERRE = _CIERRE WHERE ID_HORARIO = _ID;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_HORARIO_PERSONAL` (IN `_ID` INT(11), IN `_DIA` VARCHAR(11), IN `_ENTRADA` VARCHAR(25), IN `_SALIDA` VARCHAR(25))   BEGIN

UPDATE horario_personal SET DIA = _DIA, ENTRADA = _ENTRADA, SALIDA = _SALIDA WHERE ID_HORARIOP = _ID;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_LIMITE_CREDITO` (IN `_ID` INT(11), IN `_FECHA` TIMESTAMP(6), IN `_LIMTE` DOUBLE(12,5))   BEGIN

UPDATE limite_credito SET FECHA = _FECHA, LIMITE = _LIMITE WHERE ID_CREDITO = _ID;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_PERSONAL` (IN `_ID` INT(11), IN `_NOMBRE` VARCHAR(50), IN `_DOCUMENTO` VARCHAR(11), IN `_CELULAR` VARCHAR(11), IN `_TIPOS` VARCHAR(11), IN `_FECHA` DATE, IN `_ESTADO` VARCHAR(11))   BEGIN

UPDATE personal SET NOMBRE = _NOMBRE, DOCUMENTO = _DOCUMENTO, CELULAR = _CELULAR, TIPOS = _TIPOS, FECHA = _FECHA, ESTADO = _ESTADO WHERE ID_PERSONAL = _ID;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_PLATO` (IN `_ID` INT(11), IN `_NOMBRES` VARCHAR(30), IN `_CATEGORIA` VARCHAR(20), IN `_DESCRIPCION` VARCHAR(200), IN `_PRECIO` DOUBLE(12,5), IN `_IMAGEN` TEXT, IN `_STOCK` INT(11), IN `_RENTABILIDAD` INT(11))   BEGIN

UPDATE platos SET NOMBRES = _NOMBRES, CATEGORIA = _CATEGORIA, DESCRIPCION = _DESCRIPCION, PRECIO = _PRECIO, IMAGEN = _IMAGEN, STOCK = _STOCK, RENTABILIDAD = _RENTABILIDAD WHERE ID_PLATO = _ID;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_USUARIO` (IN `_ID` INT(11), IN `_NOMBRE` VARCHAR(40), IN `_DOCUMENTO` INT(12), IN `_CELULAR` VARCHAR(10), IN `_DIRECCION` VARCHAR(40), IN `_ROL` VARCHAR(20), IN `_LIMITE` DOUBLE(12,5), IN `_INICIA` DATE, IN `_VENCE` DATE, IN `_ESTADO` VARCHAR(25))   BEGIN

UPDATE usuarios SET NOMBRE = _NOMBRE, DOCUMENTO = _DOCUMENTO, CELULAR = _CELULAR, DIRECCION = _DIRECCION, ROL = _ROL, LIMITE = _LIMITE, INICIA = _INICIA, VENCE = _VENCE, ESTADO = _ESTADO WHERE ID_USUARIOS = _ID;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MOSTRAR_USUARIO` (IN `_ID` INT(11))   BEGIN

SELECT * FROM usuarios WHERE ID_USUARIOS = _ID;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `ID_ADMIN` int(11) NOT NULL,
  `NOMBRE` varchar(225) NOT NULL,
  `USUARIO` varchar(200) NOT NULL,
  `CLAVE` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`ID_ADMIN`, `NOMBRE`, `USUARIO`, `CLAVE`) VALUES
(4, 'Juan Perez', 'juanperez123', '$2b$04$7HbDap1tzorafShrYAgwFuiIUNEYek2QKdsT/YDRD.uD9V4vzXL4u'),
(6, 'luisa fernanda', 'luisa123', '$2b$04$mwzegkekWb.6IAaf9jjSnuAdnEa4/cV7p91KmHo3NI.h3lJ.OwRFi'),
(7, 'marinela rodriguez', 'marinela123', '$2b$04$NhEHGKO1EymT66LKihsvMukpmvBMpzH.VBeKHS/t.JvL5oRDJU9Vm'),
(8, 'camila londoño', 'camila123', '$2b$04$KgBQjkH1ip1wUQ1e4pB.o.MnItbmWmLxYA337s8weBCJ2n11lyxHq'),
(27, 'yeifi paola rodriguez', 'paola123', '$2b$04$315GFi0qgFaS.8DA56FKwe62CjYq7Az5Waq4bYT.dQZ3OlaRKi1Bq'),
(28, 'luisa fernanda perez', 'luisa123', '$2b$04$nsqR.MKeHQ9lGSCDkqn48e0.O4y8FXallrEHSVCUDthP9lAZQsg0C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario_establecimiento`
--

CREATE TABLE `horario_establecimiento` (
  `ID_HORARIO` int(11) NOT NULL,
  `DIA` varchar(10) NOT NULL,
  `APERTURA` varchar(25) NOT NULL,
  `CIERRE` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horario_establecimiento`
--

INSERT INTO `horario_establecimiento` (`ID_HORARIO`, `DIA`, `APERTURA`, `CIERRE`) VALUES
(1, 'Lunes', '06:00:00', '20:00:00'),
(2, 'Martes', '04:00:00', '18:00:00'),
(3, 'Miercoles', '14:59', '14:59'),
(5, 'Jueves', '07:00:00', '21:00:00'),
(9, 'Sabado', '07:02:01', '14:02:01'),
(10, 'Domingo', '13:59', '15:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario_personal`
--

CREATE TABLE `horario_personal` (
  `ID_HORARIOP` int(11) NOT NULL,
  `DIA` varchar(11) NOT NULL,
  `ENTRADA` varchar(25) NOT NULL,
  `SALIDA` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horario_personal`
--

INSERT INTO `horario_personal` (`ID_HORARIOP`, `DIA`, `ENTRADA`, `SALIDA`) VALUES
(1, 'Lunesss', '07:00', '20:00'),
(2, 'Martess', '07:00', '20:00'),
(6, 'Jueves', '07:00', '20:00'),
(7, 'Viernes', '07:00', '20:00'),
(8, 'Sábado', '07:00', '08:00'),
(9, 'Domingo', '07:00', '20:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `ID_METODO` int(11) NOT NULL,
  `TIPO` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`ID_METODO`, `TIPO`) VALUES
(3, 'Efectivo'),
(4, 'Transferencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `ID_ORDEN` int(11) NOT NULL,
  `ESTADO` varchar(25) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  `FECHA` date NOT NULL,
  `FK_METODO` int(11) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `TOTAL` double(12,5) NOT NULL,
  `FK_PLATO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`ID_ORDEN`, `ESTADO`, `ID_USUARIO`, `FECHA`, `FK_METODO`, `CANTIDAD`, `TOTAL`, `FK_PLATO`) VALUES
(8, 'Fiado', 25, '2024-07-22', 3, 5, 10000.00000, 6),
(9, 'Pagado', 27, '2024-07-24', 4, 2, 24000.00000, 4),
(10, 'Pagado', 28, '2024-07-24', 3, 2, 36000.00000, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `ID_PERSONAL` int(11) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `DOCUMENTO` varchar(11) NOT NULL,
  `CELULAR` varchar(11) NOT NULL,
  `TIPOS` varchar(11) NOT NULL,
  `FECHA` date NOT NULL,
  `ESTADO` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`ID_PERSONAL`, `NOMBRE`, `DOCUMENTO`, `CELULAR`, `TIPOS`, `FECHA`, `ESTADO`) VALUES
(1, 'Luisa vélez', '1245678', '3145789658', 'Permiso', '0000-00-00', 'Válido'),
(3, 'jose angel rodriguez', '5515458', '321564789', 'Permiso', '2024-07-21', 'Inválido'),
(4, 'Sara maryori', '1245678', '3145789658', 'Permiso', '1969-12-31', 'Válido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platos`
--

CREATE TABLE `platos` (
  `ID_PLATO` int(11) NOT NULL,
  `NOMBRES` varchar(30) NOT NULL,
  `CATEGORIA` varchar(20) NOT NULL,
  `DESCRIPCION` varchar(200) NOT NULL,
  `PRECIO` double(12,5) NOT NULL,
  `IMAGEN` varchar(255) NOT NULL,
  `STOCK` int(11) NOT NULL,
  `RENTABILIDAD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `platos`
--

INSERT INTO `platos` (`ID_PLATO`, `NOMBRES`, `CATEGORIA`, `DESCRIPCION`, `PRECIO`, `IMAGEN`, `STOCK`, `RENTABILIDAD`) VALUES
(1, 'Arroz de leche', 'Desayuno', 'Arroz con leche, coco y canela', 5000.00000, 'https://bing.com/th?id=OSK.88fa1939362cb2f22c6786de3484ae04', 15, 3000),
(2, 'Bandeja Paisa', 'Almuerzo', 'Arroz, frijoles, carne molida, aguacate, arepa, huevo...', 18000.00000, 'https://th.bing.com/th/id/OIP.9HZTVDad6cCDX3jXjD58ygHaEK?rs=1&pid=ImgDetMain', 30, 15000),
(3, 'Pezcado', 'Almuerzo', 'Pezcado, arroz de coco, patacón y ensalada ', 18000.00000, 'https://th.bing.com/th/id/OIP.HdyPoAlNXO0lvI3N9O0dqwHaJI?rs=1&pid=ImgDetMain', 25, 13000),
(4, 'Calentado', 'Desayuno', 'Arroz con frijoles, huevo revuelto, maduros, arepa, chicharrón', 12000.00000, 'https://th.bing.com/th/id/OIP.sjkO_JuyzTDmGMDfkbY6FgHaHa?rs=1&pid=ImgDetMain', 35, 10000),
(5, 'Arepa con quesito', 'Desayuno', 'Arepa, quesito y chocolate', 12000.00000, 'https://www.civitatis.com/f/colombia/bogota/galeria/chocolate-arepas-queso.jpg', 30, 8000),
(6, 'Papitas Margarita', 'Tienda', 'Sabor natural', 2000.00000, 'https://th.bing.com/th/id/OIP.5Y3u7nmEnmHToQV_XUXnSwHaHa?rs=1&pid=ImgDetMain', 100, 1000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quincena`
--

CREATE TABLE `quincena` (
  `ID_QUINCENA` int(11) NOT NULL,
  `FECHA` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `INGRESO` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `quincena`
--

INSERT INTO `quincena` (`ID_QUINCENA`, `FECHA`, `INGRESO`) VALUES
(1, '2024-07-14 17:45:50.000000', 250000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_USUARIOS` int(11) NOT NULL,
  `NOMBRE` varchar(40) NOT NULL,
  `DOCUMENTO` varchar(12) NOT NULL,
  `CELULAR` varchar(10) NOT NULL,
  `DIRECCION` varchar(40) NOT NULL,
  `ROL` varchar(20) NOT NULL,
  `LIMITE` double(12,5) NOT NULL,
  `INICIA` date NOT NULL,
  `VENCE` date NOT NULL,
  `ESTADO` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_USUARIOS`, `NOMBRE`, `DOCUMENTO`, `CELULAR`, `DIRECCION`, `ROL`, `LIMITE`, `INICIA`, `VENCE`, `ESTADO`) VALUES
(25, 'Luis alfonso becerra', '584656584', '3201457896', 'No se 123', 'Cliente', 400000.00000, '2024-08-28', '2024-08-29', 'Fiado'),
(26, 'Marinela rodriguez', '1122445678', '3124567894', 'Ajizal - calle 76', 'Cliente', 120000.00000, '2024-07-24', '2024-07-30', 'Fiado'),
(27, 'Gian carlos', '445566879', '3201457894', 'Bello', 'Cliente', 100000.00000, '2024-07-24', '2024-07-30', 'Fiado'),
(28, 'Samuel velez', '46544584', '3154567894', 'Medellín', 'Cliente', 100000.00000, '2024-07-24', '2024-07-30', 'Fiado'),
(29, 'Emmanuel Saldarriaga', '3672366723', '6356677472', 'calatrava sena', 'Cliente', 20000.00000, '2024-08-28', '2024-09-06', 'Fiado'),
(30, 'Sofia Pinillo', '3782638134', '378352785', 'Calatrava 54 - 89', 'Cliente', 12000.00000, '2024-08-28', '2024-08-29', 'Fiado'),
(33, 'Andrea Valdiri', '6346734747', '3146786585', 'No se 123', 'Cliente', 200000.00000, '2024-08-28', '2024-08-28', 'Fiado'),
(34, 'Pedro luis', '5236262762', '3206745773', 'el guayabo ', 'Cliente', 130000.00000, '2024-08-28', '2024-08-30', 'Fiado'),
(35, 'Keiner Serna', '637347437', '3536272473', 'No se 123', 'Cliente', 20000.00000, '2024-08-28', '2024-08-29', 'Fiado'),
(36, 'marinela dos', '4364247447', '2627477757', 'El monte de las Brujas', 'Cliente', 12000.00000, '2024-08-28', '2024-08-29', 'Fiado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `ID_VENTA` int(11) NOT NULL,
  `FECHA` date NOT NULL,
  `FK_USUARIO` int(11) NOT NULL,
  `FK_ORDEN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`ID_VENTA`, `FECHA`, `FK_USUARIO`, `FK_ORDEN`) VALUES
(7, '2024-07-24', 28, 10),
(8, '2024-07-24', 27, 9),
(11, '2024-07-24', 25, 8);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`ID_ADMIN`);

--
-- Indices de la tabla `horario_establecimiento`
--
ALTER TABLE `horario_establecimiento`
  ADD PRIMARY KEY (`ID_HORARIO`);

--
-- Indices de la tabla `horario_personal`
--
ALTER TABLE `horario_personal`
  ADD PRIMARY KEY (`ID_HORARIOP`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`ID_METODO`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`ID_ORDEN`),
  ADD UNIQUE KEY `fk_plato` (`FK_PLATO`) USING BTREE,
  ADD KEY `ID_USUARIO` (`ID_USUARIO`),
  ADD KEY `FK_METODO` (`FK_METODO`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`ID_PERSONAL`);

--
-- Indices de la tabla `platos`
--
ALTER TABLE `platos`
  ADD PRIMARY KEY (`ID_PLATO`);

--
-- Indices de la tabla `quincena`
--
ALTER TABLE `quincena`
  ADD PRIMARY KEY (`ID_QUINCENA`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_USUARIOS`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`ID_VENTA`),
  ADD KEY `fk_usuario` (`FK_USUARIO`),
  ADD KEY `fk_orden` (`FK_ORDEN`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `ID_ADMIN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `horario_establecimiento`
--
ALTER TABLE `horario_establecimiento`
  MODIFY `ID_HORARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `horario_personal`
--
ALTER TABLE `horario_personal`
  MODIFY `ID_HORARIOP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `ID_METODO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `ID_ORDEN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `ID_PERSONAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `platos`
--
ALTER TABLE `platos`
  MODIFY `ID_PLATO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `quincena`
--
ALTER TABLE `quincena`
  MODIFY `ID_QUINCENA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_USUARIOS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `ID_VENTA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `fk_plato` FOREIGN KEY (`FK_PLATO`) REFERENCES `platos` (`ID_PLATO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID_USUARIOS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orden_ibfk_3` FOREIGN KEY (`FK_METODO`) REFERENCES `metodo_pago` (`ID_METODO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_orden` FOREIGN KEY (`FK_ORDEN`) REFERENCES `orden` (`ID_ORDEN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`FK_USUARIO`) REFERENCES `usuarios` (`ID_USUARIOS`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
