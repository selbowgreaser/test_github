WITH x AS (SELECT
        departments.dept_no AS department_no,
        round(avg(salary), 2) AS average_salary
    FROM departments
    JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
    JOIN salaries s ON dept_emp.emp_no = s.emp_no
    WHERE dept_emp.to_date > sysdate()
    GROUP BY departments.dept_no)
SELECT
    x.department_no AS department_no,
    x.average_salary AS average_salary,
    concat(e.first_name, ' ', e.last_name) AS department_manager
FROM x
JOIN dept_manager dm ON x.department_no = dm.dept_no
JOIN employees e on e.emp_no = dm.emp_no
WHERE dm.to_date > sysdate();
