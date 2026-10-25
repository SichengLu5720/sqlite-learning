-- 602. 好友申请 II ：谁有最多的好友
-- https://leetcode.cn/problems/friend-requests-ii-who-has-the-most-friends/
-- 分组：6 子查询
-- 用法：sqlite3 sql50.db 后执行  .read setup/602_friend-requests-ii-who-has-the-most-friends.sql

DROP TABLE IF EXISTS RequestAccepted;
CREATE TABLE RequestAccepted (requester_id INTEGER, accepter_id INTEGER, accept_date TEXT, PRIMARY KEY (requester_id, accepter_id));
INSERT INTO RequestAccepted VALUES (1,2,'2016-06-03'),(1,3,'2016-06-08'),(2,3,'2016-06-08'),(3,4,'2016-06-09');

-- 在下面写你的查询：

