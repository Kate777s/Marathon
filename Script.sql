select 
 "FirstName",
 "LastName",
 "BibNumber",
 "CountryCode"
 from 
  "User" u 
  join 
   "Runner" r on u."Email" = r."Email" 
     join
   "Registration" r2 on r."RunnerId" = r2."RunnerId" 
   join
   "RegistrationEvent" re on r2."RegistrationId" = re."RegistrationId" 
 