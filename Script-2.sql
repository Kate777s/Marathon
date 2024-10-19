select 
 "Gender",
 extract(year from age("DateOfBirth")) as "Age",
 e."EventName"
from 
	"Runner" r
join
   "Registration" r2 on r."RunnerId" = r2."RunnerId" 
join
   "RegistrationEvent" re on r2."RegistrationId" = re."RegistrationId" 
join
"Gender" g on r."GenderId" = g."GenderId" 
join 
"Event" e on re."EventId" = e."EventId" 

