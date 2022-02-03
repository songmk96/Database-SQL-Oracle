CREATE OR REPLACE PROCEDURE AveragePrice(
    AverageVal OUT NUMBER)
AS
BEGIN
    SELECT AVG(price) INTO AverageVal FROM Book WHERE price IS NOT NULL;
END;
/

SET SERVEROUTPUT ON;
DECLARE
    AverageVal NUMBER;
BEGIN
    AveragePrice(AverageVal);
    DBMS_OUTPUT.PUT_LINE('Ã¥°ª Æò±Õ:' ||AverageVal);
END;
     