{% macro replace_nulls_mac(column_name)%}
    coalesce({{ quote_identifier(column_name) }}, 'unknown')
{% endmacro %}