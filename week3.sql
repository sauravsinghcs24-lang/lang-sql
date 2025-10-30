create database if not exists banking_week3;
show databases;
use banking_week3;
create table branch(branchname varchar(30),branchcity varchar(20),assests real, primary key(branchname));
desc branch;
create table BankAccount(accno integer,branchname varchar(30),balance real,primary key(accno),foreign key(branchname) references branch(branchname));
desc BankAccount;
create table Bankcustomer(customername varchar(30),customerstreet varchar(30),customercity varchar(30),primary key (customername));
create table Depositer(customername varchar(30),accno integer,primary key(customername,accno),foreign key(customername) references  Bankcustomer(customername),foreign key(accno) references bankaccount(accno));
desc depositer;
create table loan(loannumber int, branchname varchar(30),amount real,primary key (loannumber),foreign key (branchname) references branch(branchname));
desc loan;
create table borrower (customername VARCHAR(30),loannumber INT,PRIMARY KEY (customername, loannumber),FOREIGN KEY (customername) REFERENCES bankcustomer(customername),FOREIGN KEY (loannumber) REFERENCES loan(loannumber));

insert into branch values('SBI_Chamrajpet','Bangalore',50000);
insert into branch values('SBI_ResidencyRoad','Bangalore',10000);
insert into branch values('SBI_SivajiRoad','Bombay',20000);
insert into branch values('SBI_ParlimentRoad','Delhi',10000);
insert into branch values('SBI_JanterManter','Delhi',20000);
select* from branch;
insert into loan values(1,'SBI_Chamrajpet',50000);
insert into loan values(2,'SBI_ResidencyRoad',10000);
insert into loan values(3,'SBI_SivajiRoad',20000);
insert into loan values(4,'SBI_ParlimentRoad',10000);
insert into loan values(5,'SBI_JanterManter',20000);
select* from loan;
insert into BankAccount values(1,'SBI_JanterManter',20000);
insert into BankAccount values(2,'SBI_ResidencyRoad',50000);
insert into BankAccount values(3,'SBI_SivajiRoad',60000);
insert into BankAccount values(4,'SBI_ParlimentRoad',90000);
insert into BankAccount values(5,'SBI_JanterManter',80000);
insert into BankAccount values(6,'SBI_SivajiRoad',40000);
insert into BankAccount values(8,'SBI_ResidencyRoad',40000);
insert into BankAccount values(9,'SBI_ParlimentRoad',30000);
insert into BankAccount values(10,'SBI_ResidencyRoad',50000);
insert into BankAccount values(11,'SBI_JanterManter',20000);
commit;
select* from BankAccount;

insert into Bankcustomer values ("Avinash","Bull_Temple_Road","Banglore");
insert into Bankcustomer values ("Dinesh","Bannergatta_Road","Banglore");
insert into Bankcustomer values ("Mohan","NationalCollege_Road","Banglore");
insert into Bankcustomer values ("Nikil","Akbar_Road","Delhi");
insert into Bankcustomer values ("Ravi","Prithviraj_Road","Delhi");

select * from Bankcustomer;

insert into Depositer values ("Avinash", 1);
insert into Depositer values ("Dinesh", 2);
insert into Depositer values ("Nikil", 4);
insert into Depositer values ("Ravi", 5);
insert into Depositer values ("Avinash", 8);
insert into Depositer values ("Nikil", 9);
insert into Depositer values ("Dinesh", 10);
insert into Depositer values ("Nikil", 11);

INSERT INTO borrower VALUES ('Avinash', 1);
INSERT INTO borrower VALUES ('Dinesh', 2);
INSERT INTO borrower VALUES ('Mohan', 3);
INSERT INTO borrower VALUES ('Nikil', 4);
INSERT INTO borrower VALUES ('Ravi', 5);


select* from Depositer;
SELECT d.CUSTOMERNAME FROM Depositer d JOIN BankAccount a ON d.ACCNO = a.ACCNO GROUP BY d.CUSTOMERNAME HAVING COUNT(d.ACCNO) >= 2;



SELECT d.CUSTOMERNAME FROM Depositer d JOIN BankAccount a ON d.ACCNO = a.ACCNO
JOIN Branch b ON a.BRANCHNAME = b.BRANCHNAME
WHERE b.BRANCHCITY = 'Delhi'
GROUP BY d.CUSTOMERNAME
HAVING COUNT(DISTINCT b.BRANCHNAME) = (
    SELECT COUNT(*)
    FROM Branch
    WHERE BRANCHCITY = 'Delhi'
);

Select * from Depositer d;


DELETE a
FROM BankAccount a
JOIN branch b ON a.branchname = b.branchname
WHERE b.branchcity = 'Bombay';
Select * from BankAccount a;

SELECT customername 
from branch
where b.branchcity = 'Delhi';
SELECT *from branch;






CREATE VIEW BranchLoanSummary AS
Select branchname,
Sum(Amount) AS total_loan_amount
From Loan
Group By branchname;
Select * from Loan;

SELECT
    D.customername,
    B.branchname,
    COUNT(D.accno) AS totalaccounts
FROM Depositer D
JOIN BankAccount B ON D.accno = B.accno
GROUP BY D.customername, B.branchname
HAVING COUNT(D.accno) >= 2;
SELECT* FROM Depositer d;



SELECT branchname, (assests/1000) AS "assets in thousand"
FROM branch;

SELECT * 
FROM loan 
ORDER BY AMOUNT DESC;

SELECT DISTINCT C.customername
FROM customer C
WHERE C.customer_name IN (
    SELECT D.customername
    FROM Depositor D
);

CREATE VIEW BranchLoanSummary1 AS
SELECT branchname,SUM(amount) AS total_loan_amount
FROM Loan
GROUP BY branchname;
SELECT * FROM BranchLoanSummary1;

UPDATE branch
SET Account = Account * 1.05;

SELECT branch_name, branch_city, assets FROM BankBranch;

select distinct customernam
        from BankCustomer where customername not in 
        (select customername from Depositer);


SELECT DISTINCT D.customername
FROM Depositer D
WHERE NOT EXISTS 
    (SELECT branchname
     FROM Branch
     WHERE branchcity = 'Delhi');
     
SELECT DISTINCT customername
FROM borrower
WHERE customername NOT IN (
    SELECT customername FROM depositer
);

SELECT DISTINCT bo.customername
FROM borrower AS bo
JOIN loan AS l ON bo.loannumber = l.loannumber
WHERE l.branchname IN (
    SELECT branchname FROM branch WHERE branchcity = 'Bangalore'
)
AND (l.branchname, bo.customername) IN (
    SELECT a.branchname, d.customername
    FROM depositer AS d
    JOIN bankaccount AS a ON d.accno = a.accno
);

UPDATE branch
SET assests = assests * 1.05;

select* from branch;

SELECT branchname
FROM branch
WHERE assests > ALL (
    SELECT assests
    FROM branch
    WHERE branchcity = 'Bangalore'
);

select *
from loan
order by amount desc;

(select customername
from Depositer) UNION(select customername
                          from borrower);

create view Branch_total_loan(branchname,Total_Loan) as select branchname, sum(amount)
from loan
group by branchname;           


 UPDATE branch
SET assests=assests*1.05;      
select* from branch;
   



