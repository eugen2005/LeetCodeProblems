select a.Name Employee
from Employee a
join Employee b on b.Id = a.ManagerId 
and b.Salary < a.Salary;