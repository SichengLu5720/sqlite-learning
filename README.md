# sqlite-learning

从零打好 SQLite 基础的个人学习仓库：先用 LeetCode「SQL 50」刷熟查询，再做笔记，最后做一个能放进简历的小项目。

## 目录

| 目录 | 内容 | 状态 |
| --- | --- | --- |
| [`leetcode/`](leetcode/) | SQL 50 题的本地 SQLite 建表脚本、参考答案和学习路线 | 已就绪 |
| [`notes/`](notes/) | 知识笔记（类型、索引、事务、MySQL 差异等） | 待补充 |
| [`projects/`](projects/) | 简历项目 | 待开始 |

## 快速开始

需要 SQLite 3.44+ 的命令行（`sqlite3`）。

```bash
cd leetcode
sqlite3 sql50.db
sqlite> .headers on
sqlite> .mode box
sqlite> .read setup/1757_recyclable-and-low-fat-products.sql
```

一次跑完 50 题的参考答案：

```bash
sqlite3 :memory: < leetcode/all_in_one.sql
```

完整的做题顺序、每题的 SQLite 注意点和 MySQL 差异速查，见 [`leetcode/README.md`](leetcode/README.md)。

## 学习计划

1. 第一阶段：刷完 SQL 50（约两周，每天 4–5 题）。
2. 第二阶段：整理笔记，补齐类型、索引、事务、`EXPLAIN` 等基础。
3. 第三阶段：做一个小项目，体现表设计、索引和在程序里使用 SQLite。
