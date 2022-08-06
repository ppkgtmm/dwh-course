-- Setting up source data

CREATE TABLE public.sales
(
    transaction_id integer,
    transactional_date timestamp,
   product_id character varying,
    customer_id integer,
    payment character varying,
    credit_card bigint,
    loyalty_card character varying,
    cost character varying,
    quantity integer,
    price numeric,
    PRIMARY KEY (transaction_id)
);

SELECT * FROM public.sales;
