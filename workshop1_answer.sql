--Q01.
SELECT NAME �̸�, SAL �޿� FROM MEMBER
WHERE SAL NOT BETWEEN 14000 AND 30000;
/*
SELECT * FROM [���̺��]
WHERE [�÷���] (NOT) BETWEEN ��1 AND ��2;
*/

--Q02.
SELECT MEMBER_ID ���, NAME �̸�, SAL �޿�, SAL*1.2 "20% �λ��� �޿�" FROM MEMBER;
/*�÷� ��ü�� ��Ģ���� ����*/

--Q03.
SELECT NAME �̸�, MONTHS_BETWEEN(SYSDATE, HIRE) "�ٹ� �޼�" FROM MEMBER;
/* 
MONTHS_BETWEEN �Լ��� date1�� date2 ������ ���� ����Ѵ�. 
���� date1�� date2 ���� �Ķ��, ������� ���� ���� ��ȯ�ȴ�. 
���� date1�� date2 ���� �����ٸ�, ������� ���� ���� ��ȯ�ȴ�. 
*/

--Q04.
SELECT NAME �̸�, ROUND(MONTHS_BETWEEN(SYSDATE, HIRE),2) "�ٹ� �޼�" FROM MEMBER;
/* 
- �Լ� : ROUND("��", "�ڸ���")
�ݿø� �ؼ� "�ڸ���"���� �����.
����� �Ҽ�����, ������ ������ �ݿø��Ѵ�.
*/

--Q05.
SELECT NAME �̸�, LPAD(SAL, 10, '#') �޿� FROM MEMBER;
/*
������ ������ ��� ���ڱ��̸� �Ȱ��� ������ϴ� ��찡 �ִ�. 
LPAD�� ����, RPAD�� �����ʺ��� �ѱ��� ��ŭ ������ ���ڸ� ä���.
LPAD ex)1, 10, 123 -> 00001, 00010, 00123

LPAD �Լ��� ������ ���� ��ŭ ���ʺ��� Ư�����ڷ� ä���ش�.
- �Լ� : LPAD("��", "�� ���ڱ���", "ä����")
*/

--Q06.
SELECT MEMBER_ID ���,NAME �̸�, HIRE �Ի���, 
TO_CHAR(ADD_MONTHS(HIRE, 10), 'YYYY-MM-DD') "�Ի� �� 10��" FROM MEMBER;
/*
- �Լ� : ADD_MONTHS(date, integer)
�Ű������� ���� date�� integer �� ��ŭ�� ���� ���� ��¥�� ��ȯ�� �ִ� �Լ�

- �Լ� : TO_CHAR()
��¥, ���� ���� ���� ���ڿ��� ��ȯ�ϴ� �Լ�
��¥ ���� ���� (YYYY-MM-DD)
*/

--Q07.
SELECT NAME �̸�, HIRE �Ի���, TO_CHAR(HIRE, 'DAY') "�Ի��� ����" FROM MEMBER
ORDER BY TO_CHAR(HIRE-1, 'D');
/*
��¥�� ���� ��ȯ
SELECT TO_CHAR(SYSDATE, 'D')   --5 : 1(��)~7(��)
     , TO_CHAR(SYSDATE, 'DY')  --��
     , TO_CHAR(SYSDATE, 'DAY') --�����
  FROM dual
*/

--Q08.
SELECT NAME �̸�, JIKWI ����, 
DECODE(JIKWI, '����', 'A', '����', 'B', '����', 'C', '�븮', 'D', '���', 'E') 
FROM MEMBER;
/*
if-else ���� ����� ����� ����
ex) DECODE(�÷�, ����1, ���1, ����2, ���2, ����3, ���3..........)
*/

--Q09.
SELECT NAME �̸�, SAL*12+NVL(BONUS,0) ���� FROM MEMBER;
/* 
NVL �Լ��� ���� NULL�� ��� �������� ����ϰ�, NULL�� �ƴϸ� ���� ���� �״�� ����Ѵ�.
- �Լ�  :  NVL("��", "������")
*/

--Q10.
SELECT MEMBER_ID ���, NAME �̸� FROM MEMBER
WHERE TO_CHAR(HIRE,'YYYY') = '2004';

--Q11.
SELECT NAME �̸�, JIKWI ���� FROM MEMBER
WHERE MGR IS NULL;
/*
�ʵ� ���� NULL �� �����͸� ��ȸ �ϱ� ���ؼ���,
fields = NULL �� �ƴ϶�
fields IS NULL �� ����ؾ� �մϴ�.
*/

--Q12.
SELECT NAME �̸�, SAL �޿�, BONUS ���ʽ� FROM MEMBER
WHERE BONUS IS NOT NULL
ORDER BY BONUS DESC;



