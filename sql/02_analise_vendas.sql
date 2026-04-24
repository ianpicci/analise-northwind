-- ===========================
-- ANÁLISE DE VENDAS
-- ===========================

-- Faturamento Total
SELECT ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) as FaturamentoTotal
FROM 'Order Details' od;


-- Faturamento por mês
SELECT 
    strftime('%Y-%m', o.OrderDate) AS Mes,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) as FaturamentoTotal
FROM Orders o
JOIN "Order Details" od 
    ON o.OrderID = od.OrderID
GROUP BY 
    strftime('%Y-%m', o.OrderDate)
ORDER BY 
    Mes;


-- Ticket Médio
SELECT 
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) / COUNT(DISTINCT o.OrderID) AS TicketMedio
FROM Orders o
JOIN "Order Details" od 
    ON o.OrderID = od.OrderID;


-- Total de pedidos
SELECT COUNT(*) AS TotalPedidos
FROM Orders;

-- Total de pedidos por mês
SELECT 
    strftime('%Y-%m', OrderDate) AS Mes,
    COUNT(*) AS TotalPedidos
FROM Orders
GROUP BY Mes
ORDER BY Mes;