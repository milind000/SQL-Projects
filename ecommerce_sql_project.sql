-- 📊 E-Commerce Sales and Customer Analytics SQL Project
-- Dataset based on Sales Transaction v.4a.csv (cleaned and normalized)

-- 🏗️ Schema Creation

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    country TEXT
);

-- Products Table
CREATE TABLE products (
    product_id TEXT PRIMARY KEY,
    product_name TEXT,
    price NUMERIC
);

-- Orders Table
CREATE TABLE orders (
    order_id TEXT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE
);

-- Order Items Table
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id TEXT REFERENCES orders(order_id),
    product_id TEXT REFERENCES products(product_id),
    quantity INT
);

-- 🛢️ Sample Queries

-- 1. Total Revenue Per Month
SELECT 
    DATE_TRUNC('month', o.order_date) AS month,
    ROUND(SUM(p.price * oi.quantity), 2) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY month
ORDER BY month;

-- 2. Top 5 Customers by Revenue
SELECT 
    c.customer_id,
    c.country,
    ROUND(SUM(p.price * oi.quantity), 2) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.country
ORDER BY total_spent DESC
LIMIT 5;

-- 3. Best-Selling Products by Quantity
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 10;

-- 4. Repeat Customers vs First-Time Buyers
WITH customer_orders AS (
    SELECT 
        customer_id,
        COUNT(DISTINCT order_id) AS order_count
    FROM orders
    GROUP BY customer_id
)
SELECT 
    CASE WHEN order_count > 1 THEN 'Repeat Customer' ELSE 'First-Time Buyer' END AS customer_type,
    COUNT(*) AS count_of_customers
FROM customer_orders
GROUP BY customer_type;

-- 5. Revenue Contribution by Country
SELECT 
    c.country,
    ROUND(SUM(p.price * oi.quantity), 2) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.country
ORDER BY revenue DESC;
