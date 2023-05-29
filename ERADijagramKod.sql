use master;
drop database if exists instrukcije1;
go
create database instrukcije1 collate Croatian_CI_AS;
go
use instrukcije1;

create table korisnik(
	id int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null,
);

create table instruktor(
	id int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null,
);

create table predmet(
	id int not null primary key identity(1,1),
	naziv varchar(50) not null,
	cijena decimal not null,
);

create table termin(
	id int not null primary key identity(1,1),
	predmet int not null,
	instruktor int not null,
	korisnik int not null,
	datum datetime not null,
	trajanje int not null
);

alter table termin add foreign key (predmet) references predmet(id);
alter table termin add foreign key (korisnik) references korisnik(id);
alter table termin add foreign key (instruktor) references instruktor(id);

insert into korisnik
values 
	('Ime01','Prezime01'),
	('Ime02','Prezime02'),
	('Ime03','Prezime03');

insert into instruktor
values 
	('Ime01','Prezime01'),
	('Ime02','Prezime02'),
	('Ime03','Prezime03');

insert into predmet
values
	('naziv01',1.1),
	('naziv02',1.2),
	('naziv03',1.3);

insert into termin
values
	(1,1,1,'2023-01-01',100),
	(2,2,2,'2023-02-01',200),
	(3,3,3,'2023-02-01',300);

