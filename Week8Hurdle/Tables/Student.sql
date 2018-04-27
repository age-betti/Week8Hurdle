CREATE TABLE [dbo].[Student]
(
	[studentId] NCHAR(10) NOT NULL PRIMARY KEY, 
    [stuFName] NCHAR(20) NOT NULL, 
    [stuLName] NCHAR(20) NOT NULL, 
    [emailAddress] NVARCHAR(20) NOT NULL, 
    [mobNum] NCHAR(10) NULL
)
