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

INSERT INTO Student (studentId, stuFName, stuLName, emailAddress, mobNum) VALUES
('s12345678', 'Fred', 'Flintstone', '12345678@student.swin.edu.au', '0400 555 111'),
('s23456789', 'Barney', 'Rubble', '23456789@student.swin.edu.au', '0400 555 222'),
('s34567890', 'Bam-Bam', 'Rubble', '34567890@student.swin.edu.au', '0400 555 333');


INSERT INTO Author (authorId, autFName, autLname, autTFNum) VALUES
('32567', 'Edgar', 'Codd', '150111222'),
('76543', 'Vinton', 'Cerf', '150222333'),
('12345', 'Alan', 'Turing', '150333444');

INSERT INTO Book (isbnId, authorId, autFName, autLName, autTFNum, Title, yearPublished, studentId) VALUES
('978-3-16-148410-0','32567', 'Edgar', 'Codd', '150111222', 'Relationships with Databases, the ins and outs', '1970', null),
('978-3-16-148410-1','32567', 'Edgar', 'Codd', '150111222', 'Normalisation, how to make a database geek fit in.', '1973', null),
('978-3-16-148410-2','76543', 'Vinton', 'Cerf', '150222333', 'TCP/IP, the protocol for the masses', '1983', null),
('978-3-16-148410-3','12345', 'Alan', 'Turing', '150333444', 'The Man, the Bombe, and the Enigma.', '1940', null);

END;