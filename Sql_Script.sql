-- 1. Total revenue per day
select order_date, sum(total_amount) as daily_revenue
from fact_sales
group by 1 order by 1;

-- 2. Top 5 products by revenue (last 30 days - disesuaikan dengan data)
select product_id, sum(total_amount) as revenue
from fact_sales
where order_date >= (select max(order_date) - 30 from fact_sales)
group by 1 order by 2 desc limit 5;

-- 3. Monthly active customers
select date_trunc('month', order_date) as month, count(distinct customer_id) as active_customers
from fact_sales
group by 1 order by 1;

-- 4. Average order value (AOV) per customer
select date_trunc('month', order_date) as month, count(distinct customer_id) as active_customers
from fact_sales
group by 1 order by 1;

-- 5. Data anomaly check
select * from fact_sales
where price <= 0 
   or customer_id is null;
