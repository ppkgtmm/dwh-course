TRUNCATE TABLE staging.dim_product;

INSERT INTO staging.dim_product (product_id, product_name, category, subcategory)
SELECT product_id, product_name, category, subcategory
FROM public.products;
