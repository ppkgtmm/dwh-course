CREATE TABLE products (
    product_id varchar(5),
    product_name varchar(100),
    category varchar(50),
    subcategory varchar(50)
   );
   
   
   

SELECT * FROM products  

SELECT distinct 
category
FROM products

SELECT distinct 
category
into category
FROM products

select category 
from category


select 
category 
,row_number() over (order by category)
from category


select 
row_number() over (order by category) as category_id
,category 
from category

select 
row_number() over (order by category) as category_id
,category 
into category
from category


select 
row_number() over (order by category) as category_id
,category 
into category_table
from category


select * from
category_table
