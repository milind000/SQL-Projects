# SQL-Projects

📊 E‑Commerce Sales & Customer Analytics (SQL)

Objective: 
Use SQL to analyze e‑commerce transaction data, uncovering insights into sales trends, customer behavior, and product performance.



🧾 Data Overview

Tables:

customers: customer_id, country  
orders: order_id, customer_id, order_date  
products: product_id, product_name, price  
order_items: order_item_id, order_id, product_id, quantity  



🛠 Tools & Technologies

- SQL (PostgreSQL or MySQL)
- Optional: Power BI or Tableau


 📊 Key SQL Queries

1. Monthly Revenue Trends  
2. Top 5 Customers by Revenue  
3. Best-Selling Products by Quantity  
4. First-Time vs Repeat Buyers  
5. Revenue by Country or Category  

 📁 Project Structure

ecommerce-sql-analysis/
├── README.md
├── ecommerce\_er\_diagram.png
├── data/
│   ├── customers.csv
│   ├── products.csv
│   ├── orders.csv
│   └── order\_items.csv
├── sql\_queries/
│   └── \*.sql
└── dashboard/
└── ecommerce\_dashboard.pbix (optional)

 📈 Sample Insights

- 📅 March 2021 revenue peaked at ₹2.5M  
- 🧑‍💼 Top spender “Jane Doe” with ₹95K purchases  
- 🛒 “Home & Garden” drove 42% of total sales  

---

🎯 Business Relevance

- Reveals peak sales and customer segmentation  
- Highlights top-performing products and countries  
- Demonstrates SQL skills with joins, CTEs, and aggregations  

📚 Dataset

- Based on `Sales Transaction v.4a.csv`  
- Normalized into customers, orders, products, and order_items  


 🖼 ER Diagram

![ER Diagram]()


