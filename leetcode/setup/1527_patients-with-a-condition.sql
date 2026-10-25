-- 1527. 患某种疾病的患者
-- https://leetcode.cn/problems/patients-with-a-condition/
-- 分组：7 高级字符串函数 / 正则 / 子句
-- 用法：sqlite3 sql50.db 后执行  .read setup/1527_patients-with-a-condition.sql

DROP TABLE IF EXISTS Patients;
CREATE TABLE Patients (patient_id INTEGER PRIMARY KEY, patient_name TEXT, conditions TEXT);
INSERT INTO Patients VALUES (1,'Daniel','YFEV COUGH'),(2,'Alice',''),(3,'Bob','DIAB100 MYOP'),
 (4,'George','ACNE DIAB100'),(5,'Alain','DIAB201'),(6,'Eve','SADIAB100');

-- 在下面写你的查询：

