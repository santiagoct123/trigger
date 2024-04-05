CREATE DEFINER=`root`@`localhost` TRIGGER `alumno`.`factura_AFTER_INSERT_1` AFTER INSERT ON `factura` FOR EACH ROW
BEGIN
  DECLARE cantidadfinal INT;
  DECLARE stockactual INT;

  SET stockactual = (SELECT cantidad FROM inventario WHERE idProducto = NEW.idProducto);
  SET cantidadfinal = stockactual - NEW.cantidad;

  UPDATE inventario
  SET cantidad = cantidadfinal
  WHERE idProducto = NEW.idProducto;
END
