CREATE TABLE tblExam(
			 id int,
			 name VARCHAR(10)
		);
		
INSERT INTO tblExam values(1,'홍길동');
		INSERT INTO tblExam values(1,'홍길동');		

DELETE FROM tblExam;

ALTER TABLE tblExam ADD CONSTRAINT pk_id PRIMARY KEY(id);

INSERT INTO tblExam values(1,'홍길동');

SELECT * FROM tblExam;

DROP TABLE tblexam;


CREATE TABLE tblExam(
			 id INT PRIMARY KEY,
			 name VARCHAR(10)
		);
		
DROP TABLE tblExam;	


			CREATE TABLE tblExam(
			 id INT,
			 name VARCHAR(10),
			CONSTRAINT pk_id PRIMARY KEY(id,name)
			);	
			
			
ALTER TABLE tblExam DROP PRIMARY KEY;			

DESC tblexam;	

ALTER TABLE tblExam MODIFY id int not null;
DESC tblexam;	
			
ALTER TABLE tblExam MODIFY name varchar(20)  null;	
			
			
DESC tblexam;	
			
			
ALTER TABLE tblexam ADD age INT;		

DESC tblexam;		


ALTER TABLE tblExam ADD CONSTRAINT pk_id PRIMARY KEY(id);
				ALTER TABLE tblExam ADD CONSTRAINT uk_name UNIQUE(name);
				ALTER TABLE tblExam ADD CONSTRAINT uk_age UNIQUE(age);
				
DESC tblexam;				



INSERT INTO tblExam(id, name) VALUES(1, ‘hong’);
I				INSERT INTO tblExam(id, name) VALUES(2, ‘hong’);		


DROP TABLE tblexam;

CREATE TABLE tblexam(id INT, name VARCHAR(10) default '무명씨' ,
					age INT default 0);

INSERT INTO tblexam(id) VALUES(1);
INSERT INTO tblexam(id, name) VALUES(1, "hong");



DROP TABLE tblexam;


CREATE TABLE tblExam(
id INT auto_increment PRIMARY KEY,
name char(10),
age int
);	

INSERT INTO tblexam(name, age) VALUES('hong', 20)	;
INSERT INTO tblexam(name, age) VALUES('hong', 21);	
INSERT INTO tblexam(name) VALUES("lee");



testdbCREATE TABLE tbldept(
						deptno int,
						dname varchar(10)
					);

					INSERT INTO tbldept VALUES(1000,'Sales');
					INSERT INTO tbldept VALUES(1001,'Research');



CREATE TABLE tbldept(
						deptno int ,
						dname varchar(10)
					);

					INSERT INTO tbldept VALUES(1000,'Sales');
					INSERT INTO tbldept VALUES(1001,'Research');

					CREATE TABLE tblemp(
						empno int,
						ename varchar(10),
						hiredate	datetime,
						deptno int
					);
					ALTER TABLE tbldept ADD CONSTRAINT pk_deptno PRIMARY KEY(deptno);

					ALTER TABLE tblemp ADD CONSTRAINT fk_deptno FOREIGN KEY(deptno)
					REFERENCES tbldept(deptno);
				

					INSERT INTO  tblemp(empno,ename,hiredate,deptno) 
					VALUES(1,'hong',now(),1001);
					
				UPDATE tbldept
					SET deptno=10000			
					WHERE deptno=1000; 
					
					
					CREATE VIEW vw_emp1
	AS
	SELECT  empno, ename, sal, comm, dname FROM emp JOIN dept ON emp.deptno=dept.deptno
	WHERE sal>=1500;

	SELECT * FROM vw_emp1;
	
	
DROP TABLE 	 tblindex;
CREATE TABLE tblindex(
		id int,
		name VARCHAR(10),
		point float
	);
	
	
	
	INSERT INTO tblindex VALUES(5,'scott',9.8);

	INSERT INTO tblindex VALUES(2,'adam',4.2);

	INSERT INTO tblindex VALUES(7,'john',6.7);

	INSERT INTO tblindex VALUES(1,'tom',5);
	
	
	EXPLAIN SELECT * FROM  tblindex WHERE point>=4;
	
	
	CREATE INDEX idx_point ON tblindex(point);
	
		EXPLAIN SELECT * FROM  tblindex WHERE point>=4;
		
			EXPLAIN SELECT * FROM  tblindex WHERE id =2;
			
			ALTER TABLE tblindex ADD CONSTRAINT pk_id PRIMARY  KEY(id);
			
			EXPLAIN SELECT * FROM  tblindex WHERE id =2;
			
			DESC tblindex;
	
