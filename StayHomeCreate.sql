-- create the stayhome database
-- 2012 hsty/hau
-------------------------------
drop table rentalagreement;
drop table videoforrent;
drop table registration;
drop table member;
drop table role;
drop table actor;
drop table video;
drop table director;
drop table staff;
drop table branches;


create table branches(
branchno char(4),
street varchar(30),
city varchar(20),
state char(2),
zipcode integer,
mgrstaffno char(5),
primary key (branchno)
);

create table staff(
staffno char(5),
name varchar(30),
position varchar(20),
salary number,
branchno char(4),
primary key (staffno),
foreign key (branchno) references branches
);


create table director(
directorno char(5),
directorname varchar(30),
primary key (directorno)
);

create table video(
catalogno integer,
title varchar(30),
category varchar(20),
dailyrental number,
price number,
directorno char(5),
primary key (catalogno),
foreign key (directorno) references director
);

create table actor(
actorno char(5),
actorname varchar(30),
primary key (actorno)
);

create table role(
actorno char(5),
catalogno integer,
character varchar(30),
constraint role_pk primary key (actorno, catalogno, character),
foreign key (actorno) references actor,
foreign key (catalogno) references video
);

create table member(
memberno char(7),
fname varchar(30),
lname varchar(30),
address varchar(60),
primary key (memberno)
);

create table registration(
branchno char(4),
memberno char(7),
staffno char(5),
datejoined date,
primary key (branchno, memberno),
foreign key (branchno) references branches,
foreign key (memberno) references member,
foreign key (staffno) references staff
);

create table videoforrent(
videono integer,
available char(1),
catalogno integer,
branchno char(4),
primary key (videono),
foreign key (catalogno) references video,
foreign key (branchno) references branches
);

create table rentalagreement(
rentalno char(7),
dateout date,
datereturn date,
memberno char(7),
videono integer,
primary key (rentalno),
foreign key (memberno) references member,
foreign key (videono) references videoforrent
);



insert into branches values('B001', '8 Jefferson Way', 'Portland', 
'OR', 97201, 'S1500');
insert into branches values('B002', 'City Center Plaza', 'Seattle', 
'WA', 98122, 'S0010');
insert into branches values('B003', '14-8th Avenue', 'New York', 
'NY', 10012, 'S0415');
insert into branches values('B004', '16-14th Avenue', 'Seattle', 
'WA', 98128, 'S2250');


insert into staff values('S1500', 'Tom Daniels', 'Manager', 46000, 
'B001');
insert into staff values('S0003', 'Sally Adams', 'Assistant', 
30000, 'B001');
insert into staff values('S0010', 'Mary Martinez', 'Manager', 
50000, 'B002');
insert into staff values('S3250', 'Robert Chin', 'Supervisor', 
32000, 'B002');
insert into staff values('S2250', 'Sally Stern', 'Manager', 48000, 
'B004');
insert into staff values('S0415', 'Art Peters', 'Manager', 41000, 
'B003');


insert into director values('D1001','Lee Tamahori');
insert into director values('D7834','Cris Columbus');
insert into director values('D4576','Peter Jacson');
insert into director values('D0078','Andrew Adamson');
insert into director values('D5743','Barry Sonnenfeld');
insert into director values('D3765','Roland Emmerick');




insert into video values(207132, 'Die Another Day', 'Action', 5.00, 
21.99, 'D1001');
insert into video values(902355, 'Harry Potter', 'Children', 4.50, 
14.50, 'D7834');
insert into video values(330553, 'Lord of the Rings', 'Fantasy', 
5.00, 31.99, 'D4576');
insert into video values(781132, 'Shrek', 'Children', 4.00, 18.50, 
'D0078');
insert into video values(445624, 'Men in Black II', 'Action', 4.00, 
29.99, 'D5743');
insert into video values(634817, 'Independece Day', 'Sci-Fi', 4.50, 
32.99, 'D3765');


insert into actor values('A1002','Pierce Brosnan');
insert into actor values('A3006','Elijah Wood');
insert into actor values('A2019','Will Smith');
insert into actor values('A7525','Tommy Lee Jones');
insert into actor values('A4343','Mike Myers');
insert into actor values('A8401','Daniel Radcliffe');


insert into role values('A1002', 207132, 'James Bond');
insert into role values('A3006', 330553, 'Frodo Baggins');
insert into role values('A3006', 902355, 'Harry Potter');
insert into role values('A2019', 634817, 'Captain Steve Hiller');
insert into role values('A2019', 445624, 'Agent J');
insert into role values('A7525', 445624, 'Agent K');
insert into role values('A4343', 781132, 'Shrek');


insert into member values('M250178', 'Bob', 'Adams', '57 - 11th 
Avenue, Seattle, WA 98105');
insert into member values('M166884', 'Art', 'Peters', '89 Redmond 
Rd, Portland, OR 97117');
insert into member values('M115656', 'Serena', 'Parker', '22 W. 
Capital Way, Portland, OR 97201');
insert into member values('M284354', 'Don', 'Nelson', '123 Suffolk 
Lane, Seattle, WA 98117');


insert into registration values('B002', 'M250178', 'S3250', 
to_date('01-07-01', 'DD-MM-YY'));
insert into registration values('B001', 'M166884', 'S0003', 
to_date('04-09-02', 'DD-MM-YY'));
insert into registration values('B001', 'M115656', 'S0003', 
to_date('12-05-00', 'DD-MM-YY'));
insert into registration values('B002', 'M284354', 'S3250', 
to_date('09-10-01', 'DD-MM-YY'));


insert into videoforrent values(199004, 'Y', 207132, 'B001');
insert into videoforrent values(245456, 'Y', 207132, 'B002');
insert into videoforrent values(178643, 'N', 634817, 'B001');
insert into videoforrent values(243431, 'Y', 634817, 'B002');


insert into rentalagreement values('R753461', to_date('04-02-03', 
'DD-MM-YY'), to_date('06-02-03', 'DD-MM-YY'), 'M284354', 
245456);
insert into rentalagreement values('R753462', to_date('04-02-03', 
'DD-MM-YY'), to_date('06-02-03', 'DD-MM-YY'), 'M284354', 
243431);
insert into rentalagreement values('R668256', to_date('05-02-03', 
'DD-MM-YY'), to_date('07-02-03', 'DD-MM-YY'), 'M115656', 
199004);
insert into rentalagreement values('R668189', to_date('02-02-03', 
'DD-MM-YY'), NULL, 'M115656', 178643);


commit;