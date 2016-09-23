--EX2
SELECT ename, sal, deptno
FROM emp
WHERE deptno = (
				SELECT deptno
				FROM emp
				WHERE ename = 'JONES'
				);

--EX3
SELECT ename
FROM emp
WHERE ename != 'ADAMS'
CONNECT BY PRIOR mgr = empno
START WITH ename = 'ADAMS';

--EX4
COL name FORMAT A20;
SELECT LPAD(' ', (3*LEVEL-3))||ename NAME, mgr, deptno
FROM emp
CONNECT BY PRIOR empno = mgr
START WITH mgr IS NULL;
