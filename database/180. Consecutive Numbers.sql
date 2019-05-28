select distinct ConsecutiveNums
from
(select num ConsecutiveNums, row_number() over(order by id) - dense_rank() over(partition by num order by id) seqnum, row_number() over(order by id) idn
from Logs l) t
group by seqnum, ConsecutiveNums
having count(idn) > 2;