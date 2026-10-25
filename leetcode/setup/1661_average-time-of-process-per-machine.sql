-- 1661. 每台机器的进程平均运行时间
-- https://leetcode.cn/problems/average-time-of-process-per-machine/
-- 分组：2 连接
-- 用法：sqlite3 sql50.db 后执行  .read setup/1661_average-time-of-process-per-machine.sql

DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity (machine_id INTEGER, process_id INTEGER,
  activity_type TEXT CHECK (activity_type IN ('start','end')), timestamp REAL,
  PRIMARY KEY (machine_id, process_id, activity_type));
INSERT INTO Activity VALUES
 (0,0,'start',0.712),(0,0,'end',1.520),(0,1,'start',3.140),(0,1,'end',4.120),
 (1,0,'start',0.550),(1,0,'end',1.550),(1,1,'start',0.430),(1,1,'end',1.420),
 (2,0,'start',4.100),(2,0,'end',4.512),(2,1,'start',2.500),(2,1,'end',5.000);

-- 在下面写你的查询：

