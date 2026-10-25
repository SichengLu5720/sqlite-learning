# 1757. 可回收且低脂的产品

- 题目：<https://leetcode.cn/problems/recyclable-and-low-fat-products/>
- 分组：第 1 组 · 查询（SQL 50 第 1 题）
- 建表脚本：[`leetcode/setup/1757_recyclable-and-low-fat-products.sql`](../leetcode/setup/1757_recyclable-and-low-fat-products.sql)
- 新学的东西：表 / 行 / 列、`SELECT`、`FROM`、`WHERE`、`=`、`AND`、字符串要加单引号

## 1. 零基础概念

1. **数据库**：一个装数据的文件。SQLite 的整个数据库就是一个文件，比如 `sql50.db`。
2. **表（table）**：数据库里的一张二维表格，有名字，比如 `Products`。
3. **列（column）**：表的“表头”，每列有名字和类型，比如 `product_id`、`low_fats`。
4. **行（row）**：表里的一条记录，比如“产品 1，低脂 Y，可回收 Y”。
5. **SQL**：和数据库对话的语言。一条 SQL 叫一个“语句”，以分号 `;` 结尾。

本题的 `Products` 表（示例数据）：

| product_id | low_fats | recyclable |
| --- | --- | --- |
| 0 | Y | N |
| 1 | Y | Y |
| 2 | N | Y |
| 3 | Y | Y |
| 4 | N | N |

## 2. 准备环境

在 `leetcode/` 目录下：

```text
sqlite3 sql50.db
sqlite> .headers on
sqlite> .mode box
sqlite> .read setup/1757_recyclable-and-low-fat-products.sql
```

以点开头的 `.headers`、`.mode`、`.read` 是 sqlite3 命令行自己的命令，不是 SQL，不用分号。

## 3. 一步步学查询

1. **看全表**：`SELECT * FROM Products;`
   - `SELECT` 后面写“要哪些列”，`*` 表示所有列；`FROM` 后面写“从哪张表”。
2. **只要某几列**：`SELECT product_id, low_fats FROM Products;`
   - 多列用逗号隔开，结果仍是 5 行，只是列变少了。
3. **按条件筛行**：`SELECT product_id FROM Products WHERE low_fats = 'Y';`
   - `WHERE` 写条件，只留下条件为真的行。结果：0、1、3。
   - `'Y'` 是字符串，必须用单引号。不加引号，SQLite 会把 `Y` 当成列名去找。
   - 字符串比较区分大小写：`low_fats = 'y'` 一行都查不到。
4. **两个条件**：
   - `AND`：两个条件都为真才留下。
   - `OR`：任意一个为真就留下。`WHERE low_fats = 'Y' OR recyclable = 'Y'` 得到 0、1、2、3。

执行顺序可以这样理解：先 `FROM` 找到表，再 `WHERE` 逐行筛选，最后 `SELECT` 挑出要显示的列。

## 4. 本题

找出既是低脂（`low_fats = 'Y'`）又可回收（`recyclable = 'Y'`）的产品，返回 `product_id`，顺序不限。

提示：

1. 要返回哪一列？写在 `SELECT` 后面。
2. 两个条件要“同时满足”，用 `AND` 还是 `OR`？
3. 对照上面的表，预期结果应该是哪几个 id？

<details>
<summary>参考答案（自己写完再看）</summary>

```sql
SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';
```

示例数据下结果是 1 和 3。

</details>

## 5. MySQL 与 SQLite 的差异

LeetCode 的表定义里 `low_fats` 是 `ENUM('Y','N')`。SQLite 没有 `ENUM`，建表脚本用 `TEXT CHECK (low_fats IN ('Y','N'))` 代替：列存文本，并限制只能填 `'Y'` 或 `'N'`。查询写法两边完全一样。

## 6. 我的记录

- 我的第一版写法：
- 踩过的坑：
- LeetCode 是否通过：
