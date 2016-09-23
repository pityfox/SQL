--EX1
SELECT ename, hiredate
FROM emp
WHERE deptno = (
				SELECT deptno
				FROM emp
				WHERE ename = 'BLAKE'
				)
AND ename != 'BLAKE';

--EX2
SELECT empno, ename
FROM emp
WHERE sal > (
			SELECT AVG(sal)
			FROM emp
			)
ORDER BY sal DESC;
			
--EX3
SELECT empno, ename
FROM emp
WHERE deptno IN (
				SELECT deptno
				FROM emp
				WHERE ename LIKE '%T%'
				);
				
--EX4
SELECT ename, empno, job
FROM emp
WHERE deptno = (
				SELECT deptno
				FROM dept
				WHERE loc = 'DALLAS'
				);
				
--EX5
SELECT ename, sal
FROM emp
WHERE mgr = (
			SELECT empno
			FROM emp
			WHERE ename = 'KING'
			);
			
--EX6
SELECT deptno, ename, job
FROM emp
WHERE deptno = (
				SELECT deptno
				FROM dept
				WHERE dname = 'SALES'
				);
				
--EX7
SELECT empno, ename, sal
FROM emp
WHERE sal > (
			SELECT AVG(sal)
			FROM emp
			)
AND deptno IN (
			SELECT deptno
			FROM emp
			WHERE ename LIKE '%T%'
			);
			
