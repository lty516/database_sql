#join
#SELECT * FROM emp,dept;

#use testdb;
#CREATE TABLE tblA(		
#		id int, 
#		value int
#		);

#		CREATE TABLE tblB(		
#			id int, 
#			value int
#		);
		
INSERT INTO tblA vALues(1,10);
INSERT INTO tblA vALues(2,20);
INSERT INTO tbla vALues(3,30);
INSERT INTO tblA vALues(5,50);
INSERT INTO tblA vALues(7,70);

INSERT INTO tblB vALues(1,10);
INSERT INTO tblB vALues(2,20);
INSERT INTO tblB vALues(4,40);
INSERT INTO tblB vALues(5,50);
INSERT INTO tblB vALues(8,80);	

SELECT * FROM tblA;	
SELECT * FROM tblb;	

SELECT tblA.id, tblA.value FROM tblA INNER JOIN tblb ON tbla.id= tblB.id;
SELECT a.id, b.value 
		FROM tblA a ,tblb  b WHERE a.id= b.id; 

/* 직원의 사번, 이름, 업무, 부서번호, 부서명 조회 */

SELECT empno, ename, job, emp.deptno, dname FROM emp INNER JOIN dept ON emp.DEPTNO = dept.DEPTNO;

/* salesman의 사번, 이름, 업무, 부서번호, 부서명 조회 */

SELECT empno, ename, job, emp.deptno, dname FROM emp INNER JOIN dept ON emp.DEPTNO = dept.DEPTNO AND job='salesman';


/* Newyork 에서 근무하는 직원의  사번, 이름, 업무, 부서번호, 부서명 조회 */

SELECT empno, ename, job, emp.deptno, dname FROM emp INNER JOIN dept ON emp.DEPTNO = dept.DEPTNO AND LOC='New york';

SELECT a.id, b.value 
			FROM tblA as a LEFT OUTER JOIN tblb as b ON a.id= b.id;
			
SELECT ename, sal, dname, LOC FROM emp RIGHT OUTER JOIN dept ON emp.deptno =dept.DEPTNO;


SHOW TABLES;
SELECT * FROM salgrade;


SELECT empno, ename,job, sal, grade FROM emp INNER JOIN salgrade
			ON emp.sal >= salgrade.losal AND emp.sal<= salgrade.hisal;
			
			
SELECT e1.empno, e1.ename, e1.job, e1.mgr, e2.ename 'mgrname' FROM emp e1 INNER JOIN emp e2 ON e1.mgr=e2.empno;


CREATE TABLE tblC(		
			id int, 
			value int
		);
		
		
		INSERT INTO tblC VALUES(1,10);
		INSERT INTO tblC VALUES(2,20);
		INSERT INTO tblC VALUES(7,70);	
		INSERT INTO tblC VALUES(8,80);
		INSERT INTO tblC VALUES(9,90);
		
SELECT * FROM tblC; 		
		
		
		
		SELECT tblA.id, tblB.value, tblC.value
				FROM tblA INNER JOIN tblB
				ON tblA.id=tblB.id
				INNER JOIN tblC
				ON tblB.id=tblC.id;





