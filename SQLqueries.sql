-- Q:Is there how many warehouses and its capability?
SELECT *
FROM warehouses;
-- A:There are four warehouses with their corresponding codes, names and current capacity in percent. Warehouse c has the most space available, at only 50% filled.

-- Q: What is all the products of this company?
SELECT *
FROM products;
-- The total number of all the products of this company
SELECT COUNT(*)
FROM products;
-- A: The company currently holds a diverse inventory of 110 distinct products.

-- Q: Verify whether any products are stored in multiple warehouses.
SELECT 
  productCode, 
  COUNT(warehouseCode) AS warehouse
  FROM products
  GROUP BY productCode
  HAVING COUNT(warehouseCode) > 1;
-- A:There are no products stored in multiple warehouses.Therefore, we can see each warehouse is stored a specific product lines 


-- identify unique product count and their total stock on each warehouse 
SELECT 
    p.warehouseCode, 
    w.warehouseName, 
    COUNT(productCode) AS total_product, 
    SUM(p.quantityInStock) AS total_stock 
FROM 
    products AS p 
JOIN 
    warehouses AS w ON p.warehouseCode = w.warehouseCode 
GROUP BY 
    p.warehouseCode, 
    w.warehouseName 
 LIMIT  0, 1000;
-- Warehouse b holds 38 different product with total 219.183 of products stock, make it the most stored warehouse.

-- identify what product line each warehouse stored
SELECT 
    p.warehouseCode, 
    w.warehouseName, 
    p.productLine, 
    COUNT(p.productCode) AS total_product, 
    SUM(p.quantityInStock) AS total_stock 
FROM 
    products AS p 
JOIN 
    warehouses AS w ON p.warehouseCode = w.warehouseCode 
GROUP BY 
    p.warehouseCode, 
    w.warehouseName, 
    p.productLine 
LIMIT 
    0, 1000;

-- Warehouse a (North): planes + motorcycles  
--  12 planes, 13 motorcycles = 25 total products  
  
-- Warehouse b (East): classic cars  
--  38 total products for classic cars  
  
-- Warehouse c (West): vintage cars  
--  24 total products for vintage cars  
  
-- Warehouse d (South): Trucks + buses, ships, trains  
--  11 trucks + buses, 9 ships, 3 trains = 23 total  

-- Which productline got the highest number and lowest number of sales.

SELECT products.productLine, count(orderdetails.productCode) AS no_of_sales
FROM products 
JOIN orderdetails 
ON products.productCode = orderdetails.productCode
GROUP By products.productLine
ORDER BY no_of_sales desc;

-- Create a inventory_summảy table to indicates the product lines status

CREATE TEMPORARY TABLE inventory_summary AS(
 SELECT
  p.warehouseCode AS warehouseCode,
  p.productCode AS productCode,
        p.productName AS productName,
  p.quantityInStock AS quantityInStock,
  SUM(od.quantityOrdered) AS total_ordered,
  p.quantityInStock - SUM(od.quantityOrdered) AS remaining_stock,
  CASE 
   WHEN (p.quantityInStock - SUM(od.quantityOrdered)) > (2 * SUM(od.quantityOrdered)) THEN 'Overstocked'
   WHEN (p.quantityInStock - SUM(od.quantityOrdered)) < 650 THEN 'Understocked'
   ELSE 'Well-Stocked'
  END AS inventory_status
 FROM products AS p
 JOIN orderdetails AS od ON p.productCode = od.productCode
 JOIN orders o ON od.orderNumber = o.orderNumber
 WHERE o.status IN ('Shipped', 'Resolved')
 GROUP BY 
  p.warehouseCode,
  p.productCode,
  p.quantityInStock
);
-- how many product that are over stocked and under stocked on each warehouse.
SELECT
    warehouseCode,
    inventory_status,
    COUNT(*) AS product_count
FROM inventory_summary
GROUP BY warehouseCode, inventory_status
order by warehouseCode;
-- Seems like warehouse b is having the highest overstocked product with total 29 products, while warehouse a and c having same 19 overstocked products.
SELECT
    warehouseCode,
    COUNT(*) as product_overstocked
FROM inventory_summary
WHERE inventory_status = 'Overstocked'
GROUP BY warehouseCode;

-- Analyze various product lines, identifying those with the highest sales percentages, and gain insights into each product line's inventory and sales performance.
SELECT
p.productLine,
pl.textDescription AS productLineDescription,
SUM(p.quantityInStock) AS totalInventory,
SUM(od.quantityOrdered) AS totalSales,
SUM(od.priceEach * od.quantityOrdered) AS totalRevenue,
(SUM(od.quantityOrdered) / SUM(p.quantityInStock)) * 100 AS salesToInventoryPercentage
FROM

mintclassics.products AS p
LEFT JOIN
mintclassics.productlines AS pl ON p.productLine = pl.productLine
LEFT JOIN
mintclassics.orderdetails AS od ON p.productCode = od.productCode
GROUP BY
p.productLine, pl.textDescription
ORDER BY
salesToInventoryPercentage desc

