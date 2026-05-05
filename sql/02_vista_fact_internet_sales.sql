USE AdventureWorksDW2019;
GO

IF OBJECT_ID('dbo.vw_FactInternetSales', 'V') IS NOT NULL
    DROP VIEW dbo.vw_FactInternetSales;
GO

CREATE VIEW dbo.vw_FactInternetSales AS
SELECT 
    fis.SalesOrderNumber,
    dd.FullDateAlternateKey AS Fecha,
    dp.EnglishProductName AS Producto,
    dc.CustomerKey,
    fis.OrderQuantity,
    fis.SalesAmount,
    dg.City,
    dg.StateProvinceName,
    dg.EnglishCountryRegionName AS Pais,
    dst.SalesTerritoryRegion
FROM dbo.FactInternetSales fis
JOIN dbo.DimDate dd 
    ON fis.OrderDateKey = dd.DateKey
JOIN dbo.DimProduct dp 
    ON fis.ProductKey = dp.ProductKey
JOIN dbo.DimCustomer dc 
    ON fis.CustomerKey = dc.CustomerKey
JOIN dbo.DimGeography dg 
    ON dc.GeographyKey = dg.GeographyKey
JOIN dbo.DimSalesTerritory dst 
    ON dg.SalesTerritoryKey = dst.SalesTerritoryKey;
GO

SELECT TOP 20 *
FROM dbo.vw_FactInternetSales;
