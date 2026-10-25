-- 1484. 按日期分组销售产品
-- https://leetcode.cn/problems/group-sold-products-by-the-date/
-- 分组：7 高级字符串函数 / 正则 / 子句
-- 用法：sqlite3 sql50.db 后执行  .read setup/1484_group-sold-products-by-the-date.sql

DROP TABLE IF EXISTS Activities;
CREATE TABLE Activities (sell_date TEXT, product TEXT);
INSERT INTO Activities VALUES ('2020-05-30','Headphone'),('2020-06-01','Pencil'),('2020-06-02','Mask'),
 ('2020-05-30','Basketball'),('2020-06-01','Bible'),('2020-06-02','Mask'),('2020-05-30','T-Shirt');

-- 在下面写你的查询：

