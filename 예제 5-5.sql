-- Book_log 테이블 생성
CREATE TABLE Book_log(
    bookid_l    NUMBER,
    bookname_1  VARCHAR2(40),
    publisher_1 VARCHAR2(40),
    price_1     NUMBER  );
    
-- 삽입 백업 트리거 생성
CREATE OR REPLACE TRIGGER AfterInsertBook
AFTER INSERT ON Book FOR EACH ROW
DECLARE
    average NUMBER;
BEGIN
    INSERT INTO Book_log
        VALUES(:new.bookid, :new.bookname, :new.publisher, :new.price);
    DBMS_OUTPUT.PUT_LINE('삽입 투플을 Book_log 테이블에 백업..');
END;

-- 트리거 확인
INSERT INTO Book VALUES(14, '스포츠 과학 1', '이상미디어', 25000);
SELECT * FROM Book WHERE BOOKID = '14';
SELECT * FROM Book_log WHERE BOOKID_L = '14';