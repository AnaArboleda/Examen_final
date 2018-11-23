
CREATE TABLE PEDIDOS (
items integer,
cajas_grandes integer,
cajas_pequenas integer,
cantidad_cajas integer
)

CREATE OR REPLACE FUNCTION CALCULAR_CAJAS_NECESARIAS(cnt_items IN NUMBER,cnt_cajas_dis_gran IN VARCHAR2, cnt_cajas_dis_peque IN VARCHAR2) 
RETURN NUMBER AS
resultado1 number := 0;
resultado number := 0;
resultado2 number := 0;
calculo number := 0;
diferencia number := 0;
calculo_caja_gran number := 0;
calculo_caja_peq number := 0;
BEGIN 
 calculo := trunc((cnt_items/5),0);
 calculo_caja_gran := calculo;
 calculo_caja_peq := (cnt_items - (calculo_caja_gran * 5));
 resultado1 := cnt_cajas_dis_peque - calculo_caja_peq;
 IF (cnt_cajas_dis_peque < calculo_caja_peq)
 THEN
 diferencia := resultado1 +  calculo_caja_gran;
 resultado := diferencia;
 ELSE 
 resultado := resultado1;
 RETURN resultado;
 END IF;
 END;

BEGIN 
dbms_output.put_line('número de cajas grandes: ' || CALCULAR_CAJAS_NECESARIAS(16,5,10));
END;

