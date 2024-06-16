/*  Que 1) Retrieve the total number of orders placed.*/
SELECT 
    COUNT(order_id) AS Toatl_Orders
FROM
    orders

/*  Que 2) Calculate the total revenue generated from pizza sales.*/
SELECT 
    CAST(SUM(p.price * od.quantity) AS DECIMAL (10 , 2 )) AS total_revenue
FROM
    pizzas AS p
        INNER JOIN
    order_details AS od ON od.pizza_id = p.pizza_id;

/*  Que 3) Identify the highest-priced pizza.*/
SELECT 
    pt.name, p.price AS price
FROM
    pizza_types AS pt
        INNER JOIN
    pizzas AS p ON pt.pizza_type_id = p.pizza_type_id
ORDER BY price DESC
LIMIT 1


/*  Que 4) Identify the most common pizza size ordered.*/
SELECT 
    p.size, COUNT(od.order_details_id)
FROM
    pizzas AS p
        INNER JOIN
    order_details AS od ON p.pizza_id = od.pizza_id
GROUP BY p.size
ORDER BY COUNT(od.order_details_id) DESC
LIMIT 1



/* Que 5) List the top 5 most ordered pizza types along with their quantities. */
SELECT 
    pt.name AS pizza_name, SUM(od.quantity) AS total_orders
FROM
    pizza_types AS pt
        INNER JOIN
    pizzas AS p ON pt.pizza_type_id = p.pizza_type_id
        INNER JOIN
    order_details AS od ON od.pizza_id = p.pizza_id
GROUP BY pt.name
ORDER BY total_orders DESC
LIMIT 5;


/*  Que 6) Join the necessary tables to find the total quantity of each pizza category ordered. */
SELECT 
    pt.category AS category, SUM(od.quantity) AS total_orders
FROM
    order_details AS od
        JOIN
    pizzas AS p ON od.pizza_id = p.pizza_id
        JOIN
    pizza_types AS pt ON pt.pizza_type_id = p.pizza_type_id
GROUP BY 1


/*  Que 7) Determine the distribution of orders by hour of the day.*/
SELECT 
    HOUR(time) AS hours, COUNT(order_id)
FROM
    orders
GROUP BY 1


/* Que 8) Join relevant tables to find the category-wise distribution of pizzas. */
SELECT 
    category, COUNT(name)
FROM
    pizza_types
GROUP BY 1

/* Que 9) Group the orders by date and calculate the average number of pizzas ordered per day. */
SELECT 
    ROUND(AVG(quantity), 0) AS avg_pizza_order_per_day
FROM
    (SELECT 
        o.date, SUM(od.quantity) AS quantity
    FROM
        order_details AS od
    JOIN orders AS o ON o.order_id = od.order_id
    GROUP BY 1) AS order_quantity;
    
   /*  Que 10) Determine the top 3 most ordered pizza types based on revenue.  */ 
SELECT 
    p.pizza_type_id AS pizza_type,
    SUM(od.quantity * p.price) AS revenue
FROM
    pizzas AS p
        JOIN
    order_details AS od ON p.pizza_id = od.pizza_id
GROUP BY p.pizza_type_id
ORDER BY revenue DESC
LIMIT 3;


/*  Que 11) Calculate the percentage contribution of each pizza type to total revenue. */
with tr as(
select sum(od.quantity * p.price) as total_revenue from order_details as od
join pizzas as p on od.pizza_id =p.pizza_id
)
SELECT 
    pt.category AS pizza_category,
    (SUM(od.quantity * p.price)/(select total_revenue from tr))*100 AS revenue_share
FROM
    pizzas AS p
        JOIN
    order_details AS od ON p.pizza_id = od.pizza_id
    join pizza_types as pt on p.pizza_type_id =pt.pizza_type_id
GROUP BY pt.category
ORDER BY revenue_share DESC



/* Que 12) Analyze the cumulative revenue generated over time. */
SELECT 
    date,
    SUM(revenue) OVER (ORDER BY date) AS cum_sum
FROM 
    (SELECT 
         o.date,
         SUM(od.quantity * p.price) AS revenue
     FROM 
         order_details AS od
     JOIN 
         pizzas AS p ON od.pizza_id = p.pizza_id
     JOIN 
         orders AS o ON o.order_id = od.order_id
     GROUP BY 
         o.date) AS revenue_per_date;






    

