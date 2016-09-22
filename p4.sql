-- PART 4
-- EX1
SELECT e.ename, e.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;

-- EX2
SELECT DISTINCT e.job, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND e.deptno = 30;

--EX3
SELECT e.ename, d.dname, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND e.comm
IS NOT NULL;

--EX4
SELECT e.ename, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND e.ename
LIKE '%A%';

--EX5
SELECT e.ename, e.job, e.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND d.loc = 'DALLAS';

--EX6
SELECT e.ename "Employee", e.empno "Emp#", m.ename "Manager", m.empno "Mgr#"
FROM emp e, emp m
WHERE e.mgr = m.empno;

--EX7
SELECT e.ename "Employee", e.empno "Emp#", m.ename "Manager", e.mgr "Mgr#"
FROM emp e, emp m
WHERE e.mgr = m.empno(+);

--EX8
SELECT e.deptno department, e.ename employee, c.ename colleague
FROM emp e, emp c
WHERE e.deptno = c.deptno
AND e.ename != c.ename
ORDER BY e.deptno, e.ename;

--EX9
DESC salgrade;
SELECT e.ename, e.job, d.dname, e.sal, s.grade
FROM emp e, dept d, salgrade s
WHERE e.deptno = d.deptno
AND e.sal
BETWEEN s.losal
AND s.hisal;

--EX10
--v1 imbrquation
SELECT e.ename, e.hiredate
FROM emp e
WHERE e.hiredate < (
		SELECT b.hiredate
		FROM emp b
		WHERE b.ename='BLAKE')
;

--v2 fake table
SELECT e.ename, e.hiredate
FROM emp e, emp blake
WHERE blake.ename = 'BLAKE'
AND e.hiredate < blake.hiredate;

--EX11
SELECT e.ename "Employee", e.hiredate "Emp Hiredate", m.ename "Manager", m.hiredate "Mgr Hiredate"
FROM emp e, emp m
WHERE e.mgr = m.empno
AND e.hiredate < m.hiredate;

--EX12
SELECT RPAD(e.ename, 10, ' ')||RPAD(' ', e.sal/100, '*') "Employee and their Salaries"
FROM emp e
ORDER BY e.sal DESC;