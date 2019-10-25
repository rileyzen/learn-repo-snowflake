{% set property_types = dbt_utils.get_column_values(
  table = ref('stg_airbnb_listings'),
  column = 'property_type'
) %}



with listing as(

  select * from {{ref('stg_airbnb_listings')}}

),

pivoted as(
  select

      neighbourhood,

      {%- for property_type in property_types -%}

          {%- set property_type_cleaned =
              property_type | lower | replace(' ','_') | replace('/','_')
          %}


      sum(case when property_type = '{{property_type}}'
          then 1 else 0 end) as {{clean_this(property_type)}}_count {{- ',' if not loop.last -}}
          
      {% endfor %}

  from listing
  group by 1
)

select * from pivoted
