CREATE VIEW MemberLoanDetails AS
SELECT 
    m.member_id,
    m.name AS member_name,
    m.email,
    b.title AS book_title,
    b.author,
    b.genre,
    l.loan_date,
    l.return_date,
	l.book_id,
    (COALESCE(l.return_date, CURRENT_DATE) - l.loan_date) AS days_borrowed
FROM 
    Members m
JOIN 
    Loans l ON m.member_id=l.member_id
JOIN 
    Books b ON l.book_id=b.book_id;

select * from memberloandetails;

CREATE VIEW PublicLoanInfo AS
SELECT 
    member_name,
    book_title,
    genre,
    loan_date,
    return_date
FROM 
    MemberLoanDetails;

select * from publicloaninfo;

create role public_viewer_role;



GRANT SELECT ON PublicLoanInfo TO public_viewer_role;
