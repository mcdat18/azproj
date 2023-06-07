-- rebuild the table to force the columnstore index to compress all the rows
ALTER INDEX ALL ON [retail].[DimProduct] REBUILD;

-- create single-column statistics on each column in the dimension table, and on each joining column in the fact tables

CREATE STATISTICS [stat_retail_DimProduct_AvailableForSaleDate] ON [retail].[DimProduct]([AvailableForSaleDate]);
CREATE STATISTICS [stat_retail_DimProduct_BrandName] ON [retail].[DimProduct]([BrandName]);
CREATE STATISTICS [stat_retail_DimProduct_ClassID] ON [retail].[DimProduct]([ClassID]);
CREATE STATISTICS [stat_retail_DimProduct_ClassName] ON [retail].[DimProduct]([ClassName]);
CREATE STATISTICS [stat_retail_DimProduct_ColorID] ON [retail].[DimProduct]([ColorID]);
CREATE STATISTICS [stat_retail_DimProduct_ColorName] ON [retail].[DimProduct]([ColorName]);
CREATE STATISTICS [stat_retail_DimProduct_ETLLoadID] ON [retail].[DimProduct]([ETLLoadID]);
CREATE STATISTICS [stat_retail_DimProduct_ImageURL] ON [retail].[DimProduct]([ImageURL]);
CREATE STATISTICS [stat_retail_DimProduct_LoadDate] ON [retail].[DimProduct]([LoadDate]);
CREATE STATISTICS [stat_retail_DimProduct_Manufacturer] ON [retail].[DimProduct]([Manufacturer]);
CREATE STATISTICS [stat_retail_DimProduct_ProductDescription] ON [retail].[DimProduct]([ProductDescription]);
CREATE STATISTICS [stat_retail_DimProduct_ProductKey] ON [retail].[DimProduct]([ProductKey]);
CREATE STATISTICS [stat_retail_DimProduct_ProductLabel] ON [retail].[DimProduct]([ProductLabel]);
CREATE STATISTICS [stat_retail_DimProduct_ProductName] ON [retail].[DimProduct]([ProductName]);
CREATE STATISTICS [stat_retail_DimProduct_ProductSubcategoryKey] ON [retail].[DimProduct]([ProductSubcategoryKey]);
CREATE STATISTICS [stat_retail_DimProduct_ProductURL] ON [retail].[DimProduct]([ProductURL]);
CREATE STATISTICS [stat_retail_DimProduct_Size] ON [retail].[DimProduct]([Size]);
CREATE STATISTICS [stat_retail_DimProduct_SizeRange] ON [retail].[DimProduct]([SizeRange]);
CREATE STATISTICS [stat_retail_DimProduct_SizeUnitMeasureID] ON [retail].[DimProduct]([SizeUnitMeasureID]);
CREATE STATISTICS [stat_retail_DimProduct_Status] ON [retail].[DimProduct]([Status]);
CREATE STATISTICS [stat_retail_DimProduct_StockTypeID] ON [retail].[DimProduct]([StockTypeID]);
CREATE STATISTICS [stat_retail_DimProduct_StockTypeName] ON [retail].[DimProduct]([StockTypeName]);
CREATE STATISTICS [stat_retail_DimProduct_StopSaleDate] ON [retail].[DimProduct]([StopSaleDate]);
CREATE STATISTICS [stat_retail_DimProduct_StyleID] ON [retail].[DimProduct]([StyleID]);
CREATE STATISTICS [stat_retail_DimProduct_StyleName] ON [retail].[DimProduct]([StyleName]);
CREATE STATISTICS [stat_retail_DimProduct_UnitCost] ON [retail].[DimProduct]([UnitCost]);
CREATE STATISTICS [stat_retail_DimProduct_UnitOfMeasureID] ON [retail].[DimProduct]([UnitOfMeasureID]);
CREATE STATISTICS [stat_retail_DimProduct_UnitOfMeasureName] ON [retail].[DimProduct]([UnitOfMeasureName]);
CREATE STATISTICS [stat_retail_DimProduct_UnitPrice] ON [retail].[DimProduct]([UnitPrice]);
CREATE STATISTICS [stat_retail_DimProduct_UpdateDate] ON [retail].[DimProduct]([UpdateDate]);
CREATE STATISTICS [stat_retail_DimProduct_Weight] ON [retail].[DimProduct]([Weight]);
CREATE STATISTICS [stat_retail_DimProduct_WeightUnitMeasureID] ON [retail].[DimProduct]([WeightUnitMeasureID]);
CREATE STATISTICS [stat_retail_FactOnlineSales_CurrencyKey] ON [retail].[FactOnlineSales]([CurrencyKey]);
CREATE STATISTICS [stat_retail_FactOnlineSales_CustomerKey] ON [retail].[FactOnlineSales]([CustomerKey]);
CREATE STATISTICS [stat_retail_FactOnlineSales_DateKey] ON [retail].[FactOnlineSales]([DateKey]);
CREATE STATISTICS [stat_retail_FactOnlineSales_OnlineSalesKey] ON [retail].[FactOnlineSales]([OnlineSalesKey]);
CREATE STATISTICS [stat_retail_FactOnlineSales_ProductKey] ON [retail].[FactOnlineSales]([ProductKey]);
CREATE STATISTICS [stat_retail_FactOnlineSales_PromotionKey] ON [retail].[FactOnlineSales]([PromotionKey]);
CREATE STATISTICS [stat_retail_FactOnlineSales_StoreKey] ON [retail].[FactOnlineSales]([StoreKey]);