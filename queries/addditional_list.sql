SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

SELECT * FROM salaries
ORDER BY to_date DESC;

SELECT emp_no, first_name, last_name, gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT
	e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.gender, 
	s.salary, 
	de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

SELECT dm.dept_no,
	d.dept_name,
	dm.emp_no,
	ce.last_name,
	ce.first_name,
	dm.from_date,
	dm.to_date
INTO manager_info
FROM dept_manager as dm
	INNER JOIN departments as d
		ON (dm.dept_no = d.dept_no)
	INNER JOIN current_emp as ce
		on (dm.emp_no = ce.emp_no);
		
SELECT * FROM manager_info;
		
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp as de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no);
SELECT * FROM dept_info;
		
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	di.dept_name
FROM retirement_info as ri
	LEFT JOIN dept_info as di
	ON (ri.emp_no = di.emp_no)	
WHERE di.dept_name = 'Sales';

SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	di.dept_name
FROM retirement_info as ri
	LEFT JOIN dept_info as di
	ON (ri.emp_no = di.emp_no)	
WHERE di.dept_name IN ('Sales', 'Development');