-- LeetCode SQL 50 · SQLite 版参考答案（先自己做，再来对照）
-- 用法：sqlite3 sql50.db 里先 .read setup/<题号>.sql，再粘贴对应答案


-- ============================================================
-- 第 1 查询
-- ============================================================

-- 1757. 可回收且低脂的产品
-- https://leetcode.cn/problems/recyclable-and-low-fat-products/
-- 分组：1 查询
-- 要点：MySQL 的 ENUM 在 SQLite 里用 TEXT + CHECK 约束代替。
SELECT product_id FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';

-- 584. 寻找用户推荐人
-- https://leetcode.cn/problems/find-customer-referee/
-- 分组：1 查询
-- 要点：NULL <> 2 的结果是 NULL 而不是真，所以必须单独写 IS NULL。两边一样。
SELECT name FROM Customer
WHERE referee_id IS NULL OR referee_id <> 2;

-- 595. 大的国家
-- https://leetcode.cn/problems/big-countries/
-- 分组：1 查询
SELECT name, population, area FROM World
WHERE area >= 3000000 OR population >= 25000000;

-- 1148. 文章浏览 I
-- https://leetcode.cn/problems/article-views-i/
-- 分组：1 查询
-- 要点：SQLite 没有 DATE 类型，日期用 'YYYY-MM-DD' 文本保存，按字符串比较即可正确排序。
SELECT DISTINCT author_id AS id FROM Views
WHERE author_id = viewer_id
ORDER BY id;

-- 1683. 无效的推文
-- https://leetcode.cn/problems/invalid-tweets/
-- 分组：1 查询
-- 要点：MySQL 的 LENGTH() 数的是字节，CHAR_LENGTH() 数字符；SQLite 的 length() 对文本数的就是字符。
SELECT tweet_id FROM Tweets
WHERE length(content) > 15;

-- ============================================================
-- 第 2 连接
-- ============================================================

-- 1378. 使用唯一标识码替换员工ID
-- https://leetcode.cn/problems/replace-employee-id-with-the-unique-identifier/
-- 分组：2 连接
SELECT u.unique_id, e.name
FROM Employees e LEFT JOIN EmployeeUNI u ON e.id = u.id;

-- 1068. 产品销售分析 I
-- https://leetcode.cn/problems/product-sales-analysis-i/
-- 分组：2 连接
SELECT p.product_name, s.year, s.price
FROM Sales s JOIN Product p ON s.product_id = p.product_id;

-- 1581. 进店却未进行过交易的顾客
-- https://leetcode.cn/problems/customer-who-visited-but-did-not-make-any-transactions/
-- 分组：2 连接
-- 要点：LEFT JOIN + IS NULL 是找“没有匹配”的标准写法，也可以用 NOT EXISTS。
SELECT v.customer_id, COUNT(*) AS count_no_trans
FROM Visits v LEFT JOIN Transactions t ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;

-- 197. 上升的温度
-- https://leetcode.cn/problems/rising-temperature/
-- 分组：2 连接
-- 要点：MySQL 写 DATEDIFF(a,b)=1 或 DATE_SUB(a, INTERVAL 1 DAY)；SQLite 用 date(a,'-1 day')，或 julianday(a)-julianday(b)=1。
SELECT w1.id
FROM Weather w1 JOIN Weather w2
  ON w2.recordDate = date(w1.recordDate, '-1 day')
WHERE w1.temperature > w2.temperature;

-- 1661. 每台机器的进程平均运行时间
-- https://leetcode.cn/problems/average-time-of-process-per-machine/
-- 分组：2 连接
SELECT s.machine_id, ROUND(AVG(e.timestamp - s.timestamp), 3) AS processing_time
FROM Activity s JOIN Activity e
  ON s.machine_id = e.machine_id AND s.process_id = e.process_id
 AND s.activity_type = 'start' AND e.activity_type = 'end'
GROUP BY s.machine_id;

-- 577. 员工奖金
-- https://leetcode.cn/problems/employee-bonus/
-- 分组：2 连接
SELECT e.name, b.bonus
FROM Employee e LEFT JOIN Bonus b ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;

-- 1280. 学生们参加各科测试的次数
-- https://leetcode.cn/problems/students-and-examinations/
-- 分组：2 连接
-- 要点：COUNT(列) 不数 NULL，COUNT(*) 会数，所以这里必须写 COUNT(e.student_id)。
SELECT s.student_id, s.student_name, sub.subject_name, COUNT(e.student_id) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
  ON e.student_id = s.student_id AND e.subject_name = sub.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;

-- 570. 至少有5名直接下属的经理
-- https://leetcode.cn/problems/managers-with-at-least-5-direct-reports/
-- 分组：2 连接
SELECT m.name
FROM Employee m JOIN Employee e ON e.managerId = m.id
GROUP BY m.id, m.name
HAVING COUNT(*) >= 5;

-- 1934. 确认率
-- https://leetcode.cn/problems/confirmation-rate/
-- 分组：2 连接
-- 要点：比较表达式在两边都返回 1/0，所以 AVG(条件) 直接就是比例。
SELECT s.user_id,
       ROUND(IFNULL(AVG(c.action = 'confirmed'), 0), 2) AS confirmation_rate
FROM Signups s LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id;

-- ============================================================
-- 第 3 聚合函数
-- ============================================================

-- 620. 有趣的电影
-- https://leetcode.cn/problems/not-boring-movies/
-- 分组：3 聚合函数
-- 要点：MySQL 的 MOD(id,2) 在 SQLite 里写成 id % 2。
SELECT * FROM Cinema
WHERE id % 2 = 1 AND description <> 'boring'
ORDER BY rating DESC;

-- 1251. 平均售价
-- https://leetcode.cn/problems/average-selling-price/
-- 分组：3 聚合函数
-- 要点：重点坑：SQLite 里整数 / 整数 是整除（7/2=3），MySQL 得 3.5。要乘 1.0 或 CAST(... AS REAL)。
SELECT p.product_id,
       ROUND(IFNULL(SUM(p.price * u.units) * 1.0 / SUM(u.units), 0), 2) AS average_price
FROM Prices p LEFT JOIN UnitsSold u
  ON p.product_id = u.product_id
 AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;

-- 1075. 项目员工 I
-- https://leetcode.cn/problems/project-employees-i/
-- 分组：3 聚合函数
-- 要点：AVG() 在 SQLite 里总是返回浮点数，不会整除。
SELECT p.project_id, ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project p JOIN Employee e ON p.employee_id = e.employee_id
GROUP BY p.project_id;

-- 1633. 各赛事的用户注册率
-- https://leetcode.cn/problems/percentage-of-users-attended-a-contest/
-- 分组：3 聚合函数
-- 要点：同样注意整除：写 100.0 而不是 100。
SELECT contest_id,
       ROUND(COUNT(user_id) * 100.0 / (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id;

-- 1211. 查询结果的质量和占比
-- https://leetcode.cn/problems/queries-quality-and-percentage/
-- 分组：3 聚合函数
-- 要点：rating/position 两个都是整数，不乘 1.0 会整除得 0。
SELECT query_name,
       ROUND(AVG(rating * 1.0 / position), 2) AS quality,
       ROUND(AVG(rating < 3) * 100, 2)       AS poor_query_percentage
FROM Queries
GROUP BY query_name;

-- 1193. 每月交易 I
-- https://leetcode.cn/problems/monthly-transactions-i/
-- 分组：3 聚合函数
-- 要点：MySQL 用 DATE_FORMAT(d,'%Y-%m') 或 LEFT(d,7)；SQLite 用 strftime('%Y-%m', d) 或 substr(d,1,7)。
SELECT strftime('%Y-%m', trans_date) AS month, country,
       COUNT(*)                                             AS trans_count,
       SUM(state = 'approved')                              AS approved_count,
       SUM(amount)                                          AS trans_total_amount,
       SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY month, country;

-- 1174. 即时食物配送 II
-- https://leetcode.cn/problems/immediate-food-delivery-ii/
-- 分组：3 聚合函数
-- 要点：(a, b) IN (子查询) 这种行值写法 SQLite 3.15 起支持。
SELECT ROUND(AVG(order_date = customer_pref_delivery_date) * 100, 2) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN (
  SELECT customer_id, MIN(order_date) FROM Delivery GROUP BY customer_id
);

-- 550. 游戏玩法分析 IV
-- https://leetcode.cn/problems/game-play-analysis-iv/
-- 分组：3 聚合函数
-- 要点：MySQL 的 DATE_SUB(d, INTERVAL 1 DAY) / DATE_ADD 对应 SQLite 的 date(d, '-1 day') / date(d, '+1 day')。
SELECT ROUND(COUNT(*) * 1.0 / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity
WHERE (player_id, date(event_date, '-1 day')) IN (
  SELECT player_id, MIN(event_date) FROM Activity GROUP BY player_id
);

-- ============================================================
-- 第 4 排序和分组
-- ============================================================

-- 2356. 每位教师所教授的科目种类的数量
-- https://leetcode.cn/problems/number-of-unique-subjects-taught-by-each-teacher/
-- 分组：4 排序和分组
SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;

-- 1141. 查询近30天活跃用户数
-- https://leetcode.cn/problems/user-activity-for-the-past-30-days-i/
-- 分组：4 排序和分组
-- 要点：MySQL 常写 DATEDIFF('2019-07-27', activity_date) < 30；SQLite 用 date('2019-07-27','-29 days') 算出起始日。
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN date('2019-07-27', '-29 days') AND '2019-07-27'
GROUP BY activity_date;

-- 1070. 产品销售分析 III
-- https://leetcode.cn/problems/product-sales-analysis-iii/
-- 分组：4 排序和分组
SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) IN (
  SELECT product_id, MIN(year) FROM Sales GROUP BY product_id
);

-- 596. 超过5名学生的课
-- https://leetcode.cn/problems/classes-more-than-5-students/
-- 分组：4 排序和分组
-- 要点：WHERE 在分组前过滤行，HAVING 在分组后过滤组。
SELECT class FROM Courses
GROUP BY class
HAVING COUNT(*) >= 5;

-- 1729. 求关注者的数量
-- https://leetcode.cn/problems/find-followers-count/
-- 分组：4 排序和分组
SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;

-- 619. 只出现一次的最大数字
-- https://leetcode.cn/problems/biggest-single-number/
-- 分组：4 排序和分组
-- 要点：外层用 MAX() 包一层，没有结果时也能返回一行 NULL。MySQL 要求子查询起别名，SQLite 不强制，但写上更好。
SELECT MAX(num) AS num
FROM (SELECT num FROM MyNumbers GROUP BY num HAVING COUNT(*) = 1);

-- 1045. 买下所有产品的客户
-- https://leetcode.cn/problems/customers-who-bought-all-products/
-- 分组：4 排序和分组
SELECT customer_id FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);

-- ============================================================
-- 第 5 高级查询和连接
-- ============================================================

-- 1731. 每位经理的下属员工数量
-- https://leetcode.cn/problems/the-number-of-employees-which-report-to-each-employee/
-- 分组：5 高级查询和连接
-- 要点：SQLite 的 ROUND(x) 返回浮点（39.0），MySQL 返回整数；要整数就 CAST(... AS INTEGER)。
SELECT m.employee_id, m.name,
       COUNT(*)                              AS reports_count,
       CAST(ROUND(AVG(e.age)) AS INTEGER)    AS average_age
FROM Employees m JOIN Employees e ON e.reports_to = m.employee_id
GROUP BY m.employee_id, m.name
ORDER BY m.employee_id;

-- 1789. 员工的直属部门
-- https://leetcode.cn/problems/primary-department-for-each-employee/
-- 分组：5 高级查询和连接
SELECT employee_id, department_id FROM Employee
WHERE primary_flag = 'Y'
   OR employee_id IN (SELECT employee_id FROM Employee GROUP BY employee_id HAVING COUNT(*) = 1);

-- 610. 判断三角形
-- https://leetcode.cn/problems/triangle-judgement/
-- 分组：5 高级查询和连接
-- 要点：MySQL 的 IF(cond, a, b) 在 SQLite 里写 iif(cond, a, b)（3.32+）或 CASE WHEN。
SELECT x, y, z,
       CASE WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes' ELSE 'No' END AS triangle
FROM Triangle;

-- 180. 连续出现的数字
-- https://leetcode.cn/problems/consecutive-numbers/
-- 分组：5 高级查询和连接
-- 要点：窗口函数 LAG/LEAD 在 SQLite 3.25+、MySQL 8.0+ 可用。这题假设 id 连续；也可以用三表自连接 l2.id = l1.id + 1。
SELECT DISTINCT num AS ConsecutiveNums
FROM (
  SELECT num,
         LAG(num, 1)  OVER (ORDER BY id) AS prev1,
         LAG(num, 2)  OVER (ORDER BY id) AS prev2
  FROM Logs
)
WHERE num = prev1 AND num = prev2;

-- 1164. 指定日期的产品价格
-- https://leetcode.cn/problems/product-price-at-a-given-date/
-- 分组：5 高级查询和连接
-- 要点：关联子查询：内层引用外层的 p.product_id，每行跑一次。
SELECT p.product_id,
       IFNULL((SELECT new_price FROM Products x
               WHERE x.product_id = p.product_id AND x.change_date <= '2019-08-16'
               ORDER BY x.change_date DESC LIMIT 1), 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) p;

-- 1204. 最后一个能进入巴士的人
-- https://leetcode.cn/problems/last-person-to-fit-in-the-bus/
-- 分组：5 高级查询和连接
-- 要点：SUM() OVER (ORDER BY ...) 就是累计和。
SELECT person_name
FROM (SELECT person_name, turn, SUM(weight) OVER (ORDER BY turn) AS total FROM Queue)
WHERE total <= 1000
ORDER BY turn DESC
LIMIT 1;

-- 1907. 按分类统计薪水
-- https://leetcode.cn/problems/count-salary-categories/
-- 分组：5 高级查询和连接
-- 要点：要求即使某类为 0 也要输出，所以不能简单 GROUP BY（没有行的组不会出现）。表为空时 SUM 返回 NULL，所以每个 SUM 都包了 IFNULL(...,0)。
SELECT 'Low Salary' AS category, IFNULL(SUM(income < 20000), 0) AS accounts_count FROM Accounts
UNION ALL
SELECT 'Average Salary', IFNULL(SUM(income BETWEEN 20000 AND 50000), 0) FROM Accounts
UNION ALL
SELECT 'High Salary', IFNULL(SUM(income > 50000), 0) FROM Accounts;

-- ============================================================
-- 第 6 子查询
-- ============================================================

-- 1978. 上级经理已离职的公司员工
-- https://leetcode.cn/problems/employees-whose-manager-left-the-company/
-- 分组：6 子查询
-- 要点：NOT IN 坑：子查询里只要有一个 NULL，整个 NOT IN 就永远不为真。这里 employee_id 是主键不会为 NULL，所以安全；不确定时用 NOT EXISTS。
SELECT employee_id FROM Employees
WHERE salary < 30000
  AND manager_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY employee_id;

-- 626. 换座位
-- https://leetcode.cn/problems/exchange-seats/
-- 分组：6 子查询
SELECT CASE
         WHEN id % 2 = 1 AND id = (SELECT MAX(id) FROM Seat) THEN id
         WHEN id % 2 = 1 THEN id + 1
         ELSE id - 1
       END AS id,
       student
FROM Seat
ORDER BY id;

-- 1341. 电影评分
-- https://leetcode.cn/problems/movie-rating/
-- 分组：6 子查询
-- 要点：MySQL 可以写 (SELECT ... ORDER BY ... LIMIT 1) UNION ALL (SELECT ...)；SQLite 不允许 UNION 的分支里带括号和 ORDER BY/LIMIT，要用 SELECT * FROM (...) 包起来。
SELECT * FROM (
  SELECT u.name AS results
  FROM MovieRating r JOIN Users u ON r.user_id = u.user_id
  GROUP BY u.user_id, u.name
  ORDER BY COUNT(*) DESC, u.name
  LIMIT 1
)
UNION ALL
SELECT * FROM (
  SELECT m.title
  FROM MovieRating r JOIN Movies m ON r.movie_id = m.movie_id
  WHERE r.created_at BETWEEN '2020-02-01' AND '2020-02-29'
  GROUP BY m.movie_id, m.title
  ORDER BY AVG(r.rating) DESC, m.title
  LIMIT 1
);

-- 1321. 餐馆营业额变化增长
-- https://leetcode.cn/problems/restaurant-growth/
-- 分组：6 子查询
-- 要点：MySQL 常用 DATE_ADD / DATEDIFF 做 7 天窗口；SQLite 用 date(x,'+6 days')。ROWS 窗口依赖“每天都有记录”这一题目保证。
WITH daily AS (
  SELECT visited_on, SUM(amount) AS amount FROM Customer GROUP BY visited_on
),
win AS (
  SELECT visited_on,
         SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount
  FROM daily
)
SELECT visited_on, amount, ROUND(amount / 7.0, 2) AS average_amount
FROM win
WHERE visited_on >= (SELECT date(MIN(visited_on), '+6 days') FROM Customer)
ORDER BY visited_on;

-- 602. 好友申请 II ：谁有最多的好友
-- https://leetcode.cn/problems/friend-requests-ii-who-has-the-most-friends/
-- 分组：6 子查询
-- 要点：UNION 会去重，UNION ALL 不去重。这里必须用 UNION ALL。
SELECT id, COUNT(*) AS num
FROM (SELECT requester_id AS id FROM RequestAccepted
      UNION ALL
      SELECT accepter_id FROM RequestAccepted)
GROUP BY id
ORDER BY num DESC
LIMIT 1;

-- 585. 2016年的投资
-- https://leetcode.cn/problems/investments-in-2016/
-- 分组：6 子查询
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (SELECT tiv_2015 FROM Insurance GROUP BY tiv_2015 HAVING COUNT(*) > 1)
  AND (lat, lon) IN (SELECT lat, lon FROM Insurance GROUP BY lat, lon HAVING COUNT(*) = 1);

-- 185. 部门工资前三高的所有员工
-- https://leetcode.cn/problems/department-top-three-salaries/
-- 分组：6 子查询
-- 要点：ROW_NUMBER 不并列、RANK 并列后跳号、DENSE_RANK 并列不跳号。这题要 DENSE_RANK。
SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM (SELECT *, DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rk
      FROM Employee) e
JOIN Department d ON e.departmentId = d.id
WHERE e.rk <= 3;

-- ============================================================
-- 第 7 高级字符串函数 / 正则 / 子句
-- ============================================================

-- 1667. 修复表中的名字
-- https://leetcode.cn/problems/fix-names-in-a-table/
-- 分组：7 高级字符串函数 / 正则 / 子句
-- 要点：MySQL 的 CONCAT(a,b) 在 SQLite 里用 a || b（SQLite 3.44+ 也有 concat()）；SUBSTRING 写 substr。
SELECT user_id, upper(substr(name, 1, 1)) || lower(substr(name, 2)) AS name
FROM Users
ORDER BY user_id;

-- 1527. 患某种疾病的患者
-- https://leetcode.cn/problems/patients-with-a-condition/
-- 分组：7 高级字符串函数 / 正则 / 子句
-- 要点：SQLite 的 LIKE 对英文字母默认不区分大小写；要区分大小写可用 GLOB（通配符是 * 和 ?）：conditions GLOB 'DIAB1*'。
SELECT * FROM Patients
WHERE conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%';

-- 196. 删除重复的电子邮箱
-- https://leetcode.cn/problems/delete-duplicate-emails/
-- 分组：7 高级字符串函数 / 正则 / 子句
-- 要点：MySQL 不允许在 DELETE 的子查询里直接读同一张表（错误 1093），常写成多表 DELETE p1 FROM Person p1 JOIN Person p2 ...；SQLite 不支持多表 DELETE，但允许上面的子查询写法。
DELETE FROM Person
WHERE id NOT IN (SELECT MIN(id) FROM Person GROUP BY email);
SELECT * FROM Person;  -- 查看删除后的结果

-- 176. 第二高的薪水
-- https://leetcode.cn/problems/second-highest-salary/
-- 分组：7 高级字符串函数 / 正则 / 子句
-- 要点：外面套一层 SELECT (...)，没有第二高时会返回 NULL 而不是空结果。LIMIT 1 OFFSET 1 和 MySQL 的 LIMIT 1,1 在 SQLite 里都能用。
SELECT (SELECT DISTINCT salary FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET 1) AS SecondHighestSalary;

-- 1484. 按日期分组销售产品
-- https://leetcode.cn/problems/group-sold-products-by-the-date/
-- 分组：7 高级字符串函数 / 正则 / 子句
-- 要点：MySQL: GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',')。SQLite 3.44+ 支持聚合内 ORDER BY；DISTINCT 时不能自定义分隔符，默认就是逗号。
SELECT sell_date,
       COUNT(DISTINCT product)                          AS num_sold,
       group_concat(DISTINCT product ORDER BY product)  AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;

-- 1327. 列出指定时间段内所有的下单产品
-- https://leetcode.cn/problems/list-the-products-ordered-in-a-period/
-- 分组：7 高级字符串函数 / 正则 / 子句
SELECT p.product_name, SUM(o.unit) AS unit
FROM Orders o JOIN Products p ON o.product_id = p.product_id
WHERE strftime('%Y-%m', o.order_date) = '2020-02'
GROUP BY p.product_id, p.product_name
HAVING SUM(o.unit) >= 100;

-- 1517. 查找拥有有效邮箱的用户
-- https://leetcode.cn/problems/find-users-with-valid-e-mails/
-- 分组：7 高级字符串函数 / 正则 / 子句
-- 要点：SQLite 内核没有内置 REGEXP 实现；sqlite3 命令行工具自带（3.36+），Python 的 sqlite3 模块里要自己用 create_function 注册。MySQL 8 的 REGEXP 默认不区分大小写。另外 CLI 的正则引擎不认方括号末尾的 -，要把 - 放在最前面：[-A-Za-z0-9_.]。
SELECT * FROM Users
WHERE mail REGEXP '^[A-Za-z][-A-Za-z0-9_.]*@leetcode[.]com$';
