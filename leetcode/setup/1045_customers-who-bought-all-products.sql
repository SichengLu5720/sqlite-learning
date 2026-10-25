-- 1045. 买下所有产品的客户
-- https://leetcode.cn/problems/customers-who-bought-all-products/
-- 分组：4 排序和分组
-- 用法：sqlite3 sql50.db 后执行  .read setup/1045_customers-who-bought-all-products.sql

DROP TABLE IF EXISTS Customer; DROP TABLE IF EXISTS Product;
CREATE TABLE Product (product_key INTEGER PRIMARY KEY);
CREATE TABLE Customer (customer_id INTEGER, product_key INTEGER REFERENCES Product);
INSERT INTO Product VALUES (5),(6);
INSERT INTO Customer VALUES (1,5),(2,6),(3,5),(3,6),(1,6);

-- 在下面写你的查询：

