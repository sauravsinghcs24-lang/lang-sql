create database if not exists banking_week3;
show databases;
use banking_week3;
create table branch(branchname varchar(30),branchcity varchar(20),assests real, primary key(branchname));
desc branch;
create table BankAccount(accno integer,branchname varchar(30),balance real,primary key(accno),foreign key(branchname) references branch(branchname));

