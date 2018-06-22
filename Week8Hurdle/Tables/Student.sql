CREATE TABLE [dbo].[Student]
(
	[studentId] NVARCHAR(9) NOT NULL PRIMARY KEY, 
    [stuFName] NVARCHAR(50) NOT NULL, 
    [stuLName] NVARCHAR(50) NOT NULL, 
    [emailAddress] NVARCHAR(35) NOT NULL, 
    [mobNum] NVARCHAR(50) NOT NULL
)
