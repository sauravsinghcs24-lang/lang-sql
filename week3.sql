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
insert into BankAccount values(7,'SBI_ResidencyRoad',40000);
insert into BankAccount values(8,'SBI_ParlimentRoad',30000);
insert into BankAccount values(9,'SBI_ResidencyRoad',50000);
insert into BankAccount values(10,'SBI_JanterManter',20000);
commit;
select* from BankAccount;

insert into Bankcustomer values ("Avinash","Bull_Temple_Road","Banglore");
insert into Bankcustomer values ("Dinesh","Bannergatta_Road","Banglore");
insert into Bankcustomer values ("Mohan","NationalCollege_Road","Banglore");
insert into Bankcustomer values ("Nikil","Akbar_Road","Delhi");
insert into Bankcustomer values ("Ravi","Prithviraj_Road","Delhi");

insert into Depositer values ("Avinash", 1);
insert into Depositer values ("Dinesh", 2);
insert into Depositer values ("Nikil", 4);
insert into Depositer values ("Ravi", 5);
insert into Depositer values ("Avinash", 8);
insert into Depositer values ("Nikil", 9);
insert into Depositer values ("Dinesh", 10);
insert into Depositer values ("Nikil", 11);





