with orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}
    where status = 'success'

),

final as (

    SELECT 
    orders.order_id as order_id,
    orders.order_date as order_date,
    orders.customer_id as customer_id,
    coalesce(payments.amount,0) as amount
    
    FROM orders
    LEFT JOIN payments using (order_id)

)

SELECT * FROM final



