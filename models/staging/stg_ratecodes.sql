{{ config(materialized= 'table')}}

SELECT RateCodeID,RateCode,IsApproved,current_timestamp() as UTS
 FROM {{ source('dbt_learning', 'T_RateCodes') }}
 
