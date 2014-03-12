---------------------------------------------------------------
-- Mail Order Database: Insert Rows
-- Chapter 2; Oracle Programming -- A Primer
--            by R. Sunderraman
-- hau f2011
-- use sequence in order table
---------------------------------------------------------------
insert into  v_zipcodes values
  (67226,'Wichita');
insert into  v_zipcodes values
  (60606,'Fort Dodge');
insert into  v_zipcodes values
  (50302,'Kansas City');
insert into  v_zipcodes values
  (54444,'Columbia');
insert into  v_zipcodes values
  (66002,'Liberal');
insert into  v_zipcodes values
  (61111,'Fort Hays');

insert into v_employees values
  (1000,'Jones',67226,to_date('12-DEC-95','DD MON YY'));
insert into v_employees values
  (1001,'Smith',60606,to_date('01-JAN-92','DD MON YY'));
insert into v_employees values
  (1002,'Brown',50302,to_date('01-SEP-94','DD MON YY'));

insert into v_parts values
  (10506,'Land Before Time I',200,19.99,20);
insert into v_parts values
  (10507,'Land Before Time II',156,19.99,20);
insert into v_parts values
  (10508,'Land Before Time III',190,19.99,20); 
insert into v_parts values
  (10509,'Land Before Time IV',60,19.99,20);
insert into v_parts values
  (10601,'Sleeping Beauty',300,24.99,20);
insert into v_parts values
  (10701,'When Harry Met Sally',120,19.99,30);
insert into v_parts values
  (10800,'Dirty Harry',140,14.99,30);
insert into v_parts values
  (10900,'Dr. Zhivago',100,24.99,30);

insert into v_customers values
  (1111,'Charles','123 Main St.',67226,'316-636-5555');
insert into v_customers values
  (2222,'Bertram','237 Ash Avenue',67226,'316-689-5555');
insert into v_customers values
  (3333,'Barbara','111 Inwood St.',60606,'316-111-1234');

insert into v_orders values
  (v_orderseq.nextval,1111,1000,to_date('10-DEC-94','DD MON YY'),to_date('12-DEC-94','DD MON YY'),0);
insert into v_orders values
  (v_orderseq.nextval,1111,1000,to_date('12-JAN-95','DD MON YY'),to_date('15-JAN-95','DD MON YY'),0);
insert into v_orders values
  (v_orderseq.nextval,2222,1001,to_date('13-FEB-95','DD MON YY'),to_date('20-FEB-95','DD MON YY'),0);
insert into v_orders values
  (v_orderseq.nextval,3333,1000,to_date('20-JUN-97','DD MON YY'),null,0);

insert into v_odetails values
  (1024,10506,1);
insert into v_odetails values
  (1024,10507,1);
insert into v_odetails values
  (1024,10508,2);
insert into v_odetails values
  (1024,10509,3);
insert into v_odetails values
  (1021,10601,4);
insert into v_odetails values
  (1022,10601,1);
insert into v_odetails values
  (1022,10701,1);
insert into v_odetails values
  (1023,10800,1);
insert into v_odetails values
  (1023,10900,1);


commit;