SELECT TOP 5
    t.SalesTerritoryGroup AS Continente,
    t.SalesTerritoryCountry AS Pais,
    t.SalesTerritoryRegion AS Region,
    SUM(f.SalesAmount) AS TotalVentas
FROM FactInternetSales f
JOIN DimSalesTerritory t ON f.SalesTerritoryKey = t.SalesTerritoryKey
GROUP BY t.SalesTerritoryGroup, t.SalesTerritoryCountry, t.SalesTerritoryRegion
ORDER BY TotalVentas ASC;

