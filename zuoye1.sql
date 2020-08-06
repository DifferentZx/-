CREATE TABLE DEPT
(
  deptno INT(2) PRIMARY KEY NOT NULL,
  dname  VARCHAR(14),
  loc    VARCHAR(13)
);


INSERT INTO dept (DEPTNO, DNAME, LOC)
VALUES ('10', 'ACCOUNTING', 'NEW YORK');

INSERT INTO dept (DEPTNO, DNAME, LOC)
VALUES ('20', 'RESEARCH', 'DALLAS');

INSERT INTO dept (DEPTNO, DNAME, LOC)
VALUES ('30', 'SALES', 'CHICAGO');

INSERT INTO dept (DEPTNO, DNAME, LOC)
VALUES ('40', 'OPERATIONS', 'BOSTON');

CREATE TABLE SALGRADE
(
  grade INT,
  losal INT,
  hisal INT
);


INSERT INTO salgrade (GRADE, LOSAL, HISAL)
VALUES ('1', '700', '1200');

INSERT INTO salgrade (GRADE, LOSAL, HISAL)
VALUES ('2', '1201', '1400');

INSERT INTO salgrade (GRADE, LOSAL, HISAL)
VALUES ('3', '1401', '2000');

INSERT INTO salgrade (GRADE, LOSAL, HISAL)
VALUES ('4', '2001', '3000');

INSERT INTO salgrade (GRADE, LOSAL, HISAL)
VALUES ('5', '3001', '9999');


-- 1.员工表emp和部门表dept的笛卡尔集（笛卡尔集表=列数之和，行数之积，笛卡尔集表内中有些数据是不符合要求的）


--  两个表分别单表查询 
SELECT * FROM DEPT
SELECT * FROM emp
--  2 两个表要合并成一张表  笛卡尔积 
SELECT * FROM emp,dept
-- 3  查询  员工信息  员工编号  员工姓名  职位  入职时间  月薪  奖金  部门编号  部门名称  部门所在地 
SELECT e.empno,e.ename,e.job,e.hiredate,e.sal,e.comm,t.deptno,t.dname,t.loc FROM emp e,dept t WHERE e.deptno = t.deptno
-- 多表查询 注意事项  查询的字段  如果是只在一个表中存在 那么我们不用写  表名,别名.字段 
--  但是 如果查询的字段在  两张表中都存在 那么必须给定 这个字段是属于那张表的  





-- 2.使用等值连接/内连接（只能使用=号），显示员工的编号，姓名，部门名，使用表别名简化

-- 3.使用非等值连接（不能使用=号，其它符号可以，例如：>=，<=，<>，betwen and等），
-- 显示员工的编号，姓名，月薪，工资级别







内连接查询：只能查询出符合条件的记录
外连接查询：既能查询出符合条件的记录，也能根据一方强行将另一个方查询出来

使用外连接，按部门10,20,30,40号，统计各部门员工人数，要求显示部门号，部门名，人数
部门号 部门名        人数
10     ACCOUNTING    3 
20     RESEARCH      5
30     SALES         6
40     OPERATIONS    0

等值连接/非等值连接/内连接：只会查询出多张表中，根据某个字段匹配，符合条件的记录，不符合条件的记录是不会存在的

4.左外连接
-- 部门编号，部门名，部门人数
SELECT * FROM emp LEFT JOIN dept ON emp.`deptno`=dept.`deptno`

5.右外连接：
-- 部门编号，部门名，部门人数
SELECT * FROM emp RIGHT JOIN dept ON emp.`deptno`=dept.`deptno`

6.使用左外连接，按部门10,20,30,40号，统计各部门员工人数，要求显示部门号，部门名，人数，且按人数降序排列

SELECT d.dname,COUNT(d.`deptno`) FROM dept d LEFT JOIN emp e ON e.`deptno`=d.`deptno` GROUP BY d.`deptno`,d.dname

7.使用自连接，显示"SMITH的上级是FORD"这种格式

SELECT CONCAT(emp.`empno`,"的上级是",emp.`ename`)

只有13条记录，不含有KING

8.基于上述问题，将KING的上级是“”显示出来