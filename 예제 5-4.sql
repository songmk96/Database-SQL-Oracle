CREATE OR REPLACE PROCEDURE Interest
AS
    myInterest NUMERIC;
    Price NUMERIC;
    CURSOR InterestCursor IS SELECT saleprice FROM Orders;
BEGIN
    myInterest := 0.0;
    OPEN InterestCursor;
    LOOP
        FETCH InterestCursor INTO Price;
        EXIT WHEN InterestCursor % NOTFOUND;
        IF Price >= 30000 THEN
            myInterest := myInterest + Price*0.1;
        ELSE
            myInterest := myInterest + Price*0.05;
        END IF;
    END LOOP;
    CLOSE InterestCursor;
    DBMS_OUTPUT.PUT_LINE('ÀüÃ¼ ÀÌÀÍ ±Ý¾×='||myInterest);
END;
/ -- '/'를 사용하지 않으면 오류 발생

SET SERVEROUTPUT ON;
EXEC Interest;
