with relation_columns as (

        
        select
            cast('ORDER_ID' as string) as relation_column,
            cast('STRING' as string) as relation_column_type
        union all
        
        select
            cast('CUSTOMER_ID' as string) as relation_column,
            cast('STRING' as string) as relation_column_type
        union all
        
        select
            cast('ORDER_STATUS' as string) as relation_column,
            cast('STRING' as string) as relation_column_type
        union all
        
        select
            cast('ORDER_PURCHASE_TIMESTAMP' as string) as relation_column,
            cast('DATETIME' as string) as relation_column_type
        union all
        
        select
            cast('ORDER_APPROVED_AT' as string) as relation_column,
            cast('DATETIME' as string) as relation_column_type
        union all
        
        select
            cast('ORDER_DELIVERED_CARRIER_DATE' as string) as relation_column,
            cast('DATETIME' as string) as relation_column_type
        union all
        
        select
            cast('ORDER_DELIVERED_CUSTOMER_DATE' as string) as relation_column,
            cast('DATETIME' as string) as relation_column_type
        union all
        
        select
            cast('ORDER_ESTIMATED_DELIVERY_DATE' as string) as relation_column,
            cast('DATETIME' as string) as relation_column_type
        
        
    ),
    test_data as (

        select
            *
        from
            relation_columns
        where
            relation_column = 'ORDER_DELIVERED_CUSTOMER_DATE'
            and
            relation_column_type not in ('DATETIME')

    )
    select *
    from test_data