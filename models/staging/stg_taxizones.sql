with src as (SELECT LocationID,Borough,Zone,service_zone,current_timestamp() as UTS
 FROM {{ ref('TaxiZones')}})
select * from src