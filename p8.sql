--EX1
SELECT ename, deptno, sal
FROM emp
WHERE (deptno, sal) IN (
					SELECT deptno, sal
					FROM emp
					WHERE comm IS NOT NULL
					);
					
--EX2
