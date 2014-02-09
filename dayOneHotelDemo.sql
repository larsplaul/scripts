drop table ROOM;
drop table HOTEL;

CREATE TABLE HOTEL (
  hotelNo number primary key,
  hotelName varchar2(40),
  city varchar2(35)
);


CREATE TABLE ROOM (
roomNo number ,
hotelNo number not null,
type varchar2(10) default 'double' check(type in ('single','double','suite')),
price number NULL ,
PRIMARY KEY (roomNo,hotelNo),
FOREIGN KEY( hotelNo) REFERENCES HOTEL(hotelNo)
);

insert into HOTEL values(1,'SAS','London');
insert into HOTEL values(2,'Hilton','Oslo');
insert into HOTEL values(3,'Grand','Paris');
insert into HOTEL values(4,'Palads','Odense');

insert into ROOM (ROOMNO,HOTELNO,PRICE) VALUES (100,1,600);
insert into ROOM VALUES (200,1,'double',600);
insert into ROOM VALUES (205,1,'double',600);
insert into ROOM VALUES (300,1,'single',500);
insert into ROOM(ROOMNO,HOTELNO) VALUES (100,2);
insert into ROOM VALUES (200,2,'suite',1200);
insert into ROOM VALUES (200,3,'double',900);

SELECT hotelName, type
FROM    hotel, room
WHERE hotel.hotelNo = room.hotelNo;


SELECT hotelName, type, count(type)
FROM    hotel, room
WHERE hotel.hotelNo = room.hotelNo
group by hotelName, type;



