SELECT
    CASE
        WHEN EXTRACT(DAYOFWEEK FROM start_time) = 1 THEN '2. Sun'
        WHEN EXTRACT(DAYOFWEEK FROM start_time) = 2 THEN '3. Mon'
        WHEN EXTRACT(DAYOFWEEK FROM start_time) = 3 THEN '4. Tue'
        WHEN EXTRACT(DAYOFWEEK FROM start_time) = 4 THEN '5. Wed'
        WHEN EXTRACT(DAYOFWEEK FROM start_time) = 5 THEN '6. Thu'
        WHEN EXTRACT(DAYOFWEEK FROM start_time) = 6 THEN '7. Fri'
        WHEN EXTRACT(DAYOFWEEK FROM start_time) = 7 THEN '1. Sat'
        END AS day_of_week,
    COUNT(*) number_of_rides,
    AVG(duration_minutes) as avg_duration
FROM
    {{ source('austin_bikeshare', 'trips')}}
GROUP BY
    day_of_week
ORDER BY
    day_of_week ASC