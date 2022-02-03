-- Book_log ���̺� ����
CREATE TABLE Book_log(
    bookid_l    NUMBER,
    bookname_1  VARCHAR2(40),
    publisher_1 VARCHAR2(40),
    price_1     NUMBER  );
    
-- ���� ��� Ʈ���� ����
CREATE OR REPLACE TRIGGER AfterInsertBook
AFTER INSERT ON Book FOR EACH ROW
DECLARE
    average NUMBER;
BEGIN
    INSERT INTO Book_log
        VALUES(:new.bookid, :new.bookname, :new.publisher, :new.price);
    DBMS_OUTPUT.PUT_LINE('���� ������ Book_log ���̺� ���..');
END;

-- Ʈ���� Ȯ��
INSERT INTO Book VALUES(14, '������ ���� 1', '�̻�̵��', 25000);
SELECT * FROM Book WHERE BOOKID = '14';
SELECT * FROM Book_log WHERE BOOKID_L = '14';