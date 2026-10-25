-- 1581. 进店却未进行过交易的顾客
-- https://leetcode.cn/problems/customer-who-visited-but-did-not-make-any-transactions/
-- 分组：2 连接
-- 用法：sqlite3 sql50.db 后执行  .read setup/1581_customer-who-visited-but-did-not-make-any-transactions.sql

DROP TABLE IF EXISTS Visits; DROP TABLE IF EXISTS Transactions;
CREATE TABLE Visits (visit_id INTEGER PRIMARY KEY, customer_id INTEGER);
CREATE TABLE Transactions (transaction_id INTEGER PRIMARY KEY, visit_id INTEGER, amount INTEGER);
INSERT INTO Visits VALUES (1,23),(2,9),(4,30),(5,54),(6,96),(7,54),(8,54);
INSERT INTO Transactions VALUES (2,5,310),(3,5,300),(9,5,200),(12,1,910),(13,2,970);

-- 在下面写你的查询：

