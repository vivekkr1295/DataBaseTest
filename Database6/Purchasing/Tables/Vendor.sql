CREATE TABLE [Purchasing].[Vendor] (
    [BusinessEntityID]        INT                   NOT NULL,
    [AccountNumber]           [dbo].[AccountNumber] NOT NULL,
    [Name]                    [dbo].[Name]          NOT NULL,
    [CreditRating]            TINYINT               NOT NULL,
    [PreferredVendorStatus]   [dbo].[Flag]          CONSTRAINT [DF_Vendor_PreferredVendorStatus] DEFAULT ((1)) NOT NULL,
    [ActiveFlag]              [dbo].[Flag]          CONSTRAINT [DF_Vendor_ActiveFlag] DEFAULT ((1)) NOT NULL,
    [PurchasingWebServiceURL] NVARCHAR (1024)       NULL,
    [ModifiedDate]            DATETIME              CONSTRAINT [DF_Vendor_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Vendor_BusinessEntityID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC),
    CONSTRAINT [CK_Vendor_CreditRating] CHECK ([CreditRating]>=(1) AND [CreditRating]<=(5)),
    CONSTRAINT [FK_Vendor_BusinessEntity_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Vendor_AccountNumber]
    ON [Purchasing].[Vendor]([AccountNumber] ASC);

