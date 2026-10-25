# LeetCode SQL 50 · SQLite 学习路线

2026-10-25 · Sicheng

按 LeetCode「SQL 50」题单的 7 个知识点顺序刷，每题都配了本地 SQLite 建表脚本和参考答案，50 题已全部在 sqlite3 3.45 命令行下跑通。

## 怎么用

每道题按「先在本地 SQLite 跑通，再去 LeetCode 提交」的顺序做。练习包就在本目录下，有三样东西：`setup/`（每题一个建表 + 示例数据脚本）、`solutions_sqlite.sql`（SQLite 版参考答案和要点）、`all_in_one.sql`（50 题一次跑完）。

1. 打开题目链接，读题、看表结构。
2. 在本目录（`leetcode/`）里打开数据库：`sqlite3 sql50.db`，先输入 `.headers on` 和 `.mode box` 让结果好看些。
3. 载入这题的表：`.read setup/1757_recyclable-and-low-fat-products.sql`。每个脚本会先 DROP 同名表，可以反复执行。
4. 自己写查询，对照数据检查结果。
5. 去 LeetCode 提交（选 MySQL）。不对的话，再看 `solutions_sqlite.sql` 里这题的答案和要点。

示例数据是我自己编的小数据，规模和题目示例相近，用来验证思路，最终以 LeetCode 判题为准。题目链接用的是 leetcode.cn，题单入口：[SQL 50（力扣）](https://leetcode.cn/studyplan/sql-free-50/)。

## 第 1 组 · 查询（5 题）

目标：熟悉 SELECT / WHERE / DISTINCT / ORDER BY，弄懂 NULL 为什么不能用 = 比较。

| 题号 | 题目 | 练什么 | SQLite 注意 |
| --- | --- | --- | --- |
| 1757 | [可回收且低脂的产品](https://leetcode.cn/problems/recyclable-and-low-fat-products/) | WHERE + AND | MySQL 的 ENUM 在 SQLite 里用 TEXT + CHECK 约束代替 |
| 584 | [寻找用户推荐人](https://leetcode.cn/problems/find-customer-referee/) | NULL 比较、IS NULL | NULL <> 2 的结果是 NULL 而不是真，必须单独写 IS NULL（两边一样） |
| 595 | [大的国家](https://leetcode.cn/problems/big-countries/) | OR 条件 | 两边写法一样 |
| 1148 | [文章浏览 I](https://leetcode.cn/problems/article-views-i/) | DISTINCT、ORDER BY | SQLite 没有 DATE 类型，日期存成 'YYYY-MM-DD' 文本，按字符串比较就能正确排序 |
| 1683 | [无效的推文](https://leetcode.cn/problems/invalid-tweets/) | 字符串长度 | MySQL 的 LENGTH() 数字节、CHAR\_LENGTH() 数字符；SQLite 的 length() 对文本数字符 |

## 第 2 组 · 连接（9 题）

目标：分清 INNER / LEFT / CROSS JOIN 和自连接，学会用 LEFT JOIN + IS NULL 找“没有匹配”的行。

| 题号 | 题目 | 练什么 | SQLite 注意 |
| --- | --- | --- | --- |
| 1378 | [使用唯一标识码替换员工ID](https://leetcode.cn/problems/replace-employee-id-with-the-unique-identifier/) | LEFT JOIN | 两边写法一样 |
| 1068 | [产品销售分析 I](https://leetcode.cn/problems/product-sales-analysis-i/) | INNER JOIN | 两边写法一样 |
| 1581 | [进店却未进行过交易的顾客](https://leetcode.cn/problems/customer-who-visited-but-did-not-make-any-transactions/) | LEFT JOIN 找无匹配 | 两边一样；也可以用 NOT EXISTS |
| 197 | [上升的温度](https://leetcode.cn/problems/rising-temperature/) | 自连接 + 日期运算 | MySQL 的 DATEDIFF(a,b)=1 改成 date(a,'-1 day') = b，或 julianday(a) - julianday(b) = 1 |
| 1661 | [每台机器的进程平均运行时间](https://leetcode.cn/problems/average-time-of-process-per-machine/) | 自连接 + AVG | 两边写法一样 |
| 577 | [员工奖金](https://leetcode.cn/problems/employee-bonus/) | LEFT JOIN + NULL 过滤 | 两边写法一样 |
| 1280 | [学生们参加各科测试的次数](https://leetcode.cn/problems/students-and-examinations/) | CROSS JOIN 补全组合 | COUNT(列) 不数 NULL、COUNT(\*) 会数，这里要写 COUNT(e.student\_id) |
| 570 | [至少有5名直接下属的经理](https://leetcode.cn/problems/managers-with-at-least-5-direct-reports/) | 自连接 + HAVING | 两边写法一样 |
| 1934 | [确认率](https://leetcode.cn/problems/confirmation-rate/) | LEFT JOIN + 条件平均 | 比较表达式两边都返回 1/0，AVG(action = 'confirmed') 就是比例 |

## 第 3 组 · 聚合函数（8 题）

目标：掌握 COUNT / SUM / AVG / ROUND 和条件聚合。这一组最容易踩 SQLite 的整除坑。

| 题号 | 题目 | 练什么 | SQLite 注意 |
| --- | --- | --- | --- |
| 620 | [有趣的电影](https://leetcode.cn/problems/not-boring-movies/) | 取模、ORDER BY DESC | MySQL 的 MOD(id,2) 写成 id % 2 |
| 1251 | [平均售价](https://leetcode.cn/problems/average-selling-price/) | 区间 JOIN + 加权平均 | **整除坑**：SQLite 里 7/2 = 3，MySQL 得 3.5；乘 1.0 或 CAST(... AS REAL) |
| 1075 | [项目员工 I](https://leetcode.cn/problems/project-employees-i/) | AVG + ROUND | AVG() 在 SQLite 里总返回浮点数，不会整除 |
| 1633 | [各赛事的用户注册率](https://leetcode.cn/problems/percentage-of-users-attended-a-contest/) | 标量子查询做分母 | 整除坑：写 100.0 而不是 100 |
| 1211 | [查询结果的质量和占比](https://leetcode.cn/problems/queries-quality-and-percentage/) | 条件聚合 | 整除坑：rating/position 都是整数，要写 rating \* 1.0 / position |
| 1193 | [每月交易 I](https://leetcode.cn/problems/monthly-transactions-i/) | 按月分组、条件求和 | MySQL 的 DATE\_FORMAT(d,'%Y-%m') 改成 strftime('%Y-%m', d) 或 substr(d,1,7) |
| 1174 | [即时食物配送 II](https://leetcode.cn/problems/immediate-food-delivery-ii/) | 每组第一条（行值 IN） | (a, b) IN (子查询) 两边都支持（SQLite 3.15+） |
| 550 | [游戏玩法分析 IV](https://leetcode.cn/problems/game-play-analysis-iv/) | 首日 + 次日留存 | MySQL 的 DATE\_SUB(d, INTERVAL 1 DAY) 改成 date(d, '-1 day') |

## 第 4 组 · 排序和分组（7 题）

目标：分清 WHERE（分组前过滤行）和 HAVING（分组后过滤组），会取“每组最小值那一行”。

| 题号 | 题目 | 练什么 | SQLite 注意 |
| --- | --- | --- | --- |
| 2356 | [每位教师所教授的科目种类的数量](https://leetcode.cn/problems/number-of-unique-subjects-taught-by-each-teacher/) | COUNT(DISTINCT) | 两边写法一样 |
| 1141 | [查询近30天活跃用户数](https://leetcode.cn/problems/user-activity-for-the-past-30-days-i/) | 日期区间 + 分组 | MySQL 常写 DATEDIFF(...) < 30；SQLite 用 date('2019-07-27','-29 days') 算起始日 |
| 1070 | [产品销售分析 III](https://leetcode.cn/problems/product-sales-analysis-iii/) | 每组最小值那一行 | 两边写法一样 |
| 596 | [超过5名学生的课](https://leetcode.cn/problems/classes-more-than-5-students/) | HAVING | 两边写法一样 |
| 1729 | [求关注者的数量](https://leetcode.cn/problems/find-followers-count/) | GROUP BY + ORDER BY | 两边写法一样 |
| 619 | [只出现一次的最大数字](https://leetcode.cn/problems/biggest-single-number/) | HAVING + 外层聚合 | 外层 MAX() 让无结果时也返回一行 NULL；MySQL 要求子查询起别名，SQLite 不强制 |
| 1045 | [买下所有产品的客户](https://leetcode.cn/problems/customers-who-bought-all-products/) | HAVING COUNT = 总数 | 两边写法一样 |

## 第 5 组 · 高级查询和连接（7 题）

目标：第一次碰窗口函数（LAG、累计和），以及 CASE WHEN 和关联子查询。

| 题号 | 题目 | 练什么 | SQLite 注意 |
| --- | --- | --- | --- |
| 1731 | [每位经理的下属员工数量](https://leetcode.cn/problems/the-number-of-employees-which-report-to-each-employee/) | 自连接 + 分组统计 | SQLite 的 ROUND(x) 返回 39.0，MySQL 返回 39；要整数就 CAST(... AS INTEGER) |
| 1789 | [员工的直属部门](https://leetcode.cn/problems/primary-department-for-each-employee/) | OR + 子查询 | 两边写法一样 |
| 610 | [判断三角形](https://leetcode.cn/problems/triangle-judgement/) | CASE WHEN | MySQL 的 IF(cond, a, b) 改成 iif(cond, a, b) 或 CASE WHEN |
| 180 | [连续出现的数字](https://leetcode.cn/problems/consecutive-numbers/) | 窗口函数 LAG | 两边一样（SQLite 3.25+、MySQL 8.0+）；也可以用三表自连接 |
| 1164 | [指定日期的产品价格](https://leetcode.cn/problems/product-price-at-a-given-date/) | 关联子查询 + 默认值 | 两边一样，IFNULL 两边都有 |
| 1204 | [最后一个能进入巴士的人](https://leetcode.cn/problems/last-person-to-fit-in-the-bus/) | 累计和窗口 | 两边一样：SUM() OVER (ORDER BY turn) |
| 1907 | [按分类统计薪水](https://leetcode.cn/problems/count-salary-categories/) | UNION ALL 补全类别 | 两边一样；有类别为 0 时不能只靠 GROUP BY |

## 第 6 组 · 子查询（7 题）

目标：熟练写嵌套查询和 CTE（WITH），掌握排名函数和滑动窗口。这组难度最高。

| 题号 | 题目 | 练什么 | SQLite 注意 |
| --- | --- | --- | --- |
| 1978 | [上级经理已离职的公司员工](https://leetcode.cn/problems/employees-whose-manager-left-the-company/) | NOT IN 子查询 | 两边一样的坑：子查询里有 NULL 时 NOT IN 永远不为真，不确定就用 NOT EXISTS |
| 626 | [换座位](https://leetcode.cn/problems/exchange-seats/) | CASE + 标量子查询 | 两边写法一样 |
| 1341 | [电影评分](https://leetcode.cn/problems/movie-rating/) | UNION ALL + 各自 LIMIT | MySQL 可写 (SELECT ... LIMIT 1) UNION ALL (...)；SQLite 不支持，要写成 SELECT \* FROM (...) UNION ALL SELECT \* FROM (...) |
| 1321 | [餐馆营业额变化增长](https://leetcode.cn/problems/restaurant-growth/) | CTE + 滑动窗口 | MySQL 的 DATE\_ADD 改成 date(x,'+6 days')；窗口 ROWS BETWEEN 6 PRECEDING 两边一样 |
| 602 | [好友申请 II ：谁有最多的好友](https://leetcode.cn/problems/friend-requests-ii-who-has-the-most-friends/) | UNION ALL 拆两列 | 两边一样；UNION 会去重，这里必须用 UNION ALL |
| 585 | [2016年的投资](https://leetcode.cn/problems/investments-in-2016/) | 多条件 IN 子查询 | 两边写法一样 |
| 185 | [部门工资前三高的所有员工](https://leetcode.cn/problems/department-top-three-salaries/) | DENSE\_RANK 分组前 N | 两边一样；ROW\_NUMBER 不并列、RANK 并列后跳号、DENSE\_RANK 并列不跳号 |

## 第 7 组 · 高级字符串函数 / 正则 / 子句（7 题）

目标：字符串处理、LIKE 和正则，以及第一次用 DELETE 改数据。这组和 MySQL 的差异最多。

| 题号 | 题目 | 练什么 | SQLite 注意 |
| --- | --- | --- | --- |
| 1667 | [修复表中的名字](https://leetcode.cn/problems/fix-names-in-a-table/) | 大小写函数、拼接 | MySQL 的 CONCAT(a,b) 改成 a \|\| b；SUBSTRING 改成 substr |
| 1527 | [患某种疾病的患者](https://leetcode.cn/problems/patients-with-a-condition/) | LIKE 模式匹配 | SQLite 的 LIKE 对英文字母不区分大小写；要区分用 GLOB 'DIAB1\*' |
| 196 | [删除重复的电子邮箱](https://leetcode.cn/problems/delete-duplicate-emails/) | DELETE + 子查询 | MySQL 不让 DELETE 子查询读同一张表（错误 1093）；SQLite 可以，但不支持多表 DELETE p1 FROM ... JOIN |
| 176 | [第二高的薪水](https://leetcode.cn/problems/second-highest-salary/) | LIMIT OFFSET + 空值处理 | LIMIT 1 OFFSET 1 和 LIMIT 1,1 在 SQLite 里都能用 |
| 1484 | [按日期分组销售产品](https://leetcode.cn/problems/group-sold-products-by-the-date/) | group\_concat | MySQL 的 SEPARATOR 在 SQLite 里是第二个参数；聚合内 ORDER BY 要 3.44+；加 DISTINCT 时不能改分隔符 |
| 1327 | [列出指定时间段内所有的下单产品](https://leetcode.cn/problems/list-the-products-ordered-in-a-period/) | 日期过滤 + HAVING | MySQL 的 DATE\_FORMAT 改成 strftime('%Y-%m', d) |
| 1517 | [查找拥有有效邮箱的用户](https://leetcode.cn/problems/find-users-with-valid-e-mails/) | 正则 REGEXP | REGEXP 只在 sqlite3 命令行里自带；它不认方括号末尾的 -，要写 \[-A-Za-z0-9\_.\] |

## MySQL 与 SQLite 写法差异速查

最容易出错的是整除：SQLite 里两个整数相除会去掉小数，结果不报错但是错的。其余差异大多是日期和字符串函数换个名字。

| 场景 | MySQL（LeetCode 提交） | SQLite（本地练习） | 涉及题号 |
| --- | --- | --- | --- |
| 整数除法 | 7 / 2 = 3.5 | 7 / 2 = 3，要写 7 \* 1.0 / 2 | 1251、1633、1211、550 |
| 日期加减 | DATE\_ADD(d, INTERVAL 1 DAY)、DATE\_SUB | date(d, '+1 day')、date(d, '-1 day') | 197、550、1141、1321 |
| 日期相差天数 | DATEDIFF(a, b) | julianday(a) - julianday(b) | 197、1141 |
| 格式化日期 | DATE\_FORMAT(d, '%Y-%m') | strftime('%Y-%m', d) | 1193、1327 |
| 日期类型 | DATE / DATETIME | 没有专门类型，存 'YYYY-MM-DD' 文本 | 全部日期题 |
| 条件表达式 | IF(c, a, b) | iif(c, a, b) 或 CASE WHEN | 610 |
| 字符串拼接 | CONCAT(a, b) | a \|\| b | 1667 |
| 截取字符串 | SUBSTRING(s, i, n)、LEFT(s, n) | substr(s, i, n) | 1667 |
| 字符长度 | CHAR\_LENGTH(s) | length(s) | 1683 |
| 分组拼接 | GROUP\_CONCAT(x ORDER BY x SEPARATOR ',') | group\_concat(x, ',')，ORDER BY 要 3.44+ | 1484 |
| 保留整数的四舍五入 | ROUND(x) 返回整数 | ROUND(x) 返回 39.0，要 CAST(... AS INTEGER) | 1731 |
| 枚举类型 | ENUM('Y','N') | TEXT CHECK (col IN ('Y','N')) | 1757、1789 等 |
| UNION 分支各自排序 | (SELECT ... LIMIT 1) UNION ALL (...) | SELECT \* FROM (...) UNION ALL SELECT \* FROM (...) | 1341 |
| 删除时引用同表 | 报错 1093，常用多表 DELETE | 子查询直接写；不支持多表 DELETE | 196 |
| 正则 | REGEXP，默认不区分大小写 | 只有 sqlite3 命令行自带 REGEXP | 1517 |
| LIKE 大小写 | 默认排序规则下不区分 | 英文字母不区分；GLOB 区分 | 1527 |

两边一样的：LIMIT / OFFSET（包括 LIMIT 1,1）、IFNULL、窗口函数（MySQL 8.0+、SQLite 3.25+）、CTE、比较表达式返回 1/0。

## 节奏建议和下一步

每天 4–5 题，大约两周刷完。第 1–4 组每组一天就够，第 5–7 组每组留两天，窗口函数和子查询需要多写几遍。一题卡住 20 分钟就看参考答案，第二天不看答案重写一遍。

刷题练的是查询。简历上还需要一个小项目来体现建表设计、索引和在程序里用 SQLite，可以之后单独做。
