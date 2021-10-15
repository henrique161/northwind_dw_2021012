{{ config(materialized='table') }}

with
    staging as (
        select *
        from {{ ref('stg_suppliers') }}
)
    , transformed as (
        select


           row_number() over (order by supplier_id) as supplier_sk -- auto incremental surrogate key
           ,supplier_id		
           ,supplier_name		
           ,contact_name		
           ,contact_title		
           ,address		
           ,city		
           ,region		
           ,postal_code		
           ,country		
           ,phone		
           ,fax		
           ,homepage	
        from staging     
)

select * from transformed