SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Clientes` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Clientes` (
  `idClientes` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `telefono` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  PRIMARY KEY (`idClientes`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Estados` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Estados` (
  `idEstados` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(45) NULL ,
  PRIMARY KEY (`idEstados`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedidos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pedidos` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Pedidos` (
  `idPedidos` INT NOT NULL AUTO_INCREMENT ,
  `fecha` DATETIME NULL ,
  `detalle` VARCHAR(45) NULL ,
  `estado` VARCHAR(45) NULL ,
  `Clientes_idClientes` INT NOT NULL ,
  `Estados_idEstados` INT NOT NULL ,
  PRIMARY KEY (`idPedidos`, `Clientes_idClientes`, `Estados_idEstados`) ,
  INDEX `fk_Pedidos_Clientes` (`Clientes_idClientes` ASC) ,
  INDEX `fk_Pedidos_Estados1` (`Estados_idEstados` ASC) ,
  CONSTRAINT `fk_Pedidos_Clientes`
    FOREIGN KEY (`Clientes_idClientes` )
    REFERENCES `mydb`.`Clientes` (`idClientes` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_Estados1`
    FOREIGN KEY (`Estados_idEstados` )
    REFERENCES `mydb`.`Estados` (`idEstados` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoProducto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TipoProducto` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`TipoProducto` (
  `idTipoProducto` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(45) NULL ,
  PRIMARY KEY (`idTipoProducto`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Productos` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Productos` (
  `idProductos` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `precio` FLOAT NULL ,
  `activo` INT NULL ,
  `stock` INT NULL ,
  `TipoProducto_idTipoProducto` INT NOT NULL ,
  PRIMARY KEY (`idProductos`, `TipoProducto_idTipoProducto`) ,
  INDEX `fk_Productos_TipoProducto1` (`TipoProducto_idTipoProducto` ASC) ,
  CONSTRAINT `fk_Productos_TipoProducto1`
    FOREIGN KEY (`TipoProducto_idTipoProducto` )
    REFERENCES `mydb`.`TipoProducto` (`idTipoProducto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DetallePedidos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DetallePedidos` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`DetallePedidos` (
  `idDetallePedidos` INT NOT NULL AUTO_INCREMENT ,
  `cantidad` INT NULL ,
  `sub_total` FLOAT NULL ,
  `Pedidos_idPedidos` INT NOT NULL ,
  `Productos_idProductos` INT NOT NULL ,
  PRIMARY KEY (`idDetallePedidos`, `Pedidos_idPedidos`, `Productos_idProductos`) ,
  INDEX `fk_DetallePedidos_Pedidos1` (`Pedidos_idPedidos` ASC) ,
  INDEX `fk_DetallePedidos_Productos1` (`Productos_idProductos` ASC) ,
  CONSTRAINT `fk_DetallePedidos_Pedidos1`
    FOREIGN KEY (`Pedidos_idPedidos` )
    REFERENCES `mydb`.`Pedidos` (`idPedidos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetallePedidos_Productos1`
    FOREIGN KEY (`Productos_idProductos` )
    REFERENCES `mydb`.`Productos` (`idProductos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`Estados`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `mydb`;
INSERT INTO `mydb`.`Estados` (`idEstados`, `descripcion`) VALUES (NULL, 'Nuevo');
INSERT INTO `mydb`.`Estados` (`idEstados`, `descripcion`) VALUES (NULL, 'En Cocina');
INSERT INTO `mydb`.`Estados` (`idEstados`, `descripcion`) VALUES (NULL, 'Preparado');
INSERT INTO `mydb`.`Estados` (`idEstados`, `descripcion`) VALUES (NULL, 'Entregado');
INSERT INTO `mydb`.`Estados` (`idEstados`, `descripcion`) VALUES (NULL, 'Cancelado');
INSERT INTO `mydb`.`Estados` (`idEstados`, `descripcion`) VALUES (NULL, 'Confirmado');

COMMIT;
