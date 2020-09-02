
CREATE TABLE tbltest(
		id	int		null,
		name	varchar(10),		
		regdate	datetime
	);

INSERT INTO tbltest(id,name) values(1,'hong');
		INSERT INTO tbltest(name,regdate) values('kim',now());
		INSERT INTO tbltest values(2,'lee','2020-5-5');
		INSERT INTO tbltest(id,name) values(3,'홍길동');
		
		
SELECT * FROM tbltest;		

UPDATE tbltest
		SET regdate='2020-1-1', name='tom'
		WHERE id=3;
		
SELECT * FROM tbltest;		

SELECT empno, ename, job, sal FROM  emp 
WHERE job =(SELECT job FROM  emp WHERE  empno=7521) 
and sal>(SELECT sal FROM  emp WHERE  empno=7934);

SELECT  ename, deptno, job, hiredate FROM  emp WHERE  hiredate=(SELECT  MAX(hiredate) FROM  emp);

SELECT DISTINCT  job, min(sal) FROM emp group by job;

SELECT empno, ename, deptno FROM emp WHERE sal IN(SELECT MIN(sal) FROM emp GROUP  BY  job);

SELECT empno, ename, deptno FROM emp WHERE sal >3000 OR sal>800 OR sal>2450 OR sal>5000 OR sal> 1250;

SELECT empno, ename, deptno FROM emp WHERE sal > ANY (SELECT MIN(sal) FROM emp GROUP BY job);

SELECT job, Max(sal) FROM emp GROUP BY job;

SELECT empno, ename, deptno,sal FROM emp WHERE sal >= All (SELECT Max(sal) FROM emp GROUP BY job);

SELECT sal, comm FROM emp WHERE ename='miller'; 

UPDATE emp SET sal=1500,comm=300 WHERE ename='miller';

SELECT sal, comm FROM emp WHERE ename='miller';

SELECT sal,comm FROM emp WHERE deptno=30;

SELECT deptno, sal, comm FROM emp WHERE sal IN (SELECT sal FROM emp WHERE deptno=30) AND comm IN (SELECT comm FROM emp WHERE deptno=30);

SELECT deptno, sal, comm,ename FROM emp WHERE (sal,comm) IN (SELECT sal,comm FROM emp WHERE deptno=30) ;

SELECT deptno, sal, comm FROM emp 
		WHERE (sal,comm) IN (SELECT sal,comm FROM emp WHERE deptno=30 or comm IS NULL ) ;
		
SELECT empno, ename, deptno, sal, comm FROM emp
WHERE (sal, coalesce(comm, 0)) IN (SELECT sal,  coalesce(comm,0) FROM emp WHERE deptno = 30);		

UPDATE emp
SET sal = 1300, comm = NULL
WHERE ename = 'miller';

SELECT * FROM emp WHERE deptno=30;
SELECT * FROM (SELECT * FROM emp WHERE deptno=30) as t;

CREATE TABLE tbltest(
		id	int		null,
		name	varchar(10),		
		regdate	datetime
	);
	
INSERT INTO tbltest(id,name) SELECT empno, ename FROM emp;	

SELECT * FROM tbltest;

DELETE FROM tbltest;

SELECT * FROM tbltest;

INSERT INTO tbltest(id,name) SELECT empno, ename FROM emp LIMIT 5;	
SELECT * FROM tbltest;

SELECT ename, job,hiredate,deptno  FROM emp WHERE empno IN(SELECT mgr FROM emp);

SELECT ename, job,hiredate,deptno  FROM emp AS e1 
WHERE exists(SELECT * FROM emp AS e2 WHERE e1.empno=e2.mgr);


SELECT * FROM tbltest;
