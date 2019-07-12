CREATE TABLE [Production].[ProductModel] (
    [ProductModelID]     INT           IDENTITY (1, 1) NOT NULL,
    [Name]               [dbo].[Name]  NOT NULL,
    [ModifiedDate]       DATETIME      CONSTRAINT [DF_ProductModel_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CatalogDescription] VARCHAR (MAX) NULL,
    [Instructions]       VARCHAR (MAX) NULL,
    CONSTRAINT [PK_ProductModel_ProductModelID] PRIMARY KEY CLUSTERED ([ProductModelID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductModel_Name]
    ON [Production].[ProductModel]([Name] ASC);

