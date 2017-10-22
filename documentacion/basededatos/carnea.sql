-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 21-10-2017 a las 12:00:08
-- Versión del servidor: 5.7.19-0ubuntu0.16.04.1
-- Versión de PHP: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carnea`
--
CREATE DATABASE IF NOT EXISTS `carnea` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `carnea`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `albaranes`
--

DROP TABLE IF EXISTS `albaranes`;
CREATE TABLE `albaranes` (
  `numeroalbaran` varchar(10) NOT NULL COMMENT 'Numero Albaran',
  `fecha` varchar(10) NOT NULL COMMENT 'Fecha creacion factura',
  `hora` varchar(10) NOT NULL COMMENT 'Hora creacion factura',
  `base` float NOT NULL COMMENT 'Base imponible',
  `iva` int(11) NOT NULL COMMENT 'Iva que lleva la factura',
  `recargo` int(11) NOT NULL COMMENT 'Recargo de la factura',
  `importeiva` float NOT NULL COMMENT 'Importe en euros de aplicar el iva a la base',
  `importerecargo` float NOT NULL COMMENT 'Importe en euros de aplicar el recargo a la base',
  `fechacobro` varchar(10) NOT NULL COMMENT 'Fecha de cobro de la factura',
  `descuentopp` float DEFAULT NULL COMMENT 'Descuento pronto pago',
  `importedescuentopp` float DEFAULT NULL COMMENT 'Valor del descuento pronto pago',
  `descuentoesp` float DEFAULT NULL COMMENT 'Descuento especial',
  `importedescuentoesp` float DEFAULT NULL COMMENT 'Valor del descuento especial',
  `pagado` varchar(1) NOT NULL COMMENT 'Si ha sido cobrado o no',
  `formapago` varchar(20) DEFAULT NULL COMMENT 'Forma del pago del cliente',
  `vencimiento` varchar(10) DEFAULT NULL,
  `facturado` varchar(1) NOT NULL COMMENT 'Si se ha facturado',
  `cliente` varchar(10) NOT NULL COMMENT 'Cliente de la factura',
  `vendedor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `albaranesdetalle`
--

DROP TABLE IF EXISTS `albaranesdetalle`;
CREATE TABLE `albaranesdetalle` (
  `numeroalbaran` varchar(10) NOT NULL COMMENT 'Numero de factura a la que pertenece la linea detalle',
  `linea` int(11) NOT NULL COMMENT 'Linea de la factura',
  `precio` float NOT NULL COMMENT 'Precio kilo del articulo',
  `peso` float NOT NULL COMMENT 'Peso del articulo',
  `importe` float NOT NULL COMMENT 'Importe total del articulo',
  `lote` varchar(10) NOT NULL COMMENT 'Lote del articulo',
  `articulo` varchar(10) NOT NULL COMMENT 'Articulo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

DROP TABLE IF EXISTS `articulo`;
CREATE TABLE `articulo` (
  `codigoarticulo` varchar(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `familia` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Almacenamos los articulos';

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`codigoarticulo`, `nombre`, `familia`) VALUES
('001', 'CHISTORRA', 'PRODUCTOS ELABORADOS'),
('002', 'PINCHITOS', 'PRODUCTOS ELABORADOS'),
('003', 'BUTIFARRA', 'PRODUCTOS ELABORADOS'),
('004', 'MORCILLA CEBOLLA', 'PRODUCTOS ELABORADOS'),
('005', 'CHORIZO 1ª', 'PRODUCTOS ELABORADOS'),
('006', 'BUTIFARRA ECO', 'PRODUCTOS ELABORADOS'),
('007', 'COSTILLAS', 'CANAL DESPIEZADA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulomateriaprima`
--

DROP TABLE IF EXISTS `articulomateriaprima`;
CREATE TABLE `articulomateriaprima` (
  `articulo` varchar(10) NOT NULL,
  `materiaprima` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Composicion de los articulos';

--
-- Volcado de datos para la tabla `articulomateriaprima`
--

INSERT INTO `articulomateriaprima` (`articulo`, `materiaprima`) VALUES
('001', '004'),
('001', '020'),
('002', '001'),
('002', '019'),
('002', '021'),
('003', '003'),
('003', '004'),
('003', '016'),
('003', '017'),
('004', '005'),
('004', '006'),
('004', '007'),
('004', '008'),
('004', '009'),
('004', '013'),
('004', '025'),
('005', '001'),
('005', '003'),
('005', '004'),
('005', '009'),
('005', '011'),
('005', '012'),
('006', '001'),
('006', '003'),
('006', '004'),
('006', '012'),
('006', '016'),
('006', '017');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientefax`
--

DROP TABLE IF EXISTS `clientefax`;
CREATE TABLE `clientefax` (
  `fax` varchar(9) NOT NULL,
  `cliente` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `codigocliente` varchar(10) NOT NULL,
  `razonsocial` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `localidad` varchar(20) NOT NULL,
  `provincia` varchar(20) NOT NULL,
  `codigopostal` varchar(6) NOT NULL,
  `nif` varchar(10) NOT NULL,
  `subcuentaiva` int(7) NOT NULL,
  `descuentopp` float NOT NULL,
  `descuentoesp` float NOT NULL,
  `recargo` varchar(1) DEFAULT NULL,
  `iva` varchar(1) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `enviofacturaemail` varchar(1) DEFAULT NULL,
  `formapago` varchar(20) NOT NULL,
  `tarifa` varchar(25) NOT NULL,
  `vendedor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Almacenamos los clientes';

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`codigocliente`, `razonsocial`, `direccion`, `localidad`, `provincia`, `codigopostal`, `nif`, `subcuentaiva`, `descuentopp`, `descuentoesp`, `recargo`, `iva`, `email`, `enviofacturaemail`, `formapago`, `tarifa`, `vendedor`) VALUES
('0000000001', 'VENTA CONTADO TRANSEUNTES', 'CRTA BADAJOJ', 'ESPEJO', 'CORDOBA', '11111', '1111111111', 43000000, 0, 0, 'N', 'S', '', 'N', 'CONTADO', 'TARIFA 1', 'CAJA'),
('0000000002', 'HERMANOS ROMERO', 'C SIN SILLA', 'CORDOBA', 'CORDOBA', '22222', '3333333333', 43000001, 5, 0, 'S', 'S', '', 'N', 'PAGARE', 'TARIFA 2', 'RAFAEL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientetelefono`
--

DROP TABLE IF EXISTS `clientetelefono`;
CREATE TABLE `clientetelefono` (
  `telefono` varchar(9) NOT NULL,
  `cliente` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Almacenamos los telefonos del cliente';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE `compras` (
  `codigocompra` int(11) NOT NULL COMMENT 'Codigo de la compra auto incremental',
  `fecharecepcion` varchar(10) NOT NULL COMMENT 'Fecha de la recepcion de la compra',
  `fechafacturacompra` varchar(10) NOT NULL,
  `cantidad` float NOT NULL COMMENT 'Cantidad en kilos',
  `lotecompra` varchar(20) NOT NULL COMMENT 'Lote de la compra',
  `nfacturacompra` varchar(20) NOT NULL COMMENT 'Numero de factura de la compra',
  `higiene` varchar(12) DEFAULT NULL COMMENT 'Higiene solo acepta Aceptable y No aceptable',
  `carolep` varchar(12) NOT NULL COMMENT 'Caro leptidos solo acepta Aceptable y No aceptable',
  `precio` float NOT NULL COMMENT 'Coste de la compra',
  `firma` varchar(20) DEFAULT NULL COMMENT 'Datos de la compra',
  `observaciones` varchar(200) DEFAULT NULL COMMENT 'Observaciones de la compra',
  `transporte` int(11) DEFAULT NULL COMMENT 'Valor',
  `stock` varchar(1) NOT NULL COMMENT 'Si se ha pasado a stock',
  `proveedor` varchar(10) NOT NULL,
  `materiaprima` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Compras a proveedores';

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`codigocompra`, `fecharecepcion`, `fechafacturacompra`, `cantidad`, `lotecompra`, `nfacturacompra`, `higiene`, `carolep`, `precio`, `firma`, `observaciones`, `transporte`, `stock`, `proveedor`, `materiaprima`) VALUES
(17, '20/10/2017', '20/10/2017', 95, '4321', '1234', 'ACEPTABLE', 'ACEPTABLE', 0.29, '', '', 0, 'S', '0000000001', '008'),
(18, '19/10/2017', '18/10/2017', 177, 'TCN123', '59434', 'ACEPTABLE', 'ACEPTABLE', 1.23, '', '', 0, 'S', '0000000003', '003');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentascontabilidad`
--

DROP TABLE IF EXISTS `cuentascontabilidad`;
CREATE TABLE `cuentascontabilidad` (
  `id` varchar(1) NOT NULL,
  `venta` varchar(7) NOT NULL COMMENT 'Cuenta contabilidad de la venta',
  `iva` varchar(7) NOT NULL COMMENT 'Cuenta contablidad del iva',
  `ivare` varchar(7) NOT NULL COMMENT 'Cuenta contablidad iva repuercutido',
  `re` varchar(7) NOT NULL COMMENT 'Cuenta contablidad del recargo',
  `cobro` varchar(7) NOT NULL COMMENT 'Cuenta contablidad del cobro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuentascontabilidad`
--

INSERT INTO `cuentascontabilidad` (`id`, `venta`, `iva`, `ivare`, `re`, `cobro`) VALUES
('1', '7010200', '4770010', '4770110', '4750014', '5700000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivomovil`
--

DROP TABLE IF EXISTS `dispositivomovil`;
CREATE TABLE `dispositivomovil` (
  `codigodispositivomovil` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `especificaciones` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Almacenamos los dispositivos moviles adquiridos';

--
-- Volcado de datos para la tabla `dispositivomovil`
--

INSERT INTO `dispositivomovil` (`codigodispositivomovil`, `nombre`, `especificaciones`) VALUES
('1', 'DATALOGIC', '1'),
('2', 'MOTOROLA', ''),
('3', 'DATALOGIC AC', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivomovilvendedor`
--

DROP TABLE IF EXISTS `dispositivomovilvendedor`;
CREATE TABLE `dispositivomovilvendedor` (
  `dispositivomovil` varchar(10) NOT NULL COMMENT 'Codigo dispositivo',
  `vendedor` varchar(10) NOT NULL COMMENT 'Codigo vendedor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dispositivos y  vendedores';

--
-- Volcado de datos para la tabla `dispositivomovilvendedor`
--

INSERT INTO `dispositivomovilvendedor` (`dispositivomovil`, `vendedor`) VALUES
('3', '0000000002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

DROP TABLE IF EXISTS `facturas`;
CREATE TABLE `facturas` (
  `numerofactura` varchar(10) NOT NULL COMMENT 'Numero factura',
  `fecha` varchar(10) NOT NULL COMMENT 'Fecha creacion factura',
  `hora` varchar(10) NOT NULL COMMENT 'Hora creacion factura',
  `base` float NOT NULL COMMENT 'Base imponible',
  `iva` int(11) NOT NULL COMMENT 'Iva que lleva la factura',
  `recargo` int(11) NOT NULL COMMENT 'Recargo de la factura',
  `importeiva` float NOT NULL COMMENT 'Importe en euros de aplicar el iva a la base',
  `importerecargo` float NOT NULL COMMENT 'Importe en euros de aplicar el recargo a la base',
  `fechacobro` varchar(10) NOT NULL COMMENT 'Fecha de cobro de la factura',
  `descuentopp` float DEFAULT NULL COMMENT 'Descuento pronto pago',
  `importedescuentopp` float DEFAULT NULL COMMENT 'Valor del descuento pronto pago',
  `descuentoesp` float DEFAULT NULL COMMENT 'Descuento especial',
  `importedescuentoesp` float DEFAULT NULL COMMENT 'Valor del descuento especial',
  `cobrada` varchar(1) NOT NULL COMMENT 'Si ha sigo cobrada o no',
  `formapago` varchar(20) DEFAULT NULL COMMENT 'Forma del pago del cliente',
  `vencimiento` varchar(10) DEFAULT NULL,
  `contabilizada` varchar(1) NOT NULL COMMENT 'Si se ha pasado a contablidad',
  `cliente` varchar(10) NOT NULL COMMENT 'Cliente de la factura',
  `vendedor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Facturas';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturasdetalles`
--

DROP TABLE IF EXISTS `facturasdetalles`;
CREATE TABLE `facturasdetalles` (
  `numerofacura` varchar(10) NOT NULL COMMENT 'Numero de factura a la que pertenece la linea detalle',
  `linea` int(11) NOT NULL COMMENT 'Linea de la factura',
  `precio` float NOT NULL COMMENT 'Precio kilo del articulo',
  `peso` float NOT NULL COMMENT 'Peso del articulo',
  `importe` float NOT NULL COMMENT 'Importe total del articulo',
  `lote` varchar(10) NOT NULL COMMENT 'Lote del articulo',
  `articulo` varchar(10) NOT NULL COMMENT 'Articulo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lineas detalle de las facturas';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familiaarticulo`
--

DROP TABLE IF EXISTS `familiaarticulo`;
CREATE TABLE `familiaarticulo` (
  `nombrefamilia` varchar(25) NOT NULL COMMENT 'Almacena nombre de la familia',
  `recargo` float NOT NULL COMMENT 'Almacena el recargo que lleva la familia por desechos durante el proceso de fabricacion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Almacena las familias';

--
-- Volcado de datos para la tabla `familiaarticulo`
--

INSERT INTO `familiaarticulo` (`nombrefamilia`, `recargo`) VALUES
('AVE CANAL DESP Y ELABORA', 0.126),
('AVE CANAL ESPA 65%', 0.052),
('AVE CANAL ESPA 80%', 0.024),
('CANAL DESPIEZADA', 0.03),
('CANAL Y DESPOJOS', 0.015),
('PRODUCTOS ELABORADOS', 0.05),
('VARIOS', 0.05);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formapago`
--

DROP TABLE IF EXISTS `formapago`;
CREATE TABLE `formapago` (
  `nombreformapago` varchar(20) NOT NULL COMMENT 'Almacena el nombre de la forma de pago',
  `dias` int(11) NOT NULL,
  `porcentaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Almacenamos las formas de pago con sus dias y el porcentaje';

--
-- Volcado de datos para la tabla `formapago`
--

INSERT INTO `formapago` (`nombreformapago`, `dias`, `porcentaje`) VALUES
('CONTADO', 0, 100),
('PAGARE', 45, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lotedetalle`
--

DROP TABLE IF EXISTS `lotedetalle`;
CREATE TABLE `lotedetalle` (
  `codigolote` varchar(10) NOT NULL COMMENT 'Codigo del lote al que pertenece la linea',
  `linea` int(11) NOT NULL COMMENT 'Numero de linea detalle',
  `cantidad` float NOT NULL COMMENT 'Cantidad en kilos de mateira prima',
  `coste` float NOT NULL COMMENT 'Coste medido en euros/kilo de la materia prima',
  `numerolotecompra` varchar(12) NOT NULL COMMENT 'Lote de compra de la mateira prima',
  `proveedor` varchar(10) NOT NULL COMMENT 'Proveedor de la materia prima',
  `nfacturacompra` varchar(10) NOT NULL COMMENT 'Numero de la facrua de compra de la materia prima',
  `fechafacturacompra` varchar(10) NOT NULL COMMENT 'Fecha factura de compra',
  `materiaprima` varchar(10) NOT NULL COMMENT 'Materia prima de la linea detalle'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lineas detalle de los lotes';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lotes`
--

DROP TABLE IF EXISTS `lotes`;
CREATE TABLE `lotes` (
  `codigolote` varchar(10) NOT NULL COMMENT 'Codgio del lote',
  `fecha` varchar(10) NOT NULL COMMENT 'Fecha creacion de lote',
  `cantidad` float NOT NULL COMMENT 'Kilos del lote',
  `coste` float NOT NULL COMMENT 'Coste en euros del lote',
  `cantidadbruta` float NOT NULL COMMENT 'Cantidad bruta en kilos del lote',
  `merma` float NOT NULL COMMENT 'Kilos perdidos en el proceso de creacion del lote',
  `articulo` varchar(10) NOT NULL COMMENT 'Articulo creado en el lote'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cabecera de lotes';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiaprima`
--

DROP TABLE IF EXISTS `materiaprima`;
CREATE TABLE `materiaprima` (
  `codigomateriaprima` varchar(10) NOT NULL COMMENT 'Codigo de la materia prima',
  `nombre` varchar(30) NOT NULL COMMENT 'Nombre de la materiaprima'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Almacenamos las materias primas con las que estan fabridados';

--
-- Volcado de datos para la tabla `materiaprima`
--

INSERT INTO `materiaprima` (`codigomateriaprima`, `nombre`) VALUES
('001', 'MAGRO'),
('002', 'PANCETA'),
('003', 'PAPADA'),
('004', 'RECORTE BEICON'),
('005', 'GRASA'),
('006', 'PELLA'),
('007', 'SANGRE'),
('008', 'CEBOLLA'),
('009', 'AJO'),
('010', 'SALCHICHONAL'),
('011', 'CHORIZOL'),
('012', 'TRIPA 34/36'),
('013', 'TRIPA 40/43'),
('014', 'TRIPA 43/46'),
('015', 'MORCILLA'),
('016', 'FECULA'),
('017', 'BUTIFARRA'),
('018', 'SALCHICHON SM/50'),
('019', 'MAGRO MATANZA'),
('020', 'CHISTORRA'),
('021', 'APORRO'),
('022', 'CHIRIZO EXTRA'),
('023', 'CHORIZO SELECTO'),
('024', 'MANTECA DE CERDO IBERICO'),
('025', 'PROANSOY');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor` (
  `codigoproveedor` varchar(10) NOT NULL COMMENT 'Codigo del proveedor',
  `razonsocial` varchar(50) NOT NULL COMMENT 'Razon Social proveedor',
  `nif` varchar(10) NOT NULL COMMENT 'Nif del proveedor',
  `direccion` varchar(50) NOT NULL COMMENT 'Direccion del proveedor',
  `localidad` varchar(20) NOT NULL COMMENT 'Localidad del proveedor',
  `provincia` varchar(20) NOT NULL COMMENT 'Provincia del vendedor',
  `codigopostal` varchar(5) NOT NULL COMMENT 'Codigo postal de la localidad',
  `web` varchar(100) DEFAULT NULL COMMENT 'Pagina web del proveedor',
  `email` varchar(20) DEFAULT NULL COMMENT 'Email del proveedor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Proveedores.';

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`codigoproveedor`, `razonsocial`, `nif`, `direccion`, `localidad`, `provincia`, `codigopostal`, `web`, `email`) VALUES
('0000000001', 'DIATESA', '11111111V', 'C MOLINOS N10', 'CORDOBA', 'CORDOBA', '12345', 'WWW.A.COM', 'ASDF@A.COM'),
('0000000002', 'FRIMANCHO', '1111111111', 'AUTOVIA', 'VALDEPEñAS', 'CIUDAD REAL', '22222', '', ''),
('0000000003', 'FACCSOO', '3333333333', 'PLAZA ESPAñA', 'TORREMOLINOS', 'MALAGA', '22222', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedorcomercial`
--

DROP TABLE IF EXISTS `proveedorcomercial`;
CREATE TABLE `proveedorcomercial` (
  `codigoproveedor` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedorcomercial`
--

INSERT INTO `proveedorcomercial` (`codigoproveedor`, `nombre`, `telefono`, `email`) VALUES
('1', '111111111', '222222222', '11111111111111111111'),
('0000000001', 'PEPE', '111111111', 'PEPE@A.COM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedorfax`
--

DROP TABLE IF EXISTS `proveedorfax`;
CREATE TABLE `proveedorfax` (
  `fax` varchar(9) NOT NULL COMMENT 'Fax',
  `proveedor` varchar(10) NOT NULL COMMENT 'Codigo proveedor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Fax de los proveedores';

--
-- Volcado de datos para la tabla `proveedorfax`
--

INSERT INTO `proveedorfax` (`fax`, `proveedor`) VALUES
('222222222', '0000000001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedormateriaprima`
--

DROP TABLE IF EXISTS `proveedormateriaprima`;
CREATE TABLE `proveedormateriaprima` (
  `proveedor` varchar(10) NOT NULL COMMENT 'Proveedor',
  `materiaprima` varchar(10) NOT NULL COMMENT 'Materia prima que vende el proveedor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Materias primas venden proveedores';

--
-- Volcado de datos para la tabla `proveedormateriaprima`
--

INSERT INTO `proveedormateriaprima` (`proveedor`, `materiaprima`) VALUES
('0000000001', '008'),
('0000000001', '009'),
('0000000001', '016'),
('0000000001', '018'),
('0000000001', '021'),
('0000000001', '023'),
('0000000002', '003'),
('0000000002', '005'),
('0000000002', '009'),
('0000000002', '016'),
('0000000002', '017'),
('0000000002', '021'),
('0000000003', '002'),
('0000000003', '003'),
('0000000003', '008'),
('0000000003', '009'),
('0000000003', '011'),
('0000000003', '015'),
('0000000003', '017'),
('0000000003', '020'),
('0000000003', '021'),
('0000000003', '022');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedortelefono`
--

DROP TABLE IF EXISTS `proveedortelefono`;
CREATE TABLE `proveedortelefono` (
  `telefono` varchar(9) NOT NULL COMMENT 'Telefono',
  `proveedor` varchar(10) NOT NULL COMMENT 'Codigo proveedor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Telefonos del proveedor';

--
-- Volcado de datos para la tabla `proveedortelefono`
--

INSERT INTO `proveedortelefono` (`telefono`, `proveedor`) VALUES
('111111111', '0000000001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `codigostock` int(11) NOT NULL,
  `materiaprima` varchar(10) NOT NULL,
  `cantidad` float NOT NULL,
  `lotecompra` varchar(20) NOT NULL,
  `proveedor` varchar(10) NOT NULL,
  `nfacturacompra` varchar(20) NOT NULL,
  `ffacturacompra` varchar(10) NOT NULL,
  `precio` float NOT NULL,
  `usado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `stock`
--

INSERT INTO `stock` (`codigostock`, `materiaprima`, `cantidad`, `lotecompra`, `proveedor`, `nfacturacompra`, `ffacturacompra`, `precio`, `usado`) VALUES
(7, '008', 95, '4321', '0000000001', '1234', '20/10/2017', 0.29, 'N'),
(8, '003', 177, 'TCN123', '0000000003', '59434', '18/10/2017', 1.23, 'N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifa`
--

DROP TABLE IF EXISTS `tarifa`;
CREATE TABLE `tarifa` (
  `nombretarifa` varchar(25) NOT NULL COMMENT 'Nombre de la familia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Almacenamos las familias a los cuales pertenece los articulo';

--
-- Volcado de datos para la tabla `tarifa`
--

INSERT INTO `tarifa` (`nombretarifa`) VALUES
('TARIFA 1'),
('TARIFA 2'),
('TARIFA 3'),
('TARIFA 4'),
('TARIFA 5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifaarticulo`
--

DROP TABLE IF EXISTS `tarifaarticulo`;
CREATE TABLE `tarifaarticulo` (
  `articulo` varchar(10) NOT NULL,
  `tarifa` varchar(25) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tarifaarticulo`
--

INSERT INTO `tarifaarticulo` (`articulo`, `tarifa`, `precio`) VALUES
('001', 'TARIFA 4', 1.23),
('001', 'TARIFA 5', 1),
('002', 'TARIFA 3', 1.2),
('003', 'TARIFA 1', 1.2),
('003', 'TARIFA 2', 1),
('003', 'TARIFA 5', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tclote`
--

DROP TABLE IF EXISTS `tclote`;
CREATE TABLE `tclote` (
  `codigolote` varchar(10) NOT NULL COMMENT 'Codigo lote',
  `Temperatura1` int(11) NOT NULL,
  `Tiempo1` int(11) NOT NULL,
  `Temperatura2` int(11) NOT NULL,
  `Tiempo2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temperaturas y tiempos de algunos procesos';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoiva`
--

DROP TABLE IF EXISTS `tipoiva`;
CREATE TABLE `tipoiva` (
  `nombretipoiva` varchar(25) NOT NULL COMMENT 'Almacena nombre tipo de iva',
  `iva` int(11) NOT NULL COMMENT 'Almacena el iva que se aplicara a factura y albaranes',
  `recargo` int(11) NOT NULL COMMENT 'Almacena el recargo que se aplicara a factura y albaranes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Almacena los tipos de iva que esistiran';

--
-- Volcado de datos para la tabla `tipoiva`
--

INSERT INTO `tipoiva` (`nombretipoiva`, `iva`, `recargo`) VALUES
('TIPO 1', 10, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
CREATE TABLE `vendedor` (
  `codigovendedor` varchar(10) NOT NULL COMMENT 'Almacena el codigo del vendedor',
  `nombre` varchar(30) NOT NULL COMMENT 'Nombre del Vendedor',
  `nif` varchar(10) NOT NULL COMMENT 'Nif del vendedor',
  `direccion` varchar(50) NOT NULL COMMENT 'Direccion del vendedor',
  `localidad` varchar(20) NOT NULL COMMENT 'localidad del vendedor',
  `provincia` varchar(20) NOT NULL COMMENT 'Provincia del vendedor',
  `codigopostal` varchar(6) NOT NULL COMMENT 'Codigo postal de la localidad'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Almacenamos los vendedores de la empresa.';

--
-- Volcado de datos para la tabla `vendedor`
--

INSERT INTO `vendedor` (`codigovendedor`, `nombre`, `nif`, `direccion`, `localidad`, `provincia`, `codigopostal`) VALUES
('0000000001', 'CAJA', '1111111111', 'C  RAMON Y CAJAL', 'ESPEJO', 'CORDOBA', '14830'),
('0000000002', 'RAFAEL', '444444444V', 'C REGIONES DEVASTADAS', 'ESPEJO', 'CORDOBA', '14830');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedortelefono`
--

DROP TABLE IF EXISTS `vendedortelefono`;
CREATE TABLE `vendedortelefono` (
  `telefono` varchar(9) NOT NULL,
  `vendedor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Almacenamos los telefonos de los vendedores';

--
-- Volcado de datos para la tabla `vendedortelefono`
--

INSERT INTO `vendedortelefono` (`telefono`, `vendedor`) VALUES
('123456789', '0000000001'),
('222222222', '0000000002');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `albaranes`
--
ALTER TABLE `albaranes`
  ADD PRIMARY KEY (`numeroalbaran`);

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`codigoarticulo`);

--
-- Indices de la tabla `articulomateriaprima`
--
ALTER TABLE `articulomateriaprima`
  ADD PRIMARY KEY (`articulo`,`materiaprima`);

--
-- Indices de la tabla `clientefax`
--
ALTER TABLE `clientefax`
  ADD PRIMARY KEY (`fax`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`codigocliente`);

--
-- Indices de la tabla `clientetelefono`
--
ALTER TABLE `clientetelefono`
  ADD PRIMARY KEY (`telefono`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`codigocompra`);

--
-- Indices de la tabla `cuentascontabilidad`
--
ALTER TABLE `cuentascontabilidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dispositivomovil`
--
ALTER TABLE `dispositivomovil`
  ADD PRIMARY KEY (`codigodispositivomovil`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`numerofactura`);

--
-- Indices de la tabla `familiaarticulo`
--
ALTER TABLE `familiaarticulo`
  ADD PRIMARY KEY (`nombrefamilia`);

--
-- Indices de la tabla `formapago`
--
ALTER TABLE `formapago`
  ADD PRIMARY KEY (`nombreformapago`);

--
-- Indices de la tabla `lotes`
--
ALTER TABLE `lotes`
  ADD PRIMARY KEY (`codigolote`);

--
-- Indices de la tabla `materiaprima`
--
ALTER TABLE `materiaprima`
  ADD PRIMARY KEY (`codigomateriaprima`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`codigoproveedor`);

--
-- Indices de la tabla `proveedorfax`
--
ALTER TABLE `proveedorfax`
  ADD PRIMARY KEY (`fax`);

--
-- Indices de la tabla `proveedormateriaprima`
--
ALTER TABLE `proveedormateriaprima`
  ADD PRIMARY KEY (`proveedor`,`materiaprima`);

--
-- Indices de la tabla `proveedortelefono`
--
ALTER TABLE `proveedortelefono`
  ADD PRIMARY KEY (`telefono`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`codigostock`);

--
-- Indices de la tabla `tarifa`
--
ALTER TABLE `tarifa`
  ADD PRIMARY KEY (`nombretarifa`);

--
-- Indices de la tabla `tarifaarticulo`
--
ALTER TABLE `tarifaarticulo`
  ADD PRIMARY KEY (`articulo`,`tarifa`);

--
-- Indices de la tabla `tclote`
--
ALTER TABLE `tclote`
  ADD PRIMARY KEY (`codigolote`);

--
-- Indices de la tabla `tipoiva`
--
ALTER TABLE `tipoiva`
  ADD PRIMARY KEY (`nombretipoiva`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`codigovendedor`);

--
-- Indices de la tabla `vendedortelefono`
--
ALTER TABLE `vendedortelefono`
  ADD PRIMARY KEY (`telefono`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `codigocompra` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la compra auto incremental', AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `stock`
--
ALTER TABLE `stock`
  MODIFY `codigostock` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
