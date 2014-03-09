---------------------------------------------------------------
-- Mail Order Database; Create Tables Script
-- Chapter 2; Oracle Programming -- A Primer
--            by R. Sunderraman
---------------------------------------------------------------
DROP TABLE zipcodes CASCADE CONSTRAINTS;
DROP TABLE employees CASCADE CONSTRAINTS;
DROP TABLE parts CASCADE CONSTRAINTS;
DROP TABLE customers CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE odetails CASCADE CONSTRAINTS;
DROP TABLE director CASCADE CONSTRAINTS;
DROP TABLE directedby CASCADE CONSTRAINTS;

CREATE TABLE zipcodes
  ( zip NUMBER(5), city VARCHAR2(30), PRIMARY KEY (zip)
  );

CREATE TABLE employees
  (
    eno   NUMBER(4) NOT NULL PRIMARY KEY,
    ename VARCHAR2(30),
    zip   NUMBER(5) REFERENCES zipcodes,
    hdate DATE
  );

CREATE TABLE parts
  (
    pno   NUMBER(5) NOT NULL PRIMARY KEY,
    pname VARCHAR2(30),
    price NUMBER(6,2) CHECK(price >= 0.0)
  );

CREATE TABLE customers
  (
    cno    NUMBER(5) NOT NULL PRIMARY KEY,
    cname  VARCHAR2(30),
    street VARCHAR2(30),
    zip    NUMBER(5) REFERENCES zipcodes,
    phone  CHAR(12)
  );

CREATE TABLE orders
  (
    ono      NUMBER(5) NOT NULL PRIMARY KEY,
    cno      NUMBER(5) REFERENCES customers,
    eno      NUMBER(4) REFERENCES employees,
    received DATE,
    shipped  DATE
  );

CREATE TABLE odetails
  (
    ono NUMBER(5) NOT NULL REFERENCES orders,
    pno NUMBER(5) NOT NULL REFERENCES parts,
    qty INTEGER CHECK(qty > 0),
    PRIMARY KEY (ono,pno)
  );

CREATE TABLE director
  ( id NUMBER(5) PRIMARY KEY, name VARCHAR2(30)
  );

CREATE TABLE directedby
  (
    id  NUMBER(5) REFERENCES director,
    pno NUMBER(5) REFERENCES parts,
    PRIMARY KEY (id,pno)
  );