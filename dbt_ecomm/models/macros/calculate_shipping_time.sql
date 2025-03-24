-- macros/calculate_shipping_time.sql
{% macro calculate_shipping_time(approved_at, delivered_at) %}
    -- Safe handling of null values
    CASE
        WHEN {{ approved_at }} IS NOT NULL AND {{ delivered_at }} IS NOT NULL
        THEN DATE_DIFF('day', CAST({{ approved_at }} AS TIMESTAMP), CAST({{ delivered_at }} AS TIMESTAMP))
        ELSE NULL
    END
{% endmacro %}