

1. 각 직원들에 대해 그들의 관리자(직속상사)보다 먼저 입사한 직원의 이름, 입사일, 관리자 이름, 관리자 입사일 조회
SELECT e1.ename,e1.hiredate,e2.ename'mgrname',e2.hiredate'mgrhiredate' 
FROM emp e1 INNER JOIN emp e2 ON e1.mgr=e2.empno AND e1.HIREDATE< e2.HIREDATE;

2. 말단 사원의 사번, 이름, 업무, 부서번호, 근무지를 조회

SELECT distinct empno, ename, job,hiredate, emp.deptno,dept.LOC FROM emp INNER JOIN dept 
ON  emp.deptno=dept.DEPTNO AND empno IN (SELECT e1.empno FROM emp e1 WHERE NOT EXISTS(SELECT e2.mgr FROM emp e2 WHERE e1.empno=e2.mgr)) ORDER BY hiredate DESC LIMIT 1 ;

SELECT distinct empno, ename, job,hiredate, emp.deptno,dept.LOC FROM emp INNER JOIN dept 
ON  emp.deptno=dept.DEPTNO WHERE EMPNO NOT IN (SELECT COALESCE(mgr,0) FROM emp) ORDER BY hiredate DESC LIMIT 1;

SELECT empno, ename, job, e.deptno, loc 
FROM emp e JOIN dept d 
ON e.deptno = d.deptno 
WHERE e.empno not in (SELECT e.mgr FROM emp)
ORDER BY hiredate DESC limit 1

#SELECT e1.empno FROM emp e1 WHERE NOT EXISTS(SELECT e2.mgr FROM emp e2 WHERE e1.empno=e2.mgr);



CREATE TABLE tblBook(
author	varchar(20) not null,
title	varchar(20)
);

INSERT INTO tblBook VALUES('최주현', '하늘과 땅');
INSERT INTO tblBook VALUES('최주현', '바다');
INSERT INTO tblBook VALUES('유은정', '바다');
INSERT INTO tblBook VALUES('박성우', '문');
INSERT INTO tblBook VALUES('최주현', '문');
INSERT INTO tblBook VALUES('박성우', '천국');
INSERT INTO tblBook VALUES('최지은', '천국');
INSERT INTO tblBook VALUES('최주현', '천국');
INSERT INTO tblBook VALUES('박성우', '고슴도치');
INSERT INTO tblBook VALUES('서금동', '나');

3. 한 권의 책에 대해 두 명 이상의 작가가 쓴 책을 검색
책이름	작가명	작가명

SELECT  b1.title, b1.author, b2.author 
FROM tblBOOK b1 INNER JOIN tblBOOK b2 ON  b1.title=b2.title AND b1.author < b2.author ;

4. 한 권의 책에 대해 세명의 작가가 쓴 책을 검색
책이름	작가명	작가명	작가명
SELECT  b1.title, b1.author, b2.author , b3.author 
FROM tblBOOK b1 INNER JOIN tblBOOK b2 ON  b1.title=b2.title INNER JOIN tblBOOK b3 
ON  b2.title=b3.title AND b1.author < b2.author AND b2.author <b3.author;

