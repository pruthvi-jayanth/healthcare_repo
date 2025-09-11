{% macro transform_gender(column_name) %}
    case lower({{ quote_identifier(column_name) }})
        when 'male' then 'M'
        when 'm' then 'M'
        when 'female' then 'F'
        when 'f' then 'F'
        else 'others'
    end
{% endmacro %}