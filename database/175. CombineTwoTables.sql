select FirstName, LastName, City, State
from person a
left join address b on b.PersonId = a.PersonId;