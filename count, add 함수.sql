CREATE OR REPLACE FUNCTION totalCustomers
    return number
IS
total number := 0;
BEGIN
    SELECT COUNT(*) INTO total FROM customer;
    RETURN total;
END;
------------------------------------------------
DECLARE
    i number;
BEGIN
    i := totalCustomers();
    DBMS_OUTPUT.PUT_LINE('Total :' || i);
END;
-------------------------------------------------
CREATE OR REPLACE FUNCTION ADDER
(
    n1 IN NUMBER,
    n2 IN NUMBER
)
RETURN NUMBER
IS
n3 NUMBER;
BEGIN
    n3 := n1 + n2;
    RETURN n3;
END;
-------------------------------------------------
SET SERVEROUTPUT ON;
DECLARE
    n3 NUMBER;
BEGIN
    n3 := adder(20,30);
    DBMS_OUTPUT.PUT_LINE('Add result :' || n3);
END;