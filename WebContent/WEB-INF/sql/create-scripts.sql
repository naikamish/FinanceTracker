create database finance;

create table transactions(transactionID integer auto_increment primary key, transactionDate timestamp default now(), name varchar(50), description varchar(200), credDeb varchar(6), amount float(8,2));