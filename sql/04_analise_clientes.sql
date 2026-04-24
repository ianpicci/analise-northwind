-- ===========================
-- ANÁLISE DE CLIENTES
-- ===========================

-- Melhores clientes
SELECT 
    c.CustomerID,
    c.CompanyName,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS ReceitaTotal
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN "Order Details" od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY ReceitaTotal DESC;


-- Receita por país
SELECT 
    o.ShipCountry,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS Receita
FROM Orders o
JOIN "Order Details" od ON o.OrderID = od.OrderID
GROUP BY o.ShipCountry
ORDER BY Receita DESC;