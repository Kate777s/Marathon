select 
 "MarathonName",
 to_char( (re."RaceTime" ||'seconds')::interval, 'HH24:MI:SS' ), 
 e."EventName",
  RANK() OVER (PARTITION BY e."EventId" ORDER BY re."RaceTime" ASC) AS "Position",
  RANK() OVER (PARTITION BY e."EventId", g."GenderId" ORDER BY re."RaceTime" ASC) AS "PositionGender"
from 
	"Marathon" m 
join
"Event" e on e."MarathonId" = m."MarathonId"
join
  "RegistrationEvent" re on e."EventId" = re."EventId"
 join
 "Gender" g on g."GenderId" = g."GenderId"
where e."MarathonId" = '3' and re."RaceTime" != 0
