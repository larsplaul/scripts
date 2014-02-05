--ALTER TABLE account DROP CONSTRAINT fk_branch_account;
--ALTER TABLE loan DROP CONSTRAINT fk_branch_loan;
--ALTER TABLE customer_loan DROP CONSTRAINT fk_customer_cl;
--ALTER TABLE customer_loan DROP CONSTRAINT fk_loan_cl;

DROP TABLE customer_loan;
DROP TABLE customer;
DROP TABLE account;
DROP TABLE loan;
DROP TABLE branch;


CREATE TABLE branch
  (
    branch_name VARCHAR2(15) PRIMARY KEY,
    branch_city VARCHAR2(20) NOT NULL,
    assets      NUMBER DEFAULT 0
  );
CREATE TABLE account
  (
    account_number VARCHAR2(8) PRIMARY KEY,
    branch_name    VARCHAR2(15) NOT NULL,
    balance        NUMBER DEFAULT 0 CHECK (balance >= 0),
    CONSTRAINT fk_branch_account FOREIGN KEY(branch_name) REFERENCES branch(branch_name)
  );
CREATE TABLE customer
  (
    customer_id     NUMBER PRIMARY KEY,
    customer_name   VARCHAR2(30) NOT NULL,
    customer_street VARCHAR2(40) NOT NULL,
    customer_city   VARCHAR2(40)
  );
CREATE TABLE loan
  (
    loan_number VARCHAR2(10) PRIMARY KEY,
    branch_name VARCHAR2(15),
    amount      NUMBER CHECK (amount >= 100),
    --CONSTRAINT fk_branch_loan FOREIGN KEY(branch_name) REFERENCES branch(branch_name) 
    FOREIGN KEY(branch_name) REFERENCES branch(branch_name) 
  );
CREATE TABLE customer_loan
  (
    customer_id NUMBER,
    loan_number VARCHAR2(10),
    PRIMARY KEY (customer_id,loan_number),
    CONSTRAINT fk_customer_cl FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    CONSTRAINT fk_loan_cl FOREIGN KEY (loan_number) REFERENCES loan(loan_number)
  ); 
  
  insert into customer values (100,'Adams','A street','A city');
  insert into customer values (200,'Peter','Another street', 'Another City');
  insert into customer values (300,'Ole','zzz street', 'zzz City');
  insert into branch values('Brighton','Brooklyn',710000);
  insert into account(account_number,branch_name) values('A-101','Brighton');
  insert into loan values('L-11','Brighton',150);
  insert into customer_loan values(100,'L-11');
  insert into customer_loan values(200,'L-11');
  
  select customer_name from customer c
  join customer_loan cl on c.customer_id = cl.CUSTOMER_ID
  join loan l on l.LOAN_NUMBER = cl.LOAN_NUMBER
  where l.loan_number = 'L-11';
  
  
  
  
  