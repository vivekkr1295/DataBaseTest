CREATE TABLE [Sales].[Store] (
    [BusinessEntityID] INT           NOT NULL,
    [Name]             [dbo].[Name]  NOT NULL,
    [SalesPersonID]    INT           NULL,
    [ModifiedDate]     DATETIME      CONSTRAINT [DF_Store_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    [Demographics]     VARCHAR (MAX) NULL,
    CONSTRAINT [PK_Store_BusinessEntityID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC),
    CONSTRAINT [FK_Store_BusinessEntity_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID]),
    CONSTRAINT [FK_Store_SalesPerson_SalesPersonID] FOREIGN KEY ([SalesPersonID]) REFERENCES [Sales].[SalesPerson] ([BusinessEntityID])
);


GO
CREATE NONCLUSTERED INDEX [IX_Store_SalesPersonID]
    ON [Sales].[Store]([SalesPersonID] ASC);

