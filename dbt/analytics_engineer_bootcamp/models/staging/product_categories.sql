with source as (
      select * from {{ source('SAP Finance', 'productcategories') }}
),
renamed as (
    select
        {{ adapter.quote("PRODCATEGORYID") }},
        {{ adapter.quote("LANGUAGE") }},
        {{ adapter.quote("CREATEDBY") }},
        CONVERT(DATETIME,CONVERT(CHAR(8), CREATEDAT)) AS CREATEDAT,
        {{ adapter.quote("CHANGEDBY") }},
        {{ adapter.quote("CHANGEDAT") }}
    from
        source
)
select * from renamed