{% macro calculate_gross_sales(price_col, discount_col, tax_col) %}
    -- Calculates gross sales after applying a discount and tax.
    -- Arguments:
    --   price_col: column containing price
    --   discount_col: column containing discount in decimal, e.g. 0.1 = 10%
    --   tax_col: column containing tax rate in decimal, e.g. 0.2 = 20%
    (COALESCE({{ price_col }}, 0) * (1 - COALESCE({{ discount_col }}, 0)) * (1 + COALESCE({{ tax_col }}, 0)))
{% endmacro %}
