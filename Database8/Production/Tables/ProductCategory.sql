﻿CREATE TABLE [Production].[ProductCategory] (
    [ProductCategoryID] INT          IDENTITY (1, 1) NOT NULL,
    [Name]              [dbo].[Name] NOT NULL,
    [ModifiedDate]      DATETIME     CONSTRAINT [DF_ProductCategory_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ProductCategory_ProductCategoryID] PRIMARY KEY CLUSTERED ([ProductCategoryID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductCategory_Name]
    ON [Production].[ProductCategory]([Name] ASC);

