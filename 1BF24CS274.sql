create database if not exists insurance_database;
show databases;
use insurance_database;
create table person(driver_id varchar(10),name varchar(20),address varchar(30),primary key(driver_id));
desc person;
create table car(reg_num varchar(10),model varchar(10),year int,primary key(reg_num));
desc car;
create table accident(report_num int, accident_date date, location varchar(20), primary key(report_num));
desc accident;
create table owns(driver_id varchar(10),reg_num varchar(10),primary key(driver_id,reg_num),foreign key(driver_id) references person(driver_id), foreign key(reg_num) references car(reg_num));
desc owns;
create table participated(driver_id varchar(10),reg_num varchar(10), report_num int, damage_amount int, primary key(driver_id,reg_num,report_num),foreign key(driver_id) references person(driver_id),foreign key(reg_num) references car(reg_num),foreign key(report_num) references accident(report_num));
desc participated;
insert into person values('A01','RICHARD','SRINIVAS GHAR');
insert into person values('A02','PRADEEP','RAJAJINAGAR');
insert into person values('A03','SMITH','ASHOKNAGAR');
insert into person values('A04','VENU','N.R.COLONY');
insert into person values('A05','JOHN','HANUMANTH NAGAR');

insert into car values('KA052250','INDICA','1990');
insert into car values('KA031181','LANCER','1957');
insert into car values('KA095477','TOYOTA','1998');
insert into car values('KA053408','HONDA','2008');
insert into car values('KA041702','AUDI','2005');
select* from car;
insert into owns values('A01','KA052250');
insert into owns values('A02','KA053408');
insert into owns values('A04', 'KA031181');
insert into owns values('A03', 'KA095477');
insert into owns values('A05', 'KA041702');
select* from owns;






