with
    source_data as (
        select
           customer_id		
           ,company_name as customer_name		
           ,contact_name		
           ,contact_title	
           ,address		
           ,city		
           ,region		
           ,postal_code	
           ,country		
           ,phone		
           ,fax	

        from {{ source('erpnorthwind20211008','public_customers') }}
    )

select * from source_data