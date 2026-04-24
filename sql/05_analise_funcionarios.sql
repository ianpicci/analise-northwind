-- ===========================
-- ANÁLISE DE FUNCIONÁRIOS
-- ===========================

-- Total de vendas e receita por funcionário
SELECT 
    e.EmployeeID,
    e.FirstName || ' ' || e.LastName AS Funcionario,
    COUNT(DISTINCT o.OrderID) AS NumeroVendas,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS ReceitaTotal
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN "Order Details" od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, Funcionario
ORDER BY ReceitaTotal DESC;