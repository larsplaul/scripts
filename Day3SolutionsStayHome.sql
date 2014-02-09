--## Change Data ##
--0.1
insert into actor values ('A1111','Tom Cruise');

--0.2
insert into staff values('S1222','Lars Mortensen','Assistent',99999,'B001');

--0.3
update video
set price = 16
where catalogno = 902355;

--0.4
update videoforrent
set available = 'N'
where catalogno < 500000;

--0.5
delete from role
where actorno = 'A7525' and catalogno= 445624;

--0.6
delete from rentalagreement 
where videono > 200000;

--0.7
update staff
set salary = salary * 1.1;

--0.8
update staff
set salary = salary *1.1
where position = 'Manager';

-- Simple Queries
 --1.1
 select Name from staff
 where position = 'Manager';
 
--1.2
select price from video
where dailyrental > 4 and category = 'Children';

--1.3
select actorname from actor
order by actorname desc;

--1.4
select position, salary  from staff
where name like 'S%';

--1.5
select zipcode from branches
where state= 'WA';

--1.6
select * from member;
select * from registration;

select m.memberno from member m
join registration r on m.memberno = r.memberno
where r.datejoined > to_date('01-07-01','YY MM DD');

--1.7
select lname,address from member
where address like '%Portland%'
order by lname ;

--1.8
select name from staff
where (salary*1.1) >50000;

--### AGGREGATE QUERIES ##
--2.1
select count(*) from staff;

--2.2
select avg(salary) from staff
where position = 'Manager';

--2.3
select count(*) from actor
where actorname like '%o%';

--2.4
select max(dailyrental) from video
where directorno in ('D1001','D0078','D3765');

--2.5
select min(price) "Lowest price", max(price) "Higest price" from video;

--2.6
select count(*) "Videos with price > 20" from video
where price > 20;

--############# GROUPING #####################
--3.1
select category, avg(dailyrental) from video
group by category
order by avg(dailyrental) desc;

--3.2
select catalogno,count(actorno) from role
group by catalogno
having count(actorno) > 1;

--3.2 (if we also want the title)
select r.catalogno,v.title, count(actorno) from role r
join video v on r.catalogno= v.catalogno 
group by r.catalogno,v.title
having count(r.actorno) > 1;

--3.3

select * from staff;
select position,max(salary),min(salary), avg(salary) from staff
group by position;

-- ########### Subqueries and Joins ############################
--4-1
select s.* from staff s
join branches b on s.branchno = b.branchno
where b.city = 'Seattle';

--4.2
select s.name, b.street from staff s 
join branches b on s.branchno = b.branchno;

--4.3 
--join syntax
select b.branchno, s.name from branches b
join staff s on b.mgrstaffno = s.staffno;

--where syntax
select b.branchno, name from branches b, staff
where b.mgrstaffno = staff.staffno;

--4.4
--join syntax
select a.actorname, v.title from actor a
join role r on a.actorno = r.actorno
join video v on r.catalogno = v.catalogno;

--where syntax
select actorname, title from actor,role,video
where role.actorno = actor.actorno
and role.catalogno = video.catalogno;

--4.5
--Join syntax
select v.title, d.directorname from video v
join director d on v.directorno = d.directorno
join videoforrent vfr on v.catalogno = vfr.catalogno
where vfr.available = 'Y';

--where syntax
SELECT title, directorname from video v, director d, videoforrent vfr
	where v.directorno = d.directorno
	and vfr.catalogno = v.catalogno
	and available = 'Y';

--4.6
--Join syntax
select v.title from video v
join videoforrent vfr on v.catalogno = vfr.catalogno
join rentalagreement ra on vfr.videono = ra.videono
join member m on m.memberno = ra.memberno
and m.address like '%Seattle%';

--where syntax
SELECT title
FROM video v, videoforrent vfr, rentalagreement ra, member m
WHERE m.memberno = ra.memberno
AND ra.videono = vfr.videono
AND vfr.catalogno = v.catalogno
AND address LIKE '%Seattle%';
	







