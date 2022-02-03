CREATE OR REPLACE PROCEDURE BookInsertOrUpadate(
    myBookID NUMBER,
    myBookName VARCHAR2,
    myPublisher VARCHAR2,
    myPrice INT)
AS
    mycount NUMBER;
BEGIN
    SELECT count(*) INTO mycount FROM Book
        WHERE bookname LIKE myBookName;
    IF mycount != 0 THEN
        UPDATE Book SET price = myPrice
            WHERE bookname LIKE myBookName;
    ELSE
        INSERT INTO Book(bookid, bookname, publisher, price)
            VALUES(myBookID, myBookName, myPublisher, myPrice);
    END IF;
END;
/

EXEC BookInsertOrUpadate(15, '스포츠 즐거움', '마당과학서적', 25000);
SELECT * FROM BOOK;

EXEC BookInsertOrUpadate(15, '스포츠 즐거움', '마당과학서적', 20000);
SELECT * FROM BOOK;