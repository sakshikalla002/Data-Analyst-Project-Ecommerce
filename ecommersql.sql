SELECT DB_NAME() AS CurrentDatabase;

SELECT name FROM sys.tables;

-- 1. Preview data
SELECT TOP 10 * FROM dbo.olist_order_items_dataset;

-- 2. Total Rows
SELECT COUNT(*) AS TotalRows FROM dbo.olist_order_items_dataset;

-- 3. Basic Data (Order, Product, Price)
SELECT order_id, product_id, price FROM dbo.olist_order_items_dataset;

-- 4. Total Revenue
SELECT SUM(price) AS TotalRevenue
  FROM dbo.olist_order_items_dataset;

  -- 5. Top Selling Products
SELECT product_id, COUNT(*) AS TotalSales
  FROM dbo.olist_order_items_dataset GROUP BY product_id
   ORDER BY TotalSales DESC;

-- 6. Top Customers (Most Orders)
SELECT customer_id, COUNT(*) AS TotalOrders
FROM dbo.olist_orders_dataset GROUP BY customer_id
  ORDER BY TotalOrders DESC;

-- 7. Join Orders & Order Items
SELECT i.order_id, i.product_id, i.price
FROM dbo.olist_order_items_dataset i JOIN dbo.olist_orders_dataset o
 ON i.order_id = o.order_id;

 -- 8. Monthly Orders Trend
SELECT  YEAR(order_purchase_timestamp) AS Year,
    MONTH(order_purchase_timestamp) AS Month, COUNT(*) AS TotalOrders
FROM dbo.olist_orders_dataset GROUP BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
 ORDER BY Year, Month;

 -- 9. Revenue per Order
SELECT o.order_id, SUM(i.price) AS OrderRevenue
FROM dbo.olist_orders_dataset o
JOIN dbo.olist_order_items_dataset i
ON o.order_id = i.order_id
GROUP BY o.order_id;