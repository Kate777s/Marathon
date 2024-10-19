SELECT
    COUNT(DISTINCT r."RunnerId") AS TotalRunners,
     RANK() OVER (PARTITION BY e."EventId" ORDER BY re."RaceTime" ASC) AS "Position",
    TO_CHAR(AVG(re."RaceTime") * INTERVAL '1 second', 'HH24:MI:SS') AS AvgRaceTimeFormatted, 
    AVG(re."RaceTime") AS AvgRaceTimeSeconds,  
    u."FirstName",
    u."LastName",
    c."CountryName"
FROM
    "Registration" r
left JOIN
    "RegistrationEvent" re ON r."RegistrationId" = re."RegistrationId"
left JOIN
    "Event" e ON re."EventId" = e."EventId"
left JOIN
    "Runner" r2 ON r."RunnerId" = r2."RunnerId"
left JOIN
    "Gender" g ON r2."GenderId" = g."GenderId"
left JOIN
    "Marathon" m ON e."MarathonId" = m."MarathonId"
left JOIN
    "Country" c ON m."CountryCode" = c."CountryCode"
left JOIN
    "User" u on r2."Email" = u."Email" 
WHERE
    re."RaceTime" != 0
GROUP BY
    e."EventName", u."FirstName", u."LastName", c."CountryName", re."RaceTime", e."EventId" 
ORDER BY
    c."CountryName", u."LastName", u."FirstName" 
