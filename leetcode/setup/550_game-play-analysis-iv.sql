-- 550. 游戏玩法分析 IV
-- https://leetcode.cn/problems/game-play-analysis-iv/
-- 分组：3 聚合函数
-- 用法：sqlite3 sql50.db 后执行  .read setup/550_game-play-analysis-iv.sql

DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity (player_id INTEGER, device_id INTEGER, event_date TEXT, games_played INTEGER,
                       PRIMARY KEY (player_id, event_date));
INSERT INTO Activity VALUES (1,2,'2016-03-01',5),(1,2,'2016-03-02',6),(2,3,'2017-06-25',1),(3,1,'2016-03-02',0),(3,4,'2018-07-03',5);

-- 在下面写你的查询：

