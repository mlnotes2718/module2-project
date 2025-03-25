with relation_columns as (

        
        select
            cast('ORDER_ID' as string) as relation_column,
            cast('STRING' as string) as relation_column_type
        union all
        
        select
            cast('PAYMENT_SEQUENTIAL' as string) as relation_column,
            cast('INT64' as string) as relation_column_type
        union all
        
        select
            cast('PAYMENT_TYPE' as string) as relation_column,
            cast('STRING' as string) as relation_column_type
        union all
        
        select
            cast('PAYMENT_INSTALLMENTS' as string) as relation_column,
            cast('INT64' as string) as relation_column_type
        union all
        
        select
            cast('PAYMENT_VALUE' as string) as relation_column,
            cast('FLOAT64' as string) as relation_column_type
        
        
    ),
    test_data as (

        select
            *
        from
            relation_columns
        where
            relation_column = 'PAYMENT_INSTALLMENTS'
            and
            relation_column_type not in ('INT64')

    )
    select *
    from test_data