create database finance;

create table transactions(id integer auto_increment primary key, date timestamp default now(), name varchar(50), description varchar(200), type varchar(6), amount float(8,2), repaid float(8,2), status varchar(10));