SHOW DATABASES;
USE books;
SHOW TABLES;
SHOW TABLES FROM mysql;
SELECT DATABASE();
CREATE DATABASE IF NOT EXISTS BOOKS;
CREATE TABLE student(id INT, NAME VARCHAR(4));
DESC student;
SELECT * FROM student;
INSERT INTO student(id, NAME) VALUES(1, '小白');
SELECT VERSION();
########################
SELECT * FROM student;
########################
SELECT DATABASE();
SELECT first_name, last_name, `email`,`phone_number`,`job_id`,`salary`,`commission_pct`,`manager_id`,`department_id`,`hiredate`FROM employees;
SELECT * FROM employees;
SELECT `department_id`, `department_name`, `manager_id` FROM departments;
SELECT 100;
SELECT 'john';
SELECT 100%98;
SELECT VERSION();
SELECT IFNULL(NULL, "haha2");
SELECT IFNULL("haha1", "haha2");
SELECT 100%98 AS 余数;
SELECT 100%98 AS ' ';
SELECT salary AS 'out put' FROM employees;
SELECT DISTINCT `department_id` FROM employees;
SELECT CONCAT(`last_name`, `first_name`) AS 姓名 FROM employees;

DESC departments;
SELECT DISTINCT job_id FROM employees;
#desc employees;
SELECT CONCAT( `first_name`,'  ',`last_name`,'  ',`email`,'  ',`phone_number`,'  ',`job_id`,'  ',`salary`, '  ',IFNULL( `commission_pct`, 0),'  ',`manager_id`,'  ',`department_id`,'  ',`hiredate`) AS out_put FROM employees;
#10
SELECT * FROM employees WHERE salary > 12000;
SELECT CONCAT( `first_name`, `last_name`) AS 姓名, `department_id` FROM employees WHERE `department_id` != 90;
SELECT CONCAT( `first_name`, `last_name`) AS 姓名, `salary`, `commission_pct` FROM employees WHERE salary >=10000 AND salary <= 20000;
SELECT * FROM employees WHERE `department_id` < 90 OR `department_id` > 110 OR `salary` > 15000;
SELECT * FROM employees WHERE (department_id<90 AND department_id>110) OR salary>15000;##错误
SELECT * FROM employees WHERE NOT(`department_id`>=90 AND `department_id`<=110) OR salary>15000;
#11
SELECT * FROM employees WHERE last_name LIKE '%a%';
SELECT * FROM employees WHERE last_name LIKE '__n%' OR '____l%';
SELECT * FROM employees WHERE last_name LIKE '_\_%';
SELECT * FROM employees WHERE last_name LIKE '_&_%' ESCAPE '&';
SELECT * FROM employees WHERE salary BETWEEN 10000 AND 20000;
SELECT * FROM employees WHERE `job_id`='it_prog' OR `job_id`='ad_vp' OR `job_id`='ad_pres';
SELECT * FROM employees WHERE `job_id` IN('it_prog', 'ad_vp', 'ad_pres');
SELECT * FROM employees WHERE `commission_pct` <=> NULL;
#12
SELECT * FROM employees WHERE `department_id` >= 90 ORDER BY hiredate ASC;
SELECT *,(salary * 12 * (1 + IFNULL( commission_pct, 0))) AS 年薪 FROM employees ORDER BY 年薪 ASC;
SELECT *,(salary * 12) AS 年薪 FROM employees ORDER BY 年薪 ASC;
SELECT *,LENGTH(last_name) FROM employees ORDER BY LENGTH(last_name) ASC;
SELECT * FROM employees ORDER BY salary DESC, `employee_id` DESC;
#13
SELECT LENGTH('abcd');
SELECT LENGTH('小白abcd');
SHOW VARIABLES LIKE '%char%';
SELECT CONCAT( last_name, '--',first_name) AS 姓名 FROM employees;
SELECT UPPER("harry");
SELECT LOWER("Poter");
SELECT CONCAT( UPPER(last_name), '&', LOWER(first_name)) FROM employees;
SELECT SUBSTR( '目标字符串', 5) AS out_put;
SELECT SUBSTR( '目标字符串', 3, 2) AS out_put;
SELECT INSTR( '目标字符串', '字符串');
SELECT TRIM( ' have One      ');
SELECT LENGTH(TRIM( '  length    '));
SELECT TRIM('a' FROM 'aaaa123456aaa');
SELECT LPAD( '哈哈哈', 10, '*');
SELECT RPAD( '一二三', 10, '溜');
SELECT REPLACE( '目标字符串', '字符', '哈哈');
#14
SELECT ROUND(-1.45);
SELECT ROUND(3.14159, 3);
SELECT CEIL(-1.3);
SELECT FLOOR(-1.3);
SELECT TRUNCATE(3.1415926, 3);
SELECT MOD(10, 3);
SELECT NOW();
SELECT CURDATE();
SELECT CURTIME();
SELECT YEAR(NOW());
SELECT YEAR('2010-1-1');
SELECT MONTH(NOW());
SELECT MONTHNAME(NOW());
SELECT SECOND(NOW());
USE books;
INSERT INTO student( `id`,`name`,`date`) VALUES('33', '二哈', STR_TO_DATE( '2010-10-5', '%Y-%m-%d'));
SELECT * FROM student;
SELECT STR_TO_DATE('2010-10-5','%Y-%m-%d') AS result;
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d');
SELECT STR_TO_DATE('2017-01-06 10:20:30','%Y-%m-%d %H:%i:%s') AS result;
SELECT DATE_FORMAT(NOW(), '%m-%d-%Y');
SELECT * FROM employees WHERE `hiredate` = '1992-4-3';
SELECT * FROM employees WHERE hiredate = STR_TO_DATE( ' 2000 9 9', '%Y %m %d');
SELECT VERSION();
SELECT DATABASE();
SELECT USER();
SELECT IF( -1>1, '大', '小');

SELECT salary AS 原工资, department_id, 
	CASE department_id 
	WHEN 30 THEN salary*1.1
	WHEN 50 THEN salary*1.2
	ELSE salary
	END AS 新工资
FROM employees;

SELECT salary,
	CASE 
	WHEN salary > 20000 THEN 'A级工资'
	WHEN salary > 10000 THEN 'B级工资'
	ELSE 'C级工资'
	END AS 工资级别, phone_number
FROM employees;

SELECT SUM(salary) 单月所发总工资 FROM employees;
SELECT AVG(salary) 单月所发平均工资 FROM employees;
SELECT MAX(salary) AS 最大工资 FROM employees;
SELECT MIN(salary) AS 最小工资 FROM employees;
SELECT COUNT(`employee_id`) AS 员工数 FROM employees;
SELECT COUNT(DISTINCT salary) FROM employees;
SELECT * FROM employees;
#16
#查询每个工种的最高工资
SELECT salary FROM employees GROUP BY `job_id`;

SELECT DISTINCT job_id FROM employees;
#查询每个地方的部门个数
SELECT COUNT(DISTINCT `department_id`) AS 部门个数, location_id FROM departments GROUP BY location_id;
#查询每个部门每个工种的员工的平均工资
SELECT AVG(salary),`department_id`,`job_id` FROM employees GROUP BY `job_id`,`department_id`;
SELECT COUNT(*) 个数, AVG(salary),department_id,job_id FROM employees GROUP BY department_id,job_id;#answer
#查询员工邮箱里包含"a"字母的,每个部门的平均工资
SELECT AVG(salary) FROM employees WHERE email LIKE '%a%' GROUP BY department_id;
#查询的有奖金的每个领导手下员工的最高工资
SELECT MAX(salary) FROM employees WHERE commission_pct IS NOT NULL GROUP BY manager_id;
SELECT MAX(salary) 最高工资,manager_id FROM employees WHERE commission_pct IS NOT NULL GROUP BY manager_id;
#查询部门的员工个数>5的所有部门的员工数
SELECT COUNT(employee_id),department_id FROM employees GROUP BY `department_id` HAVING COUNT(employee_id) > 5;
#查询的没有奖金的每个领导手下员工的最高工资,且工资大于12000
SELECT MAX(salary) FROM employees WHERE commission_pct IS NULL GROUP BY manager_id HAVING MAX(salary) > 12000;
SELECT MAX(salary) maxsalary,manager_id FROM employees WHERE commission_pct IS NULL GROUP BY manager_id HAVING maxsalary>12000;
#17
CREATE TABLE ta( id INT, age INT);
CREATE TABLE tb( id INT, `name` VARCHAR(4), ta_id INT);
INSERT INTO ta( id, age) VALUES( 1, 12);

INSERT INTO ta( id, age) VALUES( 2, 22);
INSERT INTO ta( id, age) VALUES( 3, 32);
INSERT INTO ta( id, age) VALUES( 4, 42);
INSERT INTO ta( id, age) VALUES( 5, 52);
INSERT INTO ta( id, age) VALUES( 6, 62);

INSERT INTO tb(id,NAME,ta_id) VALUES(1,'斯沃特',2);
INSERT INTO tb(id,NAME,ta_id) VALUES(2,'塞斯',1);
INSERT INTO tb(id,NAME,ta_id) VALUES(3,'猎狐者',3);
INSERT INTO tb(id,NAME,ta_id) VALUES(4,'夜玫瑰',8);
INSERT INTO tb(id,NAME,ta_id) VALUES(5,'波塞冬',1);
INSERT INTO tb(id,NAME,ta_id) VALUES(6,'刀锋',10);
INSERT INTO tb(id,NAME,ta_id) VALUES(7,'奥摩',10);
INSERT INTO tb(id,NAME,ta_id) VALUES(8,'葵',6);

SELECT 'name', age FROM ta, tb;
SELECT tb.name, ta.age FROM ta, tb WHERE tb.ta_id = ta.id;

#查询员工名和对应的部门名
SELECT e.department_id,employee_id,CONCAT(last_name, first_name) FROM `employees` AS e, `departments` d WHERE e.`department_id` = d.`department_id` ORDER BY d.`department_id` ASC;
#查询有奖金的员工名及所属部门名
SELECT e.`last_name`,d.`department_name` FROM employees AS e, departments AS d 
	WHERE e.`department_id` = d.`department_id` AND e.`commission_pct` IS NOT NULL;
#查询每个城市的部门个数
SELECT COUNT(*), l.city FROM locations AS l, departments AS d WHERE l.`location_id` = d.`location_id` GROUP BY l.city;
#查询有奖金的每个部门的部门名和部门的领导编号和该部门的最低工资
SELECT d.`department_name`,d.`manager_id`,MIN(salary) FROM departments AS d, employees AS e 
	WHERE d.`department_id` = e.`department_id` AND commission_pct IS NOT NULL 
	GROUP BY d.`department_id`;
#查询每个工种的工种名和员工个数，并且按照员工个数排序降序
SELECT j.`job_title`, COUNT(e.`employee_id`) AS num FROM jobs AS j, employees AS e 
	WHERE j.`job_id` = e.`job_id` 
	GROUP BY j.`job_title` ORDER BY num DESC;
#查询员工名,部门名和所在城市名
SELECT e.`employee_id`,e.`last_name`,d.`department_name`,l.`city` FROM employees AS e, departments AS d, locations AS l 
	WHERE e.`department_id` = d.`department_id` AND d.`location_id` = l.`location_id` ORDER BY employee_id;
#18
CREATE TABLE job_grades( grade_level VARCHAR(3), lowest_sal INT, highest_sal INT);
INSERT INTO job_grades VALUES( 'A', 1000, 2999);
INSERT INTO job_grades VALUES( 'B', 3000, 5999);
INSERT INTO job_grades VALUES( 'C', 6000, 9999);
INSERT INTO job_grades VALUES( 'D', 10000, 14999);
INSERT INTO job_grades VALUES( 'E', 15000, 24999);
INSERT INTO job_grades VALUES( 'F', 25000, 40000);
#查询员工的工资和工资级别
SELECT e.`last_name`, salary, jg.`grade_level` grade_level 
	FROM employees AS e, job_grades jg 
		WHERE e.`salary` BETWEEN jg.`lowest_sal` AND jg.`highest_sal` 
			ORDER BY jg.`grade_level`;
#19查询员工名和他的上司的名字
SELECT e.`last_name`, e2.`last_name` FROM employees AS e, employees AS e2 WHERE e.`manager_id` = e2.`employee_id`;
SELECT last_name, manager_id FROM employees;
#20
#查询员工名和其对应所属的部门名
SELECT e.`last_name`, d.`department_name` FROM employees AS e INNER JOIN departments AS d ON e.`department_id` = d.`department_id`; 
#查询名字中包含e字母的员工名和其对象的部门名
SELECT e.`last_name`, e.`first_name`, d.`department_name` 
	FROM employees AS e INNER JOIN departments AS d ON e.`department_id` = d.`department_id` 
	WHERE e.`last_name` LIKE '%e%' OR e.`first_name` LIKE '%e%';
#查询所在部门个数大于3的城市名和部门个数
SELECT COUNT(d.`department_id`) AS ct, l.`city` 
	FROM locations AS l INNER JOIN departments AS d ON l.`location_id` = d.`location_id` GROUP BY l.`location_id` HAVING ct > 3;
#查询员工个数大于3点部门名和员工个数,降序排序
SELECT d.`department_name`, COUNT(e.`employee_id`) AS ct 
	FROM employees AS e INNER JOIN departments AS d ON e.`department_id` = d.`department_id` 
	GROUP BY e.`department_id` ORDER BY ct DESC;
#查询员工名以及对应的工种名和部门名,按部门名降序排序
SELECT e.`last_name`, j.`job_title`, d.`department_name` FROM employees AS e INNER JOIN jobs AS j INNER JOIN departments AS d 
	ON e.`job_id` = j.`job_id` AND e.`department_id` = d.`department_id`
	ORDER BY d.`department_name` DESC;
	#employee_id为178的员工没有department_id
#查询员工的工资和工资级别
SELECT e.`last_name`, jg.`grade_level` FROM employees AS e INNER JOIN job_grades AS jg 
	ON e.`salary` BETWEEN jg.`lowest_sal` AND jg.`highest_sal`;
#查询同一个工资级别的员工的个数大于20的员工个数，并且按照工资级别降序排序
SELECT jg.`grade_level`, COUNT(e.`employee_id`) AS ct 
	FROM employees AS e INNER JOIN job_grades AS jg ON e.`salary` BETWEEN jg.`lowest_sal` AND jg.`highest_sal` 
	GROUP BY jg.`grade_level` HAVING ct > 20 ORDER BY jg.`grade_level` DESC;
#查询员工的名和其对应的直属领导
SELECT e1.`last_name` AS 员工, e2.`last_name` AS leader 
	FROM employees AS e1 INNER JOIN employees AS e2 ON e1.`manager_id` = e2.`employee_id`;
#21
#在ta和tb两表中查询没有对应年龄数据的学生姓名和年龄
SELECT tb.id, tb.`name`,ta.`age` FROM tb LEFT JOIN ta ON tb.`ta_id` = ta.`id`;
SELECT tb.`id`, tb.`name`, ta.`age` FROM tb LEFT JOIN ta ON tb.`ta_id` = ta.`id` WHERE ta.`age` IS NULL;
SELECT tb.`id`, tb.`name`, ta.`age` FROM tb LEFT JOIN ta ON tb.`ta_id` = ta.`id` WHERE ta.`id` IS NULL;
#查询没有员工的部门
SELECT e.`first_name`, e.`department_id` FROM employees AS e LEFT JOIN departments AS d ON e.`department_id` = d.`department_id`;#没有部门的员工
SELECT d.`department_name`, d.`department_id`
	FROM departments AS d LEFT JOIN employees AS e ON d.`department_id` = e.`department_id` 
	WHERE e.`department_id` IS NULL;
#查询工资比Abel这个人的高的员工信息
SELECT e.`employee_id`,e.`last_name` FROM employees e 
	WHERE e.`salary` > (SELECT e1.`salary` FROM employees e1 WHERE e1.`last_name` = 'Abel');
#查询job_id与141号员工相同,salary比143号员工多的员工姓名,job_id和工资
SELECT * FROM employees e 
	WHERE e.`job_id` = (SELECT job_id FROM employees WHERE employee_id = 141) 
		AND e.`salary` > (SELECT salary FROM employees WHERE employee_id = 143);
#子查询里用到分组函数:查询公司工资最少的员工的last_name,job_id和salary
SELECT e.`last_name`, e.`job_id`, e.`salary` FROM employees e WHERE e.`salary` = ( SELECT MIN(salary) FROM employees);
#用到having的子查询:查询最低工资大于50号部门最低工资的部门id和其最低工资
SELECT MIN(salary) FROM employees e1 WHERE e1.`department_id` = 50;
	#最低工资大于"这个数"的部门id
	SELECT MIN(salary),department_id FROM employees GROUP BY department_id HAVING MIN(salary) > 2100;
#select e.`department_id`, min(e.`salary`) from employees e 
#	select department_id from employees e2 where (min(e2.salary) > (SELECT MIN(salary) FROM employees e1 WHERE e1.`department_id` = 50)) group by e2.department_id;
	
SELECT MIN(salary),department_id FROM employees GROUP BY department_id HAVING MIN(salary) > (SELECT MIN(salary) FROM employees e1 WHERE e1.`department_id` = 50);
#24
SELECT IN( 10, 20, 30);
#返回location_id是14001`或`1700的部门中的所有员工的名字
#方法一
SELECT d.`location_id`, e.`employee_id`, e.`last_name`, e.`department_id` FROM departments d RIGHT JOIN employees e ON d.`department_id` = e.`department_id` 
	WHERE d.`location_id` IN (1400, 1700);
	
SELECT department_id FROM departments WHERE location_id IN (1400,1700);
#方法二(所给答案)
SELECT last_name, employee_id, department_id FROM employees WHERE department_id IN (SELECT department_id FROM departments WHERE location_id IN (1400,1700));
#19092016以上两个查询有待仔细比较
#查询其他工种中比job_id为'IT_PROG'的员工某一工资低的员工的员工号,姓名,job_id和salary
SELECT MIN(salary) FROM employees WHERE job_id = 'IT_PROG';
#所给参考答案
SELECT employee_id,last_name,job_id,salary FROM employees WHERE salary < ANY(SELECT DISTINCT salary FROM employees WHERE job_id='IT_PROG') AND job_id<>'IT_PROG';
#查询其他工种中比job_id为'IT_PROG'的员工所有工资低的员工的员工号,姓名,job_id和salary
SELECT e.`employee_id`, e.`last_name`, e.`job_id`, e.`salary` FROM employees e WHERE e.`salary` < (SELECT MIN(salary) FROM employees WHERE job_id = 'IT_PROG');

SELECT employee_id,last_name,job_id,salary FROM employees WHERE salary < ALL(SELECT DISTINCT salary FROM employees WHERE job_id='IT_PROG') AND job_id<>'IT_PROG';
#查询员工编号最小并且工资最高的员工信息
SELECT * FROM employees WHERE employee_id = (SELECT MIN(employee_id) FROM employees) AND salary = (SELECT MAX(salary) FROM employees);

#insert into employees( employee_id, first_name, `last_name`, `email`, `phone_number`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`, `hiredate`) values( 99, 'hao', 'park', 'HPARK', '123.456.7890', 'IT_PROG', 8888, null, null, 60, '2015-02-01');
SELECT * FROM employees WHERE employee_id = (SELECT MIN(employee_id) FROM employees) AND salary = (SELECT MAX(salary) FROM employees);
#25
#查询每个部门的部门信息和对应的员工个数(不用连接查询)
SELECT d.`department_name`, COUNT(*) FROM departments d, employees e WHERE d.`department_id` = e.`department_id`;
#select d.*,( select d.department_name, count(*) from employees e, departments d where d.department_id=e.department_id) from departments d;

SELECT COUNT(*) FROM employees GROUP BY department_id;
#查询员工号等于102的部门名(不用连接查询)
SELECT department_name FROM departments WHERE department_id = (SELECT department_id FROM employees WHERE employee_id = 102);
#查询每个部门的平均工资等级
SELECT AVG(salary) FROM employees GROUP BY department_id;
SELECT grade_level, res.di 部门号
	FROM job_grades, (SELECT AVG(salary) avgs, department_id di FROM employees GROUP BY department_id) res
	WHERE  res.avgs BETWEEN lowest_sal AND highest_sal;
	
SELECT
avg_res.avgs,avg_res.`department_id`,g.`grade_level`
FROM
(
SELECT AVG(salary) avgs,department_id
FROM employees GROUP BY department_id
) avg_res
,`job_grades` g
WHERE
avg_res.avgs BETWEEN g.`lowest_sal` AND g.`highest_sal`;
#26
SELECT EXISTS(SELECT employee_id FROM employees);
#查询有员工的部门名
#select distinct d1.`department_name` from departments d1
#	where exists( select e.`employee_id` is not null from departments d left join employees e on d.`department_id` = e.`department_id`);
#SELECT * FROM departments d left join employees e on d.`department_id` = e.`department_id`;
#SELECT e.`employee_id` is not null FROM departments d LEFT JOIN employees e ON d.`department_id` = e.`department_id`;

SELECT d.`department_name` FROM departments d WHERE EXISTS( SELECT * FROM employees e WHERE d.`department_id` = e.`department_id`);

#select exists( select manager_id from departments);
#SELECT manager_id FROM departments;

SELECT d.department_name FROM departments d WHERE d.`department_id` IN( SELECT e.`department_id` FROM employees e);
#27
SELECT * FROM employees LIMIT 0, 5;
SELECT * FROM employees LIMIT 10, 15;
#查询有奖金且工资最高的前10名的员工信息
SELECT * FROM employees WHERE commission_pct IS NOT NULL ORDER BY salary DESC LIMIT 0, 10;
SELECT * FROM employees WHERE commission_pct IS NOT NULL ORDER BY salary DESC LIMIT 10;#答案
#28 
SELECT * FROM employees WHERE department_id>100 OR last_name LIKE '%a%';

SELECT * FROM employees WHERE department_id>100
UNION
SELECT * FROM employees WHERE last_name LIKE '%a%';

SELECT employee_id, first_name, last_name, email FROM employees 
UNION
SELECT * FROM departments;
#29
SHOW DATABASES;
SELECT DATABASE();
USE books;

CREATE TABLE students( sno LONG, sname VARCHAR(40), ssex VARCHAR(4), sbirthday DATE, class VARCHAR(20));
INSERT INTO students( sno, sname, ssex, sbirthday, class) VALUES( '11234', '塞斯', '男', '1993-2-1', '11601');
INSERT INTO students SET sno=114, sname='奥摩', ssex='男', sbirthday='1995-9-1', class='11602';
INSERT INTO students( sno, sname, ssex, sbirthday, class) VALUES( '1123', '斯沃特', '男', '1996-6-1', '8910'), ('8691', '兰', '女', '1997-10-1', '0103'), ('1831', '夜玫瑰', '女', '2000-1-1', '3128');

INSERT INTO students( sno, sname, ssex, sbirthday, class) SELECT CONCAT(sno, '0001'), CONCAT( '克隆', sname), ssex, sbirthday, class FROM students WHERE sno = 1123;

#30
UPDATE students SET class = '567' WHERE ssex LIKE '%女%';
UPDATE employees e INNER JOIN departments d ON e.`department_id` = d.`department_id` SET e.`commission_pct` = 99.99 WHERE e.`employee_id` = 99;
UPDATE employees e LEFT JOIN departments d ON e.`department_id` = d.`department_id` SET e.`commission_pct` = 0.9 WHERE e.`commission_pct` IS NULL;

DELETE FROM student WHERE id > 1;

DELETE a FROM ta a INNER JOIN tb b ON b.`ta_id` = a.`id` WHERE `name`='斯沃特';

USE books;
SELECT DATABASE();
TRUNCATE TABLE student;

CREATE DATABASE IF NOT EXISTS books2;
ALTER DATABASE books2 CHARACTER SET gbk;
DROP DATABASE books2;

CREATE TABLE book(
	id INT , #书的编号
	b_name VARCHAR(20), #书的名字
	b_price DOUBLE, #书价格
	author_id INT, # 关联作者信息表,作者编号
	publishDate DATETIME#出版日期
);

CREATE TABLE author(
	id INT,
	a_name VARCHAR(10),
	a_sex CHAR(1)
);

ALTER TABLE book CHANGE COLUMN publishDate publish_date DATETIME;

#修改publish_date的时间类型(datetime)改为date日期型
ALTER TABLE book MODIFY COLUMN publish_date DATE;

ALTER TABLE author ADD COLUMN salary DOUBLE;

ALTER TABLE author DROP COLUMN salary;

ALTER TABLE author RENAME TO b_author;

DROP TABLE IF EXISTS b_author;

CREATE TABLE c_author LIKE author;

INSERT INTO author VALUES( 9123, '斯沃特', '男'), ( 18923, '一盏绿茶', '男'), ( 689, '天蚕土豆', '男');
INSERT INTO author ( id, a_name, a_sex) VALUES( 1, '青幕山', '男');

DROP TABLE IF EXISTS c_author;

CREATE TABLE c_author SELECT * FROM author;

CREATE TABLE c_author2 SELECT * FROM author WHERE id < 3;

CREATE TABLE c_author3 SELECT a_name FROM author;

CREATE TABLE t_int(
	i30 INT( 30)
);

DROP TABLE students;

CREATE TABLE students(
	id INT PRIMARY KEY,
	s_name VARCHAR(10) NOT NULL,
	s_sex CHAR(1) CHECK(s_sex = '男' OR s_sex = '女'),
	s_seat INT UNIQUE,
	age INT DEFAULT 18,
	major_id INT REFERENCES major(id)
);

CREATE TABLE majors(
	id INT PRIMARY KEY,
	m_name VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS students;

CREATE TABLE students(
	id INT,
	s_name VARCHAR(10),
	s_sex CHAR(1),
	s_seat INT,
	age INT,
	major_id INT,
	CONSTRAINT pk PRIMARY KEY(id),
	CONSTRAINT uq UNIQUE(s_seat),
	CONSTRAINT ck CHECK( 's_sex' = '男' OR 's_sex' = '女'),
	CONSTRAINT fk_students_majors FOREIGN KEY( major_id) REFERENCES majors(id)
);

#38
ALTER TABLE students MODIFY COLUMN s_name VARCHAR(20) NOT NULL;
ALTER TABLE students MODIFY COLUMN s_name VARCHAR(20);

ALTER TABLE students MODIFY COLUMN age INT DEFAULT 18;
ALTER TABLE students MODIFY COLUMN age INT;

ALTER TABLE students DROP PRIMARY KEY;
ALTER TABLE students MODIFY COLUMN id INT PRIMARY KEY;

ALTER TABLE students DROP INDEX uq;
ALTER TABLE students MODIFY COLUMN s_seat INT UNIQUE;
SHOW INDEX FROM students;

ALTER TABLE students ADD CONSTRAINT fnk FOREIGN KEY(major_id) REFERENCES majors(id);
ALTER TABLE students DROP INDEX major_id;

ALTER TABLE students DROP FOREIGN KEY fnk;

DROP TABLE students;
DROP TABLE majors;

SHOW INDEX FROM students;
ALTER TABLE students DROP FOREIGN KEY fk_students_majors;
#39

CREATE TABLE t_identity(
	id INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR( 20)
);

INSERT INTO t_identity VALUES( NULL, '斯沃特');
INSERT INTO t_identity VALUES( NULL, '塞斯');
INSERT INTO t_identity VALUES( NULL, '奥登');

INSERT INTO t_identity( `name`) VALUES( '波塞冬');
INSERT INTO t_identity( `name`) VALUES( '猎狐者');
INSERT INTO t_identity( `name`) VALUES( '灵狐者');

INSERT INTO t_identity( `name`) VALUES( '雷霆β');
 
SET @@auto_increment_increment = 3;##############################################俩个@才起作用啊

INSERT INTO t_identity( `name`) VALUES( '雷霆α');
 
ALTER TABLE t_identity MODIFY COLUMN id INT;

#40
SHOW ENGINES;

SHOW VARIABLES LIKE '%autocommit%';

CREATE TABLE account(
	id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR( 20),
	balance DOUBLE
);
INSERT INTO account( username, balance) VALUES( '猎狐者', 9999.99), ( '斯沃特', 6666.66);

SET autocommit = 0;
START TRANSACTION;
UPDATE account SET balance = balance - 500 WHERE username = '斯沃特';
UPDATE account SET balance = balance + 500 WHERE username = '猎狐者';
COMMIT;

#43
SET autocommit = 0;
START TRANSACTION;
USE books;
SELECT DATABASE();
SELECT * FROM account;
SAVEPOINT a;
DELETE FROM account WHERE id = 1 OR id = 2; 
SELECT * FROM account;
ROLLBACK TO a;
SELECT * FROM account;
COMMIT;

SELECT * FROM account;

USE books;
SELECT DATABASE();

CREATE TABLE ages(
	id INT,
	age VARCHAR( 10)
);

#44
DELIMITER $$
CREATE PROCEDURE mypro1()
BEGIN
	INSERT INTO ages( id, age) VALUES( 11, '12');
	INSERT INTO ages(id,`age`) VALUES (21,'13');
	INSERT INTO ages(id,`age`) VALUES (31,'14');
	INSERT INTO ages(id,`age`) VALUES (41,'15');
END $$

CALL mypro1()$$
DELIMITER ;
#45

SHOW VARIABLES LIKE '%autocommit%';
DROP TABLE IF EXISTS students;
CREATE TABLE students(
	`sno` INT PRIMARY KEY AUTO_INCREMENT,
	`sname` VARCHAR( 20),
	`ssex` VARCHAR( 20),
	`sbirthday` DATE,
	`class` VARCHAR( 20)
);

INSERT INTO `students`(`sno`,`sname`,`ssex`,`sbirthday`,`class`) VALUES('11234','波塞冬','男','1990-1-12','11601');
INSERT INTO `students`(`sno`,`sname`,`ssex`,`sbirthday`,`class`) VALUES('11224','复仇女神','男','1993-1-12','11661');
INSERT INTO `students`(`sno`,`sname`,`ssex`,`sbirthday`,`class`) VALUES('1113244','雷霆α','男','1997-1-12','11101');
INSERT INTO `students`(`sno`,`sname`,`ssex`,`sbirthday`,`class`) VALUES('11298274','刀锋','男','1994-1-12','11901');

ALTER TABLE students ADD COLUMN age_id INT;
INSERT INTO students( age_id) VALUES ( 13), (342);
DELETE FROM students WHERE sno = 11298275 OR sno = 11298276;
UPDATE students SET age_id = 11 WHERE sno = 11224;
UPDATE students SET age_id = 21 WHERE sno = 11234;
UPDATE students SET age_id = 31 WHERE sno = 1113244;
UPDATE students SET age_id = 41 WHERE sno = 11298274;

DROP PROCEDURE myp2;

DELIMITER @@
CREATE PROCEDURE myp2( IN s_name VARCHAR( 20))
BEGIN
SELECT s.sname, a.age FROM students s INNER JOIN ages a ON s.age_id = a.id
	WHERE s.sname = s_name;
END@@



SELECT DATABASE();  

@@
CALL myp2('刀锋');@@

USE books;

DELIMITER $
CREATE PROCEDURE myp3( IN username VARCHAR( 20), IN `password` VARCHAR( 20))
BEGIN
DECLARE res INT DEFAULT 0;
SELECT COUNT( *) INTO res FROM users u WHERE u.username = username AND u.password = `password`;
SELECT IF( res > 0, '登陆成功', '登陆失败');
END$

USE myemployees;
DROP PROCEDURE IF EXISTS myp3;

CREATE TABLE users(
	username VARCHAR( 40),
	`password` VARCHAR( 40)
);

INSERT INTO users VALUES( '11111', '123456');
INSERT INTO users VALUES( '22222', '123456');
INSERT INTO users VALUES( '33333', '123456');

UPDATE users SET username = '111111' WHERE username = '11111';
UPDATE users SET username = '222222' WHERE username = '22222';
UPDATE users SET username = '333333' WHERE username = '33333';
#############
CALL myp3( '111111', '123456');

DELIMITER $
CREATE PROCEDURE myp4( IN sname VARCHAR( 10), OUT agee INT)
BEGIN
SELECT a.age INTO agee FROM students s INNER JOIN ages a ON s.age_id = a.id WHERE s.sname = sname;
END$
DELIMITER ;
###############
CALL myp4( '刀锋', @ageee);

DROP PROCEDURE IF EXISTS myp4;

SELECT DATABASE();

SELECT @ageee;
##############
DELIMITER $
CREATE PROCEDURE myp5( IN sname VARCHAR( 20), OUT agee INT, OUT sid INT)
BEGIN
SELECT a.age, s.sno INTO agee, sid FROM ages a INNER JOIN students s ON a.id = s.age_id WHERE s.sname = sname;
END$
DELIMITER ;

DROP PROCEDURE IF EXISTS myp5;

CALL myp5( '波塞冬', @ageeee, @sidddd);

SELECT @ageeee, @sidddd;
###############
DELIMITER $
CREATE PROCEDURE myp6( INOUT a INT, INOUT b INT)
BEGIN 
SET a = a*2;
SET b = b*2;
END$

SET @a = 10;
SET @b = 20;

CALL myp6( @a, @b);

SELECT @a, @b;

SHOW CREATE PROCEDURE myp6;