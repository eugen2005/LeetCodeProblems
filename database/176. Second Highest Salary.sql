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