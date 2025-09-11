{% macro quote_identifier(identifier) %}
    {% if target.type == 'snowflake' or target.type == 'redshift' or target.type == 'postgres' %}
        "{{ identifier }}"
    {% elif target.type == 'bigquery' %}
        `{{ identifier }}`
    {% else %}
        {{ identifier }}
    {% endif %}
{% endmacro %}