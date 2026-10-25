-- 1517. 查找拥有有效邮箱的用户
-- https://leetcode.cn/problems/find-users-with-valid-e-mails/
-- 分组：7 高级字符串函数 / 正则 / 子句
-- 用法：sqlite3 sql50.db 后执行  .read setup/1517_find-users-with-valid-e-mails.sql

DROP TABLE IF EXISTS Users;
CREATE TABLE Users (user_id INTEGER PRIMARY KEY, name TEXT, mail TEXT);
INSERT INTO Users VALUES (1,'Winston','winston@leetcode.com'),(2,'Jonathan','jonathanisgreat'),
 (3,'Annabelle','bella-@leetcode.com'),(4,'Sally','sally.come@leetcode.com'),(5,'Marwan','quarz#2020@leetcode.com'),
 (6,'David','david69@gmail.com'),(7,'Shapiro','.shapo@leetcode.com');

-- 在下面写你的查询：

