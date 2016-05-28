create database finance;

create table transactions(id integer auto_increment primary key, date timestamp default now(), name varchar(50), description varchar(200), type varchar(6), amount float(8,2), repaid float(8,2), status varchar(10));

DELIMITER //
CREATE TRIGGER upd_check BEFORE UPDATE ON transactions
FOR EACH ROW
BEGIN
     IF NEW.repaid <=> OLD.repaid AND NEW.repaid = OLD.amount THEN
         UPDATE transactions SET status = 'Closed'    
     END IF;
END//