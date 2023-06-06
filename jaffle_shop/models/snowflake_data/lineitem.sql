with li as(
    select * from {{ source('snowflake_data', 'lineitem') }}
)
select * from li