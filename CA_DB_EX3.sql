--3.1

select title,runtime, rating from DB.MOVIE
where title like '%September%';

--3.2

select distinct genre from db.GENRE
order by 1;


--3.3
select title from db.movie
where year = 2008 and rating >=8.3 and rating <= 8.5;

select title from db.movie 
where year = 2008 and rating between 8.3 and 8.5;

--3.4
select year, count(*) from db.movie 
group by year
order by year;

--3.5
select g.genre from db.genre g,db.movie m
where m.id = g.movie_id
and m.title = 'Changeling';

--3.6
select title from db.movie
where runtime = (
  select max(runtime) from db.movie
);

select title, runtime from db.movie
where runtime is not null
order by runtime desc  ;

--3.7

select title, person_name, role from db.movie 
join db.casting using (movie_id) 
join db.person using (person_id)
where title like 'Alpha%'
and role = 'composer';

--3.8

select distinct p.name from db.person p 
join db.casting c on p.ID = c.PERSON_ID
where role = 'director'
and p.name like 'C%, Barbara%';

select count(*) from db.movie
where id not in (
select movie_id from db.genre
);

select title, year from DB.movie
where id in
		(select id
		from db.genre
		group by movie_id
		having count(*) = 8);  


--	Hvem har instrueret de dårligste film fra 2007?
	select name from db.person p 
  join db.casting c on p.id = c.person_id 
  join db.movie m on m.id = c.movie_id
	where role = 'director'
	and year = 2007
	and m.rating = (select min(rating) from db.movie where year = 2007);


12.	Hvad er titlen på den film der har flest personer tilknyttet?

	select title
	from DB.movie
	where movie_id in
	  (select movie_id from
	     (select movie_id, count(*) antal from DB.casting group by movie_id)
	     where antal = 
	         (select max(x) from
                     (select count(*) x from DB.casting group by movie_id)));

13.	Vi title, år, rating på film der både har genren 'Horror' og 'Romance' og har en rating der er større end 7.
	select * from DB.movie m, DB.genre g1, DB.genre g2
	where m.movie_id = g1.movie_id








