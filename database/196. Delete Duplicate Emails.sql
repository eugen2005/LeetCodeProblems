delete p1
from Person p1
join Person p2 on p2.Email = p1.Email
and p1.Id > p2.Id;

/* Solution from forum */
DELETE FROM Person WHERE Id NOT IN 
(SELECT * FROM(
    SELECT MIN(Id) FROM Person GROUP BY Email) as p);