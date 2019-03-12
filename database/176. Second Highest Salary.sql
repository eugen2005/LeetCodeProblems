/* First solution */
select max(salary) SecondHighestSalary
from
(select rownum rn, salary
from
(select distinct salary
from employee
order by salary desc)
)
where rn = 2

/* Second way to solve the problem */
select max(salary) SecondHighestSalary from 
(select salary, dense_rank() over (order by salary desc) N
from employee)
where N = 2;

/* Solution from forum*/
SELECT max(Salary)
FROM Employee
WHERE Salary < (SELECT max(Salary) FROM Employee)

/* Accepted solution */
SELECT DISTINCT
    Salary AS SecondHighestSalary
FROM
    Employee
ORDER BY Salary DESC
LIMIT 1 OFFSET 1
