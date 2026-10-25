-- 2356. 每位教师所教授的科目种类的数量
-- https://leetcode.cn/problems/number-of-unique-subjects-taught-by-each-teacher/
-- 分组：4 排序和分组
-- 用法：sqlite3 sql50.db 后执行  .read setup/2356_number-of-unique-subjects-taught-by-each-teacher.sql

DROP TABLE IF EXISTS Teacher;
CREATE TABLE Teacher (teacher_id INTEGER, subject_id INTEGER, dept_id INTEGER, PRIMARY KEY (subject_id, dept_id));
INSERT INTO Teacher VALUES (1,2,3),(1,2,4),(1,3,3),(2,1,1),(2,2,1),(2,3,1),(2,4,1);

-- 在下面写你的查询：

