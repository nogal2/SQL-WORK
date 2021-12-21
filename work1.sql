--1  EMPLOYEES Table의 모든 자료를 출력하여라.
SELECT *
FROM EMPLOYEES;

--2 EMPLOYEES Table의 컬럼들을 모두 출력하라.
DESC EMPLOYEES;

--3 EMPLOYEES Table에서 사원 번호, 이름, 급여, 담당업무를 출력하여라.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID
FROM EMPLOYEES;

--4 모든 종업원의 급여를 $300증가 시키기 위해서 덧셈 연산자를 사용하고 결과에 SALARY+300을 디스플레이 합니다.
SELECT	FIRST_NAME, SALARY+300
FROM EMPLOYEES;

--5 EMP 테이블에서 사원번호, 이름, 급여, 보너스, 보너스 금액을 출력하여라. 
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT, SALARY*COMMISSION_PCT
FROM EMPLOYEES;

--6 EMPLOYEES 테이블에서 LAST_NAME을 이름으로 SALARY을 급여로 출력하여라.
SELECT LAST_NAME 이름, SALARY 급여
FROM EMPLOYEES;

--7 EMPLOYEES 테이블에서 LAST_NAME을 Name으로 SALARY * 12를 Annual Salary(연봉)로 출력하여라
SELECT LAST_NAME "Name", SALARY*12 "Annual Salary(연봉)"
FROM EMPLOYEES;

--8 EMPLOYEES 테이블에서 이름과 업무를 연결하여 출력하여라. 
SELECT FIRST_NAME || ' ' || JOB_ID
FROM EMPLOYEES;

-- 문제9) EMPLOYEES 테이블에서 이름과 업무를 “KING is a PRESIDENT” 형식으로 출력하여라. 
SELECT FIRST_NAME || ' is a ' || JOB_ID AS 급여
FROM EMPLOYEES;

-- 문제10) EMPLOYEES 테이블에서 이름과 연봉을 “KING: 1 Year salary = 60000” 형식으로 출력하여라. 
SELECT FIRST_NAME || ': 1 Year salary = ' || salary*12 AS 연봉
FROM EMPLOYEES;

-- 문제11) EMPLOYEES 테이블에서 JOB을 모두 출력하라(중복생략).
SELECT DISTINCT JOB_ID
FROM EMPLOYEES;