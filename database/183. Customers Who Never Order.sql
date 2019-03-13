select Name as Customers
from Customers a
left join Orders b on b.CustomerId = a.Id
where b.CustomerId is null;