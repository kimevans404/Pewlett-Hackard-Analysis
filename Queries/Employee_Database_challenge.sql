-- Deliverable 1: The Number of Retiring Employees by Title

-- Create a new table merging data from the employees and titles tables, ordered by the employee number.
		
SELECT employees.emp_no, 
	employees.first_name, 
	employees.last_name, 
	titles.title, 
	titles.from_date, 
	titles.to_date
INTO Retirement_Titles
FROM Employees 
INNER JOIN titles ON employees.emp_no = titles.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT * From Retirement_Titles
ORDER BY emp_no ASC;

-- create new table using Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO Unique_Titles
FROM Retirement_Titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- create a new table to hold the number of titles in descending order.

SELECT count(title), title
INTO retiring_titles
FROM Unique_Titles
GROUP BY title
ORDER BY count(title) DESC;


-------------------------------------------------------------------------------------------------------------


-- Deliverable 2: The Employees Eligible for the Mentorship Program

-- Create a new table for employees eligible for mentorship, sorted by the employee number.

SELECT distinct on (employees.emp_no) employees.emp_no, 
	employees.first_name, 
	employees.last_name, 
	employees.birth_date,
	dept_emp.from_date,
	dept_emp.to_date,
	titles.title
INTO Mentorship
FROM Employees 
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN titles ON employees.emp_no = titles.emp_no
WHERE dept_emp.to_date = '9999-01-01'
AND employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp_no;
