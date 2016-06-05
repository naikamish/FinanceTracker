create database finance;

create table transactions(id integer auto_increment primary key, 
													date timestamp default now(), 
													name varchar(50), 
													description varchar(200), 
													type varchar(6), 
													amount float(8,2), 
													repaid float(8,2) default 0, 
													status varchar(10));

create table users(username varchar(45) NOT NULL, 
								   password varchar(45) NOT NULL, 
								   enabled TINYINT NOT NULL DEFAULT 1, 
								   primary key(username));

create table userRoles(userRoleId int not null auto_increment, 
											 username varchar(45) not null, 
											 role varchar(45) not null, 
											 primary key (userRoleId), 
											 unique key uni_username_role (role,username), 
											 key fk_username_idx (username), 
											 constraint fk_username foreign key (username) references users (username));