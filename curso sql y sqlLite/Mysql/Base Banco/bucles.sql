-- Active: 1668005078601@@127.0.0.1@3316@bancodb
--creamos una tabla 
CREATE Table MasterCuenta (
    idMasterCuenta INT Auto_increment PRIMARY KEY,
    monto DECIMAL(10,2));

insert into MasterCuenta(monto) values(2000.00);

SELECT * from mastercuenta;



--promocion procedimiento

DELIMITER //
CREATE PROCEDURE ejecutar_promocion(IN monto DECIMAL(10,2))

	Begin
        Declare montoMaster int;        
        Declare montoCuenta int;
        declare nCuenta int;
        Declare finalizado int default false;
        Declare listadoCuentas CURSOR for SELECT CuentasCliente.Numero, CuentasCliente.monto  from CuentasCliente;
        Declare continue handler for not found set finalizado =  True;

        select MasterCuenta.Monto INTO montoMaster from MasterCuenta;

        open listadoCuentas;

        recorriendoLista: Loop
            Fetch listadoCuentas INTO nCuenta, montoCuenta;
            if finalizado then 
                leave recorriendoLista;
            end if ;

            if montoMaster>=monto Then
                UPDATE CuentasCliente set CuentasCliente.Monto=montoCuenta+monto 
                where CuentasCliente.numero=nCuenta;
                set montoMaster=montoMaster-monto;


                if montoMaster<monto then
                    leave recorriendoLista;
                end if ;
            else 
                leave recorriendoLista;
            end if ;

        end Loop;
		Update MasterCuenta SET Monto=montoMaster where idMasterCuenta=1;
    END //	

DELIMITER ;



--miramos ejecucion

SELECT CuentasCliente.Monto FROM bancodb.cuentascliente;
select * from mastercuenta;


