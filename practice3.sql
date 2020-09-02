USE testdb;

#1. Blake와 같은 부서에 있는 모든 직원의 사번, 이름, 입사일자 조회
SELECT deptno, ename, hiredate FROM emp WHERE deptno = (SELECT deptno FROM emp WHERE ename='Blake');


#2. 평균 급여 이상을 받는 직원들의  사번, 이름을 조회. 단, 급여가 많은 순으로 정렬
SELECT empno, ename FROM emp
WHERE sal >=  (SELECT avg(sal) FROM emp) order by sal DESC;


#3. 이름에 T자가 들어가는 직원이 근무하는 부서에서 근무하는 직원의 사번,이름, 급여 조회

SELECT empno,ename,sal FROM emp WHERE deptno IN (SELECT deptno FROM emp WHERE ename LIKE '%T%') ;

#4. 부서의 위치가 dallas인 모든 직원에 대해 사번, 이름, 급여, 업무조회

SELECT  distinct empno,ename,sal,job FROM emp,dept WHERE emp.deptno = (SELECT deptno FROM dept WHERE LOC= 'dallas'); 

#5. King에게 보고하는 모든 직원의 이름과 부서, 업무, 급여를 조회
SELECT ename, deptno, job, sal FROM emp WHERE mgr = (SELECT EMPNO FROM emp WHERE ename ='KING');

#6. 급여가 30번 부서의 최저급여보다 높은 직원의 사번, 이름, 급여 조회

SELECT empno, ename,sal FROM emp WHERE sal > (SELECT MIN(sal) FROM emp WHERE deptno=30);


#7. 10번부서에서 30번 부서의 직원과 같은 업무를 하는 직원의 이름과 업무를 조회

SELECT ename,job FROM emp WHERE job IN(SELECT job FROM emp WHERE deptno=30) AND deptno=10;


