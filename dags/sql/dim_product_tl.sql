WITH transformed AS (
    SELECT product_id, 
    array_to_string(
        ARRAY(
            SELECT x
            FROM unnest(string_to_array(REPLACE(product_name, '	', ' '), ' ')) x
            WHERE x != ''
        ),
        ' '
    ) product_name, 
    category, 
    subcategory, 
    substring(product_name FROM '.* \((.*)\)') brand
    FROM staging.dim_product
)

merge into core.dim_product cp
using staging.dim_product sp
on cp.product_id = sp.product_id
when matched then 
    update set (product_id, product_name, category, subcategory, brand) = 
    (sp.product_id, sp.product_name, sp.category, sp.subcategory, sp.brand)
when not matched then
    insert (product_id, product_name, category, subcategory, brand) 
    values (sp.product_id, sp.product_name, sp.category, sp.subcategory, sp.brand);

