SHOW DATABASES;
USE testdb;
SHOW TABLES;
SELECT * FROM emp;

#1. 오늘부터 12월 25일까지 몇일이 남았는가?
SELECT DATEDIFF('2020-12-25',NOW());

#2. 현재까지 근무한 직원들의 근무일수를 몇주 몇일로 조회.(단, 근무일수가 많은 사람 순으로 조회)
SELECT ename,deptno, truncate(DATEDIFF(NOW(),hiredate)/7,0) AS "주", MOD(DATEDIFF(NOW(),hiredate), 7) as'일' FROM emp ORDER BY DATEDIFF(NOW(),hiredate) DESC; 

#3.  10번 부서 직원들 중 현재까지의 근무월수를 계산해서 조회
SELECT ename,deptno, TIMESTAMPDIFF(month,hiredate,NOW()) AS '현재까지 근무일수' FROM emp WHERE deptno =10;

#4. 20번 부서 직원들 중 입사일자로부터 13개월이 지난 후의 날짜를 조회
SELECT ename,deptno,DATE(DATE_ADD(hiredate, INTERVAL 13 MONTH)) AS '13개월 지난 후의 날짜'  FROM emp WHERE deptno=20;

#5. 모든 직원에 대해 입사한 달의 근무일수를 조회
SELECT ename, DATEDIFF(LAST_DAY(hiredate), hiredate)+1 AS workdays FROM emp;


#6. 현재 급여에 15%가 증가된 급여를 계산하여 사번,이름, 급여, 증가된 급여를 조회(단, 급여는 반올림하여 적용한다.)
SELECT empno, ename, sal, round(sal*1.15) FROM emp;

#7. 이름, 입사일, 입사일로부터 현재까지의 월수, 급여,급여 총계를 조회
SELECT ename, hiredate, TIMESTAMPDIFF(MONTH,hiredate,NOW()) AS '입사일로부터 현재까지 월수',sal, (select SUM(sal) FROM emp) FROM emp;

#8. 업무가 analyst이면 급여를 10%증가시키고 clerk이면 15%, manager이면 20%증가 시켜서 이름, 업무, 급여, 증가된 급여를 조회
SELECT ename, job, sal,
CASE
	WHEN job = 'analyst' then sal*1.1
 	when job= 'clerk' then sal*1.15
 	when job='manager' then sal*1.2
 ELSE sal
 END AS '증가된 급여'
FROM emp; 

#9. 이름의 첫글자가 k보다 크고 y보다 작은 직원의 이름, 부서, 업무를 조회하시오.
SELECT ename, deptno, job FROM emp WHERE ASCII('K') < ASCII(LEFT(ename,1)) AND ASCII(LEFT(ename,1)) < ASCII('Y');