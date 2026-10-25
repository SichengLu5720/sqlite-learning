-- 1251. 平均售价
-- https://leetcode.cn/problems/average-selling-price/
-- 分组：3 聚合函数
-- 用法：sqlite3 sql50.db 后执行  .read setup/1251_average-selling-price.sql

DROP TABLE IF EXISTS Prices; DROP TABLE IF EXISTS UnitsSold;
CREATE TABLE Prices (product_id INTEGER, start_date TEXT, end_date TEXT, price INTEGER,
                     PRIMARY KEY (product_id, start_date, end_date));
CREATE TABLE UnitsSold (product_id INTEGER, purchase_date TEXT, units INTEGER);
INSERT INTO Prices VALUES (1,'2019-02-17','2019-02-28',5),(1,'2019-03-01','2019-03-22',20),
 (2,'2019-02-01','2019-02-20',15),(2,'2019-02-21','2019-03-31',30),(3,'2019-01-01','2019-12-31',9);
INSERT INTO UnitsSold VALUES (1,'2019-02-25',100),(1,'2019-03-01',15),(2,'2019-02-10',200),(2,'2019-03-22',30);

-- 在下面写你的查询：

