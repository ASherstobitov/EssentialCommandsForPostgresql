
-- order by
select * from person order by first_name, last_name asc
select country_of_birth from person order by country_of_birth desc
select country_of_birth from person order by country_of_birth

--distinct
select distinct country_of_birth from person order by country_of_birth
select distinct country_of_birth from person order by country_of_birth desc


-- where  (something or something) and something
select * from person where gender= 'Female'
select * from person where gender='Male' and country_of_birth='Russia'
select * from person where gender='Male' and (country_of_birth='Russia' or country_of_birth='China')
and last_name='Brea' and gender='Male'

select 1 > 2;

-- limit, offset , fetch first number row only
select * from person  limit 10
select * from person offset 995 limit 3
select * from person offset 5 fetch first 2 row only
select * from person offset 5 fetch first row only

--or
select * from person where country_of_birth ='Russia'
or country_of_birth='Poland' or country_of_birth='France'
select * from person where country_of_birth in ('Russia', 'France', 'Italy')
order by country_of_birth desc

--between
select * from person where date_of_birth
between  '2020-05-01' and '2020-05-30'

--like and ilike
select * from person where email like '%google.com%'
select * from person where email like '______@%'
select * from person where country_of_birth like 'R%'
select * from person where country_of_birth ilike 'r%'

--group by
select country_of_birth from person group by country_of_birth
select distinct country_of_birth from person
select country_of_birth, count (*) from person
group by country_of_birth
select country_of_birth, count (*) from person
group by country_of_birth  order by country_of_birth desc

--group by having
select country_of_birth, count (*) from person
group by country_of_birth having count (*) > 30 order by country_of_birth

--max(), min(), avr()
select max(price) from car
select min(price) from car
select round(avg(price)) from car
select make, model, min(price) from car group by make, model
select make, min(price) from car group by make, model
--sum()
select make, sum(price) from car group by make
select model, sum(price) from car group by model
--Basic Arithmetic operators
select 10 + 2;
select 10 - 2;
select 10 * 2;
select 10 / 2;
--select 10 ^ 2 don't work here

-- Arithmetic operation(round)

select id, make, model, price, price * .10 from car
select id, make, model, price, round (price * .10, 2) from car
select id, make, model, price, round (price * .10, 2), round (price - (price * .10),2) from car
--rename column

select id, make, price as original_price, round (price * .10, 2) as ten_percent , round (price - (price * .10),2) as discount_after_10_percent
from car

--fill empty spaces
select coalesce(email, 'Email not provided') from person

select coalesce email from person
--nullif
select 10 / nullif(2, 0);
select coalesce(10 / nullif(0,0), 2);
--timestamps
select now()::date
select now()::time
select now()::timestamp
select now()

--take items with same values
select first_name, count(*) from person group by first_name having count(*) > 2
select first_name, count(*) from person group by first_name
select * from person where first_name ='Jaime'

--constraint values in a column
update person set email='sayl3@latimes.com' where id=2
--alter table person add constraint unique_email_address unique (email)         this don't work in idea
--alter table person drop constraint unique_email_address                        this don't work in idea
-- alter table person add unique (email)
--alter table person drop constraint person_email_key
select email, count(*) from person group by email having count(*) > 1
select email, count(*) from person group by email


--drop primary key
--alter table person drop constraint person_pkey -    don't work in the idea

--add primary key
--alter table person add primary key (id)            don't work in idea

--Adding and subtracting with dates|course
--select now() - interval "10 years"     don't work in intellij


--extract needed information
--select*, extract(day from date_of_birth) as days from person this code          does't work in idea
--age function
select first_name, last_name, gender, country_of_birth, date_of_birth from person
--select first_name, last_name, gender, country_of_birth, date_of_birth,age(now(), date_of_birth) from person       don't work in idea

--Check Constraints
select distinct gender from person
-- alter table person add constraint gender_constraint check (gender='Female' or gender = 'Male')     don't work in idea
--alter table person drop constraint gender_constraint                                                 don't work in idea
 update person set gender='hello' where id=1

-- How to delete records
delete from person where gender='Female' and country_of_birth='Nigeria'
--How to update records
update person set first_name='Ruslan', last_name='Rovnushkin',country_of_birth='Russia' where id=10

--On Conflict () Do nothing
--insert into person (id, first_name, last_name, country_of_birth, gender, date_of_birth)                  don't work in idea
--values (1, 'Andrey', 'Shishkin', 'Russia', 'Male', '1998-11-16') on conflict (id) do nothing

--insert or update

--  insert into person (id, first_name, last_name, country_of_birth, gender, date_of_birth)                 don't work in idea
-- values (10, 'Roman' , 'Dibenko', 'Russia', 'Female', '1992-10-2') on conflict (id) do update set first_name = excluded.first_name,
-- last_name=excluded.last_name, gender=excluded.gender don't work in idea

--references
	car_id bigint references car,
	unique (car_id)

--Update foreign key columns
update person_car set car_id= null where id = 3
update person_car set car_id= 1 where id = 3
select * from person_car where id = 3
--Inner Joins
select * from person_car join car on person_car.car_id = car.id
where car_id > 995
select person_car.first_name, person_car.last_name, car.id, car.make, car.model, car.price from person_car
join car on person_car.car_id = car.id where person_car.id between 10 and 20

--Left Joins
select * from person_car left join car on person_car.car_id = car."id" order by person_car."id"
select * from person_car where car_id is null order by person_car."id"
select * from person_car left join car on car.* is null

--Deleting records with foreign keys

--Exporting Query results to csv
copy(select * from person_car left join car on car.id = person_car.car_id where person_car.id between 1 and 5)
to 'C:\Exports\result.sql'
delimiter ',' csv header;

--   Serial & Sequen
select * from person_car_id_seq
--alter sequence person_car_id_seq restart with 9

--Extensions
select * from pg_available_extensions

--Universally unique identifier UUID
select * from pg_availablr_extansions;
--create extension if not exist "uuid-ossp";            don't work in idea
select uuid_generate_v4()
select uuid_generate_v4()

select * from person_car_2
select * from car_2
--UUID As primary key
update person_car_2 set car_uuid='d63b8719-7b7a-4928-86f4-5db1f0a23afd'
where person_uuid='78178abf-5bea-49e9-bf08-e125b8dfaf13'
select * from person_car_2 join car_2 on car_2.car_2_uuid = person_car_2.car_uuid
--Using replace on in join
select * from person_car_2  join car_2 using (car_uuid)

select * from person_car_2
left join car_2 using  (car_uuid) where car_2.* is null




