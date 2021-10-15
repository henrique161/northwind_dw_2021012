{{ config(materialized='table') }}

with
    staging as (
        select *
        from {{ ref('stg_customer') }}
)
    , transformed as (
        select


           row_number() over (order by customer_id) as customer_sk -- auto incremental surrogate key
           ,customer_id		
           ,customer_name		
           ,contact_name		
           ,contact_title	
           ,address		
           ,city		
           ,region		
           ,postal_code	
           ,country		
           ,phone		
           ,fax
        from staging     
)

select * from transformed