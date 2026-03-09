Create table Vrinda_Sales_Table(
indexe int,
Order_ID varchar(50),
Cust_ID int,
Gender Varchar(10),
Age int,
Age_Group varchar(20),
date DATE,
month VARCHAR(10),
status VARCHAR(20),
channel VARCHAR(20),
sku VARCHAR(100),
category VARCHAR(50),
sizes VARCHAR(10),
qty INT,
currency VARCHAR(10),
amount INT,
ship_city VARCHAR(100),
ship_state VARCHAR(100),
ship_postal_code INT,
ship_country VARCHAR(10),
b2b BOOLEAN
)
select * from vrinda_sales_table limit 5;

UPDATE vrinda_sales_table
SET channel = 'Myntra'
WHERE channel = 'Menyntra';

UPDATE vrinda_sales_table
SET channel = 'Meesho'
WHERE channel = 'Meneesho';

UPDATE vrinda_sales_table
SET channel = 'Amazon'
WHERE channel = 'AMenazon';

SELECT DISTINCT channel
FROM vrinda_sales_table;

# Total Revenue
SELECT SUM(Amount) AS total_revenue
FROM vrinda_sales_table;

# Total Orders By Channel
SELECT Channel, COUNT(Order_ID) AS total_orders
FROM vrinda_sales_table
GROUP BY Channel
ORDER BY total_orders DESC;

# Revenue by Category
SELECT Category, SUM(Amount) AS total_sales
FROM vrinda_sales_table
GROUP BY Category
ORDER BY total_sales DESC;

# Top 5 States by Sales
SELECT ship_state, SUM(Amount) AS total_sales
FROM vrinda_sales_table
GROUP BY ship_state
ORDER BY total_sales DESC
LIMIT 5;

# Orders By Gender and Age Group
SELECT Gender, Age_Group, COUNT(Order_ID) AS total_orders
FROM vrinda_sales_table
GROUP BY Gender, Age_Group
ORDER BY total_orders DESC;

# Average Order Value By Channel
SELECT Channel, ROUND(AVG(Amount),2) AS avg_order_value
FROM vrinda_sales_table
GROUP BY Channel;

# Delivered vs Other Order Status
SELECT Status, COUNT(*) AS total_orders
FROM vrinda_sales_table
WHERE Status = 'Delivered'
GROUP BY Status;

# Total Quantity Sold By Product Size
SELECT sizes, SUM(qty) AS total_quantity
FROM vrinda_sales_table
GROUP BY sizes
ORDER BY total_quantity DESC;

# Monthly Sales Analysis
SELECT Month, SUM(Amount) AS monthly_sales
FROM vrinda_sales_table
GROUP BY Month
ORDER BY monthly_sales DESC;

# Rank Channels By Sales
SELECT Channel,
SUM(Amount) AS total_sales,
RANK() OVER (ORDER BY SUM(Amount) DESC) AS sales_rank
FROM vrinda_sales_table
GROUP BY Channel;

# Orders Above Average Amount
SELECT order_id, amount
FROM vrinda_sales_table
WHERE amount > (
    SELECT AVG(amount)
    FROM vrinda_sales_table
);

# Top Selling Category per Channel
SELECT channel, category, SUM(amount) AS total_sales
FROM vrinda_sales_table
GROUP BY channel, category
ORDER BY channel, total_sales DESC;

# Age Group Sales Contribution
SELECT age_group, SUM(amount) AS total_sales
FROM vrinda_sales_table
GROUP BY age_group
ORDER BY total_sales DESC;