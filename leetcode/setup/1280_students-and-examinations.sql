-- 1280. 学生们参加各科测试的次数
-- https://leetcode.cn/problems/students-and-examinations/
-- 分组：2 连接
-- 用法：sqlite3 sql50.db 后执行  .read setup/1280_students-and-examinations.sql

DROP TABLE IF EXISTS Students; DROP TABLE IF EXISTS Subjects; DROP TABLE IF EXISTS Examinations;
CREATE TABLE Students (student_id INTEGER PRIMARY KEY, student_name TEXT);
CREATE TABLE Subjects (subject_name TEXT PRIMARY KEY);
CREATE TABLE Examinations (student_id INTEGER, subject_name TEXT);
INSERT INTO Students VALUES (1,'Alice'),(2,'Bob'),(13,'John'),(6,'Alex');
INSERT INTO Subjects VALUES ('Math'),('Physics'),('Programming');
INSERT INTO Examinations VALUES (1,'Math'),(1,'Physics'),(1,'Programming'),(2,'Programming'),(1,'Physics'),
 (1,'Math'),(13,'Math'),(13,'Programming'),(13,'Physics'),(2,'Math'),(1,'Math');

-- 在下面写你的查询：

