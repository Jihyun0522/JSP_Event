drop table users;
drop table attend;
drop table point;

CREATE TABLE USERS 
(
  ID CHAR(8) NOT NULL 
, PASSWD CHAR(8) NOT NULL 
, NAME NCHAR(5) NOT NULL 
, CONSTRAINT USERS_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

CREATE TABLE ATTEND 
(
  ID CHAR(8) NOT NULL 
, ATTEND_DATE DATE NOT NULL 
);

CREATE TABLE POINT 
(
  ID CHAR(8) NOT NULL 
, POINT NUMBER(8) DEFAULT 0 NOT NULL 
);

select * from attend where to_char(attend_date, 'YYYYMMdd') = '20190909' and id = 'ji';
