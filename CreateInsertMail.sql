---------------------------------------------------------------
-- Creates and fill Mail Order Database; 
-- from "Oracle Programming -- A Primer", by R. Sunderraman
-------------------------------------------------------------
-- set date format
alter session set nls_date_format = 'yyyy-mm-dd';

drop table  odetails;
drop table  orders;
drop table  customers;
drop table  employees;
drop table  parts;
drop table  zipcodes;

drop sequence orderseq;
create sequence orderseq start with 3000;

create table zipcodes (
  zip      integer,
  city     varchar(30),
  primary key (zip));

create table employees (
  eno      integer not null primary key,
  ename    varchar(30),
  zip      integer,
  hdate    date,
  constraint ezFK foreign key (zip) references zipcodes(zip));

create table parts(
  pno      integer not null primary key,
  pname    varchar(30),
  qoh      integer,
  price    float,
  olevel   integer);

create table customers (
  cno      integer not null primary key,
  cname    varchar(30),
  street   varchar(30),
  zip      integer,
  phone    char(12),
  constraint czFK foreign key (zip) references zipcodes(zip));

create table orders (
  ono      integer not null primary key,
  cno      integer,
  eno      integer,
  received date,
  shipped  date, 
  foreign key (cno) references customers(cno),
  foreign key (eno) references employees(eno));

create table odetails (
  ono      integer not null,
  pno      integer not null,
  qty      integer,
  foreign key (ono) references orders(ono),
  foreign key (pno) references parts(pno),
  primary key (ono,pno));


insert into  zipcodes values
  (67226,'Wichita');
insert into  zipcodes values
  (60606,'Fort Dodge');
insert into  zipcodes values
  (50302,'Kansas City');
insert into  zipcodes values
  (54444,'Columbia');
insert into  zipcodes values
  (66002,'Liberal');
insert into  zipcodes values
  (61111,'Fort Hays');

insert into employees values
  (1000,'Jones',67226,'1995-12-12');
insert into employees values
  (1001,'Smith',60606,'1992-01-01');
insert into employees values
  (1002,'Brown',50302,'1944-09-01');

insert into parts values
  (10506,'Land Before Time I',200,19.99,20);
insert into parts values
  (10507,'Land Before Time II',156,19.99,20);
insert into parts values
  (10508,'Land Before Time III',190,19.99,20); 
insert into parts values
  (10509,'Land Before Time IV',60,19.99,20);
insert into parts values
  (10601,'Sleeping Beauty',300,24.99,20);
insert into parts values
  (10701,'When Harry Met Sally',120,19.99,30);
insert into parts values
  (10800,'Dirty Harry',140,14.99,30);
insert into parts values
  (10900,'Dr. Zhivago',100,24.99,30);

insert into customers values
  (1111,'Charles','123 Main St.',67226,'316-636-5555');
insert into customers values
  (2222,'Bertram','237 Ash Avenue',67226,'316-689-5555');
insert into customers values
  (3333,'Barbara','111 Inwood St.',60606,'316-111-1234');

insert into orders values
  (1020,1111,1000,'1994-12-10','1994-12-12');
insert into orders values
  (1021,1111,1000,'1995-12-01','1995-01-15');
insert into orders values
  (1022,2222,1001,'1995-02-13','1995-02-20');
insert into orders (ono, cno, eno,received) values
  (1023,3333,1000,'1997-06-20');

insert into odetails values
  (1020,10506,1);
insert into odetails values
  (1020,10507,1);
insert into odetails values
  (1020,10508,2);
insert into odetails values
  (1020,10509,3);
insert into odetails values
  (1021,10601,4);
insert into odetails values
  (1022,10601,1);
insert into odetails values
  (1022,10701,1);
insert into odetails values
  (1023,10800,1);
insert into odetails values
  (1023,10900,1);
commit;