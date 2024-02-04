select
    id as transaction_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    amount / 100 as amount,
    created,
    _batched_at as time_stamp

from {{ source('stripe','payment') }}