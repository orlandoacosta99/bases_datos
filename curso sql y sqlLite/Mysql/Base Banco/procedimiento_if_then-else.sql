-- Active: 1668005078601@@127.0.0.1@3316@bancodb

DELIMITER //
CREATE PROCEDURE ejecutar_transaccion (
    IN documento Varchar(15), 
    iN ncuenta INT,
    IN esMovimiento TINYINT(1),
    IN cuentaDestino INT,
    IN esRetiro TINYINT(1), 
    IN monto DECIMAL(10,2)
)
begin 
    DECLARE montoActual DECIMAL(10,2);
    SELECT CuentasCliente.Monto into montoActual 
    from Clientes
    INNER JOIN CuentasCliente on Clientes.idCliente=CuentasCliente.idCliente
    WHERE CuentasCliente.Numero=nCuenta and Clientes.Documento=documento;
    
    
    IF (esMovimiento=0) THEN
        if (esRetiro=1 AND montoActual>=monto) THEN
            UPDATE CuentasCliente
                SET CuentasCliente.Monto=montoActual-monto
                WHERE CuentasCliente.Numero=nCuenta;
		 elseif (esRetiro=0) Then 
			UPDATE CuentasCliente
                SET CuentasCliente.Monto=montoActual+monto
                WHERE CuentasCliente.Numero=nCuenta;

                
         end IF;
         
         elseif (montoActual>=monto) then
          UPDATE CuentasCliente
			  SET CuentasCliente.Monto=montoActual-monto
			  WHERE CuentasCliente.Numero=nCuenta;
		  UPDATE CuentasCliente
			   SET CuentasCliente.Monto=CuentasCliente.Monto+monto
                WHERE CuentasCliente.Numero=cuentaDestino;        
         
    End if;
End //

DELIMITER ;



-- provamos FUNCTION
SELECT CuentasCliente.Monto 
    from Clientes
    INNER JOIN CuentasCliente on Clientes.idCliente=CuentasCliente.idCliente
    WHERE CuentasCliente.Numero=555 and Clientes.Documento=552426;

-- ejecucion

CALL ejecutar_transaccion('552426', 555, 1, 111, 1, 1000.00);






