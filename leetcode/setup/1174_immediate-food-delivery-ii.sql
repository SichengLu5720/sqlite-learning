-- 1174. 即时食物配送 II
-- https://leetcode.cn/problems/immediate-food-delivery-ii/
-- 分组：3 聚合函数
-- 用法：sqlite3 sql50.db 后执行  .read setup/1174_immediate-food-delivery-ii.sql

DROP TABLE IF EXISTS Delivery;
CREATE TABLE Delivery (delivery_id INTEGER PRIMARY KEY, customer_id INTEGER, order_date TEXT, customer_pref_delivery_date TEXT);
INSERT INTO Delivery VALUES (1,1,'2019-08-01','2019-08-02'),(2,2,'2019-08-02','2019-08-02'),(3,1,'2019-08-11','2019-08-12'),
 (4,3,'2019-08-24','2019-08-24'),(5,3,'2019-08-21','2019-08-22'),(6,2,'2019-08-11','2019-08-13'),(7,4,'2019-08-09','2019-08-09');

-- 在下面写你的查询：

