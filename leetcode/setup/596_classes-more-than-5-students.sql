-- 596. 超过5名学生的课
-- https://leetcode.cn/problems/classes-more-than-5-students/
-- 分组：4 排序和分组
-- 用法：sqlite3 sql50.db 后执行  .read setup/596_classes-more-than-5-students.sql

DROP TABLE IF EXISTS Courses;
CREATE TABLE Courses (student TEXT, class TEXT, PRIMARY KEY (student, class));
INSERT INTO Courses VALUES ('A','Math'),('B','English'),('C','Math'),('D','Biology'),('E','Math'),
 ('F','Computer'),('G','Math'),('H','Math'),('I','Math');

-- 在下面写你的查询：

