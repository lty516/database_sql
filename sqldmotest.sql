USE testdb;

CREATE TABLE student(
sno INT(4) PRIMARY KEY ,
sname VARCHAR(4),
address VARCHAR(4),
score INT(2),
dept INT(3));

INSERT INTO student VALUES(9801,'홍길동','서울',80,100);
INSERT INTO student VALUES(9802,'김철수','대전',90,200);
INSERT INTO student VALUES(9803,'이순자','강릉',90,100);
INSERT INTO student VALUES(9805,'이원영','부산',95,200);
INSERT INTO student VALUES(9806,'홍남순','서울',65,300);


CREATE TABLE department(
dno INT(3) PRIMARY KEY ,
dname VARCHAR(4),
manager VARCHAR(4)
);

INSERT INTO department VALUES(100,'정통','이순신');
INSERT INTO department VALUES(200,'전자','강감찬');
INSERT INTO department VALUES(300,'기계','김유신');

ALTER TABLE student ADD CONSTRAINT fk_dno FOREIGN KEY(dept) REFERENCES department(dno);

SELECT * FROM student s, department d WHERE s.dept>100;