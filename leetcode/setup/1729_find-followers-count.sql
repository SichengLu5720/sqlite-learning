-- 1729. 求关注者的数量
-- https://leetcode.cn/problems/find-followers-count/
-- 分组：4 排序和分组
-- 用法：sqlite3 sql50.db 后执行  .read setup/1729_find-followers-count.sql

DROP TABLE IF EXISTS Followers;
CREATE TABLE Followers (user_id INTEGER, follower_id INTEGER, PRIMARY KEY (user_id, follower_id));
INSERT INTO Followers VALUES (0,1),(1,0),(2,0),(2,1);

-- 在下面写你的查询：

