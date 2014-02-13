--## Change Data ##
--0.1 Insert Tom Cruise as a new actor
insert into actor values ('A1111','Tom Cruise');

--0.2 Insert yourself as a new assistant (staff table)
insert into staff values('S1222','Lars Mortensen','Assistent',99999,'B001');

--0.3	Change the price of Harry Potter to 16
update video
set price = 16
where catalogno = 902355;

--0.4	Change availability to ‘N’ for all videos with catalogno less than 500000
update videoforrent
set available = 'N'
where catalogno < 500000;

--0.5	Remove the character “Agent K” from role
delete from role
where actorno = 'A7525' and catalogno= 445624;
--or
delete from role
where character = 'Agent K';

--0.6	Remove all rental aggreements concerning videos with video-nr greater than 200000
delete from rentalagreement 
where videono > 200000;

--0.7	Raise all salaries 10%
update staff
set salary = salary * 1.1;

--0.8	Raise the salary 10% more for managers
update staff
set salary = salary *1.1
where position = 'Manager';

-- Simple Queries
 --1.1 Find the name of all staff with the 'Manager' position.
 select Name from staff
 where position = 'Manager';
 
--1.2 Find the price of videos where the daily rental is greater than 4 and the category is 'Children'.
select price from video
where dailyrental > 4 and category = 'Children';

--1.3 List the name of actors in descending order.
select actorname from actor
order by actorname desc;

--1.4 Show the position and salary for all staff with a name starting with 'S'.
select position, salary  from staff
where name like 'S%';

--1.5 What are the registered zip codes for the branches in Washington state? 
select zipcode from branches
where state= 'WA';

--1.6 List member number for all members with a registration after 1-jul-01.
select * from member;
select * from registration;

select m.memberno from member m
join registration r on m.memberno = r.memberno
where r.datejoined > to_date('01-07-01','YY MM DD');

--1.7 Find surname from members in 'Portland'. Order the list
select lname,address from member
where address like '%Portland%'
order by lname ;

--1.8 What are the names of staff that would earn more than 50000 if the salary was raised with 10%?
select name from staff
where (salary*1.1) > 50000;

--### AGGREGATE QUERIES ##
--2.1 What are the number of staffs?
select count(*) from staff;

--2.2 What are the average salary for managers?
select avg(salary) from staff
where position = 'Manager';

--2.3 Count actors with a 'o' in their name. 
select count(*) from actor
where actorname like '%o%';

--2.4 What are the highest daily rental for videos directed by D1001, D0078 or D3765?
select max(dailyrental) from video
where directorno in ('D1001','D0078','D3765');

--2.5 Find the smallest and highest price for videos (in one statement).
select min(price) "Lowest price", max(price) "Higest price" from video;

--2.6 How many videos has a price over 20?
select count(*) "Videos with price > 20" from video
where price > 20;

--############# GROUPING #####################
--3.1 For each video category show the average daily rental. Ordered by the average descending.
select category, avg(dailyrental) from video
group by category
order by avg(dailyrental) desc;

--3.2 For each video count the number of actors. Show only the ones having more than one actor.
select catalogno,count(actorno) from role
group by catalogno
having count(actorno) > 1;

--3.2 (if we also want the title)
select r.catalogno,v.title, count(actorno) from role r
join video v on r.catalogno= v.catalogno 
group by r.catalogno,v.title
having count(r.actorno) > 1;

--3.3 List the highest, smallest, and average salary for each position.    
select * from staff;
select position,max(salary),min(salary), avg(salary) from staff
group by position;

-- ########### Subqueries and Joins ############################
--4-1 List all staff from the branches in Seattle
select s.* from staff s
join branches b on s.branchno = b.branchno
where b.city = 'Seattle';

--4.2 For each staff show name and the street of their branch in which he/she works
select s.name, b.street from staff s 
join branches b on s.branchno = b.branchno;

--4.3 For each branch show street and name of manager
--join syntax
select b.branchno, s.name from branches b
join staff s on b.mgrstaffno = s.staffno;

--where syntax
select b.branchno, name from branches b, staff
where b.mgrstaffno = staff.staffno;

--4.4 For each actor show name and title of video in which he/she has a role
--join syntax
select a.actorname, v.title from actor a
join role r on a.actorno = r.actorno
join video v on r.catalogno = v.catalogno;

--where syntax
select actorname, title from actor,role,video
where role.actorno = actor.actorno
and role.catalogno = video.catalogno;

--4.5 Show title and director name for videos available for rent.
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
	







