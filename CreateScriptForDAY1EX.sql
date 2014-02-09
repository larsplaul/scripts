DROP TABLE EMP;
DROP TABLE DEPT;

CREATE TABLE DEPT (	
	DEPTNO NUMBER, 
	DNAME VARCHAR2(30), 
	LOC VARCHAR2(30), 
	PRIMARY KEY (DEPTNO)
);
 


CREATE TABLE EMP(	
	EMPNO NUMBER, 
	ENAME VARCHAR2(30), 
	JOB VARCHAR2(30), 
	MGR NUMBER, 
	HIREDATE DATE, 
	SAL NUMBER, 
	COMM NUMBER, 
	DEPTNO NUMBER, 
	PRIMARY KEY (EMPNO),
	FOREIGN KEY (DEPTNO) REFERENCES DEPT
);
 

Insert into DEPT (DEPTNO,DNAME,LOC) values (10,'ACCOUNTING','NEW YORK');
Insert into DEPT (DEPTNO,DNAME,LOC) values (20,'RESEARCH','DALLAS');
Insert into DEPT (DEPTNO,DNAME,LOC) values (30,'SALES','CHICAGO');
Insert into DEPT (DEPTNO,DNAME,LOC) values (40,'OPERATIONS','BOSTON');

insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7369,'SMITH','CLERK',7902,     to_date('1980-12-17', 'YYYY MM DD') ,800,null,20);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7499,'ALLEN','SALESMAN',7698,  to_date('1981-02-20', 'YYYY MM DD') ,1600,300,30);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7521,'WARD','SALESMAN',7698,   to_date('1981-02-22', 'YYYY MM DD') ,1250,500,30);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7566,'JONES','MANAGER',7839,   to_date('1981-04-02', 'YYYY MM DD') ,2975,null,20);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7654,'MARTIN','SALESMAN',7698, to_date('1981-09-28', 'YYYY MM DD') ,1250,1400,30);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7698,'BLAKE','MANAGER',7839,   to_date('1981-05-01', 'YYYY MM DD') ,2850,null,30);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7782,'CLARK','MANAGER',7839,   to_date('1981-06-09', 'YYYY MM DD') ,2450,null,10);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7788,'SCOTT','ANALYST',7566,   to_date('1987-04-19', 'YYYY MM DD') ,3000,null,20);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7839,'KING','PRESIDENT',null,  to_date('1981-11-17', 'YYYY MM DD') ,5000,null,10);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7844,'TURNER','SALESMAN',7698, to_date('1981-09-08', 'YYYY MM DD') ,1500,0,30);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7876,'ADAMS','CLERK',7788,     to_date('1987-05-23', 'YYYY MM DD') ,1100,null,20);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7900,'JAMES','CLERK',7698,     to_date('1981-12-03', 'YYYY MM DD') ,950,null,30);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7902,'FORD','ANALYST',7566,    to_date('1981-12-03', 'YYYY MM DD') ,3000,null,20);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7934,'MILLER','CLERK',7782,    to_date('1982-01-23', 'YYYY MM DD') ,1300,null,10);

commit;
