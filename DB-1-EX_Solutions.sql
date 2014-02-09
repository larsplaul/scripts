--#########################################################################
--Day 1 Solutions
--#########################################################################

--### Queries on a single table #######
-- 1.1 a)
SELECT *
FROM dept;
-- 1.1 b)
SELECT empno FROM emp WHERE ename = 'MARTIN';
-- 1.1 c)
SELECT * FROM emp WHERE sal > 1500;
-- 1.1 d)
SELECT DISTINCT job FROM emp;
-- 1.1 e)
SELECT ename AS "Sales men with salary > 1300"
FROM emp
WHERE sal > 1300
AND job   = 'SALESMAN';
-- 1.1 f)
SELECT ename "Non salesmen", job FROM emp WHERE job <> 'SALESMAN';
-- 1.1 g)
SELECT ename "Name",
  sal     AS "Salary",
  sal*0.9 AS "Salary - 10%"
FROM emp
WHERE job = 'CLERK';
-- 1.1 h)
SELECT ename
FROM emp
WHERE hiredate < to_date('01-05-1981','DD MM YYYY');

--### Aggregate functions #######
-- 1.2 a)
SELECT COUNT(*) AS "Total employees"
FROM emp;
-- 1.2 b)
SELECT AVG(sal),
  SUM(sal)/COUNT(*) AS "Just for fun"
FROM emp
WHERE deptno = 20;
-- 1.2 c)
SELECT COUNT(DISTINCT job) FROM emp;
-- 1.2 d)
SELECT deptno "Department number",
  COUNT(*) "Total employees"
FROM emp
GROUP BY deptno;
-- 1.2 e)
SELECT MAX(sal),
  deptno
FROM emp
GROUP BY deptno
ORDER BY deptno DESC;

--### Joining tables #######
-- 1.3 a) Using a where clause
SELECT loc "Allens location"
FROM dept,
  emp
WHERE emp.deptno = dept.deptno
AND ename        = 'ALLEN';
-- 1.3 a) Using a specific join clause (join = inner join)
SELECT d.loc
FROM dept d
JOIN emp e
ON e.deptno = d.deptno
WHERE ename ='ALLEN';
-- 1.3 b (Could also have been done using a where clause as in 1.3a, it will still be a join)
SELECT e.ename
FROM emp e
JOIN dept d
ON e.deptno   = d.deptno
WHERE d.dname = 'SALES';
-- 1.3c (Could also have been done using a where clause as in 1.3a, it will still be a join)
SELECT MAX(sal)
FROM emp e
JOIN dept d
ON e.deptno  = d.deptno
WHERE d.dname='SALES';

--### Subqueries (with alternatives) #######
-- 1.4 a)
-- 1) Strategy find the id of Smiths manager (the inner query)
---2) Use this id to find the manager
SELECT ename AS "Smith's manager"
FROM emp
WHERE empno =
  ( SELECT mgr FROM emp WHERE ename = 'SMITH'
  );

--1.4 a) Alternative solution using a SELF join (The table is joined to with itself)
SELECT e1.ename AS "Smith's manager"
FROM emp e1
JOIN emp e2
ON e1.empno   = e2.mgr
WHERE e2.ename= 'SMITH';

-- 1.4b) (Can also be solved using a self join as in 1.4 a )
SELECT ename AS "Managed by the president"
FROM emp
WHERE mgr =
  ( SELECT empno FROM emp WHERE job = 'PRESIDENT'
  );

--1.4 c)
SELECT *
FROM emp
WHERE empno =
  (SELECT mgr
  FROM emp
  WHERE --Smith's managers manager
    empno =
    ( SELECT mgr FROM emp /*--Smiths manager*/
    WHERE ename = 'SMITH'
    )
  );
--This was fun :-) So continue and find: who is the manager of Smiths managers, manager ?
SELECT ename "S.. managers managers manager"
FROM emp
WHERE empno =
  (SELECT mgr
  FROM emp
  WHERE empno =
    (SELECT mgr
    FROM emp
    WHERE --Smith's managers manager
      empno =
      ( SELECT mgr FROM emp /*--Smiths manager*/
      WHERE ename = 'SMITH'
      )
    )
  );

--Let's continue :-) Who is the manager of Smiths managers, managers managers manager
SELECT ename, nvl(to_char(mgr),'Has no manager') "Smitms m's m's m's m"FROM emp
WHERE empno =
  (SELECT mgr
  FROM emp
  WHERE empno =
    (SELECT mgr
    FROM emp
    WHERE --Smith's managers manager
      empno =
      ( SELECT mgr FROM emp /*--Smiths manager*/
      WHERE ename = 'SMITH'
      )
    )
  );

--1.4 d)
--Strategy (from inside out)
-- 1) Find all employees who are managers
-- 2) Use this info to find all mgr's from employees who are not managers
-- 3) Use this to find the details of the managers

SELECT * -- 3) Select managers of all non-managers
FROM emp
WHERE empno IN
  (
  SELECT mgr FROM emp -- 2) Select all NON-managers
  WHERE empno NOT IN
    ( 
    SELECT e1.empno FROM emp e1 --1)Find all managers
    JOIN emp e2 ON e1.empno = e2.mgr
    )
  );

