select
    id as order_id,
    user_id as customer_id,
    order_date,
    status
from {{ source('jaffle_shop', 'orders') }}
{{load_dev_data(column_name='_etl_loaded_at', dev_days_of_data=1000)}}
