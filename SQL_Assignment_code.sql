use employees; 

#################### Part One #########################
#Problem One
Select *
FROM departments;

#Problem Two
Select emp_no, dept_no, to_date
FROM dept_emp;

#Problem Three
Select emp_no, salary 
FROM salaries
where salary > 10000;

#Problem Four
select emp_no, birth_date, hire_date, gender
from employees
where (birth_date < '1970-01-01' AND hire_date > '1950-01-01')
or gender = 'F';

#Problem Five
select emp_no as employees, birth_date as birthdate
from employees;

#Problem Six
select concat(first_name, last_name) as names
from employees;

#Problem Seven
Select emp_no, salary,
Case WHEN salary <= 35000 then 'underpaid'
	when salary >= 80000 then  'overpaid'
    else 'paid'
    END as 'paymentStatus'
from salaries;

#Problem Eight
Select * from employees
limit 10;

#Problem Nine
Select emp_no, Salary, from_date
From salaries
where from_date IN('1986-06-26', '1989-12-01');

#Problem Ten
select emp_no, first_name, last_name
from employees
where (first_name like '%geor%' or last_name like '%bam%');

######################### Part Two ###########################

#Problem One
Select emp_no, gender, hire_date
FROM employees
where gender = 'M'
ORDER BY hire_date asc;

#Problem Two
Select s.emp_no, s.salary, e.gender
FROM salaries s, employees e
WHERE e.emp_no = s.emp_no
ORDER BY e.gender, s.salary desc;

#Problem Three
Select first_name, last_name, datediff(hire_date, birth_date)/365
AS age_hire
FROM employees
where gender = 'M';

#Problem 4
Select first_name, last_name, datediff(hire_date, birth_date)/365
AS age_hire
FROM employees
WHERE datediff(hire_date, birth_date)/365 > 28;			

########################## Part Three #############################
#Problem 1
Select emp_no as Employee_and_dept, dept_no
FROM dept_emp
WHERE dept_no = 'd005'
UNION ALL 
	Select dept_name, dept_no
    FROM departments;
    
#Problem Two
Select e.emp_no, s.salary
FROM employees e, salaries s
where e.emp_no = s.emp_no;

#Problem Three
Select emp_no
FROM employees
where emp_no NOT In (select emp_no from dept_manager);

#Problem Four
Select count(emp_no) as total_employees, sum(salary) 
	   as total_salary, avg(salary) as average_salary
FROM salaries;

######################### Part Four #########################

#Problem One
Insert into employees (emp_no, birth_date, first_name,
			last_name, gender, hire_date)
			Values ('9108','1990-03-14', 'Caleb', 'Blankenship',
            'M', '2019-03-01');

#Problem Two
Insert INTO dept_manager (emp_no, dept_no, from_date, to_date)
Select emp_no, dept_no, from_date, to_date
from dept_emp
where emp_no in ('9108');

#Problem Three
UPDATE salaries
set salary = salary*1.10
where emp_no = '10001';

#Problem Four
Delete FROM employees where emp_no = '9108';



            