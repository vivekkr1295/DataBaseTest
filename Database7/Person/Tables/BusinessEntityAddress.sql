CREATE TABLE [Person].[BusinessEntityAddress] (
    [BusinessEntityID] INT      NOT NULL,
    [AddressID]        INT      NOT NULL,
    [AddressTypeID]    INT      NOT NULL,
    [ModifiedDate]     DATETIME CONSTRAINT [DF_BusinessEntityAddress_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC, [AddressID] ASC, [AddressTypeID] ASC),
    CONSTRAINT [FK_BusinessEntityAddress_Address_AddressID] FOREIGN KEY ([AddressID]) REFERENCES [Person].[Address] ([AddressID]),
    CONSTRAINT [FK_BusinessEntityAddress_AddressType_AddressTypeID] FOREIGN KEY ([AddressTypeID]) REFERENCES [Person].[AddressType] ([AddressTypeID]),
    CONSTRAINT [FK_BusinessEntityAddress_BusinessEntity_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID])
);


GO
CREATE NONCLUSTERED INDEX [IX_BusinessEntityAddress_AddressID]
    ON [Person].[BusinessEntityAddress]([AddressID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_BusinessEntityAddress_AddressTypeID]
    ON [Person].[BusinessEntityAddress]([AddressTypeID] ASC);

