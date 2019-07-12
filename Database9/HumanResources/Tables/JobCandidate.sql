﻿CREATE TABLE [HumanResources].[JobCandidate] (
    [JobCandidateID]   INT           IDENTITY (1, 1) NOT NULL,
    [BusinessEntityID] INT           NULL,
    [ModifiedDate]     DATETIME      CONSTRAINT [DF_JobCandidate_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    [Resume]           VARCHAR (MAX) NULL,
    CONSTRAINT [PK_JobCandidate] PRIMARY KEY CLUSTERED ([JobCandidateID] ASC),
    CONSTRAINT [FK_JobCandidate_Employee_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID])
);


GO
CREATE NONCLUSTERED INDEX [IX_JobCandidate_BusinessEntityID]
    ON [HumanResources].[JobCandidate]([BusinessEntityID] ASC);

