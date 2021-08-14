IF OBJECT_ID('tempdb.dbo.##temp_employee') IS NOT NULL
    DROP TABLE ##temp_employee

CREATE TABLE  ##temp_employee (
	[Emp_No] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[DOB] [varchar](100) NULL,
	[Gender] [varchar](100) NULL,
	[Salary] [int] NULL,
	[City] [varchar](20) NULL 
)  
GO


insert into ##temp_employee ([Emp_No],[Name],[DOB],[Gender],[Salary],[City]) values
(100,'Mahesh','1965-12-01','Male',30000,'Delhi'),
(101,'Suresh','1963-11-14','Male',34000,'Delhi'),
(102,'Rajat','1969-12-21','Male',23000,'Shimla'),
(103,'Kalpana','1961-12-01','Female',40000,'Goa'),
(104,'Neha','1971-12-01','Female',19000,'Goa'),
(105,'Sunita','1958-12-01','Female',50000,'Delhi')


