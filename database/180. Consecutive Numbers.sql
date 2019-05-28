select distinct ConsecutiveNums
from
(select num ConsecutiveNums, row_number() over(order by id) - dense_rank() over(partition by num order by id) seqnum, row_number() over(order by id) idn
from Logs l) t
group by seqnum, ConsecutiveNums
having count(idn) > 2;

/* recomended solution */
SELECT distinct l1.num
FROM
    Logs l1,
    Logs l2,
    Logs l3
WHERE
    l1.id = l2.id - 1
    AND l2.id = l3.id - 1
    AND l1.num = l2.num
    AND l2.num = l3.num;

/* solution from forum */
SELECT DISTINCT num
FROM
(
SELECT num,LEAD(num) OVER(ORDER BY id) AS lead, LAG(num) OVER (ORDER BY id) AS lag
FROM Logs
)t
WHERE num=lead and num=lag;