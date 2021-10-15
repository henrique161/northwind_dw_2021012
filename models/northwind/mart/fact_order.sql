{{ config(materialized='table') }}

with 
    customers as (
        select
        customer_sk
        ,customer_id
        ,customer_name
        from {{ref('dim_customers')}}
    )

, products as (
        select
        product_id
        ,product_name
        from {{ref('dim_product')}}
    )

, orders_with_sk as (
        select
        orders.order_id
        , customers.customer_id
        , customer_name
        , orders.order_date
        , orders.ship_region
        , orders.shipped_date
        , orders.ship_country
        , orders.ship_address
        , orders.ship_postal_code
        , orders.ship_city
        , orders.ship_name
        , orders.freight
        , orders.required_date 

    from {{ref('stg_orders')}} orders
    left join customers customers on orders.customer_id = customers.customer_id
)

, shippers as (
        select
        shipper_sk
        ,shipper_id
        ,shipper_name
        from {{ref('dim_shipper')}}
    )

select  order_id
        , customer_id
        , customer_name
        , product_id
        , product_name
        , order_date
        , shipper_id
        , shipper_name
        , ship_region
        , shipped_date
        , ship_country
        , ship_address
        , ship_postal_code
        , ship_city
        , ship_name
        , freight
        , required_date 
from products, orders_with_sk, shippers