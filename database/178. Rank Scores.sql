select round(Score,2) Score, dense_rank() over(order by Score desc) Rank
from Scores
order by Score desc;