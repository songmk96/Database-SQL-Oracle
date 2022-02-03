CREATE TABLE LOOP_TEST
(
    TESTID NUMBER(10) PRIMARY KEY
);

BEGIN
    FOR J IN 1..10 LOOP
        INSERT INTO LOOP_TEST VALUES(J);
    END LOOP;
END;

SELECT * FROM LOOP_TEST;
------------------------------------------------
CREATE TABLE TEST
(
    TESTID NUMBER(10) PRIMARY KEY
);

BEGIN
    FOR J IN 1..10 LOOP
        IF J != 5 OR J != 7 THEN
            INSERT INTO TEST VALUES(J);
        ELSE
            CONTINUE;
        END IF;
    END LOOP;
END;

SELECT * FROM TEST;
        
        
    