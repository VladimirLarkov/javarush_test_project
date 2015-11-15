DROP DATABASE IF EXISTS test; 
CREATE DATABASE test DEFAULT CHARACTER SET `utf8`;
USE test;
CREATE TABLE `User` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `admin` bit(1) NOT NULL DEFAULT TRUE,
  `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

insert into `User` (`name`, `age`, `admin`, `timestamp`) 
values ('Mark Zuckerberg', '33', 1, '2008-01-01 00:00:01');
insert into `User` (`name`, `age`, `admin`, `timestamp`) 
values ('Pavel Durov', '30', 0, '2009-01-01 00:00:01');
insert into `User` (`name`, `age`, `admin`, `timestamp`) 
values ('Mark Mark', '38', 1, '2007-01-01 00:00:01');
insert into `User` (`name`, `age`, `admin`, `timestamp`) 
values ('Pavel Argo', '12', 0, '2000-01-01 00:00:01');
insert into `User` (`name`, `age`, `admin`, `timestamp`) 
values ('Kolo Moisha', '53', 1, '2001-01-01 00:00:01');
insert into `User` (`name`, `age`, `admin`, `timestamp`) 
values ('Vova Putin', '60', 0, '2018-01-01 00:00:01');
insert into `User` (`name`, `age`, `admin`, `timestamp`) 
values ('Bartolomeo', '10', 1, '2011-01-01 00:00:01');
insert into `User` (`name`, `age`, `admin`, `timestamp`) 
values ('Doku Umarov', '49', 0, '1999-01-01 00:00:01');
insert into `User` (`name`, `age`, `admin`, `timestamp`) 
values ('Margo', '36', 1, '2021-01-01 00:00:01');
insert into `User` (`name`, `age`, `admin`, `timestamp`) 
values ('Hare Christmas', '33', 0, '2000-01-01 00:00:01');
insert into `User` (`name`, `age`, `admin`, `timestamp`) 
values ('Roma Trahtenberg', '20', 1, '2008-01-01 00:00:01');
insert into `User` (`name`, `age`, `admin`, `timestamp`) 
values ('Ronaldo', '28', 1, '2034-01-01 00:00:01');
insert into `User` (`name`, `age`, `admin`, `timestamp`) 
values ('Eddie', '43', 1, '2008-01-01 00:00:01');
insert into `User` (`name`, `age`, `admin`, `timestamp`) 
values ('Pablo Escobar', '55', 0, '2009-01-01 00:00:01');
insert into `User` (`name`, `age`, `admin`, `timestamp`) 
values ('Boris Karloff', '63', 1, '2008-01-01 00:00:01');
insert into `User` (`name`, `age`, `admin`, `timestamp`) 
values ('Pinnocio', '8', 0, '2009-01-01 00:00:01');
insert into `User` (`name`, `age`, `admin`, `timestamp`) 
values ('Vlad Tsepesh', '69', 1, '2000-01-01 00:00:01');
insert into `User` (`name`, `age`, `admin`, `timestamp`) 
values ('Pinnochet Augusto', '78', 0, '2009-01-01 00:00:01');






