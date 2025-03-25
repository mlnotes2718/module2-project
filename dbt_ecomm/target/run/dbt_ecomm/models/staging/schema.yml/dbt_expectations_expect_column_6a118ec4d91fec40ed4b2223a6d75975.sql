select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      with relation_columns as (

        
        select
            cast('PRODUCT_ID' as string) as relation_column,
            cast('STRING' as string) as relation_column_type
        union all
        
        select
            cast('PRODUCT_CATEGORY_NAME' as string) as relation_column,
            cast('STRING' as string) as relation_column_type
        union all
        
        select
            cast('PRODUCT_WEIGHT_G' as string) as relation_column,
            cast('FLOAT64' as string) as relation_column_type
        union all
        
        select
            cast('PRODUCT_LENGTH_CM' as string) as relation_column,
            cast('FLOAT64' as string) as relation_column_type
        union all
        
        select
            cast('PRODUCT_HEIGHT_CM' as string) as relation_column,
            cast('FLOAT64' as string) as relation_column_type
        union all
        
        select
            cast('PRODUCT_WIDTH_CM' as string) as relation_column,
            cast('FLOAT64' as string) as relation_column_type
        
        
    ),
    test_data as (

        select
            *
        from
            relation_columns
        where
            relation_column = 'PRODUCT_WIDTH_CM'
            and
            relation_column_type not in ('FLOAT64')

    )
    select *
    from test_data
      
    ) dbt_internal_test