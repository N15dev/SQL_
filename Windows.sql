use practice3;

CREATE TABLE employees5 (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees5 VALUES
(1, 'Amit', 'HR', 50000),
(2, 'Neha', 'HR', 60000),
(3, 'Raj', 'HR', 60000),
(4, 'Simran', 'HR', 45000),

(5, 'Karan', 'IT', 80000),
(6, 'Riya', 'IT', 90000),
(7, 'Vikram', 'IT', 85000),
(8, 'Anjali', 'IT', 90000),

(9, 'Arjun', 'Finance', 70000),
(10, 'Priya', 'Finance', 75000),
(11, 'Suresh', 'Finance', 72000),
(12, 'Meena', 'Finance', 75000);

select emp_name,department,salary
from (
select *,
DENSE_RANK() over(partition by department order by salary desc) as top_sales
from employees5) t
where top_sales<=3;

select top 3 * from employees5
order by salary desc;

-- aletnate approach
select emp_name,department,salary from
(
select *,
row_number() over(order by salary desc) as top_sales
from employees5) t
where top_sales<=3;

