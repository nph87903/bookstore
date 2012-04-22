create table book
(
book_id  NUMBER,
title		VARCHAR(100),
author	VARCHAR(100),
price		VARCHAR(100),
ISBN		VARCHAR(100),
category_id		number,
publisher	varchar(100),
year		varchar(10),
imagename		varchar(100),
description		VARCHAR(2000),
primary	key(book_id),
foreign key(category_id) references category(category_id)
)

create table category
（
category_id		number,
category_name	varchar(100),
primary	key(category_id)
）

create table bestseller
(
book_id	NUMBER,
title		VARCHAR(100),
author	VARCHAR(100),
price		VARCHAR(100),
ISBN		VARCHAR(100),
category_id		number,
publisher		varchar(100),
year		varchar(10),
imagename		varchar(100),
description		VARCHAR(2000),
primary key(book_id),
foreign key(book_id) references book(book_id),
foreign key(category_id) references category(category_id)
)

create table recommend
(
book_id          NUMBER,
title        VARCHAR(100),
author	VARCHAR(100),
price        VARCHAR(100),
ISBN		VARCHAR(100),
category_id number,
publisher varchar(100),
year  varchar(10),
imagename varchar(100),
description VARCHAR(2000),
primary key(book_id),
foreign key(book_id) references book(book_id)
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
primary key(book_id),
foreign key(book_id) references book(book_id)
)

create table users
(
username varchar(100),
password varchar(100),
email	varchar(100),
primary key(email)
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

create table basket (
book_id number, 
order_id number,
primary key (book_id,order_id),
foreign key(book_id) references book(book_id),
foreign key(order_id) references orders(order_id)
)

create table orders
(
order_id number AUTO_INCREMENT,
email varchar(100),
dates varchar(100),
items varchar(1000),
address varchar(1000),
primary key(order_id),
foreign key(email) references users(email)
)

create table Coupons (
code varchar(20) primary key,
reward number(5))


create table Params (
support number(4,2) primary key, 
confidence number(4,2),
num_transactions number(4)
)

create table AssociationRules(
itemX varchar(100),
itemY varchar(100),
support number,
confidence number,
primary key(itemX, itemY)
)



