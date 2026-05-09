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
    dps.EnglishProductSubcategoryName AS Subcategoria,
    dpc.EnglishProductCategoryName AS Categoria,
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
LEFT JOIN dbo.DimProductSubcategory dps
    ON dp.ProductSubcategoryKey = dps.ProductSubcategoryKey
LEFT JOIN dbo.DimProductCategory dpc
    ON dps.ProductCategoryKey = dpc.ProductCategoryKey
JOIN dbo.DimCustomer dc 
    ON fis.CustomerKey = dc.CustomerKey
JOIN dbo.DimGeography dg 
    ON dc.GeographyKey = dg.GeographyKey
JOIN dbo.DimSalesTerritory dst 
    ON dg.SalesTerritoryKey = dst.SalesTerritoryKey;
GO
