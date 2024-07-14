-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-07-2024 a las 03:04:05
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `ID_CATEGORIA` int(11) NOT NULL,
  `TIPO` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`ID_CATEGORIA`, `TIPO`) VALUES
(1, 'Desayuno'),
(2, 'Almuerzo'),
(3, 'Tienda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `ID_FACTURA` int(11) NOT NULL,
  `ID_ORDEN` int(11) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  `ID_CATEGORIA` int(11) NOT NULL,
  `ID_PLATO` int(11) NOT NULL,
  `FECHA` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `ID_METODO` int(11) NOT NULL,
  `TOTAL` double(12,5) NOT NULL,
  `ID_MODALIDAD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`ID_FACTURA`, `ID_ORDEN`, `ID_USUARIO`, `ID_CATEGORIA`, `ID_PLATO`, `FECHA`, `ID_METODO`, `TOTAL`, `ID_MODALIDAD`) VALUES
(1, 1, 2, 1, 1, '2024-07-12 23:52:45.000000', 3, 25000.00000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario_establecimiento`
--

CREATE TABLE `horario_establecimiento` (
  `ID_HORARIO` int(11) NOT NULL,
  `DIA` varchar(10) NOT NULL,
  `APERTURA` time NOT NULL,
  `CIERRE` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horario_establecimiento`
--

INSERT INTO `horario_establecimiento` (`ID_HORARIO`, `DIA`, `APERTURA`, `CIERRE`) VALUES
(1, 'Lunes', '06:00:00', '20:00:00'),
(2, 'Martes', '04:00:00', '18:00:00'),
(3, 'Miercoles', '04:00:00', '18:00:00'),
(5, 'Jueves', '07:00:00', '21:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario_personal`
--

CREATE TABLE `horario_personal` (
  `ID_HORARIOP` int(11) NOT NULL,
  `DIA` varchar(11) NOT NULL,
  `ENTRADA` time NOT NULL,
  `SALIDA` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horario_personal`
--

INSERT INTO `horario_personal` (`ID_HORARIOP`, `DIA`, `ENTRADA`, `SALIDA`) VALUES
(1, 'Lunes', '06:30:46', '20:30:46'),
(2, 'Martes', '06:30:46', '20:30:46'),
(5, 'Miercoles', '06:30:46', '20:30:46'),
(6, 'Jueves', '06:30:46', '20:30:46'),
(7, 'Viernes', '06:30:46', '20:30:46'),
(8, 'Sábado', '00:00:00', '00:00:00'),
(9, 'Domingo', '00:00:00', '00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `limite_credito`
--

CREATE TABLE `limite_credito` (
  `ID_CREDITO` int(11) NOT NULL,
  `FECHA` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `LIMITE` double(12,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `limite_credito`
--

INSERT INTO `limite_credito` (`ID_CREDITO`, `FECHA`, `LIMITE`) VALUES
(2, '2024-07-12 18:07:36.000000', 150000.00000);

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
-- Estructura de tabla para la tabla `modalidad`
--

CREATE TABLE `modalidad` (
  `ID_MODALIDAD` int(11) NOT NULL,
  `TIPO` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modalidad`
--

INSERT INTO `modalidad` (`ID_MODALIDAD`, `TIPO`) VALUES
(1, 'Fiado'),
(2, 'Pagado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `ID_ORDEN` int(11) NOT NULL,
  `FK_MODALIDAD` int(11) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  `FECHA` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `METODO` int(11) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `TOTAL` double(12,5) NOT NULL,
  `FK_PLATO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`ID_ORDEN`, `FK_MODALIDAD`, `ID_USUARIO`, `FECHA`, `METODO`, `CANTIDAD`, `TOTAL`, `FK_PLATO`) VALUES
(1, 1, 2, '2024-07-12 23:54:25.000000', 4, 2, 25000.00000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `ID_PERSONAL` int(11) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `DOCUMENTO` int(11) NOT NULL,
  `CELULAR` varchar(11) NOT NULL,
  `TIPO` varchar(11) NOT NULL,
  `FECHA` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `ESTADO` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`ID_PERSONAL`, `NOMBRE`, `DOCUMENTO`, `CELULAR`, `TIPO`, `FECHA`, `ESTADO`) VALUES
(1, 'LUISA VELEZ', 55452888, '307555855', 'Permiso', '2024-07-12 22:38:11.005065', 'Válido'),
(2, 'ALBERTO GARCIA', 2512528, '33202144', 'Ausencia', '2024-07-12 22:38:11.005065', 'Inválido'),
(3, 'jose angel ', 5515458, '321564789', 'Ausencia', '2024-07-13 23:08:52.000000', 'Inválido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platos`
--

CREATE TABLE `platos` (
  `ID_PLATO` int(11) NOT NULL,
  `FK_CATEGORIA` int(11) NOT NULL,
  `DESCRIPCION` varchar(200) NOT NULL DEFAULT 'Sin descripción',
  `PRECIO` int(11) NOT NULL,
  `RENTABILIDAD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `platos`
--

INSERT INTO `platos` (`ID_PLATO`, `FK_CATEGORIA`, `DESCRIPCION`, `PRECIO`, `RENTABILIDAD`) VALUES
(1, 0, 'Arroz con leche, coco y canela', 18500, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quincena`
--

CREATE TABLE `quincena` (
  `ID_QUINCENA` int(11) NOT NULL,
  `FECHA` int(6) NOT NULL,
  `INGRESO` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_USUARIOS` int(11) NOT NULL,
  `NOMBRE` varchar(40) NOT NULL,
  `DOCUMENTO` varchar(12) NOT NULL,
  `CORREO` varchar(200) NOT NULL,
  `CLAVE` varchar(250) NOT NULL,
  `CELULAR` varchar(10) NOT NULL,
  `DIRECCION` varchar(40) NOT NULL,
  `ROL` varchar(20) NOT NULL,
  `FK_CREDITO` int(11) NOT NULL,
  `INICIA` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `VENCE` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `ESTADO` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_USUARIOS`, `NOMBRE`, `DOCUMENTO`, `CORREO`, `CLAVE`, `CELULAR`, `DIRECCION`, `ROL`, `FK_CREDITO`, `INICIA`, `VENCE`, `ESTADO`) VALUES
(2, 'manuela', '344435886', 'manuela@example.com', 'clave123', '64588544', 'Calle Segunda 123', 'Cliente', 0, '2024-07-12 23:25:20.658390', '2024-07-12 23:25:56.927955', 'pagado'),
(5, 'marinela rodriguez', '4525424', 'marinela@gmail.com', '12345', '3201248518', 'los Gómez (itagui)', 'GERENTE', 0, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', ''),
(6, 'Alfonso', '35685676', 'alfonnsp@gmail.com', '1254', '320154789', 'itagui', 'Ingeniero', 0, '2024-07-12 23:27:36.000000', '2024-07-15 23:27:36.000000', 'Fiado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `ID_VENTA` int(11) NOT NULL,
  `FECHA` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FK_USUARIO` int(11) NOT NULL,
  `FK_ORDEN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`ID_CATEGORIA`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`ID_FACTURA`);

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
-- Indices de la tabla `limite_credito`
--
ALTER TABLE `limite_credito`
  ADD PRIMARY KEY (`ID_CREDITO`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`ID_METODO`);

--
-- Indices de la tabla `modalidad`
--
ALTER TABLE `modalidad`
  ADD PRIMARY KEY (`ID_MODALIDAD`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`ID_ORDEN`),
  ADD UNIQUE KEY `fk_plato` (`FK_PLATO`) USING BTREE;

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
  ADD PRIMARY KEY (`ID_USUARIOS`),
  ADD UNIQUE KEY `uniq_correo` (`CORREO`),
  ADD UNIQUE KEY `uniq_doc` (`DOCUMENTO`),
  ADD UNIQUE KEY `uniq_celular` (`CELULAR`);

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
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `ID_CATEGORIA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `ID_FACTURA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `horario_establecimiento`
--
ALTER TABLE `horario_establecimiento`
  MODIFY `ID_HORARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `horario_personal`
--
ALTER TABLE `horario_personal`
  MODIFY `ID_HORARIOP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `limite_credito`
--
ALTER TABLE `limite_credito`
  MODIFY `ID_CREDITO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `ID_METODO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `modalidad`
--
ALTER TABLE `modalidad`
  MODIFY `ID_MODALIDAD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `ID_ORDEN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `ID_PERSONAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `platos`
--
ALTER TABLE `platos`
  MODIFY `ID_PLATO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `quincena`
--
ALTER TABLE `quincena`
  MODIFY `ID_QUINCENA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_USUARIOS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `ID_VENTA` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `fk_plato` FOREIGN KEY (`FK_PLATO`) REFERENCES `platos` (`ID_PLATO`) ON DELETE CASCADE ON UPDATE CASCADE;

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
