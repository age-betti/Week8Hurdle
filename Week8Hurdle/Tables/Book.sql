CREATE TABLE [dbo].[Book]
(
	[isbnId] NCHAR(10) NOT NULL PRIMARY KEY, 
    [authorId] NCHAR(10) NULL, 
    [autFName] NVARCHAR(25) NULL, 
    [autLName] NVARCHAR(25) NULL, 
    [autTFNum] NCHAR(9) NULL, 
    [Title] NVARCHAR(25) NULL, 
    [Year] NCHAR(4) NULL, 
    [Published] DATE NULL, 
    [studentId] NCHAR(10) NULL, 
    CONSTRAINT [FK_Book_AuthorID] FOREIGN KEY ([authorId]) REFERENCES [Author]([authorId]), 
    CONSTRAINT [FK_Book_AuthorFN] FOREIGN KEY ([autFName]) REFERENCES [Author]([autFName]),
	CONSTRAINT [FK_Book_AuthorLN] FOREIGN KEY ([autLName]) REFERENCES [Author]([autLName]), 
	CONSTRAINT [FK_Book_AuthorTFN] FOREIGN KEY ([autTFNum]) REFERENCES [Author]([autTFNum]), 
    CONSTRAINT [FK_Book_Student] FOREIGN KEY ([studentId]) REFERENCES [Student]([studentId]), 
)
