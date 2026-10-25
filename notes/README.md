# 笔记

学习 SQLite 过程中的知识笔记放在这里，一个主题一个 `.md` 文件。

建议的主题（边学边补，不用一次写完）：

- `mysql-vs-sqlite.md`：刷 SQL 50 时遇到的 MySQL 与 SQLite 写法差异（整数除法、日期函数、正则等）
- `types-and-constraints.md`：动态类型、类型亲和性、`CHECK` / `PRIMARY KEY` / `UNIQUE`
- `indexes-and-explain.md`：索引、`EXPLAIN QUERY PLAN`
- `transactions.md`：事务、WAL 模式、并发限制
- `python-sqlite3.md`：在 Python 里使用 SQLite

LeetCode 题目里的差异速查表见 [`../leetcode/README.md`](../leetcode/README.md) 末尾。

## 每题笔记

刷 SQL 50 时每题一份笔记，文件名和建表脚本一致：`<题号>_<英文 slug>.md`。进度总表见 [`../leetcode/PROGRESS.md`](../leetcode/PROGRESS.md)。

- [1757 可回收且低脂的产品](1757_recyclable-and-low-fat-products.md)：表 / 行 / 列、SELECT、WHERE、AND
