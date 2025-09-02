WITH 
avg_salary_company AS(
       SELECT AVG(s1.salary) AS avg_salary_com
       FROM salaries AS s1),
avg_dept_salary AS(
       SELECT de.dept_no, dept_name,AVG(s.salary) AS avg_salary_dep
       FROM salaries AS s
	   INNER JOIN dept_emp AS de ON(de.emp_no=s.emp_no)
       INNER JOIN departments AS d ON(de.dept_no=d.dept_no)
       GROUP BY dept_no, dept_name)
SELECT *
FROM avg_salary_company AS ac
CROSS JOIN avg_dept_salary 
WHERE avg_salary_dep > avg_salary_com
ORDER BY avg_salary_dep;