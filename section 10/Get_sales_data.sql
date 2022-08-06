SELECT s.transaction_id,
s.transactional_date,
EXTRACT('year' FROM s.transactional_date) * 10000 + EXTRACT('month' FROM s.transactional_date) * 100 + 
EXTRACT('day' FROM s.transactional_date) AS transactional_date_fk,
s.product_id,
pr.product_pk AS product_fk,
pm.payment_pk AS payment_fk,
s.customer_id,
s.credit_card,
s.cost,
s.quantity,
s.price,
s.cost * s.quantity AS total_cost,
s.price * s.quantity AS total_price,
(s.price - s.cost) * s.quantity AS profit
FROM staging.sales s LEFT JOIN core.dim_product pr ON s.product_id = pr.product_id
LEFT JOIN core.dim_payment pm ON COALESCE(s.payment, 'cash') = pm.payment and s.loyalty_card = pm.loyalty_card
ORDER BY 1