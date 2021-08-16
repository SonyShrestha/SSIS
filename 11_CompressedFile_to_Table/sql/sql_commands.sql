USE [DWHDemo]
GO

CREATE TABLE [dbo].[Employee](
	[Emp_No] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[DOB] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Salary] [varchar](50) NULL,
	[GeographyID] [varchar](50) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[HotelDetails](
	[HotelID] [varchar](50) NULL,
	[HotelName] [varchar](50) NULL,
	[HotelCategory] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Coordinates] [varchar](50) NULL
) ON [PRIMARY]
GO

USE [DWHDemo]
GO


CREATE TABLE [dbo].[Product](
	[ProductId] [varchar](50) NULL,
	[PName] [varchar](50) NULL,
	[SID] [varchar](50) NULL
) ON [PRIMARY]
GO

USE [DWHDemo]
GO

CREATE TABLE [dbo].[SupplierDetails](
	[SupplierID] [varchar](50) NULL,
	[CompanyName] [varchar](50) NULL
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[LogTable](
	[logid] [int] IDENTITY(1,1) Primary Key,
	[filepath] [varchar](200) NULL,
	[Status] [varchar](500) NULL,
	[InsertedDate] [datetime] NULL
 )

ALTER TABLE [dbo].[LogTable] ADD  CONSTRAINT [DF_LogTable_InsertedDate]  DEFAULT (getdate()) FOR [InsertedDate]
GO

select * from [DWHDemo].[dbo].[LogTable]