
USE [DWHDemo]
GO



CREATE TABLE [dbo].[LogErrorTable](
	[id] [int] IDENTITY(1,1) Primary Key,
	[Filepath] [varchar](250) NULL,
	[Errordetails] [varchar](250) NULL,
	[Errordatetime] [datetime] NULL,
)

ALTER TABLE [dbo].[LogErrorTable] ADD  CONSTRAINT [DF_LogErrorTable_Errordatetime]  DEFAULT (getdate()) FOR [Errordatetime]
GO




-- To View Result
SELECT TOP (1000) [HotelID]
      ,[HotelName]
      ,[HotelCategory]
      ,[City]
      ,[Country]
      ,[Address]
  FROM [DWHDemo].[dbo].[MetadataHotelDetails];


-- To View Result
SELECT *
  FROM [DWHDemo].[dbo].[LogErrorTable];
