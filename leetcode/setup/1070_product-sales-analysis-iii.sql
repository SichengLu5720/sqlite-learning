-- 1070. 产品销售分析 III
-- https://leetcode.cn/problems/product-sales-analysis-iii/
-- 分组：4 排序和分组
-- 用法：sqlite3 sql50.db 后执行  .read setup/1070_product-sales-analysis-iii.sql

DROP TABLE IF EXISTS Sales; DROP TABLE IF EXISTS Product;
CREATE TABLE Product (product_id INTEGER PRIMARY KEY, product_name TEXT);
CREATE TABLE Sales (sale_id INTEGER, product_id INTEGER, year INTEGER, quantity INTEGER, price INTEGER,
                    PRIMARY KEY (sale_id, year));
INSERT INTO Product VALUES (100,'Nokia'),(200,'Apple'),(300,'Samsung');
INSERT INTO Sales VALUES (1,100,2008,10,5000),(2,100,2009,12,5000),(7,200,2011,15,9000);

-- 在下面写你的查询：

