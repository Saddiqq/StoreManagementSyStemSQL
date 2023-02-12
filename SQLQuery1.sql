
		---- department table ----
		create table department( 
		dep_id INTEGER Primary key, 
		dep_name varchar(20),
		dep_location varchar(15),
		); 

		---- salary_grade ----
		create table Salary_Grade(
		grade INTEGER primary key,
		min_salary INTEGER,
		max_salary INTEGER, 
		);

		---- employees ----
		create table Employees(
		emp_id INTEGER,
		emp_name VARCHAR(15),
		job_name VARCHAR(10),
		manager_id INTEGER,
		hire_date DATE,
		salary DECIMAL(10, 2),
		commission DECIMAL(7,2),
		dep_id INTEGER, 
		Foreign key (dep_id) references department(dep_id)
		);

		INSERT INTO department (dep_id, dep_name, dep_location)
		VALUES
		(1001, 'FINANCE', 'SYDNEY'),
		(2001, 'AUDIT', 'MELBOURNE'),
		(3001, 'MARKETING', 'PERTH'),
		(4001, 'PRODUCTION','BRISBANE');

		INSERT INTO salary_grade (grade, min_salary, max_salary)
		VALUES
		  (1, 800, 1300),
		  (2, 1301, 1500),
		  (3, 1501, 2100),
		  (4, 2101, 3100),
		  (5, 3101, 9999);

		 INSERT INTO employees (emp_id, emp_name, job_name, manager_id, hire_date, salary, commission, dep_id)
		VALUES
		(68319, 'KAYLING', 'PRESIDENT', null, '1991-11-18', 6000.00, null, 1001),
		(66928, 'BLAZE', 'MANAGER', 68319, '1991-05-01', 2750.00, null, 3001),
		(67832, 'CLARE', 'MANAGER', 68319, '1991-06-09', 2550.00, null, 1001),
		(65646, 'JONAS', 'MANAGER', 68319, '1991-04-02', 2957.00, null, 2001),
		(67858, 'SCARLET', 'ANALYST', 65646, '1997-04-19', 3100.00, null, 2001),
		(69062, 'FRANK', 'ANALYST', 65646, '1991-12-03', 3100.00, null, 2001),
		(63679, 'SANDRINE', 'CLERK', 69062, '1990-12-18', 900.00, null, 2001),
		(64989, 'ADELYN', 'SALESMAN', 66928, '1991-02-20', 1700.00, 400.00, 3001),
		(65271, 'WADE', 'SALESMAN', 66928, '1991-02-22', 1350.00, 600.00, 3001),
		(66564, 'MADDEN', 'SALESMAN', 66928, '1991-09-28', 1350.00, 1500.00, 3001),
		(68454, 'TUCKER', 'SALESMAN', 66928, '1991-09-08', 1600.00, 0.00, 3001),
		(68736, 'ADNRES', 'CLERK', 67858, '1997-05-23', 1200.00, null, 2001),
		(69000, 'JULIUS', 'CLERK', 66928, '1991-12-03', 1050.00, null, 3001),
		(69324, 'MARKER', 'CLERK', 67832, '1992-01-23', 1400.00, null, 1001);	

---- Q1 ----
select* 
from Employees;

---- Q2 ----
select salary
from Employees;

---- Q3 ----
SELECT DISTINCT job_name 
FROM employees;

---- Q4 ----
SELECT emp_name, salary * 1.15 AS increased_salary
FROM employees;

---- Q5 ----
SELECT concat(emp_name, ' & ', job_name) as "Employee & Job"
FROM employees;

---- Q6 ----
SELECT emp_id, emp_name, salary,
       CONVERT(VARCHAR(20), hire_date, 107) AS hire_date
FROM employees;

---- Q7 ----
SELECT COUNT(*) as High_Salary
FROM employees
WHERE salary > 2200;	

---- Q8 ----
SELECT distinct job_name, dep_id 
from Employees;

---- Q9 ----
SELECT *
FROM employees
WHERE dep_id != 2001;

---- Q10 ----
SELECT *
FROM employees
WHERE YEAR(hire_date) < 1991;

---- Q11 ----
SELECT AVG(salary)
FROM employees
WHERE job_name = 'ANALYST'

---- Q12 ----
SELECT *
FROM employees
WHERE emp_name LIKE 'B%' OR emp_name LIKE '%E';
---- Q13 ----
	SELECT employees.*, department.dep_name
	FROM employees
	JOIN department ON employees.dep_id = department.dep_id
	WHERE department.dep_name LIKE 'B%' OR department.dep_name LIKE '%E';

---- Q14 ----
SELECT employees.*, department.dep_location
FROM employees
JOIN department ON employees.dep_id = department.dep_id
WHERE department.dep_location LIKE 'F%' OR department.dep_location LIKE '%N';

---- Q15 ----
select Employees.*, department.dep_location, department.dep_name
from Employees
join department on Employees.dep_id = department.dep_id
where Employees.commission > Employees.salary; 

---- Q16 ----
SELECT *
FROM employees
WHERE salary * 1.25 > 3000;

---- Q17 ----
select *
from Employees
where MONTH(hire_date)=1
---- Q18 ----
SELECT CONCAT( em.emp_name,'  WORKS FOR  ',mn.emp_name) AS "EMP & MAN" FROM employees em, employees mn
WHERE em.manager_id = mn.emp_id

---- Q19 ----
select* 
from Employees
where Employees.job_name = 'CLERK';

---- Q20 ----
SELECT * 
FROM employees 
WHERE datediff(year, hire_date, getdate()) > 27;


---- Q21 ----
select* 
from Employees
where salary < 3500;

---- Q22 ----
select emp_name , job_name, salary
from Employees
where Employees.job_name = 'analyst' ; 

---- Q23 ----
select*
from Employees
where year(hire_date) = 1991;
---- Q24 ----
select*
from Employees
where YEAR(hire_date) > 1991; 

---- Q25 ----
select emp_id, emp_name, hire_date, salary
from Employees
where hire_date > '1991-04-01';
---- Q26 ----
select emp_name, job_name 
from Employees
where manager_id is null
---- Q27 ----
select*
from Employees
where hire_date = '1991-05-01'; 
---- Q28 ----
SELECT emp_id, emp_name, salary, DATEDIFF(year, hire_date, CURRENT_TIMESTAMP) AS experience
FROM employees
WHERE manager_id = 68319;

---- Q29 ----
SELECT emp_id, emp_name, salary, DATEDIFF(year, hire_date, CURRENT_TIMESTAMP) as experience
FROM employees
WHERE salary/365 > 100;
---- Q30 ----
SELECT emp_name
FROM employees
WHERE hire_date < '1991-12-31' 
AND (YEAR(getdate()) - YEAR(hire_date)) >= 8
---- Q31 ----

---- Q32 ----
---- Q33 ----
---- Q34 ----
---- Q35 ----
---- Q36 ----
---- Q37 ----
---- Q38 ----
---- Q39 ----
---- Q40 ----
---- Q41 ----
---- Q42 ----
---- Q43 ----
---- Q44 ----
---- Q45 ----
---- Q46 ----
---- Q47 ----
---- Q48 ----
---- Q49 ----
---- Q50 ----
---- Q51 ----