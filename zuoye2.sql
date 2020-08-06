-- 工资>JONES工资的员工信息
SELECT sal FROM emp WHERE ename = 'JONES'
SELECT * FROM emp WHERE sal>(SELECT sal FROM emp WHERE ename = 'JONES')	
-- 查询与SCOTT同一个部门的员工
SELECT deptno FROM emp WHERE ename = 'Scott'
SELECT * FROM emp WHERE deptno=	(SELECT deptno FROM emp WHERE ename = 'Scott')
-- 工资高于30号部门所有人的员工信息
SELECT * FROM emp WHERE sal>ALL (SELECT sal FROM emp WHERE deptno=30)	
-- 查询工作和工资与MARTIN完全相同的员工信息
SELECT * FROM emp WHERE sal=(SELECT sal FROM emp WHERE ename='MARTIN')	
-- 有两个以上直接下属的员工信息
SELECT *,COUNT(emp.`mgr`) c FROM emp GROUP BY emp.`mgr` HAVING c>2

-- 查询员工编号为7788的员工名称,员工工资,部门名称,部门地址
SELECT e.ename,e.sal,d.dname,d.loc FROM emp e,dept d  WHERE e.deptno=d.deptno  && e.empno=7788


SELECT * FROM emp WHERE	empno=7788

-- 1. 查询出高于本部门平均工资的员工信息
SELECT *, AVG(sal) avgs FROM emp GROUP BY deptno 

SELECT e.empno,e.ename,e.mgr,e.hiredate,e.sal,e.comm,e.deptno,zidep.avgs 
FROM emp e INNER JOIN (SELECT *,AVG(sal) avgs FROM emp GROUP BY deptno) zidep ON 
e.deptno = zidep.deptno WHERE e.sal>zidep.avgs


-- 2. 查询员工编号,姓名,经理编号和经理姓名
SELECT empno,ename FROM emp;
SELECT  CONCAT("经理的编号",empno,"经理的名字",ename) managers FROM emp WHERE job='manager'


-- SELECT e.empno,e.ename,e.mgr,e.hiredate,e.sal,e.comm,e.deptno FROM emp e INNER JOIN (SELECT mgr FROM emp GROUP BY deptno) zidep ON e.mgr = zidep.mgr 


-- 3. 查询出各个部门薪水最高的员工所有信息
SELECT e.empno,e.ename,e.mgr,e.hiredate,e.sal,e.comm,e.deptno,zidep.avgs FROM emp e INNER JOIN (SELECT *,MAX(sal) avgs FROM emp GROUP BY deptno) zidep ON e.deptno = zidep.deptno WHERE AVGS=e.sal	

________________________________________________________________________________________
16按照下面的条件： 根据职位制定工资等级 ，显示出员工姓名，职位，工资等级（Grade） 
职位与工资对应如下  
job                  grade
PRESIDENT            A
MANAGER             	B
ANALYST              C
SALESMAN              D
CLERK                 E
Others                F


SELECT ename,job,(
 CASE job WHEN 'PRESIDENT' THEN 'A'
	  WHEN 	'MANAGER' THEN 'B'
	  WHEN 	'ANALYST' THEN 'C'
	  WHEN 	'SALESMAN' THEN 'D'
	  WHEN 	'CLERK'  THEN 'E'
	   ELSE 'F'
	 END
) 'grade' FROM EMP
DROP TABLE QUSI



17查询公司员工工资的最大值，最小值，平均值，总和
SELECT MAX(SAL),MIN(SAL),AVG(SAL),SUM(SAL) FROM EMP

18查询各部门的员工工资的最大值，最小值，平均值，总和
SELECT deptno, MAX(SAL),MIN(SAL),AVG(SAL),SUM(SAL) avgs FROM emp GROUP BY deptno 

19展示各个职位的员工人数
SELECT *,COUNT(JOB)  FROM emp GROUP BY JOB 

20查询员工最高工资和最低工资的差距（DIFFERENCE）

SELECT CONCAT("DIFFERENCE:",MAX(SAL)-MIN(SAL)) FROM EMP


21查询各个管理者手下员工的最低工资，其中最低工资不能低于1500，没有管理者的员工不计算在内
SELECT *,MIN(SAL) FROM emp WHERE SAL>1500 && mgr IS NOT NULL GROUP BY MGR 

22查询所有部门的名字，员工数量和平均工资

SELECT deptno,COUNT(deptno),AVG(sal) FROM emp GROUP BY deptno
_____________________________________________________________________________________
1.查询和SMITH相同部门的员工姓名和雇用日期

SELECT ename,hiredate FROM EMP WHERE deptno=(SELECT deptno FROM emp WHERE ename = 'SMITH')


2查询工资比公司平均工资高的员工的员工号，姓名和工资。


SELECT empno,ename,sal FROM emp WHERE sal > (SELECT AVG(SAL) FROM emp )
