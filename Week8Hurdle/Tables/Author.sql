CREATE TABLE [dbo].[Author]
(
	[authorId] NCHAR(10) NOT NULL PRIMARY KEY, 
    [autFName] NVARCHAR(25) NOT NULL, 
    [autLname] NVARCHAR(25) NOT NULL, 
    [autTFNum] NCHAR(9) NOT NULL
)
