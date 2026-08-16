# 🗄 SQL Practice Project

Учебный проект по работе с реляционной базой данных **PostgreSQL** с использованием **DBeaver**.

Цель проекта — продемонстрировать практические навыки работы с SQL и применение SQL для проверки данных с позиции **QA Engineer**.

---

## 🎯 Что реализовано

В рамках проекта выполнены:

- создание таблиц;
- настройка PRIMARY KEY и FOREIGN KEY;
- добавление тестовых данных;
- получение и фильтрация данных;
- сортировка;
- группировка и агрегирование;
- объединение связанных таблиц;
- добавление, изменение и удаление записей;
- проверка результатов CRUD-операций;
- QA-проверки целостности и корректности данных.

---

## 🗄 Структура базы данных

В проекте используются две связанные таблицы.

### `users`

Содержит данные пользователей:

- `id`
- `name`
- `email`
- `age`
- `city`

### `orders`

Содержит данные заказов:

- `id`
- `user_id`
- `product_name`
- `amount`
- `status`
- `created_at`

Связь между таблицами:

```text
users.id → orders.user_id
```

Для связи используется **FOREIGN KEY**.

---

## 🛠 SQL-конструкции

В проекте применяются:

- `CREATE TABLE`
- `PRIMARY KEY`
- `FOREIGN KEY`
- `INSERT`
- `SELECT`
- `WHERE`
- `ORDER BY`
- `GROUP BY`
- `HAVING`
- `COUNT`
- `SUM`
- `JOIN`
- `LEFT JOIN`
- `UPDATE`
- `DELETE`
- `IN / NOT IN`

---

# 🔎 Примеры SQL-запросов

## SELECT + WHERE

Получение пользователей из Москвы:

```sql
SELECT *
FROM users
WHERE city = 'Moscow';
```

Получение заказов дороже 10 000:

```sql
SELECT *
FROM orders
WHERE amount > 10000;
```

---

## 🔗 JOIN

Получение пользователя и связанных с ним заказов:

```sql
SELECT
    users.name,
    users.email,
    orders.product_name,
    orders.amount,
    orders.status
FROM users
JOIN orders
    ON users.id = orders.user_id;
```

Такой запрос позволяет проверить корректность связи между пользователем и его заказами.

---

## 📊 LEFT JOIN + GROUP BY

Проверка количества заказов каждого пользователя:

```sql
SELECT
    users.name,
    COUNT(orders.id) AS orders_count
FROM users
LEFT JOIN orders
    ON users.id = orders.user_id
GROUP BY users.name
ORDER BY orders_count DESC;
```

Использование `LEFT JOIN` позволяет получить в том числе пользователей, у которых нет заказов.

---

# 🧪 QA-проверки данных

SQL использовался не только для работы с данными, но и непосредственно для **QA-проверок**.

## Проверка пользователя по email

```sql
SELECT *
FROM users
WHERE email = 'anna@test.com';
```

Позволяет проверить наличие пользователя и корректность сохранённых данных.

---

## Проверка связи пользователя и заказа

```sql
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
```

Позволяет проверить, что заказ связан с правильным пользователем.

---

## 🔍 Поиск дублирующихся email

Ожидаемый результат: **0 строк**.

```sql
SELECT
    email,
    COUNT(*) AS count
FROM users
GROUP BY email
HAVING COUNT(*) > 1;
```

Запрос используется для поиска нарушений уникальности email.

---

## 💰 Проверка некорректной суммы заказа

Ожидаемый результат: **0 строк**.

```sql
SELECT *
FROM orders
WHERE amount <= 0;
```

Позволяет обнаружить заказы с нулевой или отрицательной суммой.

---

## 📌 Проверка допустимых статусов

Ожидаемый результат: **0 строк**.

```sql
SELECT *
FROM orders
WHERE status NOT IN (
    'new',
    'paid',
    'delivered',
    'cancelled'
);
```

Запрос позволяет обнаружить записи со статусами, которые не предусмотрены тестовыми данными.

---

# 🔄 Проверка CRUD-операций

После изменения данных выполнялась дополнительная проверка результата.

### INSERT

Создание тестового пользователя:

```sql
INSERT INTO users (name, email, age, city)
VALUES (
    'Test User',
    'testuser@test.com',
    27,
    'Perm'
);
```

Проверка:

```sql
SELECT *
FROM users
WHERE email = 'testuser@test.com';
```

### UPDATE

Изменение города:

```sql
UPDATE users
SET city = 'Ufa'
WHERE email = 'testuser@test.com';
```

После `UPDATE` выполнялся `SELECT` для проверки сохранённого значения.

### DELETE

Удаление тестового пользователя:

```sql
DELETE FROM users
WHERE email = 'testuser@test.com';
```

Проверка после удаления:

```sql
SELECT *
FROM users
WHERE email = 'testuser@test.com';
```

Ожидаемый результат: **0 строк**.

---

# 📸 Результаты выполнения

## JOIN — пользователь и его заказы

Запрос объединяет `users` и `orders` и позволяет проверить связь между данными.

![JOIN result](Screenshots/join-result.png)

---

## LEFT JOIN + GROUP BY — количество заказов

Запрос показывает количество заказов каждого пользователя.

![GROUP BY result](Screenshots/group-by-result.png)

---

## Data Validation — проверка статусов

Проверка наличия заказов с недопустимыми статусами.

Ожидаемый результат: **0 строк**.

![Data validation result](Screenshots/data-check-result.png)

---

# 📂 Полный набор SQL-запросов

Все запросы проекта собраны в одном файле:

➡️ [Открыть SQL-Queries.sql](SQL-Queries.sql)

Файл включает:

1. создание таблиц;
2. тестовые данные;
3. SELECT;
4. WHERE;
5. ORDER BY;
6. GROUP BY;
7. JOIN;
8. LEFT JOIN;
9. INSERT;
10. UPDATE;
11. DELETE;
12. QA Data Checks;
13. Data Validation.

---

# 💻 Инструменты

- PostgreSQL
- DBeaver
- SQL
- Git / GitHub

---

# 📁 Структура проекта

```text
SQL/
├── README.md
├── SQL-Queries.sql
└── Screenshots/
    ├── join-result.png
    ├── group-by-result.png
    └── data-check-result.png
```

---

# 🎯 Что демонстрирует проект

Проект демонстрирует практические навыки Junior QA Engineer:

- работы с реляционной базой данных;
- понимания PRIMARY KEY и FOREIGN KEY;
- создания тестовых данных;
- написания SELECT-запросов;
- фильтрации и сортировки данных;
- использования агрегатных функций;
- работы с GROUP BY и HAVING;
- использования JOIN и LEFT JOIN;
- выполнения CRUD-операций;
- проверки результатов INSERT, UPDATE и DELETE;
- поиска некорректных данных;
- проверки связей между сущностями;
- использования SQL для задач тестирования.
