SHOW DATABASES;

USE testdb;

SHOW TABLES;

SELECT * FROM emp;

#1. 1981년에 입사한 사람의 이름, 업무, 입사일자 조회
SELECT ename, job, hiredate FROM emp WHERE hiredate BETWEEN '1981-01-01' AND '1981-12-31'
SELECT ename, job, hiredate FROM emp WHERE hiredate LIKE '1981%';

#2. 사번이 7902, 7788, 7566인 사원의 이름, 업무, 급여,입사일자 조회
SELECT ename, job, sal, hiredate FROM emp
WHERE empno in(7902, 7788,7566);

#3. 업무가 manager, clerk, analyst가 아닌 직원의 이름, 업무, 급여, 부서번호 조회
SELECT ename, job, sal, deptno FROM emp WHERE job IN ('SALESMAN', 'PRESIDENT');
SELECT ename, job, sal, deptno FROM emp WHERE job NOT IN('manager', 'clerk', 'analyst');
SELECT ename, job, sal, deptno FROM emp WHERE job!='manager' AND  job!='clerk'AND job!='analyst');




##4. 업무가 president 또는 salesman이고 급여가 1500인 직원의 이름, 급여, 업무, 부서번호 조회

SELECT ename, job, sal, deptno FROM emp WHERE (job='president' OR job='salesman') AND sal=1500;

###5. 가장 최근에 입사한 직원의 이름, 부서, 업무, 입사일자
조회(현재 검색 일자가 1987년이라 가정한다.)

#where문에 hiredate=max(hiredate) 를 넣으면 단일 행과 다중행의 비교가 되므로 문법 상 맞지 않다.
SELECT ename, deptno, job, hiredate FROM emp ORDER BY hiredate DESC LIMIT 1; 




###6. 같은 부서내에서 같은 업무를 하는 직원의 급여가 많은 순으로 조회
SELECT * FROM emp ORDER BY deptno, job, sal DESC;

# 7. 커미션이 급여보다 10%이상 많은 직원의 급여가 많은 순으로 조회
SELECT * FROM emp WHERE comm>sal*1.1 order by sal;

#8. 이름에 L자가 2개 있고 30번 부서이거나 직속상사가 7782인 직원의 이름, 부서, 직속상사 조회
SELECT ename, deptno, mgr FROM emp WHERE (ename LIKE '%L%L%' and deptno=30) OR mgr=7782;



#업무가 salesman인 직원들의 급여 평균, 최고 급여, 최저 급여, 합계급여를 조회
SELECT avg(sal), max(sal), min(sal), sum(sal) FROM emp WHERE job='salesman';

#총 직원수 
SELECT count(ename) FROM emp;
SELECT COUNT(*) FROM emp;

#업무가 SALESMAN이면 '커미션 있음' 이라고 출력, 그 외는 '커미션 없음' 출력
SELECT *, 
	CASE
		WHEN job='salesman' THEN "커미션 있음"
 		ELSE "커미션 없음"
 	END
FROM emp; 	

