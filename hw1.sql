--1. Инициализация схемы БД
-- Создание таблиц
CREATE TABLE users(
    id SERIAL primary key, 
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    created_at TIMESTAMP NOT NULL
);

CREATE TABLE categories(
    id SERIAL primary key,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE products(
    id SERIAL primary key, 
    name VARCHAR(100) NOT NULL,
    price NUMERIC (10, 2) NOT NULL CHECK(price >= 0),
    category_id INTEGER REFERENCES categories(id)
);

CREATE TABLE orders(
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL
);

CREATE TABLE order_items(
    id SERIAL primary key,
    order_id INTEGER REFERENCES orders(id),
    product_id INTEGER REFERENCES products(id),
    quantity INTEGER NOT NULL CHECK (quantity > 0)
);

CREATE TABLE payments(
    id SERIAL primary key,
    order_id INTEGER REFERENCES orders(id),
    amount NUMERIC (10, 2) NOT NULL CHECK (amount >= 0),
    payment_date TIMESTAMP
);

-- Вставка данных
INSERT INTO users (id, name, email, created_at) VALUES
(1, 'Иван Иванов', 'ivan@example.com', '2023-01-15 10:00:00'),
(2, 'Петр Петров', 'petr@example.com', '2023-02-10 11:00:00'),
(3, 'Сидор Сидоров', 'sidor@example.com', '2023-03-05 12:00:00'),
(4, 'Анна Аннова', 'anna@example.com', '2023-04-20 13:00:00'),
(5, 'Мария Морина', 'maria@example.com', '2023-05-25 14:00:00'),
(6, 'Дементий Деменьтев', 'dementiy@example.com', '2023-01-07 17:00:00');

INSERT INTO categories (id, name) VALUES
(1, 'Электроника'),
(2, 'Одежда'),
(3, 'Книги'),
(4, 'Мебель'),
(5, 'Спорт');

INSERT INTO products (id, name, price, category_id) VALUES
(1, 'Смартфон', 29999.99, 1),
(2, 'Ноутбук', 59999.99, 1),
(3, 'Футболка', 1999.99, 2),
(4, 'Джинсы', 4999.99, 2),
(5, 'Книга "SQL для начинающих"', 999.99, 3),
(6, 'Книга "Python для профессионалов"', 1499.99, 3),
(7, 'Диван', 29999.99, 4),
(8, 'Стул', 4999.99, 4),
(9, 'Велосипед', 19999.99, 5),
(10, 'Гантели', 2999.99, 5);

INSERT INTO orders (id, user_id, status, created_at) VALUES
(1, 1, 'Оплачен', '2023-01-20 10:00:00'),
(2, 2, 'Ожидает оплаты', '2023-02-15 11:00:00'),
(3, 3, 'Доставлен', '2023-03-10 12:00:00'),
(4, 4, 'Оплачен', '2023-04-05 13:00:00'),
(5, 5, 'Ожидает оплаты', '2023-05-01 14:00:00'),
(6, 1, 'Доставлен', '2023-01-25 15:00:00'),
(7, 2, 'Оплачен', '2023-02-20 16:00:00'),
(8, 3, 'Ожидает оплаты', '2023-03-15 17:00:00'),
(9, 4, 'Доставлен', '2023-04-10 18:00:00'),
(10, 5, 'Оплачен', '2023-05-05 19:00:00'),
(11, 1, 'Ожидает оплаты', '2023-01-30 20:00:00'),
(12, 2, 'Доставлен', '2023-03-25 21:00:00'),
(13, 3, 'Оплачен', '2023-03-20 22:00:00'),
(14, 4, 'Ожидает оплаты', '2023-04-15 23:00:00'),
(15, 5, 'Доставлен', '2023-05-10 10:00:00'),
(16, 1, 'Оплачен', '2023-01-05 11:00:00'),
(17, 2, 'Ожидает оплаты', '2023-02-28 12:00:00'),
(18, 3, 'Доставлен', '2023-03-25 13:00:00'),
(19, 4, 'Оплачен', '2023-04-20 14:00:00'),
(20, 5, 'Ожидает оплаты', '2023-06-15 15:00:00');

INSERT INTO order_items (id, order_id, product_id, quantity) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 3, 2),
(4, 2, 4, 1),
(5, 3, 5, 1),
(6, 3, 6, 1),
(7, 4, 7, 1),
(8, 4, 8, 2),
(9, 5, 9, 1),
(10, 5, 10, 1),
(11, 6, 1, 1),
(12, 6, 3, 1),
(13, 7, 2, 1),
(14, 7, 4, 1),
(15, 8, 5, 1),
(16, 8, 7, 1),
(17, 9, 6, 1),
(18, 9, 8, 1),
(19, 10, 9, 1),
(20, 10, 10, 1),
(21, 11, 1, 1),
(22, 11, 2, 1),
(23, 12, 3, 1),
(24, 12, 4, 1),
(25, 13, 5, 1),
(26, 13, 6, 1),
(27, 14, 7, 1),
(28, 14, 8, 1),
(29, 15, 9, 1),
(30, 15, 10, 1),
(31, 16, 1, 1),
(32, 16, 3, 1),
(33, 17, 2, 1),
(34, 17, 4, 1),
(35, 18, 5, 1),
(36, 18, 7, 1),
(37, 19, 6, 1),
(38, 19, 8, 1),
(39, 20, 9, 1),
(40, 20, 10, 1);

INSERT INTO payments (id, order_id, amount, payment_date) VALUES
(1, 1, 89999.98, '2023-01-20 10:05:00'),
(2, 2, 8999.97, NULL),
(3, 3, 2499.98, '2023-03-10 12:05:00'),
(4, 4, 39999.97, '2023-04-05 13:05:00'),
(5, 5, 22999.98, NULL),
(6, 6, 31999.98, '2023-01-25 15:05:00'),
(7, 7, 64999.98, '2023-02-20 16:05:00'),
(8, 8, 30999.98, NULL),
(9, 9, 6499.98, '2023-04-10 18:05:00'),
(10, 10, 22999.98, '2023-05-05 19:05:00'),
(11, 11, 89999.98, NULL),
(12, 12, 6999.98, '2023-02-25 21:05:00'),
(13, 13, 2499.98, '2023-03-20 22:05:00'),
(14, 14, 34999.98, NULL),
(15, 15, 22999.98, '2023-05-10 10:05:00'),
(16, 16, 31999.98, '2023-01-05 11:05:00'),
(17, 17, 64999.98, NULL),
(18, 18, 30999.98, '2023-03-25 13:05:00'),
(19, 19, 6499.98, '2023-04-20 14:05:00'),
(20, 20, 22999.98, NULL);



--задача 1. Средняя стоимость заказа по по категориям товаров
SELECT c.name AS category_name, ROUND(AVG(p.price * oi.quantity), 2) AS avg_order_amount
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
JOIN categories c ON p.category_id = c.id
WHERE o.created_at BETWEEN '2023-03-01' AND '2023-03-31'
GROUP BY c.name;

-- 2. Рейтинг пользователей по сумме оплаченных заказов
WITH user_spent AS (
    SELECT u.name AS user_name, SUM(py.amount) AS total_spent
    FROM users u
    JOIN orders o ON u.id = o.user_id
    JOIN payments py ON o.id = py.order_id
    WHERE o.status = 'Оплачен'
    GROUP BY u.name
)
SELECT user_name, total_spent, RANK() OVER (ORDER BY total_spent DESC) AS user_rank
FROM user_spent
LIMIT 3;


-- 3. Количество заказов и сумма платежей по месяцам
SELECT TO_CHAR(o.created_at, 'YYYY-MM') AS month, COUNT(o.id) AS total_orders, SUM(py.amount) AS total_payments
FROM orders o
JOIN payments py ON o.id = py.order_id
WHERE EXTRACT(YEAR FROM o.created_at) = 2023
GROUP BY month
ORDER BY month;


-- 4. Рейтинг товаров по количеству продаж
WITH product_sales AS (
    SELECT p.name AS product_name, SUM(oi.quantity) AS total_sold
    FROM order_items oi
    JOIN products p ON oi.product_id = p.id
    GROUP BY p.name
)
SELECT product_name, total_sold, ROUND(total_sold::numeric / (SELECT SUM(quantity) FROM order_items) * 100, 2) AS sales_percentage
FROM product_sales
ORDER BY total_sold DESC
LIMIT 5;


-- 5. Пользователи, которые сделали заказы на сумму выше среднего
WITH user_spent AS (
    SELECT u.name AS user_name, SUM(py.amount) AS total_spent
    FROM users u
    JOIN orders o ON u.id = o.user_id
    JOIN payments py ON o.id = py.order_id
    WHERE o.status = 'Оплачен'
    GROUP BY u.name
)
SELECT user_name, total_spent
FROM user_spent
WHERE total_spent > (SELECT AVG(total_spent) FROM user_spent);


-- 6. Рейтинг товаров по количеству продаж в каждой категории
WITH product_sales AS (
    SELECT c.name AS category_name, p.name AS product_name, SUM(oi.quantity) AS total_sold,
           RANK() OVER (PARTITION BY c.name ORDER BY SUM(oi.quantity) DESC) AS rank
    FROM order_items oi
    JOIN products p ON oi.product_id = p.id
    JOIN categories c ON p.category_id = c.id
    GROUP BY c.name, p.name
)
SELECT category_name, product_name, total_sold
FROM product_sales
WHERE rank <= 3;


-- 7. Категории товаров с максимальной выручкой в каждом месяце
WITH monthly_revenue AS (
    SELECT TO_CHAR(o.created_at, 'YYYY-MM') AS month, c.name AS category_name, SUM(py.amount) AS total_revenue,
           RANK() OVER (PARTITION BY TO_CHAR(o.created_at, 'YYYY-MM') ORDER BY SUM(py.amount) DESC) AS rank
    FROM orders o
    JOIN payments py ON o.id = py.order_id
    JOIN order_items oi ON o.id = oi.order_id
    JOIN products p ON oi.product_id = p.id
    JOIN categories c ON p.category_id = c.id
    WHERE o.created_at BETWEEN '2023-01-01' AND '2023-06-30'
    GROUP BY month, c.name
)
SELECT month, category_name, total_revenue
FROM monthly_revenue
WHERE rank = 1;


-- 8. Накопительная сумма платежей по месяцам
WITH monthly_payments AS (
    SELECT TO_CHAR(py.payment_date, 'YYYY-MM') AS month, SUM(py.amount) AS monthly_payments
    FROM payments py
    WHERE EXTRACT(YEAR FROM py.payment_date) = 2023
    GROUP BY month
)
SELECT month, monthly_payments, SUM(monthly_payments) OVER (ORDER BY month) AS cumulative_payments
FROM monthly_payments
ORDER BY month;

