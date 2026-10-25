-- 1341. 电影评分
-- https://leetcode.cn/problems/movie-rating/
-- 分组：6 子查询
-- 用法：sqlite3 sql50.db 后执行  .read setup/1341_movie-rating.sql

DROP TABLE IF EXISTS Movies; DROP TABLE IF EXISTS Users; DROP TABLE IF EXISTS MovieRating;
CREATE TABLE Movies (movie_id INTEGER PRIMARY KEY, title TEXT);
CREATE TABLE Users (user_id INTEGER PRIMARY KEY, name TEXT);
CREATE TABLE MovieRating (movie_id INTEGER, user_id INTEGER, rating INTEGER, created_at TEXT, PRIMARY KEY (movie_id, user_id));
INSERT INTO Movies VALUES (1,'Avengers'),(2,'Frozen 2'),(3,'Joker');
INSERT INTO Users VALUES (1,'Daniel'),(2,'Monica'),(3,'Maria'),(4,'James');
INSERT INTO MovieRating VALUES (1,1,3,'2020-01-12'),(1,2,4,'2020-02-11'),(1,3,2,'2020-02-12'),(1,4,1,'2020-01-01'),
 (2,1,5,'2020-02-17'),(2,2,2,'2020-02-01'),(2,3,2,'2020-03-01'),(3,1,3,'2020-02-22'),(3,2,4,'2020-02-25');

-- 在下面写你的查询：

