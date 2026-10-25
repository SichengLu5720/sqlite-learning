.headers on
.mode box

.print '=== 1 查询 ==='
.print ''
.print '--- 1757. 可回收且低脂的产品'
DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
  product_id INTEGER PRIMARY KEY,
  low_fats   TEXT CHECK (low_fats IN ('Y','N')),
  recyclable TEXT CHECK (recyclable IN ('Y','N'))
);
INSERT INTO Products VALUES (0,'Y','N'),(1,'Y','Y'),(2,'N','Y'),(3,'Y','Y'),(4,'N','N');
SELECT product_id FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';

.print ''
.print '--- 584. 寻找用户推荐人'
DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer (id INTEGER PRIMARY KEY, name TEXT, referee_id INTEGER);
INSERT INTO Customer VALUES (1,'Will',NULL),(2,'Jane',NULL),(3,'Alex',2),(4,'Bill',NULL),(5,'Zack',1),(6,'Mark',2);
SELECT name FROM Customer
WHERE referee_id IS NULL OR referee_id <> 2;

.print ''
.print '--- 595. 大的国家'
DROP TABLE IF EXISTS World;
CREATE TABLE World (name TEXT PRIMARY KEY, continent TEXT, area INTEGER, population INTEGER, gdp INTEGER);
INSERT INTO World VALUES
 ('Afghanistan','Asia',652230,25500100,20343000000),
 ('Albania','Europe',28748,2831741,12960000000),
 ('Algeria','Africa',2381741,37100000,188681000000),
 ('Andorra','Europe',468,78115,3712000000),
 ('Angola','Africa',1246700,20609294,100990000000);
SELECT name, population, area FROM World
WHERE area >= 3000000 OR population >= 25000000;

.print ''
.print '--- 1148. 文章浏览 I'
DROP TABLE IF EXISTS Views;
CREATE TABLE Views (article_id INTEGER, author_id INTEGER, viewer_id INTEGER, view_date TEXT);
INSERT INTO Views VALUES
 (1,3,5,'2019-08-01'),(1,3,6,'2019-08-02'),(2,7,7,'2019-08-01'),(2,7,6,'2019-08-02'),
 (4,7,1,'2019-07-22'),(3,4,4,'2019-07-21'),(3,4,4,'2019-07-21');
SELECT DISTINCT author_id AS id FROM Views
WHERE author_id = viewer_id
ORDER BY id;

.print ''
.print '--- 1683. 无效的推文'
DROP TABLE IF EXISTS Tweets;
CREATE TABLE Tweets (tweet_id INTEGER PRIMARY KEY, content TEXT);
INSERT INTO Tweets VALUES (1,'Let us Code'),(2,'More than fifteen chars are here!');
SELECT tweet_id FROM Tweets
WHERE length(content) > 15;

.print '=== 2 连接 ==='
.print ''
.print '--- 1378. 使用唯一标识码替换员工ID'
DROP TABLE IF EXISTS Employees; DROP TABLE IF EXISTS EmployeeUNI;
CREATE TABLE Employees (id INTEGER PRIMARY KEY, name TEXT);
CREATE TABLE EmployeeUNI (id INTEGER, unique_id INTEGER, PRIMARY KEY (id, unique_id));
INSERT INTO Employees VALUES (1,'Alice'),(7,'Bob'),(11,'Meir'),(90,'Winston'),(3,'Jonathan');
INSERT INTO EmployeeUNI VALUES (3,1),(11,2),(90,3);
SELECT u.unique_id, e.name
FROM Employees e LEFT JOIN EmployeeUNI u ON e.id = u.id;

.print ''
.print '--- 1068. 产品销售分析 I'
DROP TABLE IF EXISTS Sales; DROP TABLE IF EXISTS Product;
CREATE TABLE Product (product_id INTEGER PRIMARY KEY, product_name TEXT);
CREATE TABLE Sales (sale_id INTEGER, product_id INTEGER REFERENCES Product, year INTEGER, quantity INTEGER, price INTEGER,
                    PRIMARY KEY (sale_id, year));
INSERT INTO Product VALUES (100,'Nokia'),(200,'Apple'),(300,'Samsung');
INSERT INTO Sales VALUES (1,100,2008,10,5000),(2,100,2009,12,5000),(7,200,2011,15,9000);
SELECT p.product_name, s.year, s.price
FROM Sales s JOIN Product p ON s.product_id = p.product_id;

.print ''
.print '--- 1581. 进店却未进行过交易的顾客'
DROP TABLE IF EXISTS Visits; DROP TABLE IF EXISTS Transactions;
CREATE TABLE Visits (visit_id INTEGER PRIMARY KEY, customer_id INTEGER);
CREATE TABLE Transactions (transaction_id INTEGER PRIMARY KEY, visit_id INTEGER, amount INTEGER);
INSERT INTO Visits VALUES (1,23),(2,9),(4,30),(5,54),(6,96),(7,54),(8,54);
INSERT INTO Transactions VALUES (2,5,310),(3,5,300),(9,5,200),(12,1,910),(13,2,970);
SELECT v.customer_id, COUNT(*) AS count_no_trans
FROM Visits v LEFT JOIN Transactions t ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;

.print ''
.print '--- 197. 上升的温度'
DROP TABLE IF EXISTS Weather;
CREATE TABLE Weather (id INTEGER PRIMARY KEY, recordDate TEXT, temperature INTEGER);
INSERT INTO Weather VALUES (1,'2015-01-01',10),(2,'2015-01-02',25),(3,'2015-01-03',20),(4,'2015-01-04',30),(5,'2015-01-06',35);
SELECT w1.id
FROM Weather w1 JOIN Weather w2
  ON w2.recordDate = date(w1.recordDate, '-1 day')
WHERE w1.temperature > w2.temperature;

.print ''
.print '--- 1661. 每台机器的进程平均运行时间'
DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity (machine_id INTEGER, process_id INTEGER,
  activity_type TEXT CHECK (activity_type IN ('start','end')), timestamp REAL,
  PRIMARY KEY (machine_id, process_id, activity_type));
INSERT INTO Activity VALUES
 (0,0,'start',0.712),(0,0,'end',1.520),(0,1,'start',3.140),(0,1,'end',4.120),
 (1,0,'start',0.550),(1,0,'end',1.550),(1,1,'start',0.430),(1,1,'end',1.420),
 (2,0,'start',4.100),(2,0,'end',4.512),(2,1,'start',2.500),(2,1,'end',5.000);
SELECT s.machine_id, ROUND(AVG(e.timestamp - s.timestamp), 3) AS processing_time
FROM Activity s JOIN Activity e
  ON s.machine_id = e.machine_id AND s.process_id = e.process_id
 AND s.activity_type = 'start' AND e.activity_type = 'end'
GROUP BY s.machine_id;

.print ''
.print '--- 577. 员工奖金'
DROP TABLE IF EXISTS Employee; DROP TABLE IF EXISTS Bonus;
CREATE TABLE Employee (empId INTEGER PRIMARY KEY, name TEXT, supervisor INTEGER, salary INTEGER);
CREATE TABLE Bonus (empId INTEGER PRIMARY KEY, bonus INTEGER);
INSERT INTO Employee VALUES (3,'Brad',NULL,4000),(1,'John',3,1000),(2,'Dan',3,2000),(4,'Thomas',3,4000);
INSERT INTO Bonus VALUES (2,500),(4,2000);
SELECT e.name, b.bonus
FROM Employee e LEFT JOIN Bonus b ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;

.print ''
.print '--- 1280. 学生们参加各科测试的次数'
DROP TABLE IF EXISTS Students; DROP TABLE IF EXISTS Subjects; DROP TABLE IF EXISTS Examinations;
CREATE TABLE Students (student_id INTEGER PRIMARY KEY, student_name TEXT);
CREATE TABLE Subjects (subject_name TEXT PRIMARY KEY);
CREATE TABLE Examinations (student_id INTEGER, subject_name TEXT);
INSERT INTO Students VALUES (1,'Alice'),(2,'Bob'),(13,'John'),(6,'Alex');
INSERT INTO Subjects VALUES ('Math'),('Physics'),('Programming');
INSERT INTO Examinations VALUES (1,'Math'),(1,'Physics'),(1,'Programming'),(2,'Programming'),(1,'Physics'),
 (1,'Math'),(13,'Math'),(13,'Programming'),(13,'Physics'),(2,'Math'),(1,'Math');
SELECT s.student_id, s.student_name, sub.subject_name, COUNT(e.student_id) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
  ON e.student_id = s.student_id AND e.subject_name = sub.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;

.print ''
.print '--- 570. 至少有5名直接下属的经理'
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (id INTEGER PRIMARY KEY, name TEXT, department TEXT, managerId INTEGER);
INSERT INTO Employee VALUES (101,'John','A',NULL),(102,'Dan','A',101),(103,'James','A',101),
 (104,'Amy','A',101),(105,'Anne','A',101),(106,'Ron','B',101),(107,'Lia','B',106);
SELECT m.name
FROM Employee m JOIN Employee e ON e.managerId = m.id
GROUP BY m.id, m.name
HAVING COUNT(*) >= 5;

.print ''
.print '--- 1934. 确认率'
DROP TABLE IF EXISTS Signups; DROP TABLE IF EXISTS Confirmations;
CREATE TABLE Signups (user_id INTEGER PRIMARY KEY, time_stamp TEXT);
CREATE TABLE Confirmations (user_id INTEGER, time_stamp TEXT,
  action TEXT CHECK (action IN ('confirmed','timeout')), PRIMARY KEY (user_id, time_stamp));
INSERT INTO Signups VALUES (3,'2020-03-21 10:16:13'),(7,'2020-01-04 13:57:59'),(2,'2020-07-29 23:09:44'),(6,'2020-12-09 10:39:37');
INSERT INTO Confirmations VALUES (3,'2021-01-06 03:30:46','timeout'),(3,'2021-07-14 14:00:00','timeout'),
 (7,'2021-06-12 11:57:29','confirmed'),(7,'2021-06-13 12:58:28','confirmed'),(7,'2021-06-14 13:59:27','confirmed'),
 (2,'2021-01-22 00:00:00','confirmed'),(2,'2021-02-28 23:59:59','timeout');
SELECT s.user_id,
       ROUND(IFNULL(AVG(c.action = 'confirmed'), 0), 2) AS confirmation_rate
FROM Signups s LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id;

.print '=== 3 聚合函数 ==='
.print ''
.print '--- 620. 有趣的电影'
DROP TABLE IF EXISTS Cinema;
CREATE TABLE Cinema (id INTEGER PRIMARY KEY, movie TEXT, description TEXT, rating REAL);
INSERT INTO Cinema VALUES (1,'War','great 3D',8.9),(2,'Science','fiction',8.5),(3,'irish','boring',6.2),
 (4,'Ice song','Fantacy',8.6),(5,'House card','Interesting',9.1);
SELECT * FROM Cinema
WHERE id % 2 = 1 AND description <> 'boring'
ORDER BY rating DESC;

.print ''
.print '--- 1251. 平均售价'
DROP TABLE IF EXISTS Prices; DROP TABLE IF EXISTS UnitsSold;
CREATE TABLE Prices (product_id INTEGER, start_date TEXT, end_date TEXT, price INTEGER,
                     PRIMARY KEY (product_id, start_date, end_date));
CREATE TABLE UnitsSold (product_id INTEGER, purchase_date TEXT, units INTEGER);
INSERT INTO Prices VALUES (1,'2019-02-17','2019-02-28',5),(1,'2019-03-01','2019-03-22',20),
 (2,'2019-02-01','2019-02-20',15),(2,'2019-02-21','2019-03-31',30),(3,'2019-01-01','2019-12-31',9);
INSERT INTO UnitsSold VALUES (1,'2019-02-25',100),(1,'2019-03-01',15),(2,'2019-02-10',200),(2,'2019-03-22',30);
SELECT p.product_id,
       ROUND(IFNULL(SUM(p.price * u.units) * 1.0 / SUM(u.units), 0), 2) AS average_price
FROM Prices p LEFT JOIN UnitsSold u
  ON p.product_id = u.product_id
 AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;

.print ''
.print '--- 1075. 项目员工 I'
DROP TABLE IF EXISTS Project; DROP TABLE IF EXISTS Employee;
CREATE TABLE Project (project_id INTEGER, employee_id INTEGER, PRIMARY KEY (project_id, employee_id));
CREATE TABLE Employee (employee_id INTEGER PRIMARY KEY, name TEXT, experience_years INTEGER);
INSERT INTO Project VALUES (1,1),(1,2),(1,3),(2,1),(2,4);
INSERT INTO Employee VALUES (1,'Khaled',3),(2,'Ali',2),(3,'John',1),(4,'Doe',2);
SELECT p.project_id, ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project p JOIN Employee e ON p.employee_id = e.employee_id
GROUP BY p.project_id;

.print ''
.print '--- 1633. 各赛事的用户注册率'
DROP TABLE IF EXISTS Users; DROP TABLE IF EXISTS Register;
CREATE TABLE Users (user_id INTEGER PRIMARY KEY, user_name TEXT);
CREATE TABLE Register (contest_id INTEGER, user_id INTEGER, PRIMARY KEY (contest_id, user_id));
INSERT INTO Users VALUES (6,'Alice'),(2,'Bob'),(7,'Alex');
INSERT INTO Register VALUES (215,6),(209,2),(208,2),(210,6),(208,6),(209,7),(209,6),(215,7),(208,7),(210,2),(207,2),(210,7);
SELECT contest_id,
       ROUND(COUNT(user_id) * 100.0 / (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id;

.print ''
.print '--- 1211. 查询结果的质量和占比'
DROP TABLE IF EXISTS Queries;
CREATE TABLE Queries (query_name TEXT, result TEXT, position INTEGER, rating INTEGER);
INSERT INTO Queries VALUES ('Dog','Golden Retriever',1,5),('Dog','German Shepherd',2,5),('Dog','Mule',200,1),
 ('Cat','Shirazi',5,2),('Cat','Siamese',3,3),('Cat','Sphynx',7,4);
SELECT query_name,
       ROUND(AVG(rating * 1.0 / position), 2) AS quality,
       ROUND(AVG(rating < 3) * 100, 2)       AS poor_query_percentage
FROM Queries
GROUP BY query_name;

.print ''
.print '--- 1193. 每月交易 I'
DROP TABLE IF EXISTS Transactions;
CREATE TABLE Transactions (id INTEGER PRIMARY KEY, country TEXT,
  state TEXT CHECK (state IN ('approved','declined')), amount INTEGER, trans_date TEXT);
INSERT INTO Transactions VALUES (121,'US','approved',1000,'2018-12-18'),(122,'US','declined',2000,'2018-12-19'),
 (123,'US','approved',2000,'2019-01-01'),(124,'DE','approved',2000,'2019-01-07');
SELECT strftime('%Y-%m', trans_date) AS month, country,
       COUNT(*)                                             AS trans_count,
       SUM(state = 'approved')                              AS approved_count,
       SUM(amount)                                          AS trans_total_amount,
       SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY month, country;

.print ''
.print '--- 1174. 即时食物配送 II'
DROP TABLE IF EXISTS Delivery;
CREATE TABLE Delivery (delivery_id INTEGER PRIMARY KEY, customer_id INTEGER, order_date TEXT, customer_pref_delivery_date TEXT);
INSERT INTO Delivery VALUES (1,1,'2019-08-01','2019-08-02'),(2,2,'2019-08-02','2019-08-02'),(3,1,'2019-08-11','2019-08-12'),
 (4,3,'2019-08-24','2019-08-24'),(5,3,'2019-08-21','2019-08-22'),(6,2,'2019-08-11','2019-08-13'),(7,4,'2019-08-09','2019-08-09');
SELECT ROUND(AVG(order_date = customer_pref_delivery_date) * 100, 2) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN (
  SELECT customer_id, MIN(order_date) FROM Delivery GROUP BY customer_id
);

.print ''
.print '--- 550. 游戏玩法分析 IV'
DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity (player_id INTEGER, device_id INTEGER, event_date TEXT, games_played INTEGER,
                       PRIMARY KEY (player_id, event_date));
INSERT INTO Activity VALUES (1,2,'2016-03-01',5),(1,2,'2016-03-02',6),(2,3,'2017-06-25',1),(3,1,'2016-03-02',0),(3,4,'2018-07-03',5);
SELECT ROUND(COUNT(*) * 1.0 / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity
WHERE (player_id, date(event_date, '-1 day')) IN (
  SELECT player_id, MIN(event_date) FROM Activity GROUP BY player_id
);

.print '=== 4 排序和分组 ==='
.print ''
.print '--- 2356. 每位教师所教授的科目种类的数量'
DROP TABLE IF EXISTS Teacher;
CREATE TABLE Teacher (teacher_id INTEGER, subject_id INTEGER, dept_id INTEGER, PRIMARY KEY (subject_id, dept_id));
INSERT INTO Teacher VALUES (1,2,3),(1,2,4),(1,3,3),(2,1,1),(2,2,1),(2,3,1),(2,4,1);
SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;

.print ''
.print '--- 1141. 查询近30天活跃用户数'
DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity (user_id INTEGER, session_id INTEGER, activity_date TEXT,
  activity_type TEXT CHECK (activity_type IN ('open_session','end_session','scroll_down','send_message')));
INSERT INTO Activity VALUES (1,1,'2019-07-20','open_session'),(1,1,'2019-07-20','scroll_down'),(1,1,'2019-07-20','end_session'),
 (2,4,'2019-07-20','open_session'),(2,4,'2019-07-21','send_message'),(2,4,'2019-07-21','end_session'),
 (3,2,'2019-07-21','open_session'),(3,2,'2019-07-21','send_message'),(3,2,'2019-07-21','end_session'),
 (4,3,'2019-06-25','open_session'),(4,3,'2019-06-25','end_session');
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN date('2019-07-27', '-29 days') AND '2019-07-27'
GROUP BY activity_date;

.print ''
.print '--- 1070. 产品销售分析 III'
DROP TABLE IF EXISTS Sales; DROP TABLE IF EXISTS Product;
CREATE TABLE Product (product_id INTEGER PRIMARY KEY, product_name TEXT);
CREATE TABLE Sales (sale_id INTEGER, product_id INTEGER, year INTEGER, quantity INTEGER, price INTEGER,
                    PRIMARY KEY (sale_id, year));
INSERT INTO Product VALUES (100,'Nokia'),(200,'Apple'),(300,'Samsung');
INSERT INTO Sales VALUES (1,100,2008,10,5000),(2,100,2009,12,5000),(7,200,2011,15,9000);
SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) IN (
  SELECT product_id, MIN(year) FROM Sales GROUP BY product_id
);

.print ''
.print '--- 596. 超过5名学生的课'
DROP TABLE IF EXISTS Courses;
CREATE TABLE Courses (student TEXT, class TEXT, PRIMARY KEY (student, class));
INSERT INTO Courses VALUES ('A','Math'),('B','English'),('C','Math'),('D','Biology'),('E','Math'),
 ('F','Computer'),('G','Math'),('H','Math'),('I','Math');
SELECT class FROM Courses
GROUP BY class
HAVING COUNT(*) >= 5;

.print ''
.print '--- 1729. 求关注者的数量'
DROP TABLE IF EXISTS Followers;
CREATE TABLE Followers (user_id INTEGER, follower_id INTEGER, PRIMARY KEY (user_id, follower_id));
INSERT INTO Followers VALUES (0,1),(1,0),(2,0),(2,1);
SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;

.print ''
.print '--- 619. 只出现一次的最大数字'
DROP TABLE IF EXISTS MyNumbers;
CREATE TABLE MyNumbers (num INTEGER);
INSERT INTO MyNumbers VALUES (8),(8),(3),(3),(1),(4),(5),(6);
SELECT MAX(num) AS num
FROM (SELECT num FROM MyNumbers GROUP BY num HAVING COUNT(*) = 1);

.print ''
.print '--- 1045. 买下所有产品的客户'
DROP TABLE IF EXISTS Customer; DROP TABLE IF EXISTS Product;
CREATE TABLE Product (product_key INTEGER PRIMARY KEY);
CREATE TABLE Customer (customer_id INTEGER, product_key INTEGER REFERENCES Product);
INSERT INTO Product VALUES (5),(6);
INSERT INTO Customer VALUES (1,5),(2,6),(3,5),(3,6),(1,6);
SELECT customer_id FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);

.print '=== 5 高级查询和连接 ==='
.print ''
.print '--- 1731. 每位经理的下属员工数量'
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (employee_id INTEGER PRIMARY KEY, name TEXT, reports_to INTEGER, age INTEGER);
INSERT INTO Employees VALUES (9,'Hercy',NULL,43),(6,'Alice',9,41),(4,'Bob',9,36),(2,'Winston',NULL,37);
SELECT m.employee_id, m.name,
       COUNT(*)                              AS reports_count,
       CAST(ROUND(AVG(e.age)) AS INTEGER)    AS average_age
FROM Employees m JOIN Employees e ON e.reports_to = m.employee_id
GROUP BY m.employee_id, m.name
ORDER BY m.employee_id;

.print ''
.print '--- 1789. 员工的直属部门'
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (employee_id INTEGER, department_id INTEGER,
  primary_flag TEXT CHECK (primary_flag IN ('Y','N')), PRIMARY KEY (employee_id, department_id));
INSERT INTO Employee VALUES (1,1,'N'),(2,1,'Y'),(2,2,'N'),(3,3,'N'),(4,2,'N'),(4,3,'Y'),(4,4,'N');
SELECT employee_id, department_id FROM Employee
WHERE primary_flag = 'Y'
   OR employee_id IN (SELECT employee_id FROM Employee GROUP BY employee_id HAVING COUNT(*) = 1);

.print ''
.print '--- 610. 判断三角形'
DROP TABLE IF EXISTS Triangle;
CREATE TABLE Triangle (x INTEGER, y INTEGER, z INTEGER, PRIMARY KEY (x, y, z));
INSERT INTO Triangle VALUES (13,15,30),(10,20,15);
SELECT x, y, z,
       CASE WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes' ELSE 'No' END AS triangle
FROM Triangle;

.print ''
.print '--- 180. 连续出现的数字'
DROP TABLE IF EXISTS Logs;
CREATE TABLE Logs (id INTEGER PRIMARY KEY, num TEXT);
INSERT INTO Logs VALUES (1,'1'),(2,'1'),(3,'1'),(4,'2'),(5,'1'),(6,'2'),(7,'2');
SELECT DISTINCT num AS ConsecutiveNums
FROM (
  SELECT num,
         LAG(num, 1)  OVER (ORDER BY id) AS prev1,
         LAG(num, 2)  OVER (ORDER BY id) AS prev2
  FROM Logs
)
WHERE num = prev1 AND num = prev2;

.print ''
.print '--- 1164. 指定日期的产品价格'
DROP TABLE IF EXISTS Products;
CREATE TABLE Products (product_id INTEGER, new_price INTEGER, change_date TEXT, PRIMARY KEY (product_id, change_date));
INSERT INTO Products VALUES (1,20,'2019-08-14'),(2,50,'2019-08-14'),(1,30,'2019-08-15'),(1,35,'2019-08-16'),
 (2,65,'2019-08-17'),(3,20,'2019-08-18');
SELECT p.product_id,
       IFNULL((SELECT new_price FROM Products x
               WHERE x.product_id = p.product_id AND x.change_date <= '2019-08-16'
               ORDER BY x.change_date DESC LIMIT 1), 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) p;

.print ''
.print '--- 1204. 最后一个能进入巴士的人'
DROP TABLE IF EXISTS Queue;
CREATE TABLE Queue (person_id INTEGER PRIMARY KEY, person_name TEXT, weight INTEGER, turn INTEGER);
INSERT INTO Queue VALUES (5,'Alice',250,1),(4,'Bob',175,5),(3,'Alex',350,2),(6,'John Cena',400,3),
 (1,'Winston',500,6),(2,'Marie',200,4);
SELECT person_name
FROM (SELECT person_name, turn, SUM(weight) OVER (ORDER BY turn) AS total FROM Queue)
WHERE total <= 1000
ORDER BY turn DESC
LIMIT 1;

.print ''
.print '--- 1907. 按分类统计薪水'
DROP TABLE IF EXISTS Accounts;
CREATE TABLE Accounts (account_id INTEGER PRIMARY KEY, income INTEGER);
INSERT INTO Accounts VALUES (3,108939),(2,12747),(8,87709),(6,91796);
SELECT 'Low Salary' AS category, SUM(income < 20000) AS accounts_count FROM Accounts
UNION ALL
SELECT 'Average Salary', SUM(income BETWEEN 20000 AND 50000) FROM Accounts
UNION ALL
SELECT 'High Salary', SUM(income > 50000) FROM Accounts;

.print '=== 6 子查询 ==='
.print ''
.print '--- 1978. 上级经理已离职的公司员工'
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (employee_id INTEGER PRIMARY KEY, name TEXT, manager_id INTEGER, salary INTEGER);
INSERT INTO Employees VALUES (3,'Mila',9,60301),(12,'Antonella',NULL,31000),(13,'Emery',NULL,67084),
 (1,'Kalel',11,21241),(9,'Mikaela',NULL,50937),(11,'Joziah',6,28485);
SELECT employee_id FROM Employees
WHERE salary < 30000
  AND manager_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY employee_id;

.print ''
.print '--- 626. 换座位'
DROP TABLE IF EXISTS Seat;
CREATE TABLE Seat (id INTEGER PRIMARY KEY, student TEXT);
INSERT INTO Seat VALUES (1,'Abbot'),(2,'Doris'),(3,'Emerson'),(4,'Green'),(5,'Jeames');
SELECT CASE
         WHEN id % 2 = 1 AND id = (SELECT MAX(id) FROM Seat) THEN id
         WHEN id % 2 = 1 THEN id + 1
         ELSE id - 1
       END AS id,
       student
FROM Seat
ORDER BY id;

.print ''
.print '--- 1341. 电影评分'
DROP TABLE IF EXISTS Movies; DROP TABLE IF EXISTS Users; DROP TABLE IF EXISTS MovieRating;
CREATE TABLE Movies (movie_id INTEGER PRIMARY KEY, title TEXT);
CREATE TABLE Users (user_id INTEGER PRIMARY KEY, name TEXT);
CREATE TABLE MovieRating (movie_id INTEGER, user_id INTEGER, rating INTEGER, created_at TEXT, PRIMARY KEY (movie_id, user_id));
INSERT INTO Movies VALUES (1,'Avengers'),(2,'Frozen 2'),(3,'Joker');
INSERT INTO Users VALUES (1,'Daniel'),(2,'Monica'),(3,'Maria'),(4,'James');
INSERT INTO MovieRating VALUES (1,1,3,'2020-01-12'),(1,2,4,'2020-02-11'),(1,3,2,'2020-02-12'),(1,4,1,'2020-01-01'),
 (2,1,5,'2020-02-17'),(2,2,2,'2020-02-01'),(2,3,2,'2020-03-01'),(3,1,3,'2020-02-22'),(3,2,4,'2020-02-25');
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

.print ''
.print '--- 1321. 餐馆营业额变化增长'
DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer (customer_id INTEGER, name TEXT, visited_on TEXT, amount INTEGER, PRIMARY KEY (customer_id, visited_on));
INSERT INTO Customer VALUES (1,'Jhon','2019-01-01',100),(2,'Daniel','2019-01-02',110),(3,'Jade','2019-01-03',120),
 (4,'Khaled','2019-01-04',130),(5,'Winston','2019-01-05',110),(6,'Elvis','2019-01-06',140),(7,'Anna','2019-01-07',150),
 (8,'Maria','2019-01-08',80),(9,'Jaze','2019-01-09',110),(1,'Jhon','2019-01-10',130),(3,'Jade','2019-01-10',150);
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

.print ''
.print '--- 602. 好友申请 II ：谁有最多的好友'
DROP TABLE IF EXISTS RequestAccepted;
CREATE TABLE RequestAccepted (requester_id INTEGER, accepter_id INTEGER, accept_date TEXT, PRIMARY KEY (requester_id, accepter_id));
INSERT INTO RequestAccepted VALUES (1,2,'2016-06-03'),(1,3,'2016-06-08'),(2,3,'2016-06-08'),(3,4,'2016-06-09');
SELECT id, COUNT(*) AS num
FROM (SELECT requester_id AS id FROM RequestAccepted
      UNION ALL
      SELECT accepter_id FROM RequestAccepted)
GROUP BY id
ORDER BY num DESC
LIMIT 1;

.print ''
.print '--- 585. 2016年的投资'
DROP TABLE IF EXISTS Insurance;
CREATE TABLE Insurance (pid INTEGER PRIMARY KEY, tiv_2015 REAL, tiv_2016 REAL, lat REAL, lon REAL);
INSERT INTO Insurance VALUES (1,10,5,10,10),(2,20,20,20,20),(3,10,30,20,20),(4,10,40,40,40);
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (SELECT tiv_2015 FROM Insurance GROUP BY tiv_2015 HAVING COUNT(*) > 1)
  AND (lat, lon) IN (SELECT lat, lon FROM Insurance GROUP BY lat, lon HAVING COUNT(*) = 1);

.print ''
.print '--- 185. 部门工资前三高的所有员工'
DROP TABLE IF EXISTS Employee; DROP TABLE IF EXISTS Department;
CREATE TABLE Department (id INTEGER PRIMARY KEY, name TEXT);
CREATE TABLE Employee (id INTEGER PRIMARY KEY, name TEXT, salary INTEGER, departmentId INTEGER REFERENCES Department);
INSERT INTO Department VALUES (1,'IT'),(2,'Sales');
INSERT INTO Employee VALUES (1,'Joe',85000,1),(2,'Henry',80000,2),(3,'Sam',60000,2),(4,'Max',90000,1),
 (5,'Janet',69000,1),(6,'Randy',85000,1),(7,'Will',70000,1);
SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM (SELECT *, DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rk
      FROM Employee) e
JOIN Department d ON e.departmentId = d.id
WHERE e.rk <= 3;

.print '=== 7 高级字符串函数 / 正则 / 子句 ==='
.print ''
.print '--- 1667. 修复表中的名字'
DROP TABLE IF EXISTS Users;
CREATE TABLE Users (user_id INTEGER PRIMARY KEY, name TEXT);
INSERT INTO Users VALUES (1,'aLice'),(2,'bOB');
SELECT user_id, upper(substr(name, 1, 1)) || lower(substr(name, 2)) AS name
FROM Users
ORDER BY user_id;

.print ''
.print '--- 1527. 患某种疾病的患者'
DROP TABLE IF EXISTS Patients;
CREATE TABLE Patients (patient_id INTEGER PRIMARY KEY, patient_name TEXT, conditions TEXT);
INSERT INTO Patients VALUES (1,'Daniel','YFEV COUGH'),(2,'Alice',''),(3,'Bob','DIAB100 MYOP'),
 (4,'George','ACNE DIAB100'),(5,'Alain','DIAB201'),(6,'Eve','SADIAB100');
SELECT * FROM Patients
WHERE conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%';

.print ''
.print '--- 196. 删除重复的电子邮箱'
DROP TABLE IF EXISTS Person;
CREATE TABLE Person (id INTEGER PRIMARY KEY, email TEXT);
INSERT INTO Person VALUES (1,'john@example.com'),(2,'bob@example.com'),(3,'john@example.com');
DELETE FROM Person
WHERE id NOT IN (SELECT MIN(id) FROM Person GROUP BY email);
SELECT * FROM Person;  -- 查看删除后的结果

.print ''
.print '--- 176. 第二高的薪水'
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (id INTEGER PRIMARY KEY, salary INTEGER);
INSERT INTO Employee VALUES (1,100),(2,200),(3,300);
SELECT (SELECT DISTINCT salary FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET 1) AS SecondHighestSalary;

.print ''
.print '--- 1484. 按日期分组销售产品'
DROP TABLE IF EXISTS Activities;
CREATE TABLE Activities (sell_date TEXT, product TEXT);
INSERT INTO Activities VALUES ('2020-05-30','Headphone'),('2020-06-01','Pencil'),('2020-06-02','Mask'),
 ('2020-05-30','Basketball'),('2020-06-01','Bible'),('2020-06-02','Mask'),('2020-05-30','T-Shirt');
SELECT sell_date,
       COUNT(DISTINCT product)                          AS num_sold,
       group_concat(DISTINCT product ORDER BY product)  AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;

.print ''
.print '--- 1327. 列出指定时间段内所有的下单产品'
DROP TABLE IF EXISTS Products; DROP TABLE IF EXISTS Orders;
CREATE TABLE Products (product_id INTEGER PRIMARY KEY, product_name TEXT, product_category TEXT);
CREATE TABLE Orders (product_id INTEGER REFERENCES Products, order_date TEXT, unit INTEGER);
INSERT INTO Products VALUES (1,'Leetcode Solutions','Book'),(2,'Jewels of Stringology','Book'),(3,'HP','Laptop'),
 (4,'Lenovo','Laptop'),(5,'Leetcode Kit','T-shirt');
INSERT INTO Orders VALUES (1,'2020-02-05',60),(1,'2020-02-10',70),(2,'2020-01-18',30),(2,'2020-02-11',80),
 (3,'2020-02-17',2),(3,'2020-02-24',3),(4,'2020-03-01',20),(4,'2020-03-04',30),(4,'2020-03-04',60),
 (5,'2020-02-25',50),(5,'2020-02-27',50),(5,'2020-03-01',50);
SELECT p.product_name, SUM(o.unit) AS unit
FROM Orders o JOIN Products p ON o.product_id = p.product_id
WHERE strftime('%Y-%m', o.order_date) = '2020-02'
GROUP BY p.product_id, p.product_name
HAVING SUM(o.unit) >= 100;

.print ''
.print '--- 1517. 查找拥有有效邮箱的用户'
DROP TABLE IF EXISTS Users;
CREATE TABLE Users (user_id INTEGER PRIMARY KEY, name TEXT, mail TEXT);
INSERT INTO Users VALUES (1,'Winston','winston@leetcode.com'),(2,'Jonathan','jonathanisgreat'),
 (3,'Annabelle','bella-@leetcode.com'),(4,'Sally','sally.come@leetcode.com'),(5,'Marwan','quarz#2020@leetcode.com'),
 (6,'David','david69@gmail.com'),(7,'Shapiro','.shapo@leetcode.com');
SELECT * FROM Users
WHERE mail REGEXP '^[A-Za-z][-A-Za-z0-9_.]*@leetcode[.]com$';

