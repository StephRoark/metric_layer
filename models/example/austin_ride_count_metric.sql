-- depends_on: {{ ref('austin_rides') }}

select *
from
    {{ metrics.metric(
        metric_name='ride_count',
        grain='week',
        dimensions=['start_station_name','end_station_name'],
    ) }}
