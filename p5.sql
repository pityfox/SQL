--EX4
SELECT MAX(sal) "Max", MIN(sal) "Min", SUM(sal) "Somme", ROUND(AVG(sal)) "Moyenne"
FROM emp;

--EX5
SELECT job, MAX(sal), MIN(sal), SUM(sal), ROUND(AVG(sal))
FROM emp
GROUP BY job;

--EX6
SELECT job, COUNT(*)
FROM emp
GROuP BY job;

--EX7
SELECT COUNT(*) "N of Mgr"
FROM emp
WHERE job = 'MANAGER'
GROUP BY job;

--EX8
SELECT MAX(sal)-MIN(sal) "DIFF"
from emp
group by 'DIFF';

--EX9
SELECT mgr, MIN(sal)
from emp
WHERE mgr IS NOT NULL
GROUP BY mgr
HAVING MIN(sal) > 1000;

--EX10
SELECT d.dname, d.loc, COUNT(*), AVG(sal)
FROM emp e, dept d
WHERE e.deptno = d.deptno
GROUP BY d.dname, d.loc;

--EX11
--v1
SELECT COUNT(DISTINCT (a.empno)) total,
		COUNT(DISTINCT(b.empno)) "1980",
		COUNT(DISTINCT(c.empno)) "1981",
		COUNT(DISTINCT(d.empno)) "1982",
		COUNT(DISTINCT(e.empno)) "1983"
from emp a, emp b, emp c, emp d, emp e
WHERE EXTRACT(YEAR FROM b.hiredate) = 1980
AND	EXTRACT(YEAR FROM c.hiredate) = 1981
AND EXTRACT(YEAR FROM d.hiredate) = 1982
AND	EXTRACT(YEAR FROM e.hiredate) = 1983;

--v2
SELECT COUNT(*) total,
		SUM(DECODE(TO_CHAR(hiredate, 'YYYY'), 1980, 1, 0)) "1980",
		SUM(DECODE(TO_CHAR(hiredate, 'YYYY'), 1981, 1, 0)) "1981",
		SUM(DECODE(TO_CHAR(hiredate, 'YYYY'), 1982, 1, 0)) "1982",
		SUM(DECODE(TO_CHAR(hiredate, 'YYYY'), 1983, 1, 0)) "1983"
FROM emp;

--EX12
SELECT job,
		SUM(DECODE(deptno, 10, sal, 0)) "Dept 10",
		SUM(DECODE(deptno, 20, sal, 0)) "Dept 20",
		SUM(DECODE(deptno, 30, sal, 0)) "Dept 30",
		SUM(sal) "TOTAL"
FROM emp
GROUP BY job;