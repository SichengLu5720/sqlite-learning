-- 1327. 列出指定时间段内所有的下单产品
-- https://leetcode.cn/problems/list-the-products-ordered-in-a-period/
-- 分组：7 高级字符串函数 / 正则 / 子句
-- 用法：sqlite3 sql50.db 后执行  .read setup/1327_list-the-products-ordered-in-a-period.sql

DROP TABLE IF EXISTS Products; DROP TABLE IF EXISTS Orders;
CREATE TABLE Products (product_id INTEGER PRIMARY KEY, product_name TEXT, product_category TEXT);
CREATE TABLE Orders (product_id INTEGER REFERENCES Products, order_date TEXT, unit INTEGER);
INSERT INTO Products VALUES (1,'Leetcode Solutions','Book'),(2,'Jewels of Stringology','Book'),(3,'HP','Laptop'),
 (4,'Lenovo','Laptop'),(5,'Leetcode Kit','T-shirt');
INSERT INTO Orders VALUES (1,'2020-02-05',60),(1,'2020-02-10',70),(2,'2020-01-18',30),(2,'2020-02-11',80),
 (3,'2020-02-17',2),(3,'2020-02-24',3),(4,'2020-03-01',20),(4,'2020-03-04',30),(4,'2020-03-04',60),
 (5,'2020-02-25',50),(5,'2020-02-27',50),(5,'2020-03-01',50);

-- 在下面写你的查询：

