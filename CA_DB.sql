--2.A

alter table CD_ARTIST drop constraint fk_cd_ca;
alter table CD_ARTIST drop constraint fk_a_ca;
alter table TRACK drop constraint fk_cd_t;
alter table TRACK_ARTIST drop constraint fk_t_ta;
alter table TRACK_ARTIST drop constraint fk_a_ta;

drop table CD;
drop table ARTIST;
drop table CD_ARTIST;
drop table TRACK;
drop table TRACK_ARTIST;

CREATE TABLE CD
  (
    cd_id    CHAR(32) PRIMARY KEY,
    cd_title VARCHAR(150),
    genre    VARCHAR(50),
    LENGTH   INTEGER,
    YEAR     INTEGER
  );
  
  CREATE TABLE ARTIST
  (
    artist_id   CHAR(32) PRIMARY KEY,
    artist_name VARCHAR(150)
  );
  
  
 CREATE TABLE CD_ARTIST
  (
    cd_id     CHAR(32),
    artist_id CHAR(32),
    PRIMARY KEY (cd_id,artist_id),
    CONSTRAINT fk_cd_ca FOREIGN KEY(cd_id) REFERENCES CD,
    CONSTRAINT fk_a_ca FOREIGN KEY(artist_id) REFERENCES ARTIST
  );
  
  create table TRACK (
  cd_id char(32),
  track_title varchar (150),
  position integer,
  primary key (cd_id,position),
  constraint fk_cd_t foreign key(cd_id) references CD
  );
  
  CREATE TABLE TRACK_ARTIST
  (
    cd_id     CHAR(32),
    position  INTEGER,
    artist_id CHAR(32),
    PRIMARY KEY (cd_id,position,artist_id),
    CONSTRAINT fk_t_ta FOREIGN KEY (cd_id,position) REFERENCES TRACK (cd_id,position),
    CONSTRAINT fk_a_ta FOREIGN KEY (artist_id) REFERENCES ARTIST
  );
  
insert into cd values('2EB4B70A6BB398465A874F1C8670127D', 'bad', 'Pop', 2944, 1987);
insert into cd values('B5B1BD6AB8243369443B8B5BEF8CE2F9', 'Number One', 'Rock', 4756, 2003);
insert into cd values('B4B04A2B667CD84BC6C2CAB826E016C5', 'King of Pop, The Dutch Collection', 'Pop', 4761, 2008);
insert into cd values('9D600BCA37D0C22E6E16A26021789EBF', 'Blood On The Dance Floor', 'Pop', 4557, 1997);

insert into artist values('047177509AFC1589BB3DA1FC19CAE128', 'Milt Jackson and The Modern Jazz Quartet');
insert into artist values('058546B5CA4627A9533913A83609B5FA', 'Bull Moose Jackson');
insert into artist values('05A7DF8F65D3436CC60682DF93A2F928', 'Micheal Jackson');

insert into cd_artist values('B4B04A2B667CD84BC6C2CAB826E016C5', '05A7DF8F65D3436CC60682DF93A2F928');
insert into cd_artist values('2EB4B70A6BB398465A874F1C8670127D', '05A7DF8F65D3436CC60682DF93A2F928');
insert into cd_artist values('B5B1BD6AB8243369443B8B5BEF8CE2F9', '05A7DF8F65D3436CC60682DF93A2F928');
insert into cd_artist values('9D600BCA37D0C22E6E16A26021789EBF', '05A7DF8F65D3436CC60682DF93A2F928');

insert into track values('B4B04A2B667CD84BC6C2CAB826E016C5', 'Billie Jean', 1);
insert into track values('B4B04A2B667CD84BC6C2CAB826E016C5', 'Thriller', 2);
insert into track values('B4B04A2B667CD84BC6C2CAB826E016C5', 'Man In The Mirror', 7);

insert into track_artist values('B4B04A2B667CD84BC6C2CAB826E016C5', 1, '05A7DF8F65D3436CC60682DF93A2F928');
insert into track_artist values('B4B04A2B667CD84BC6C2CAB826E016C5', 2, '05A7DF8F65D3436CC60682DF93A2F928');
insert into track_artist values('B4B04A2B667CD84BC6C2CAB826E016C5', 7, '05A7DF8F65D3436CC60682DF93A2F928');

--2.B
insert into ARTIST values('XXB04A2B6ARTD84BC6C2CAB826E016C5','Lars Mortensen');
insert into CD_ARTIST values('2EB4B70A6BB398465A874F1C8670127D','XXB04A2B6ARTD84BC6C2CAB826E016C5');

select cd_title from cd
join cd_artist on cd_artist.CD_ID = cd.CD_ID
join artist a on CD_ARTIST.ARTIST_ID = a.ARTIST_ID
where a.ARTIST_NAME = 'Lars Mortensen';


