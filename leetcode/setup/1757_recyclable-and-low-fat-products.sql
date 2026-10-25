-- 1757. 可回收且低脂的产品
-- https://leetcode.cn/problems/recyclable-and-low-fat-products/
-- 分组：1 查询
-- 用法：sqlite3 sql50.db 后执行  .read setup/1757_recyclable-and-low-fat-products.sql

DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
  product_id INTEGER PRIMARY KEY,
  low_fats   TEXT CHECK (low_fats IN ('Y','N')),
  recyclable TEXT CHECK (recyclable IN ('Y','N'))
);
INSERT INTO Products VALUES (0,'Y','N'),(1,'Y','Y'),(2,'N','Y'),(3,'Y','Y'),(4,'N','N');

-- 在下面写你的查询：

