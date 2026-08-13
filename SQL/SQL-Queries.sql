# SQL Practice Project

Файл: `SQL/SQL-Queries.sql`

```sql
-- QA Portfolio
-- SQL Practice
-- PostgreSQL
-- Junior QA Engineer

-- =========================================
-- 1. CREATE TABLES
-- =========================================

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    age INTEGER,
    city VARCHAR(100)
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    product_name VARCHAR(150) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- =========================================
-- 2. INSERT TEST DATA
-- =========================================

INSERT INTO users (name, email, age, city)
VALUES
('Anna Petrova', 'anna@test.com', 28, 'Moscow'),
('Ivan Smirnov', 'ivan@test.com', 34, 'Kazan'),
('Olga Sokolova', 'olga@test.com', 25, 'Samara'),
('Pavel Ivanov', 'pavel@test.com', 41, 'Moscow'),
('Maria Volkova', 'maria@test.com', 30, 'Kazan');

INSERT INTO orders (user_id, product_name, amount, status)
VALUES
(1, 'Laptop', 85000.00, 'paid'),
(1, 'Mouse', 2500.00, 'delivered'),
(2, 'Keyboard', 6000.00, 'new'),
(3, 'Monitor', 32000.00, 'paid'),
(4, 'Headphones', 12000.00, 'cancelled'),
(5, 'Phone', 65000.00, 'delivered'),
(2, 'USB Cable', 900.00, 'paid');

-- =========================================
-- 3. SELECT
-- =========================================

SELECT *
FROM users;

SELECT name, email
FROM users;

-- =========================================
-- 4. WHERE
-- =========================================

SELECT *
FROM users
WHERE city = 'Moscow';

SELECT *
FROM users
WHERE age >= 30;

SELECT *
FROM orders
WHERE status = 'paid';

SELECT *
FROM orders
WHERE amount > 10000;

-- =========================================
-- 5. ORDER BY
-- =========================================

SELECT *
FROM users
ORDER BY age ASC;

SELECT *
FROM users
ORDER BY age DESC;

SELECT *
FROM orders
ORDER BY amount DESC;

-- =========================================
-- 6. GROUP BY
-- =========================================

SELECT city, COUNT(*) AS users_count
FROM users
GROUP BY city;

SELECT status, COUNT(*) AS orders_count
FROM orders
GROUP BY status;

SELECT user_id, SUM(amount) AS total_amount
FROM orders
GROUP BY user_id;

-- =========================================
-- 7. JOIN
-- =========================================

SELECT
    users.name,
    users.email,
    orders.product_name,
    orders.amount,
    orders.status
FROM users
JOIN orders
    ON users.id = orders.user_id;

SELECT
    users.name,
    orders.product_name,
    orders.status
FROM users
JOIN orders
    ON users.id = orders.user_id
WHERE orders.status = 'paid';

SELECT
    users.name,
    SUM(orders.amount) AS total_orders
FROM users
JOIN orders
    ON users.id = orders.user_id
GROUP BY users.name
ORDER BY total_orders DESC;

-- =========================================
-- 8. INSERT
-- =========================================

INSERT INTO users (name, email, age, city)
VALUES ('Test User', 'testuser@test.com', 27, 'Perm');

SELECT *
FROM users
WHERE email = 'testuser@test.com';

-- =========================================
-- 9. UPDATE
-- =========================================

UPDATE users
SET city = 'Ufa'
WHERE email = 'testuser@test.com';

SELECT *
FROM users
WHERE email = 'testuser@test.com';

UPDATE orders
SET status = 'delivered'
WHERE id = 3;

SELECT *
FROM orders
WHERE id = 3;

-- =========================================
-- 10. DELETE
-- =========================================

DELETE FROM users
WHERE email = 'testuser@test.com';

SELECT *
FROM users
WHERE email = 'testuser@test.com';

-- =========================================
-- 11. QA DATA CHECKS
-- =========================================

-- Проверка пользователя по email

SELECT *
FROM users
WHERE email = 'anna@test.com';

-- Проверка заказа по ID

SELECT *
FROM orders
WHERE id = 1;

-- Проверка связи пользователя и заказа

SELECT
    users.name,
    users.email,
    orders.id AS order_id,
    orders.product_name,
    orders.status
FROM users
JOIN orders
    ON users.id = orders.user_id
WHERE orders.id = 1;

-- Проверка количества заказов пользователя

SELECT
    users.name,
    COUNT(orders.id) AS orders_count
FROM users
LEFT JOIN orders
    ON users.id = orders.user_id
GROUP BY users.name;

-- Проверка дублей email

SELECT
    email,
    COUNT(*) AS count
FROM users
GROUP BY email
HAVING COUNT(*) > 1;

-- Проверка заказов с некорректной суммой

SELECT *
FROM orders
WHERE amount <= 0;

-- Проверка заказов с неизвестным статусом

SELECT *
FROM orders
WHERE status NOT IN ('new', 'paid', 'delivered', 'cancelled');
```

## Что этот проект показывает

* создание связанных таблиц;
* `PRIMARY KEY`;
* `FOREIGN KEY`;
* тестовые данные;
* `SELECT`;
* `WHERE`;
* `ORDER BY`;
* `GROUP BY`;
* агрегатные функции;
* `JOIN`;
* `LEFT JOIN`;
* `INSERT`;
* `UPDATE`;
* `DELETE`;
* проверки данных с точки зрения QA;
* поиск дублей;
* проверку некорректных значений;
* проверку связей между таблицами.
