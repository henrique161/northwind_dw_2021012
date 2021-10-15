with
    source_data as (
        select
        supplier_id		
        ,company_name as supplier_name		
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

        from {{ source('erpnorthwind20211008','public_suppliers') }}
    )

select * from source_data