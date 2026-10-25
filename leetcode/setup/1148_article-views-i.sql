-- 1148. 文章浏览 I
-- https://leetcode.cn/problems/article-views-i/
-- 分组：1 查询
-- 用法：sqlite3 sql50.db 后执行  .read setup/1148_article-views-i.sql

DROP TABLE IF EXISTS Views;
CREATE TABLE Views (article_id INTEGER, author_id INTEGER, viewer_id INTEGER, view_date TEXT);
INSERT INTO Views VALUES
 (1,3,5,'2019-08-01'),(1,3,6,'2019-08-02'),(2,7,7,'2019-08-01'),(2,7,6,'2019-08-02'),
 (4,7,1,'2019-07-22'),(3,4,4,'2019-07-21'),(3,4,4,'2019-07-21');

-- 在下面写你的查询：

