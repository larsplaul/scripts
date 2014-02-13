-- rev/hau 9/2 2014
-- reorder drop and create statements
-- insert foreign key constraint in orders_tbl
-- correct data values
-- specify date format for this session
-- change decimal point to full stop in insert statements
ALTER session SET nls_date_format        = 'yyyy-mm-dd';
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = '.,';
---------------------------------------------------------
DROP TABLE ORDERS_TBL;
DROP TABLE CUSTOMER_TBL;
DROP TABLE PRODUCTS_TBL;
DROP TABLE EMPLOYEE_PAY_TBL;
DROP TABLE EMPLOYEE_TBL;
CREATE TABLE EMPLOYEE_TBL
  (
    EMP_ID      VARCHAR2(9) NOT NULL,
    LAST_NAME   VARCHAR2(15) NOT NULL,
    FIRST_NAME  VARCHAR2(15) NOT NULL,
    MIDDLE_NAME VARCHAR2(15),
    ADDRESS     VARCHAR2(30) NOT NULL,
    CITY        VARCHAR2(15) NOT NULL,
    STATE       CHAR(2) NOT NULL,
    ZIP         NUMBER(5) NOT NULL,
    PHONE       CHAR(10),
    PAGER       CHAR(10),
    CONSTRAINT E_PK PRIMARY KEY (EMP_ID)
  );
CREATE TABLE EMPLOYEE_PAY_TBL
  (
    EMP_ID          VARCHAR2(9) NOT NULL PRIMARY KEY,
    POSITION        VARCHAR2(15) NOT NULL,
    DATE_HIRE       DATE,
    PAY_RATE        NUMBER(4,2),
    DATE_LAST_RAISE DATE,
    SALARY          NUMBER(8,2),
    BONUS           NUMBER(6,2),
    CONSTRAINT E_E_FK FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE_TBL (EMP_ID)
  );
CREATE TABLE CUSTOMER_TBL
  (
    CUST_ID      VARCHAR2(10) NOT NULL PRIMARY KEY,
    CUST_NAME    VARCHAR2(30) NOT NULL,
    CUST_ADDRESS VARCHAR2(20) NOT NULL,
    CUST_CITY    VARCHAR2(15) NOT NULL,
    CUST_STATE   CHAR(2) NOT NULL,
    CUST_ZIP     NUMBER(5) NOT NULL,
    CUST_PHONE   NUMBER(10),
    CUST_FAX     NUMBER(10)
  );
CREATE TABLE PRODUCTS_TBL
  (
    PROD_ID   VARCHAR2(10) NOT NULL PRIMARY KEY,
    PROD_DESC VARCHAR2(40) NOT NULL,
    COST      NUMBER(6,2) NOT NULL
  );
CREATE TABLE ORDERS_TBL
  (
    ORD_NUM  VARCHAR2(10) NOT NULL PRIMARY KEY,
    CUST_ID  VARCHAR2(10) NOT NULL,
    PROD_ID  VARCHAR2(10) NOT NULL,
    QTY      NUMBER(6) NOT NULL,
    ORD_DATE DATE,
    CONSTRAINT O_P_FK FOREIGN KEY (prod_id) REFERENCES products_tbl (prod_id),
    CONSTRAINT O_C_FK FOREIGN KEY (cust_id) REFERENCES customer_tbl (cust_id)
  );
INSERT
INTO EMPLOYEE_TBL VALUES
  (
    '311549902',
    'STEPHENS',
    'TINA',
    'DAWN',
    'RR 3 BOX 17A',
    'GREENWOOD',
    'IN',
    '47890',
    '3178784465',
    NULL
  );
INSERT
INTO EMPLOYEE_TBL VALUES
  (
    '442346889',
    'PLEW',
    'LINDA',
    'CAROL',
    '3301 BEACON',
    'INDIANAPOLIS',
    'IN',
    '46224',
    '3172978990',
    NULL
  );
INSERT
INTO EMPLOYEE_TBL VALUES
  (
    '213764555',
    'GLASS',
    'BRANDON',
    'SCOTT',
    '1710 MAIN ST',
    'WHITELAND',
    'IN',
    '47885',
    '3178984321',
    '3175709980'
  );
INSERT
INTO EMPLOYEE_TBL VALUES
  (
    '313782439',
    'GLASS',
    'JACOB',
    NULL,
    '3789 WHITE RIVER BLVD',
    'INDIANAPOLIS',
    'IN',
    '45734',
    '3175457676',
    '8887345678'
  );
INSERT
INTO EMPLOYEE_TBL VALUES
  (
    '220984332',
    'WALLACE',
    'MARIAH',
    NULL,
    '7889 KEYSTONE AVE',
    'INDIANAPOLIS',
    'IN',
    '46741',
    '3173325986',
    NULL
  );
INSERT
INTO EMPLOYEE_TBL VALUES
  (
    '443679012',
    'SPURGEON',
    'TIFFANY',
    NULL,
    '5 GEORGE COURT',
    'INDIANAPOLIS',
    'IN',
    '46234',
    '3175679007',
    NULL
  );
INSERT
INTO EMPLOYEE_PAY_TBL VALUES
  (
    '311549902',
    'MARKETING',
    '1989-05-23',
    NULL,
    '1999-05-01',
    '40000',
    NULL
  );
INSERT
INTO EMPLOYEE_PAY_TBL VALUES
  (
    '442346889',
    'TEAM LEADER',
    '1990-06-17',
    '14.75',
    '1999-06-01',
    NULL,
    NULL
  );
INSERT
INTO EMPLOYEE_PAY_TBL VALUES
  (
    '213764555',
    'SALES MANAGER',
    '1994-08-14',
    NULL,
    '1999-08-01',
    '30000',
    '2000'
  );
INSERT
INTO EMPLOYEE_PAY_TBL VALUES
  (
    '313782439',
    'SALESMAN',
    '1997-06-28',
    NULL,
    NULL,
    '20000',
    '1000'
  );
INSERT
INTO EMPLOYEE_PAY_TBL VALUES
  (
    '220984332',
    'SHIPPER',
    '1996-07-22',
    '11.00',
    '1999-07-01',
    NULL,
    NULL
  );
INSERT
INTO EMPLOYEE_PAY_TBL VALUES
  (
    '443679012',
    'SHIPPER',
    '1991-01-14',
    '15.00',
    '1999-01-01',
    NULL,
    NULL
  );
INSERT
INTO CUSTOMER_TBL VALUES
  (
    '232',
    'LESLIE GLEASON',
    '798 HARDAWAY DR',
    'INDIANAPOLIS',
    'IN',
    '47856',
    '3175457690',
    NULL
  );
INSERT
INTO CUSTOMER_TBL VALUES
  (
    '109',
    'NANCY BUNKER',
    'APT A 4556 WATERWAY',
    'BROAD RIPPLE',
    'IN',
    '47950',
    '3174262323',
    NULL
  );
INSERT
INTO CUSTOMER_TBL VALUES
  (
    '345',
    'ANGELA DOBKO',
    'RR3 BOX 76',
    'LEBANON',
    'IN',
    '49967',
    '7658970090',
    NULL
  );
INSERT
INTO CUSTOMER_TBL VALUES
  (
    '090',
    'WENDY WOLF',
    '3345 GATEWAY DR',
    'INDIANAPOLIS',
    'IN',
    '46224',
    '3172913421',
    NULL
  );
INSERT
INTO CUSTOMER_TBL VALUES
  (
    '12',
    'MARYS GIFT SHOP',
    '435 MAIN ST',
    'DANVILLE',
    'IL',
    '47978',
    '3178567221',
    '3178523434'
  );
INSERT
INTO CUSTOMER_TBL VALUES
  (
    '432',
    'SCOTTYS MARKET',
    'RR2 BOX 173',
    'BROWNSBURG',
    'IN',
    '45687',
    '3178529835',
    '3178529836'
  );
INSERT
INTO CUSTOMER_TBL VALUES
  (
    '333',
    'JASONS AND DALLAS GOODIES',
    'LAFAYETTE SQ MALL',
    'INDIANAPOLIS',
    'IN',
    '46222',
    '3172978886',
    '3172978887'
  );
INSERT
INTO CUSTOMER_TBL VALUES
  (
    '21',
    'MORGANS CANDIES AND TREATS',
    '5657 W TENTH ST',
    'INDIANAPOLIS',
    'IN',
    '46234',
    '3172714398',
    NULL
  );
INSERT
INTO CUSTOMER_TBL VALUES
  (
    '43',
    'SCHYLERS NOVELTIES',
    '17 MAPLE ST',
    'LEBANON',
    'IN',
    '48990',
    '3174346758',
    NULL
  );
INSERT
INTO CUSTOMER_TBL VALUES
  (
    '287',
    'GAVINS PLACE',
    '9880 ROCKVILLE RD',
    'INDIANAPOLIS',
    'IN',
    '46244',
    '3172719991',
    '3172719992'
  );
INSERT
INTO CUSTOMER_TBL VALUES
  (
    '288',
    'HOLLYS GAMEARAMA',
    '567 US 31 SOUTH',
    'WHITELAND',
    'IN',
    '49980',
    '3178879023',
    NULL
  );
INSERT
INTO CUSTOMER_TBL VALUES
  (
    '590',
    'HEATHERS FEATHERS AND THINGS',
    '4090 N SHADELAND AVE',
    'INDIANAPOLIS',
    'IN',
    '43278',
    '3175456768',
    NULL
  );
INSERT
INTO CUSTOMER_TBL VALUES
  (
    '610',
    'REGANS HOBBIES INC',
    '451 GREEN ST',
    'PLAINFIELD',
    'IN',
    '46818',
    '3178393441',
    '3178399090'
  );
INSERT
INTO CUSTOMER_TBL VALUES
  (
    '560',
    'ANDYS CANDIES',
    'RR 1 BOX 34',
    'NASHVILLE',
    'IN',
    '48756',
    '8123239871',
    NULL
  );
INSERT
INTO CUSTOMER_TBL VALUES
  (
    '221',
    'RYANS STUFF',
    '2337 S SHELBY ST',
    'INDIANAPOLIS',
    'IN',
    '47834',
    '3175634402',
    NULL
  );
INSERT INTO PRODUCTS_TBL VALUES
  ('11235', 'WITCHES COSTUME', 29.99
  );
INSERT INTO PRODUCTS_TBL VALUES
  ('222', 'PLASTIC PUMPKIN 18 INCH', 7.75
  );
INSERT INTO PRODUCTS_TBL VALUES
  ('13', 'FALSE PARAFFIN TEETH', 1.10
  );
INSERT INTO PRODUCTS_TBL VALUES
  ('90', 'LIGHTED LANTERNS', 14.50
  );
INSERT INTO PRODUCTS_TBL VALUES
  ('15', 'ASSORTED COSTUMES', 10.00
  );
INSERT INTO PRODUCTS_TBL VALUES
  ('9', 'CANDY CORN', 1.35
  );
INSERT INTO PRODUCTS_TBL VALUES
  ('6', 'PUMPKIN CANDY', 1.45
  );
INSERT INTO PRODUCTS_TBL VALUES
  ('87', 'PLASTIC SPIDERS', 1.05
  );
INSERT INTO PRODUCTS_TBL VALUES
  ('119', 'ASSORTED MASKS', 4.95
  );
INSERT INTO PRODUCTS_TBL VALUES
  ('1234', 'KEY CHAIN', '5.95'
  );
INSERT INTO PRODUCTS_TBL VALUES
  ('2345', 'OAK BOOSHELF', '59.99'
  );
INSERT INTO ORDERS_TBL VALUES
  ('56A901', '232', '11235', '1', '1999-10-22'
  );
INSERT INTO ORDERS_TBL VALUES
  ('56A917', '12', '90', '100', '1999-09-30'
  );
INSERT INTO ORDERS_TBL VALUES
  ('32A132', '43', '222', '25', '1999-10-10'
  );
INSERT INTO ORDERS_TBL VALUES
  ('16C17', '090', '222', '2', '1999-10-17'
  );
INSERT INTO ORDERS_TBL VALUES
  ('18D778', '287', '90', '10', '1999-10-17'
  );
INSERT INTO ORDERS_TBL VALUES
  ('23E934', '432', '13', '20', '1999-10-15'
  );
