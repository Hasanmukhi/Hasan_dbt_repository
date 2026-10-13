{{config (materialized='table')}}


select max(salary) as secondmax from {{source('stg_to_trg','empsal')}}
where salary<(select max(salary) from {{source('stg_to_trg','empsal')}})

