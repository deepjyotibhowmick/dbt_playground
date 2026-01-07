select TRAVEL_TIME_MINUTES
from {{ref('trip_details_Jan_2019')}}
where TRAVEL_TIME_MINUTES>1000