create table car_2 (
	car_uuid uuid PRIMARY KEY NOT NULL,
	make VARCHAR(100) NOT NULL,
	model VARCHAR(100) NOT NULL,
	price NUMERIC(19, 2) NOT NULL CHECK (price > 0)
);

create table person_car_2 (
	person_uuid uuid primary key not null,
	first_name VARCHAR(50) not null,
	last_name VARCHAR(50) not null, 
	email VARCHAR(100),
	gender VARCHAR(7) not null,
	date_of_birth timestamp not null,
	country_of_birth VARCHAR(50) not null,
	car_uuid uuid references car_2 (car_uuid),
	unique (car_uuid), 
	unique (email)
);

insert into car_2 (car_uuid, make, model, price) 
values (uuid_generate_v4(), 'Ford', 'Edge', '46656.78');
insert into car_2 (car_uuid, make, model, price) 
values (uuid_generate_v4(), 'Nissan', 'Altima', '35618.12');

insert into person_car_2 (person_uuid, first_name, last_name, email, gender, date_of_birth, country_of_birth) 
values (uuid_generate_v4(), 'Tory', 'Car_2nall', 'tcar_2nall0@ibm.com', 'Female', '1979-11-20', 'Sweden');
insert into person_car_2 (person_uuid, first_name, last_name, email, gender, date_of_birth, country_of_birth) 
values (uuid_generate_v4(), 'Miran', 'Bracchi', 'mbracchi1@free.fr', 'Female', '1986-12-26', 'Iraq');
insert into person_car_2 (person_uuid, first_name, last_name, email, gender, date_of_birth, country_of_birth) 
values (uuid_generate_v4(), 'Car_2itta', 'Bygrave', 'cbygrave2@shop-pro.jp', 'Female', '1983-05-24', 'Brazil');
insert into person_car_2 (person_uuid, first_name, last_name, email, gender, date_of_birth, country_of_birth) 
values (uuid_generate_v4(), 'Kenon', 'Leah', 'kleah3@ucoz.com', 'Male', '1991-01-28', 'Portugal');
