with li as(
    select * from {{ ref('lineitem') }}
),
final as(
    select to_char(l_receiptdate,'yyyymmdd') as periodid, 
        l_linenumber as linenumber, 
        l_quantity as quantity, 
        l_extendedprice as extendedprice 
    from li

)
select * from final
order by 1