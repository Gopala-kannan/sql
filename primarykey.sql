create schema lib;

use lib;

create table book(
id int,
title varchar(100)
);

create table author(
id int,
name varchar(100)
);

insert into book(id, title) values (1, "power of life"),(2, "own wish"),(3, "unaspect time");
insert into author(id, name) values (1, "gopal"), (2, "kanna"), (3, "golden go");

alter table book add constraint pk_id primary key(id);

insert into book values(3, "no one"); -- not allowed the duplicate because we using primary key
-- primary key is a set of rules
-- not allow duplicate 
-- if add or insert primary key not use in "null" 
-- one table only one primary key add or used

-- also added primey in another method
-- also use to primary key inside the create table

create table shop(
id int primary key,
items varchar(100)
);
