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
    trip_id,
    subscriber_type,
    bikeid,
    start_time,
    start_station_name,
    end_station_name,
    duration_minutes
FROM
    {{ source('austin_bikeshare', 'trips')}}
