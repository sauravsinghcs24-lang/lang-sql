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
insert into accident values (11, "01-05-24","kathmandu");
insert into accident values (14, "12-08-25","paris");
insert into accident values (15, "23-10-22","pokhara");
insert into accident values (17, "30-12-21","milan");
insert into accident values (20, "19-02-19","budapest");
select * from accident;
update accident set report_num=12 where report_num= 14;
update accident set report_num=13 where report_num= 15;
update accident set report_num=14 where report_num= 17;
update accident set report_num=15 where report_num= 20;
select * from accident;
insert into participated values ("A01","KA777777", 11, 10000);
insert into participated values ("A02","KA0529639", 12, 50000);
insert into participated values ("A03","KA0147258", 13, 25000);
insert into participated values ("A04","KA0789456", 14, 3000);
insert into participated values ("A05","KA0123698", 15, 5000);
select * from participated;
show tables;
update participated set damage_ammount=25000 where reg_num= "KA0123698" and report_num=15;
commit;
select * from participated;
insert into accident values (16, "31-12-21","oslo");
select * from accident;
select accident_date,location from accident;
select driver_id from participated where damage_ammount>=25000;






