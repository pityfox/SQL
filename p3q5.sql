SELECT ename, TO_CHAR(hiredate, 'DD-MM-YYYY') HIREDATE,
TO_CHAR(ADD_MONTHS(hiredate,6)+8-(TO_NUMBER(TO_CHAR(ADD_MONTHS(hiredate,6), 'd'),9)), 'FMDay, "the" Ddspth "of" Month, YYYY') "Review"
FROM emp;

SELECT ename, TO_CHAR(hiredate, 'DD-MM-YYYY') HIREDATE,
TO_CHAR(NEXT_DAY(ADD_MONTHS(hiredate,6), 'Monday'), 'FMDay, "the" Ddspth "of" Month, YYYY') "Review"
FROM emp;