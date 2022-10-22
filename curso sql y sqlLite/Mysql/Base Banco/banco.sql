CREATE DATABASE BancoDB;

use BancoDB;

CREATE Table clientes(
    idCliente int auto_Increment PRIMARY KEY,
    Documento VARCHAR(15) UNIQUE NOT null,
    Nombre VARCHAR(20) NOT NULL,
    Apellido VARCHAR (20) NOT NULL
);

CREATE Table CuentasCliente (
    idCuenta int AUTO_INCREMENT PRIMARY KEY,
    Numero int  UNIQUE NOT null,
    idCliente int not null,
    Monto DECIMAL(10,2),
    Foreign Key (idCliente) REFERENCES Clientes(idCliente)
);

CREATE Table MovimientosCuenta(
    idMovimiento int AUTO_INCREMENT PRIMARY KEY,
    idCuenta int NOT NULL, 
    Retiro TINYINT not null, 
    Movimiento TINYINT NOT NULL,
    idCuentaMovimiento int,
    Monto DECIMAL(10,2),
    Foreign Key (idCuenta) REFERENCES CuentasCliente (idCuenta), 
    Foreign Key (idCuentaMovimiento) REFERENCES CuentasCliente(idCuenta)
);


insert INTO clientes (Documento, Nombre, Apellido) VALUES
    ('123456', 'Camilo', 'Acosta'),
    ('456654', 'Catalina', 'Quimbayo'),
    ('552426', 'Juan', 'Quito');

INSERT into cuentascliente(Numero, idCliente, Monto) VALUES
    (111,1,1000.00),
    (444,2,2000.00), 
    (555,3,5000.0);


SELECT clientes.Nombre, cuentasCliente.Numero, CuentasCliente.Monto
FROM clientes, cuentasCliente
where clientes.idCliente = CuentasCliente.idCliente;


-- transacciones
/*¨movimiento entre cuentas*/
UPDATE cuentascliente set Monto = Monto - 500 where Numero=111;
UPDATE cuentascliente set Monto = Monto + 500 where Numero=444;

INSERT INTO movimientoscuenta (idCuenta,Retiro,Movimiento,idCuentaMovimiento,Monto) VALUES 
    (1,1,1,2,500);
INSERT INTO movimientoscuenta (idCuenta,Retiro,Movimiento,idCuentaMovimiento,Monto) VALUES 
    (2,0,1,1,500);


--Movimento de juan
UPDATE cuentascliente set monto = monto -250.00 WHERE Numero=555;

INSERT INTO movimientoscuenta (idCuenta,Retiro,Movimiento,idCuentaMovimiento,Monto) VALUES 
    (3,1,0,null,250.00);


--visulalizacion de transacion entre cuentas 
SELECT clientes.Nombre,cuentasCliente.Numero, MovimientosCuenta.Retiro, MovimientosCuenta.Movimiento, 
    MovimientosCuenta.Monto, CuentasTercero.Numero
from clientes
inner join cuentascliente on clientes.idCliente=cuentasCliente.idCliente
inner JOIN MovimientosCuenta on CuentasCliente.idCuenta=MovimientosCuenta.idCuenta
inner JOIN cuentascliente as CuentasTercero on CuentasTercero.idCuenta=MovimientosCuenta.idCuentaMovimiento;

--transaionentre cuentas y cuenta de juan
SELECT clientes.Nombre,cuentasCliente.Numero, MovimientosCuenta.Retiro, MovimientosCuenta.Movimiento, 
    MovimientosCuenta.Monto, CuentasTercero.Numero
from clientes
LEFT join cuentascliente on clientes.idCliente=cuentasCliente.idCliente
LEFT JOIN MovimientosCuenta on CuentasCliente.idCuenta=MovimientosCuenta.idCuenta
LEFT JOIN cuentascliente as CuentasTercero on CuentasTercero.idCuenta=MovimientosCuenta.idCuentaMovimiento;



--Transaccion

set autocommit = 0; -- o off y para encenderla on;
Begin;
UPDATE cuentascliente set Monto = Monto - 500 where Numero=111;
UPDATE cuentascliente set Monto = Monto + 500 where Numero=444;
INSERT INTO movimientoscuenta (idCuenta,Retiro,Movimiento,idCuentaMovimiento,Monto) VALUES 
    (1,1,1,2,500);
INSERT INTO movimientoscuenta (idCuenta,Retiro,Movimiento,idCuentaMovimiento,Monto) VALUES 
    (2,0,1,1,500);
COMMIT; --envia transaccion
ROLLBACK;--devuelve los cambios de la transaccion 
