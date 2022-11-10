DELIMITER //
CREATE TRIGGER control_cliente AFTER INSERT ON Clientes FOR EACH ROW
BEGIN

DECLARE cLienteID INT;

SElect clienteID= New.idcliente;

INSERT INTO ControlCLientes(idCliente,fecha) VALUES (cLienteID,now());

end //

DELIMITER ;


----
CREATE TABLE ControlClientes(idControlClientes INT AUTO_INCREMENT key,
Idcliente INT NOT NULL,
fecha date NOT NULL,
FOREIGN KEY (IdCLiente) REFERENCES Clientes(idCliente));


---visualizar
SELECT * FROM ControlClientes;
select * from Clientes;
INSERT INTO Clientes(documento,nonbre,apellido) VALUES (55555, 'Lola', 'Lola');


