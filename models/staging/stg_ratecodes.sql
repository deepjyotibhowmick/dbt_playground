with src as (SELECT RateCodeID,RateCode,IsApproved,current_timestamp() as UTS
 FROM {{ ref('RateCodes')}})
select * from src