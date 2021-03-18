------------------------------------------------------------------------
-- Task 1:
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
------------------------------------------------------------------------
-- EMPLOYEES.CSV DATA FRAME
-- Drop table
DROP TABLE IF EXISTS employees;
-- Creating table
CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE
);
-- Importing CSV File
-- Display all
SELECT * FROM employees;
------------------------------------------------------------------------
-- SALARIES.CSV DATA FRAME
-- Drop table
DROP TABLE IF EXISTS salaries;
-- Creating table
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT
);
-- Importing CSV File
-- Display all
SELECT * FROM salaries;
------------------------------------------------------------------------
-- Creating table
SELECT 
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
LEFT JOIN salaries ON employees.emp_no=salaries.emp_no;
------------------------------------------------------------------------
-- Task 2:
-- 2. List first name, last name, and hire date for employees who were hired in 1986.
------------------------------------------------------------------------
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
------------------------------------------------------------------------
-- Task 3:
-- 3. List the manager of each department with the following information: 
-- department number(dm)(d), department name (d), the manager's employee number(dm), last name(e), first name(e).
------------------------------------------------------------------------
-- DEPT_MANAGER.CSV DATA FRAME
-- Drop table
DROP TABLE IF EXISTS dept_manager;
-- Creating table
CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT
);
-- Importing CSV File
-- Display all
SELECT * FROM dept_manager;
------------------------------------------------------------------------
-- DEPARTMENTS.CSV DATA FRAME
-- Drop table
DROP TABLE IF EXISTS departments;
-- Creating table
CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR
);
-- Importing CSV File
-- Display all
SELECT * FROM departments;
------------------------------------------------------------------------
-- Inner Join: DEPARMENTS, DEPT_MANAGER, EMPLOYEES
SELECT
	e.emp_no,
	e.first_name,
	e.last_name,
	d.dept_no,
	d.dept_name,
	dm.emp_no
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no=dm.dept_no
INNER JOIN employees as e
ON e.emp_no=dm.emp_no;
------------------------------------------------------------------------
-- Task 4:
-- 4. List the department of each employee with the following information: 
-- employee number(e), last name(e), first name(e), and department name (d).
------------------------------------------------------------------------
-- Inner Join: EMPLOYEES, DEPT_MANAGER, DEPARMENTS
SELECT
	e.emp_no,
	e.first_name,
	e.last_name,
	d.dept_name
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no=dm.dept_no
INNER JOIN employees as e
ON e.emp_no=dm.emp_no;
------------------------------------------------------------------------
-- Task 5:
-- 5. List first name, last name, and sex for employees 
-- whose first name is "Hercules" and last names begin with "B."
------------------------------------------------------------------------
SELECT
	employees.sex,
	employees.first_name,
	employees.last_name
		FROM employees
		WHERE first_name ='Hercules' AND last_name LIKE 'B%';
------------------------------------------------------------------------
-- Task 6:
-- 6. List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.
------------------------------------------------------------------------
SELECT
	e.last_name,
	e.first_name,
	e.emp_no,
	d.dept_name
FROM employees as e
	INNER JOIN dept_emp as de
		ON de.emp_no=e.emp_no
	INNER JOIN departments as d
		ON d.dept_no=de.dept_no
WHERE dept_name = 'Sales'
ORDER BY e.emp_no;
------------------------------------------------------------------------
-- Task 7:
-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name
------------------------------------------------------------------------
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees as e
	INNER JOIN dept_emp as de
		ON de.emp_no=e.emp_no
	INNER JOIN departments as d
		ON d.dept_no=de.dept_no
WHERE dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;
------------------------------------------------------------------------
-- Task 8. 
-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
------------------------------------------------------------------------
SELECT
	last_name,
	COUNT(last_name) AS count_of_last_name
	FROM employees
	GROUP BY last_name
	ORDER BY count_of_last_name DESC;
	
		
		
		