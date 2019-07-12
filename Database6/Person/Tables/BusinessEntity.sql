﻿CREATE TABLE [Person].[BusinessEntity] (
    [BusinessEntityID] INT      IDENTITY (1, 1) NOT NULL,
    [ModifiedDate]     DATETIME CONSTRAINT [DF_BusinessEntity_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_BusinessEntity_BusinessEntityID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC)
);

