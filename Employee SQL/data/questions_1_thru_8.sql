CREATE TABLE departments(
	dept_no VARCHAR,
	dept_name VARCHAR
);
--SELECT * FROM departments;
CREATE TABLE dept_employees(
	--id SERIAL PRIMARY KEY,
	emp_no INT,
	dept_no VARCHAR(255)
);

--DROP TABLE dept_employees;
--SELECT * FROM dept_employees

CREATE TABLE dept_managers(
	dept_no VARCHAR(255),
	emp_no INT
);

CREATE TABLE employees(
	emp_no INT,
	emp_title VARCHAR(255),
	birth_date DATE,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	sex VARCHAR(255),
	hire_date DATE
);
--SELECT * FROM titles

CREATE TABLE salaries(
	emp_no INT,
	salaries INT
);

CREATE TABLE titles(
	title_id VARCHAR(255),
	title VARCHAR(255)
);  
-- #1.
SELECT 
  s.salaries,
  e.emp_no,
  e.last_name,
  e.first_name,
  e.sex 
FROM employees e
INNER JOIN salaries s ON
s.emp_no = e.emp_no;

-- #2. List first name, last name, and hire date for employees who were hired in 1986

SELECT 
  e.first_name,
  e.last_name,
  e.hire_date
FROM employees e
WHERE e.hire_date >= '01-01-1986' 
AND e.hire_date <= '12-31-1986'
ORDER BY e.hire_date asc;

-- #3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

SELECT 
  d.dept_no,
  d.dept_name,
  dm.emp_no,
  e.last_name,
  e.first_name
FROM dept_managers dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

--SELECT * FROM departments

-- #4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT 
  de.emp_no,
  d.dept_name,
  e.last_name,
  e.first_name
FROM dept_employees de
JOIN departments d ON de.dept_no = d.dept_no
JOIN employees e ON de.emp_no = e.emp_no;

-- #5. List first name, last name, and sex for employees whose first name is 
-- "Hercules" and last names begin with "B." 

SELECT
	e.first_name,
	e.last_name,
	e.sex
FROM employees e
WHERE e.first_name = 'Hercules' 
AND e.last_name LIKE 'B%';

-- #6. List all employees in the Sales department (d007), including their employee number, last name, first name, and department name.
	
SELECT 
  de.emp_no,
  d.dept_name,
  e.last_name,
  e.first_name
FROM dept_employees de
JOIN departments d ON de.dept_no = d.dept_no
JOIN employees e ON de.emp_no = e.emp_no
WHERE de.dept_no = 'd007';

-- #7. List all employees in the Sales and Development departments (d005), 
-- including their employee number, last name, first name, and department name.

SELECT 
  de.emp_no,
  d.dept_name,
  e.last_name,
  e.first_name
FROM dept_employees de
JOIN departments d ON de.dept_no = d.dept_no
JOIN employees e ON de.emp_no = e.emp_no
WHERE de.dept_no = 'd007' OR de.dept_no = 'd005';

-- #8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT e.last_name, COUNT(*) AS "Number of each last name" 
FROM employees e
GROUP BY e.last_name
ORDER BY "Number of each last name" DESC;

SELECT ti.title, s.salaries 
FROM titles ti
JOIN employees e 
ON ti.title_id = e.emp_title
JOIN salaries s 
ON s.emp_no = e.emp_no
GROUP BY ti.title, s.salaries

