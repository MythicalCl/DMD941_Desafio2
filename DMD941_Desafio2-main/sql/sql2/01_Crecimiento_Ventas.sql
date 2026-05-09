WITH VentasMensuales AS (
    SELECT 
        d.CalendarYear AS Anio,
        d.MonthNumberOfYear AS Mes,
        SUM(f.SalesAmount) AS TotalVentas
    FROM FactInternetSales f
    JOIN DimDate d ON f.OrderDateKey = d.DateKey
    GROUP BY d.CalendarYear, d.MonthNumberOfYear
)
SELECT 
    Anio,
    Mes,
    TotalVentas,
    LAG(TotalVentas, 12) OVER (ORDER BY Anio, Mes) AS VentasAnioAnterior,
    CASE 
        WHEN LAG(TotalVentas, 12) OVER (ORDER BY Anio, Mes) IS NULL THEN 0
        ELSE ((TotalVentas - LAG(TotalVentas, 12) OVER (ORDER BY Anio, Mes)) / LAG(TotalVentas, 12) OVER (ORDER BY Anio, Mes)) * 100
    END AS PorcentajeCrecimiento
FROM VentasMensuales
ORDER BY Anio, Mes;

a este?