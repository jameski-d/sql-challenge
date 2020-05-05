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