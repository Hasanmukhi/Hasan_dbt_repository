{{config (materialized='table')}}

with dedup as (
    select * from (select *, row_number()over (partition by doctor_name order by doctor_id) as rnk 
    from {{source('stg_to_trg','DOC_OLDDATA')}} )
)

select * from  dedup
where rnk>1

