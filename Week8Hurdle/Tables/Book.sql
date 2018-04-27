CREATE TABLE [dbo].[Book]
(
	[isbnId] NCHAR(10) NOT NULL PRIMARY KEY, 
    [authorId] NCHAR(10) NOT NULL, 
    [autFName] NVARCHAR(25) NOT NULL, 
    [autLName] NVARCHAR(25) NOT NULL, 
    [autTFNum] NCHAR(9) NOT NULL, 
    [Title] NVARCHAR(25) NOT NULL, 
    [yearPublished] NCHAR(4) NOT NULL, 
    [studentId] NCHAR(10) NULL, 
    CONSTRAINT [FK_Book_Author] FOREIGN KEY ([authorId]) REFERENCES [Author]([authorId]),  
    CONSTRAINT [FK_Book_Student] FOREIGN KEY ([studentId]) REFERENCES [Student]([studentId]), 
)
