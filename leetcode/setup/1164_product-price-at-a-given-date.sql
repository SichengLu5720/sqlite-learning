-- 1164. 指定日期的产品价格
-- https://leetcode.cn/problems/product-price-at-a-given-date/
-- 分组：5 高级查询和连接
-- 用法：sqlite3 sql50.db 后执行  .read setup/1164_product-price-at-a-given-date.sql

DROP TABLE IF EXISTS Products;
CREATE TABLE Products (product_id INTEGER, new_price INTEGER, change_date TEXT, PRIMARY KEY (product_id, change_date));
INSERT INTO Products VALUES (1,20,'2019-08-14'),(2,50,'2019-08-14'),(1,30,'2019-08-15'),(1,35,'2019-08-16'),
 (2,65,'2019-08-17'),(3,20,'2019-08-18');

-- 在下面写你的查询：

