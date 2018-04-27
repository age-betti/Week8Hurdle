/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

IF '$(LoadTestData)' = 'true'

BEGIN

-- Kills pre-existing data

DELETE FROM Student;
DELETE FROM Book;
DELETE FROM Author;

-- Builds new data

INSERT INTO Student (studentId, stuFName, stuLName) VALUES
('101644658', 'Adrian', 'Phillips'),
('000000001', 'Blah', 'Blah'),
('111111111', 'Olivia', 'Vun'),
('222222222', 'LeStrade', 'Doggo');

INSERT INTO Book (isbnId, Title, yearPublished) VALUES
('1234567890', 'Dog', '1994'),
('2345678901', 'Dog; Part 2', '1998'),
('3456789012', 'Cat', '1997'),
('4567890123', 'Blah', '1991');

INSERT INTO Author (authorId, autFName, autLname, autTFNum) VALUES
('0987654321', 'Dave', 'Davidson', '123456789'),
('9876543210', 'Steve', 'Stephenson', '234567891'),
('8765432109', 'Bill', 'Billbur', '345678912'),
('7654321098', 'Barry', 'Barriton', '456789123');


END