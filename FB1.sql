use master;
drop database if exists FB;
go
create database FB;
go
use FB;

create table objava(
	sifra int not null primary key identity(1,1),
	naslov varchar(50) not null,
	upis varchar(250) not null,
	osoba int not null,
	ipadresa varchar(20),
	vrijemeizrade datetime not null,
);
create table svidamise(
	sifra int not null primary key identity(1,1),
	vrijemesvidanja datetime not null,
	objava int not null,
	osoba int not null,
);
create table osoba(
	sifra int not null primary key identity(1,1),
	ime varchar(25) not null,
	prezime varchar(25) not null,
	datumrodenja datetime,
	email varchar(50) not null,
	lozinka varchar(60) not null,
	brojtel int,
	slika varchar(100),
	administrator bit not null,
	stanje bit not null,
	aktivan bit not null,
	uniqueid varchar(255),
);
create table komentar(
	sifra int not null primary key identity(1,1),
	vrijemekomentiranja datetime not null,
	opis varchar(250),
	objava int not null,
	osoba int not null,
);
create table svidamise_komentar(
	sifra int not null primary key identity(1,1),
	osoba int not null,
	komentar int not null,
);

alter table objava add foreign key (osoba) references osoba(sifra);
alter table svidamise add foreign key (objava) references objava(sifra);
alter table svidamise add foreign key (osoba) references osoba(sifra);
alter table komentar add foreign key (objava) references objava(sifra);
alter table svidamise_komentar add foreign key (komentar) references komentar(sifra);

insert into osoba
values
('ime01','prezime01','2002-01-01','email01@gmail.com','lozinka01',null,null,'1','1','1',null),
('ime02','prezime02','2002-02-01','email02@gmail.com','lozinka02',null,null,'1','1','1',null),
('ime03','prezime03','2002-03-01','email03@gmail.com','lozinka03',null,null,'1','1','1',null);

select * from osoba;


select * from objava; 
insert into objava
values
('naslov01','upis',4,null,'2002-01-01'),
('naslov01','upis02',5,null,'2002-01-02'),
('naslov01','upis03',6,null,'2002-01-03');

select * from komentar;
insert into komentar
values
('2002-01-01',null,2,4),
('2002-01-02',null,4,5),
('2002-01-03',null,5,6);

insert into svidamise
values
('2002-01-01',null,2,4),
('2002-01-02',null,4,5),
('2002-01-03',null,5,6);

select *from svidamise_komentar;
insert into svidamise_komentar
values
(4,1),
(5,2),
(6,3);

update osoba set
ime='Madona',
prezime='Ruka'
where sifra=4;

update objava set
