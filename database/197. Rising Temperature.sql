select a.id
from Weather a
join Weather b on b.RecordDate = a.RecordDate - 1
and b.Temperature < a.Temperature;