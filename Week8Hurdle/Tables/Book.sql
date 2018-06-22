CREATE TABLE [dbo].[Book]
(
	[isbnId] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [authorId] NVARCHAR(50) NOT NULL, 
    [autFName] NVARCHAR(25) NOT NULL, 
    [autLName] NVARCHAR(25) NOT NULL, 
    [autTFNum] NVARCHAR(50) NOT NULL, 
    [Title] NVARCHAR(100) NOT NULL, 
    [yearPublished] NCHAR(4) NOT NULL, 
    [studentId] NVARCHAR(9) NULL, 
    CONSTRAINT [FK_Book_Author] FOREIGN KEY ([authorId]) REFERENCES [Author]([authorId]),  
    CONSTRAINT [FK_Book_Student] FOREIGN KEY ([studentId]) REFERENCES [Student]([studentId]), 
)
