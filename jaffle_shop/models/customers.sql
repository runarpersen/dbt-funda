{{
  config(
    materialized = 'view',
    )
}}

with customers as(
    select * from {{ ref('stg_customers') }}
),

orders as(
    select * from {{ ref('stg_orders') }}
),

customer_orders as(
    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as last_order_date,
        count(order_id) as number_of_orders
    from orders
    group by 1    
),

final as(
    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.last_order_date
    from customers left join customer_orders using (customer_id)
)
select * from final
