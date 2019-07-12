﻿CREATE TABLE [Purchasing].[ShipMethod] (
    [ShipMethodID] INT          IDENTITY (1, 1) NOT NULL,
    [Name]         [dbo].[Name] NOT NULL,
    [ShipBase]     MONEY        CONSTRAINT [DF_ShipMethod_ShipBase] DEFAULT ((0.00)) NOT NULL,
    [ShipRate]     MONEY        CONSTRAINT [DF_ShipMethod_ShipRate] DEFAULT ((0.00)) NOT NULL,
    [ModifiedDate] DATETIME     CONSTRAINT [DF_ShipMethod_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ShipMethod_ShipMethodID] PRIMARY KEY CLUSTERED ([ShipMethodID] ASC),
    CONSTRAINT [CK_ShipMethod_ShipBase] CHECK ([ShipBase]>(0.00)),
    CONSTRAINT [CK_ShipMethod_ShipRate] CHECK ([ShipRate]>(0.00))
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ShipMethod_Name]
    ON [Purchasing].[ShipMethod]([Name] ASC);

