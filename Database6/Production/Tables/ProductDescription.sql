CREATE TABLE [Production].[ProductDescription] (
    [ProductDescriptionID] INT            IDENTITY (1, 1) NOT NULL,
    [Description]          NVARCHAR (400) NOT NULL,
    [ModifiedDate]         DATETIME       CONSTRAINT [DF_ProductDescription_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ProductDescription_ProductDescriptionID] PRIMARY KEY CLUSTERED ([ProductDescriptionID] ASC)
);

