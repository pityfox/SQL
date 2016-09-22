--EX1
-- Soustraction des resultats d'une requete
SELECT d.deptno, d.dname
from dept d
MINUS
SELECT d.deptno, d.dname
FROM emp e, dept d
WHERE d.deptno = e.deptno;

--EX2
--v1 nul
SELECT DISTINCT job
FROM emp
WHERE job IN (
			SELECT job
			FROM emp
			WHERE EXTRACT(YEAR FROM hiredate) = 1982
			AND TO_CHAR(hiredate, 'MM') > 6
			)
AND EXTRACT(YEAR FROM hiredate) = 1981
AND TO_CHAR(hiredate, 'MM') > 6;

--v2 INTERSECTION entre 2 requetes
SELECT DISTINCT job
FROM emp
WHERE hiredate BETWEEN '01-06-1981' AND '30-12-1981'
INTERSECT
SELECT DISTINCT job
FROM emp
WHERE hiredate BETWEEN '01-06-1982' AND '30-12-1982';

