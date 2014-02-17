--3.1 1. Show title, runtime and rating for all movies having a title containing the word "September".

select title,runtime, rating from DB.MOVIE
where title like '%September%';

--3.2 Show a sorted list of all genres. 

select distinct genre from db.GENRE
order by 1;

select  unique(genre) from db.GENRE
order by 1;


--3.3 Show the title of movies from 2008 that is rated between 8.3 and 8.5. 
select title from db.movie
where year = 2008 and rating >=8.3 and rating <= 8.5;

select title from db.movie 
where year = 2008 and rating between 8.3 and 8.5;


--3.4 Show the number of movies by year. Sort by year. 

select  year, count(*) from db.movie 
group by year
order by year;

--3.5 Show the genre of the movie "Changeling". 

select g.genre from db.genre g,db.movie m
where m.id = g.movie_id
and m.title = 'Changeling';


select genre from DB.genre
where MOVIE_ID = (select id from DB.movie where title = 'Changeling');


SELECT genre FROM DB.Genre WHERE MOVIE_ID = (SELECT ID FROM DB.MOVIE
WHERE title like 'Changeling');

--3.6 What is the title of the longest movie? 

select title from db.movie
where runtime = (
  select max(runtime) from db.movie
);



--3.7 Show movie title and name of producers (role) for all movies with a title that starts with "Alpha". 

select m.title, p.NAME, c.role from db.movie m
join db.casting c on c.MOVIE_ID = m.ID
join db.person p on c.PERSON_ID = p.id
where title like 'Alpha%'
and role = 'producer';


select distinct m.TITLE, p.NAME from DB.MOVIE m
join DB.CASTING c on m.id = c.MOVIE_ID 
join DB.PERSON p on c.PERSON_ID =p.ID 
where c.ROLE = 'producer' AND m.TITLE LIKE 'Alpha%';



SELECT title,role,name FROM DB.MOVIE,DB.CASTING,DB.PERSON WHERE title LIKE
'Alpha%' and role = 'producer';


--3.8 Find the name of all directors whose first name is ’Barbara’ and who has a surname beginning with a ’C’.

select distinct p.name from db.person p 
join db.casting c on p.ID = c.PERSON_ID
where role = 'director'
and p.name like 'C%, Barbara%';

SELECT distinct(p.name)
FROM db.person p INNER JOIN db.casting c
ON p.id = c.person_id
WHERE c.role = 'director' and p.name like '%Barbara%'and p.name Like 'C%';




select name, role from db.person p, db.casting c where p.ID = c.PERSON_ID and p.name = 'Carratala Bonds, Barbara';


--3.9 How many movies do not have information about genre?

select count(*) from db.movie
where id not in (
select movie_id from db.genre
);




SELECT COUNT(TITLE) FROM DB.MOVIE
 left JOIN DB.GENRE ON DB.MOVIE.ID = DB.GENRE.MOVIE_ID WHERE GENRE IS  NULL;
 
 select count(*) from db.movie m
left join db.genre g
on m.id = g.movie_id
where g.genre is null;
 
 
 SELECT COUNT(*) AS "MOVIES WITHOUT GENRE-INFO"
FROM DB.MOVIE M
left JOIN DB.GENRE G
ON M.ID = G.MOVIE_ID
WHERE genre is null;
 
 
 
 SELECT Count(m.title) as "Movies with no genre"
from db.movie m left join db.genre g
on m.ID = g.movie_id
where g.genre IS NULL;
--


SELECT Count(m.title) as "Movies with no genre" from db.movie m 
left join db.genre g
on m.ID = g.movie_id
where g.genre IS NULL;



--10. Show title and year of movies that belong to 8 different genres. 

select title, year from DB.movie
where id in
		(select movie_id
		from db.genre
		group by movie_id
		having count(*) = 8);  

 select title, year from db.movie
where id in (select movie_id from db.genre
group by movie_id
having count(*) = 8);

select title, year from db.movie where id in (
select g.movie_id from db.movie m, db.genre g
where m.id = g.movie_id 
group by g.MOVIE_ID having count(g.movie_id) = 8);
    
    
SELECT title, year FROM DB.movie
WHERE id IN(
SELECT m.id
FROM DB.movie m, DB.genre g
WHERE m.id = g.movie_id
GROUP BY m.id
HAVING count(distinct genre) > 7);





--	11 Hvem har instrueret de dårligste film fra 2007?



select name from db.person
where id in (select person_id from db.casting
where role = 'director' and movie_id in (select m.id from db.movie m
where year = 2007 and rating = (select min(m.rating) from db.movie m)));

	select name from db.person p 
  join db.casting c on p.id = c.person_id 
  join db.movie m on m.id = c.movie_id
	where role = 'director'
	and year = 2007
	and m.rating = (select min(rating) from db.movie where year = 2007);

--12 Hvad er titlen på den film der har flest personer tilknyttet?

	select title
	from DB.movie
	where id in
	  (select movie_id from
	     (select movie_id, count(*) antal from DB.casting group by movie_id)
	     where antal = 
	         (select max(x) from
                     (select count(*) x from DB.casting group by movie_id)));

SELECT title
FROM db.movie
WHERE id =
  (SELECT movie_id FROM
    (SELECT movie_id FROM db.casting
    GROUP BY movie_id
    ORDER BY COUNT(DISTINCT person_id) DESC
    )
  WHERE rownum = 1
  );
  
  


--13.	. Show title, year, rating of movies that belong the genres 'Horror' and 'Romance' and have ratings greater than 7
  
  select m.title,m.year, m.rating from DB.movie m
	join db.genre g1 on m.ID = g1.MOVIE_ID and g1.GENRE = 'Horror'
  join db.genre g2 on m.ID = g2.MOVIE_ID and g2.genre = 'Romance'
  and m.rating > 7;
  
  
  
 


--##### Exercise 4 ##

SELECT name FROM db.person
WHERE id IN
  (
  SELECT p.id FROM db.movie m, db.casting c, db.person p
  WHERE m.id = c.movie_id
  AND c.person_id = p.id
  AND title LIKE 'Lord of the Rings%'
  AND role = 'actress'
  GROUP BY p.id
  HAVING COUNT(movie_id) = 3
  );



