-- ===========================
-- ANÁLISE INICIAL
-- ===========================

-- Entendendo as tabelas
SELECT * FROM customers LIMIT 10;
SELECT * FROM orders LIMIT 10;
SELECT * FROM order_details LIMIT 10;
SELECT * FROM products LIMIT 10;
SELECT * FROM categories LIMIT 10;
SELECT * FROM employees LIMIT 10;

SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;