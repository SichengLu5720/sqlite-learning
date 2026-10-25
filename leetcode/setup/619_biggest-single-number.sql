-- 619. 只出现一次的最大数字
-- https://leetcode.cn/problems/biggest-single-number/
-- 分组：4 排序和分组
-- 用法：sqlite3 sql50.db 后执行  .read setup/619_biggest-single-number.sql

DROP TABLE IF EXISTS MyNumbers;
CREATE TABLE MyNumbers (num INTEGER);
INSERT INTO MyNumbers VALUES (8),(8),(3),(3),(1),(4),(5),(6);

-- 在下面写你的查询：

