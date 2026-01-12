SELECT LocationID,Borough,Zone,service_zone,current_timestamp() as UTS
 FROM {{ source('dbt_learning', 'T_TaxiZones') }} 
