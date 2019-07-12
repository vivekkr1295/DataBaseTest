CREATE TABLE [Person].[BusinessEntityContact] (
    [BusinessEntityID] INT      NOT NULL,
    [PersonID]         INT      NOT NULL,
    [ContactTypeID]    INT      NOT NULL,
    [ModifiedDate]     DATETIME CONSTRAINT [DF_BusinessEntityContact_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC, [PersonID] ASC, [ContactTypeID] ASC),
    CONSTRAINT [FK_BusinessEntityContact_BusinessEntity_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID]),
    CONSTRAINT [FK_BusinessEntityContact_ContactType_ContactTypeID] FOREIGN KEY ([ContactTypeID]) REFERENCES [Person].[ContactType] ([ContactTypeID]),
    CONSTRAINT [FK_BusinessEntityContact_Person_PersonID] FOREIGN KEY ([PersonID]) REFERENCES [Person].[Person] ([BusinessEntityID])
);


GO
CREATE NONCLUSTERED INDEX [IX_BusinessEntityContact_ContactTypeID]
    ON [Person].[BusinessEntityContact]([ContactTypeID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_BusinessEntityContact_PersonID]
    ON [Person].[BusinessEntityContact]([PersonID] ASC);

