
select * from authors;
select * from book_copies;
select * from book_loans;
select * from books;
select * from borrower;
select * from library_branch;
select * from publisher;


-- 1. How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?

with cte_1 as(select * from library_branch
inner join book_copies
using(branchid)
inner join books
using(bookid)
where title = "the lost tribe")

select No_of_copies,branchname,title from cte_1
where branchname = "sharpstown";


-- 2. How many copies of the book titled "The Lost Tribe" are owned by each library branch?

select No_of_copies,title,branchname from books
inner join book_copies
using(bookid)
inner join library_branch
using(branchid)
where title = "the lost tribe";

-- 3. Retrieve the names of all borrowers who do not have any books checked out?

with cte_1 as(select * from borrower
left join book_loans
using(cardNo))
select borrowername from cte_1
where dateout is null;

/* 
4. For each book that is loaned out from the "Sharpstown" branch and whose 
   DueDate is 2/3/18, retrieve the book title, the borrower's name, and the borrower's address. 
*/

with cte_1 as (select * from library_branch
inner join book_loans
using(branchid)
where branchname = "sharpstown" and duedate = "2/3/18")
select title,borrowername,borroweraddress from cte_1
inner join books
using(bookid)
inner join borrower
using(cardno);


-- 5. For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
select branchname,count(bookid) as total_books from library_branch
inner join book_loans
using(branchid)
group by branchid;


-- 6. Retrieve the names, addresses, and number of books checked out for all borrowers 
-- who have more than five books checked out.

select borrowername,borroweraddress,count(bookid) as books_checkedout from borrower
inner join book_loans
using(cardno)
group by cardno
having books_checkedout>5;



-- 7. For each book authored by "Stephen King", 
-- retrieve the title and the number of copies owned by the library branch whose name is "Central".

select title,sum(no_of_copies),branchname,authorname from library_branch
inner join book_copies
using(branchid)
inner join books
using(bookid)
inner join authors
using(bookid)
where branchname = "central" and authorname = "stephen king"
group by title;












                         