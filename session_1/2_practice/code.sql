-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 library.db
-- 2. Load this script: .read code.sql
-- 3. Exit SQLite: .exit


-- write your sql code here

--SELECT Books.title, Members.name, loan_date FROM Loans 
--LEFT JOIN Members ON Loans.member_id=Members.id LEFT JOIN Books ON Loans.book_id=Books.id;

--SELECT Books.title, loan_date, Loans.id FROM Books LEFT JOIN Loans ON Loans.book_id=Books.id ORDER BY Books.title;

--SELECT LibraryBranch.name, LibraryBranch.city, Books.title FROM LibraryBranch LEFT JOIN Books ON LibraryBranch.id=branch_id;

--SELECT LibraryBranch.name, COUNT(Books.id) as bookcount FROM LibraryBranch LEFT JOIN Books ON LibraryBranch.id=branch_id GROUP BY LibraryBranch.id;

--SELECT LibraryBranch.name, COUNT(Books.id) as bookcount FROM LibraryBranch LEFT JOIN Books ON LibraryBranch.id=branch_id GROUP BY LibraryBranch.id HAVING bookcount>7;

--SELECT Members.name, COUNT(Loans.id) FROM Members LEFT JOIN Loans ON Members.id=member_id GROUP BY member_id;

--SELECT Members.name, COUNT(Loans.id) FROM Members LEFT JOIN Loans ON Members.id=member_id GROUP BY member_id HAVING COUNT(Loans.id)==0;

--SELECT LibraryBranch.name, COUNT(Loans.id) FROM LibraryBranch LEFT JOIN Books ON LibraryBranch.id=Books.branch_id JOIN Loans ON Books.id=book_id GROUP BY LibraryBranch.id;

--SELECT Members.name, loan_date, return_date, COUNT(Loans.id) FROM Members 
--RIGHT JOIN Loans ON Members.id=Loans.member_id GROUP BY Members.name HAVING COUNT(loan_date)>0 AND COUNT(loan_date)>COUNT(return_date);

--SELECT Books.title, Loans.id, CASE WHEN Loans.id IS NOT NULL THEN 'Loaned book' ELSE 'Unloaned book' END FROM Books FULL OUTER JOIN Loans ON Books.id=book_id;




--DATE('20-01-2026') /* convert a specific date to a datetime */
--DATE('now') /* convert the current time to a datetime */
--DATE('now', '-14 days') /* you can add or subtract days */

