CREATE TABLE [Sales].[SalesOrderHeader] (
    [SalesOrderID]           INT                   IDENTITY (1, 1) NOT NULL,
    [RevisionNumber]         TINYINT               CONSTRAINT [DF_SalesOrderHeader_RevisionNumber] DEFAULT ((0)) NOT NULL,
    [OrderDate]              DATETIME              CONSTRAINT [DF_SalesOrderHeader_OrderDate] DEFAULT (getdate()) NOT NULL,
    [DueDate]                DATETIME              NOT NULL,
    [ShipDate]               DATETIME              NULL,
    [Status]                 TINYINT               CONSTRAINT [DF_SalesOrderHeader_Status] DEFAULT ((1)) NOT NULL,
    [OnlineOrderFlag]        [dbo].[Flag]          CONSTRAINT [DF_SalesOrderHeader_OnlineOrderFlag] DEFAULT ((1)) NOT NULL,
    [SalesOrderNumber]       AS                    (isnull(N'SO'+CONVERT([nvarchar](23),[SalesOrderID]),N'*** ERROR ***')),
    [PurchaseOrderNumber]    [dbo].[OrderNumber]   NULL,
    [AccountNumber]          [dbo].[AccountNumber] NULL,
    [CustomerID]             INT                   NOT NULL,
    [SalesPersonID]          INT                   NULL,
    [TerritoryID]            INT                   NULL,
    [BillToAddressID]        INT                   NOT NULL,
    [ShipToAddressID]        INT                   NOT NULL,
    [ShipMethodID]           INT                   NOT NULL,
    [CreditCardID]           INT                   NULL,
    [CreditCardApprovalCode] VARCHAR (15)          NULL,
    [CurrencyRateID]         INT                   NULL,
    [SubTotal]               MONEY                 CONSTRAINT [DF_SalesOrderHeader_SubTotal] DEFAULT ((0.00)) NOT NULL,
    [TaxAmt]                 MONEY                 CONSTRAINT [DF_SalesOrderHeader_TaxAmt] DEFAULT ((0.00)) NOT NULL,
    [Freight]                MONEY                 CONSTRAINT [DF_SalesOrderHeader_Freight] DEFAULT ((0.00)) NOT NULL,
    [TotalDue]               AS                    (isnull(([SubTotal]+[TaxAmt])+[Freight],(0))),
    [Comment]                NVARCHAR (128)        NULL,
    [ModifiedDate]           DATETIME              CONSTRAINT [DF_SalesOrderHeader_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SalesOrderHeader_SalesOrderID] PRIMARY KEY CLUSTERED ([SalesOrderID] ASC),
    CONSTRAINT [CK_SalesOrderHeader_DueDate] CHECK ([DueDate]>=[OrderDate]),
    CONSTRAINT [CK_SalesOrderHeader_Freight] CHECK ([Freight]>=(0.00)),
    CONSTRAINT [CK_SalesOrderHeader_ShipDate] CHECK ([ShipDate]>=[OrderDate] OR [ShipDate] IS NULL),
    CONSTRAINT [CK_SalesOrderHeader_Status] CHECK ([Status]>=(0) AND [Status]<=(8)),
    CONSTRAINT [CK_SalesOrderHeader_SubTotal] CHECK ([SubTotal]>=(0.00)),
    CONSTRAINT [CK_SalesOrderHeader_TaxAmt] CHECK ([TaxAmt]>=(0.00)),
    CONSTRAINT [FK_SalesOrderHeader_Address_BillToAddressID] FOREIGN KEY ([BillToAddressID]) REFERENCES [Person].[Address] ([AddressID]),
    CONSTRAINT [FK_SalesOrderHeader_Address_ShipToAddressID] FOREIGN KEY ([ShipToAddressID]) REFERENCES [Person].[Address] ([AddressID]),
    CONSTRAINT [FK_SalesOrderHeader_CreditCard_CreditCardID] FOREIGN KEY ([CreditCardID]) REFERENCES [Sales].[CreditCard] ([CreditCardID]),
    CONSTRAINT [FK_SalesOrderHeader_CurrencyRate_CurrencyRateID] FOREIGN KEY ([CurrencyRateID]) REFERENCES [Sales].[CurrencyRate] ([CurrencyRateID]),
    CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID] FOREIGN KEY ([CustomerID]) REFERENCES [Sales].[Customer] ([CustomerID]),
    CONSTRAINT [FK_SalesOrderHeader_SalesPerson_SalesPersonID] FOREIGN KEY ([SalesPersonID]) REFERENCES [Sales].[SalesPerson] ([BusinessEntityID]),
    CONSTRAINT [FK_SalesOrderHeader_SalesTerritory_TerritoryID] FOREIGN KEY ([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID]),
    CONSTRAINT [FK_SalesOrderHeader_ShipMethod_ShipMethodID] FOREIGN KEY ([ShipMethodID]) REFERENCES [Purchasing].[ShipMethod] ([ShipMethodID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesOrderHeader_SalesOrderNumber]
    ON [Sales].[SalesOrderHeader]([SalesOrderNumber] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SalesOrderHeader_CustomerID]
    ON [Sales].[SalesOrderHeader]([CustomerID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SalesOrderHeader_SalesPersonID]
    ON [Sales].[SalesOrderHeader]([SalesPersonID] ASC);

