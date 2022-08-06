SELECT COALESCE(payment, 'cash') AS payment, loyalty_card
FROM staging.sales
GROUP BY 1, 2