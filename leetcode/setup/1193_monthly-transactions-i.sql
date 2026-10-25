-- 1193. 每月交易 I
-- https://leetcode.cn/problems/monthly-transactions-i/
-- 分组：3 聚合函数
-- 用法：sqlite3 sql50.db 后执行  .read setup/1193_monthly-transactions-i.sql

DROP TABLE IF EXISTS Transactions;
CREATE TABLE Transactions (id INTEGER PRIMARY KEY, country TEXT,
  state TEXT CHECK (state IN ('approved','declined')), amount INTEGER, trans_date TEXT);
INSERT INTO Transactions VALUES (121,'US','approved',1000,'2018-12-18'),(122,'US','declined',2000,'2018-12-19'),
 (123,'US','approved',2000,'2019-01-01'),(124,'DE','approved',2000,'2019-01-07');

-- 在下面写你的查询：

