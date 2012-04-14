create table book
(
  book_id           NUMBER,
  title        VARCHAR(100),
author	VARCHAR(100),
  price        VARCHAR(100),
ISBN		VARCHAR(100),
category_id number,
publisher varchar(100),
year  varchar(10),
imagename varchar(100),
  description VARCHAR(2000),
 primary key(book_id)
)

create table category
£¨
category_id number,
category_name varchar(100),
primary key(category_id),


£©

create table bestseller
(
  book_id           NUMBER,
  title        VARCHAR(100),
author	VARCHAR(100),
  price        VARCHAR(100),
ISBN		VARCHAR(100),
category_id number,
publisher varchar(100),
year  varchar(10),
imagename varchar(100),
  description VARCHAR(2000),
 primary key(book_id)
)

create table recommend
(
  book_id           NUMBER,
  title        VARCHAR(100),
author	VARCHAR(100),
  price        VARCHAR(100),
ISBN		VARCHAR(100),
category_id number,
publisher varchar(100),
year  varchar(10),
imagename varchar(100),
  description VARCHAR(2000),
 primary key(book_id)
)

create table specialproducts
(
  book_id           NUMBER,
  title        VARCHAR(100),
author	VARCHAR(100),
  price        VARCHAR(100),
specialprice varchar(100),
ISBN		VARCHAR(100),
category_id number,
publisher varchar(100),
year  varchar(10),
imagename varchar(100),
  description VARCHAR(2000),
 primary key(book_id)
)

create table users
(
username varchar(100),
password varchar(100),
email	varchar(100),
primary key(username)
)

create table admin
(
username varchar(100),
password varchar(100),
primary key(username)
)

create table message
(
name varchar(100),
email varchar(100),
phone varchar(100),
company varchar(100),
message varchar(100),
primary key(email)
)


create table orders
(
dates varchar(100),
items varchar(1000),
address varchar(1000),
primary key(dates)
)