--Q01.
SELECT NAME 이름, SAL 급여 FROM MEMBER
WHERE SAL NOT BETWEEN 14000 AND 30000;
/*
SELECT * FROM [테이블명]
WHERE [컬럼명] (NOT) BETWEEN 값1 AND 값2;
*/

--Q02.
SELECT MEMBER_ID 사번, NAME 이름, SAL 급여, SAL*1.2 "20% 인상한 급여" FROM MEMBER;
/*컬럼 자체에 사칙연산 가능*/

--Q03.
SELECT NAME 이름, MONTHS_BETWEEN(SYSDATE, HIRE) "근무 달수" FROM MEMBER;
/* 
MONTHS_BETWEEN 함수는 date1과 date2 사이의 월을 계산한다. 
만약 date1이 date2 일자 후라면, 결과값은 양의 값이 반환된다. 
만약 date1이 date2 보다 빠르다면, 결과값은 음의 값이 반환된다. 
*/

--Q04.
SELECT NAME 이름, ROUND(MONTHS_BETWEEN(SYSDATE, HIRE),2) "근무 달수" FROM MEMBER;
/* 
- 함수 : ROUND("값", "자리수")
반올림 해서 "자리수"까지 남긴다.
양수면 소수점을, 음수면 정수를 반올림한다.
*/

--Q05.
SELECT NAME 이름, LPAD(SAL, 10, '#') 급여 FROM MEMBER;
/*
숫자형 문자인 경우 문자길이를 똑같이 맞춰야하는 경우가 있다. 
LPAD는 왼쪽, RPAD는 오른쪽부터 총길이 만큼 지정한 문자를 채운다.
LPAD ex)1, 10, 123 -> 00001, 00010, 00123

LPAD 함수는 지정한 길이 만큼 왼쪽부터 특정문자로 채워준다.
- 함수 : LPAD("값", "총 문자길이", "채움문자")
*/

--Q06.
SELECT MEMBER_ID 사번,NAME 이름, HIRE 입사일, 
TO_CHAR(ADD_MONTHS(HIRE, 10), 'YYYY-MM-DD') "입사 후 10달" FROM MEMBER;
/*
- 함수 : ADD_MONTHS(date, integer)
매개변수로 들어온 date에 integer 값 만큼의 월을 더한 날짜를 반환해 주는 함수

- 함수 : TO_CHAR()
날짜, 숫자 등의 값을 문자열로 변환하는 함수
날짜 포맷 변경 (YYYY-MM-DD)
*/

--Q07.
SELECT NAME 이름, HIRE 입사일, TO_CHAR(HIRE, 'DAY') "입사한 요일" FROM MEMBER
ORDER BY TO_CHAR(HIRE-1, 'D');
/*
날짜의 요일 반환
SELECT TO_CHAR(SYSDATE, 'D')   --5 : 1(일)~7(토)
     , TO_CHAR(SYSDATE, 'DY')  --목
     , TO_CHAR(SYSDATE, 'DAY') --목요일
  FROM dual
*/

--Q08.
SELECT NAME 이름, JIKWI 직위, 
DECODE(JIKWI, '사장', 'A', '부장', 'B', '과장', 'C', '대리', 'D', '사원', 'E') 
FROM MEMBER;
/*
if-else 문과 비슷한 기능을 수행
ex) DECODE(컬럼, 조건1, 결과1, 조건2, 결과2, 조건3, 결과3..........)
*/

--Q09.
SELECT NAME 이름, SAL*12+NVL(BONUS,0) 연봉 FROM MEMBER;
/* 
NVL 함수는 값이 NULL인 경우 지정값을 출력하고, NULL이 아니면 원래 값을 그대로 출력한다.
- 함수  :  NVL("값", "지정값")
*/

--Q10.
SELECT MEMBER_ID 사번, NAME 이름 FROM MEMBER
WHERE TO_CHAR(HIRE,'YYYY') = '2004';

--Q11.
SELECT NAME 이름, JIKWI 직위 FROM MEMBER
WHERE MGR IS NULL;
/*
필드 값이 NULL 인 데이터를 조회 하기 위해서는,
fields = NULL 이 아니라
fields IS NULL 을 사용해야 합니다.
*/

--Q12.
SELECT NAME 이름, SAL 급여, BONUS 보너스 FROM MEMBER
WHERE BONUS IS NOT NULL
ORDER BY BONUS DESC;



