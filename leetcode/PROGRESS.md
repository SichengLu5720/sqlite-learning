# SQL 50 刷题进度

按 [学习路线](README.md) 的顺序，一次一题。每做完一题，把状态改掉，并在「笔记」列链接到 `notes/` 里对应的笔记。

状态：⬜ 未开始 · 🟡 学习中 · ✅ 已完成（本地跑通 + LeetCode 通过）

笔记命名规则：`notes/<题号>_<英文 slug>.md`，和 `setup/` 里的建表脚本同名。

| 组 | 完成 |
| --- | --- |
| 1 查询 | 0 / 5 |
| 2 连接 | 0 / 9 |
| 3 聚合函数 | 0 / 8 |
| 4 排序和分组 | 0 / 7 |
| 5 高级查询和连接 | 0 / 7 |
| 6 子查询 | 0 / 7 |
| 7 高级字符串函数 / 正则 / 子句 | 0 / 7 |
| **合计** | **0 / 50** |

## 第 1 组 · 查询

| # | 状态 | 题号 | 题目 | 练什么 | 笔记 |
| --- | --- | --- | --- | --- | --- |
| 1 | 🟡 | 1757 | [可回收且低脂的产品](https://leetcode.cn/problems/recyclable-and-low-fat-products/) | WHERE + AND | [笔记](../notes/1757_recyclable-and-low-fat-products.md) |
| 2 | ⬜ | 584 | [寻找用户推荐人](https://leetcode.cn/problems/find-customer-referee/) | NULL 比较、IS NULL | |
| 3 | ⬜ | 595 | [大的国家](https://leetcode.cn/problems/big-countries/) | OR 条件 | |
| 4 | ⬜ | 1148 | [文章浏览 I](https://leetcode.cn/problems/article-views-i/) | DISTINCT、ORDER BY | |
| 5 | ⬜ | 1683 | [无效的推文](https://leetcode.cn/problems/invalid-tweets/) | 字符串长度 | |

## 第 2 组 · 连接

| # | 状态 | 题号 | 题目 | 练什么 | 笔记 |
| --- | --- | --- | --- | --- | --- |
| 6 | ⬜ | 1378 | [使用唯一标识码替换员工ID](https://leetcode.cn/problems/replace-employee-id-with-the-unique-identifier/) | LEFT JOIN | |
| 7 | ⬜ | 1068 | [产品销售分析 I](https://leetcode.cn/problems/product-sales-analysis-i/) | INNER JOIN | |
| 8 | ⬜ | 1581 | [进店却未进行过交易的顾客](https://leetcode.cn/problems/customer-who-visited-but-did-not-make-any-transactions/) | LEFT JOIN 找无匹配 | |
| 9 | ⬜ | 197 | [上升的温度](https://leetcode.cn/problems/rising-temperature/) | 自连接 + 日期运算 | |
| 10 | ⬜ | 1661 | [每台机器的进程平均运行时间](https://leetcode.cn/problems/average-time-of-process-per-machine/) | 自连接 + AVG | |
| 11 | ⬜ | 577 | [员工奖金](https://leetcode.cn/problems/employee-bonus/) | LEFT JOIN + NULL 过滤 | |
| 12 | ⬜ | 1280 | [学生们参加各科测试的次数](https://leetcode.cn/problems/students-and-examinations/) | CROSS JOIN 补全组合 | |
| 13 | ⬜ | 570 | [至少有5名直接下属的经理](https://leetcode.cn/problems/managers-with-at-least-5-direct-reports/) | 自连接 + HAVING | |
| 14 | ⬜ | 1934 | [确认率](https://leetcode.cn/problems/confirmation-rate/) | LEFT JOIN + 条件平均 | |

## 第 3 组 · 聚合函数

| # | 状态 | 题号 | 题目 | 练什么 | 笔记 |
| --- | --- | --- | --- | --- | --- |
| 15 | ⬜ | 620 | [有趣的电影](https://leetcode.cn/problems/not-boring-movies/) | 取模、ORDER BY DESC | |
| 16 | ⬜ | 1251 | [平均售价](https://leetcode.cn/problems/average-selling-price/) | 区间 JOIN + 加权平均 | |
| 17 | ⬜ | 1075 | [项目员工 I](https://leetcode.cn/problems/project-employees-i/) | AVG + ROUND | |
| 18 | ⬜ | 1633 | [各赛事的用户注册率](https://leetcode.cn/problems/percentage-of-users-attended-a-contest/) | 标量子查询做分母 | |
| 19 | ⬜ | 1211 | [查询结果的质量和占比](https://leetcode.cn/problems/queries-quality-and-percentage/) | 条件聚合 | |
| 20 | ⬜ | 1193 | [每月交易 I](https://leetcode.cn/problems/monthly-transactions-i/) | 按月分组、条件求和 | |
| 21 | ⬜ | 1174 | [即时食物配送 II](https://leetcode.cn/problems/immediate-food-delivery-ii/) | 每组第一条（行值 IN） | |
| 22 | ⬜ | 550 | [游戏玩法分析 IV](https://leetcode.cn/problems/game-play-analysis-iv/) | 首日 + 次日留存 | |

## 第 4 组 · 排序和分组

| # | 状态 | 题号 | 题目 | 练什么 | 笔记 |
| --- | --- | --- | --- | --- | --- |
| 23 | ⬜ | 2356 | [每位教师所教授的科目种类的数量](https://leetcode.cn/problems/number-of-unique-subjects-taught-by-each-teacher/) | COUNT(DISTINCT) | |
| 24 | ⬜ | 1141 | [查询近30天活跃用户数](https://leetcode.cn/problems/user-activity-for-the-past-30-days-i/) | 日期区间 + 分组 | |
| 25 | ⬜ | 1070 | [产品销售分析 III](https://leetcode.cn/problems/product-sales-analysis-iii/) | 每组最小值那一行 | |
| 26 | ⬜ | 596 | [超过5名学生的课](https://leetcode.cn/problems/classes-more-than-5-students/) | HAVING | |
| 27 | ⬜ | 1729 | [求关注者的数量](https://leetcode.cn/problems/find-followers-count/) | GROUP BY + ORDER BY | |
| 28 | ⬜ | 619 | [只出现一次的最大数字](https://leetcode.cn/problems/biggest-single-number/) | HAVING + 外层聚合 | |
| 29 | ⬜ | 1045 | [买下所有产品的客户](https://leetcode.cn/problems/customers-who-bought-all-products/) | HAVING COUNT = 总数 | |

## 第 5 组 · 高级查询和连接

| # | 状态 | 题号 | 题目 | 练什么 | 笔记 |
| --- | --- | --- | --- | --- | --- |
| 30 | ⬜ | 1731 | [每位经理的下属员工数量](https://leetcode.cn/problems/the-number-of-employees-which-report-to-each-employee/) | 自连接 + 分组统计 | |
| 31 | ⬜ | 1789 | [员工的直属部门](https://leetcode.cn/problems/primary-department-for-each-employee/) | OR + 子查询 | |
| 32 | ⬜ | 610 | [判断三角形](https://leetcode.cn/problems/triangle-judgement/) | CASE WHEN | |
| 33 | ⬜ | 180 | [连续出现的数字](https://leetcode.cn/problems/consecutive-numbers/) | 窗口函数 LAG | |
| 34 | ⬜ | 1164 | [指定日期的产品价格](https://leetcode.cn/problems/product-price-at-a-given-date/) | 关联子查询 + 默认值 | |
| 35 | ⬜ | 1204 | [最后一个能进入巴士的人](https://leetcode.cn/problems/last-person-to-fit-in-the-bus/) | 累计和窗口 | |
| 36 | ⬜ | 1907 | [按分类统计薪水](https://leetcode.cn/problems/count-salary-categories/) | UNION ALL 补全类别 | |

## 第 6 组 · 子查询

| # | 状态 | 题号 | 题目 | 练什么 | 笔记 |
| --- | --- | --- | --- | --- | --- |
| 37 | ⬜ | 1978 | [上级经理已离职的公司员工](https://leetcode.cn/problems/employees-whose-manager-left-the-company/) | NOT IN 子查询 | |
| 38 | ⬜ | 626 | [换座位](https://leetcode.cn/problems/exchange-seats/) | CASE + 标量子查询 | |
| 39 | ⬜ | 1341 | [电影评分](https://leetcode.cn/problems/movie-rating/) | UNION ALL + 各自 LIMIT | |
| 40 | ⬜ | 1321 | [餐馆营业额变化增长](https://leetcode.cn/problems/restaurant-growth/) | CTE + 滑动窗口 | |
| 41 | ⬜ | 602 | [好友申请 II ：谁有最多的好友](https://leetcode.cn/problems/friend-requests-ii-who-has-the-most-friends/) | UNION ALL 拆两列 | |
| 42 | ⬜ | 585 | [2016年的投资](https://leetcode.cn/problems/investments-in-2016/) | 多条件 IN 子查询 | |
| 43 | ⬜ | 185 | [部门工资前三高的所有员工](https://leetcode.cn/problems/department-top-three-salaries/) | DENSE\_RANK 分组前 N | |

## 第 7 组 · 高级字符串函数 / 正则 / 子句

| # | 状态 | 题号 | 题目 | 练什么 | 笔记 |
| --- | --- | --- | --- | --- | --- |
| 44 | ⬜ | 1667 | [修复表中的名字](https://leetcode.cn/problems/fix-names-in-a-table/) | 大小写函数、拼接 | |
| 45 | ⬜ | 1527 | [患某种疾病的患者](https://leetcode.cn/problems/patients-with-a-condition/) | LIKE 模式匹配 | |
| 46 | ⬜ | 196 | [删除重复的电子邮箱](https://leetcode.cn/problems/delete-duplicate-emails/) | DELETE + 子查询 | |
| 47 | ⬜ | 176 | [第二高的薪水](https://leetcode.cn/problems/second-highest-salary/) | LIMIT OFFSET + 空值处理 | |
| 48 | ⬜ | 1484 | [按日期分组销售产品](https://leetcode.cn/problems/group-sold-products-by-the-date/) | group\_concat | |
| 49 | ⬜ | 1327 | [列出指定时间段内所有的下单产品](https://leetcode.cn/problems/list-the-products-ordered-in-a-period/) | 日期过滤 + HAVING | |
| 50 | ⬜ | 1517 | [查找拥有有效邮箱的用户](https://leetcode.cn/problems/find-users-with-valid-e-mails/) | 正则 REGEXP | |
