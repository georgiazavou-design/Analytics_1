{% macro extract_year(date_col) %}
    year({{ date_col }})
{% endmacro %}
