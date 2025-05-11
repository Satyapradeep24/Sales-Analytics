select 
    year(order_date) as year,
    month(order_date) as month,
    sum(quantity * price) as total_revenue
from sales
group by year(order_date), month(order_date)
order by year, month;

select 
    p.product_name,
    sum(s.quantity * s.price) as revenue
from sales s
join products p on s.product_id = p.product_id
group by p.product_name
order by revenue desc
limit 5;

select 
    c.name,
    count(s.order_id) as total_orders,
    sum(s.quantity * s.price) as total_spent
from customers c
join sales s on c.customer_id = s.customer_id
group by c.customer_id
order by total_orders desc;

select 
    c.region,
    sum(s.quantity * s.price) as region_sales
from sales s
join customers c on s.customer_id = c.customer_id
group by c.region
order by region_sales desc;

select 
    product_name,
    stock_quantity
from products
where stock_quantity < 50
order by stock_quantity asc;

select 
    c.name,
    count(distinct s.order_id) as orders
from customers c
join sales s on c.customer_id = s.customer_id
group by c.customer_id
having orders > 1
order by orders desc;
