select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      with relation_columns as (

        
        select
            cast('CUSTOMER_ID' as string) as relation_column,
            cast('STRING' as string) as relation_column_type
        union all
        
        select
            cast('CUSTOMER_UNIQUE_ID' as string) as relation_column,
            cast('STRING' as string) as relation_column_type
        union all
        
        select
            cast('CUSTOMER_ZIP_CODE_PREFIX' as string) as relation_column,
            cast('INT64' as string) as relation_column_type
        union all
        
        select
            cast('CUSTOMER_CITY' as string) as relation_column,
            cast('STRING' as string) as relation_column_type
        union all
        
        select
            cast('CUSTOMER_STATE' as string) as relation_column,
            cast('STRING' as string) as relation_column_type
        
        
    ),
    test_data as (

        select
            *
        from
            relation_columns
        where
            relation_column = 'CUSTOMER_ZIP_CODE_PREFIX'
            and
            relation_column_type not in ('INT64')

    )
    select *
    from test_data
      
    ) dbt_internal_test