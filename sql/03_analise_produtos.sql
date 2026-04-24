-- ===========================
-- ANÁLISE DE PRODUTOS
-- ===========================

--  Produtos com maior receita
SELECT 
	p.ProductName as produto, 
	ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) as FaturamentoTotal
FROM 'Order Details' od
JOIN Products p ON p.ProductID = od.ProductID 
GROUP BY p.ProductName
ORDER BY FaturamentoTotal DESC;


-- Produtos mais vendidos
SELECT 
    p.ProductName,
    SUM(od.Quantity) AS TotalVendido
FROM "Order Details" od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalVendido DESC;


-- Receita por categoria
SELECT 
    c.CategoryName,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS Receita
FROM "Order Details" od
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName
ORDER BY Receita DESC;

