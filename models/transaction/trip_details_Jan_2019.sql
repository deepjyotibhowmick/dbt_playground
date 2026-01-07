WITH TRIP AS (SELECT * FROM {{ref('stg_yellow_tripdata_201901')}})

,RATE AS (SELECT RateCodeID,RateCode  FROM {{ref('stg_ratecodes')}})

,ZONE AS (SELECT LocationID,Zone FROM {{ref('stg_taxizones')}})

SELECT T.VendorID, T.tpep_pickup_datetime, T.tpep_dropoff_datetime
,  {{dbt.datediff('T.tpep_pickup_datetime' ,'T.tpep_dropoff_datetime', 'minute')}} as TRAVEL_TIME_MINUTES
,T.passenger_count,T.trip_distance,R.RateCode,T.total_amount,Z2.ZONE AS PICKUP_LOCATION, Z1.ZONE AS DROP_LOCATION
FROM TRIP T INNER JOIN RATE R ON  T.RatecodeID=R.RateCodeID
INNER JOIN ZONE Z1  
ON T.DOLocationID=Z1.LocationID
INNER JOIN ZONE Z2  
ON T.PULocationID=Z2.LocationID 
where T.total_amount>50