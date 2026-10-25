-- 1141. 查询近30天活跃用户数
-- https://leetcode.cn/problems/user-activity-for-the-past-30-days-i/
-- 分组：4 排序和分组
-- 用法：sqlite3 sql50.db 后执行  .read setup/1141_user-activity-for-the-past-30-days-i.sql

DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity (user_id INTEGER, session_id INTEGER, activity_date TEXT,
  activity_type TEXT CHECK (activity_type IN ('open_session','end_session','scroll_down','send_message')));
INSERT INTO Activity VALUES (1,1,'2019-07-20','open_session'),(1,1,'2019-07-20','scroll_down'),(1,1,'2019-07-20','end_session'),
 (2,4,'2019-07-20','open_session'),(2,4,'2019-07-21','send_message'),(2,4,'2019-07-21','end_session'),
 (3,2,'2019-07-21','open_session'),(3,2,'2019-07-21','send_message'),(3,2,'2019-07-21','end_session'),
 (4,3,'2019-06-25','open_session'),(4,3,'2019-06-25','end_session');

-- 在下面写你的查询：

