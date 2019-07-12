﻿CREATE TABLE [Sales].[SalesPersonQuotaHistory] (
    [BusinessEntityID] INT      NOT NULL,
    [QuotaDate]        DATETIME NOT NULL,
    [SalesQuota]       MONEY    NOT NULL,
    [ModifiedDate]     DATETIME CONSTRAINT [DF_SalesPersonQuotaHistory_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC, [QuotaDate] ASC),
    CONSTRAINT [CK_SalesPersonQuotaHistory_SalesQuota] CHECK ([SalesQuota]>(0.00)),
    CONSTRAINT [FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Sales].[SalesPerson] ([BusinessEntityID])
);

