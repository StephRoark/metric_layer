-- depends_on: {{ ref('austin_rides') }}

{{ config(
    materialized='table',
    partition_by={
      "field": "period",
      "data_type": "date",
      "granularity": "year"
    }
) }}

select *
from
    {{ metrics.metric(
        metric_name='ride_count',
        grain='month',
        dimensions=['start_station_name','end_station_name'],
    ) }}
where period between DATE('2019-01-01') and DATE('2022-12-31')
