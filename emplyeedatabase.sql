create database if not exists employee_database;
show databases;
use employee_database;
create table dept(deptno decimal(2,0) primary key, dname varchar(14) default NULL,loc varchar(13) default NULL);
create table emp(empno decimal(4,0) primary key, ename varchar(14) default NULL, mgr_no decimal(4,0) default null,hiredate date  default NULL,sal decimal(7,2) default null, deptno decimal(2,0) references dept(deptno) on delete cascade on update cascade);
create table incentives(empno decimal(4,0) references emp(empno) on delete cascade on update cascade, incentive_date date, incentive_amount decimal(10,2), primary key(empno,incentive_date));
create table project(pno int primary key, pname varchar(30) not null, ploc varchar(30));
create table assigned_to( empno decimal(4,0) references emp(empno) on delete cascade on update cascade, pno int references project(pno) on delete cascade on update cascade,job_role varchar(30),primary key (empno,pno));
show tables;
insert into dept values(10,'ACCOUNTING','MUMBAI'),
(20,'ACCOUNTING','BENGALURU'),
(30,'ACCOUNTING','DELHI'),
(40,'ACCOUNTING','CHENNAI');

insert into emp values (7369,'adarsh',7902,'2012-12-17','80000.00','20'),
(7499,'shruthi',7698,'2013-02-20','16000.00','30'),
(7521,'anvitha',7698,'2015-02-22','12500.00','30'),
(7566,'tanvir',7839,'2008-04-02','29750.00','20'),
(7654,'ramesh',7698,'2014-09-28','12500.00','30'),
(7698,'kumar',7839,'2015-05-01','28500.00','30'),
(7782,'clark',7839,'2017-06-09','24500.00','10'),
(7788,'scott',7566,'2010-12-09','30000.00','20'),
(7839,'king',null,'2009-11-17','50000.00','10'),
(7844,'turner',7698,'2010-08-17','15000.00','30'),
(7876,'adams',7788,'2013-12-17','11000.00','20'),
(7900,'james',7698,'2017-03-17','9500.00','30'),
(7902,'ford',7566,'2010-03-17','30000.00','20');
