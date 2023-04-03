create table country
(
country_code varchar2(10) primary key,
country_name_kr varchar2(100) not null
);

create table city
(
city_code varchar2(10) primary key,
city_name_kr varchar2(100) not null,
city_country_code varchar2(10) references country(country_code)
);

create table users
(
user_id varchar2(100) primary key,
user_email varchar2(100) not null unique,
user_balance number(38,2) default 0,
user_country varchar2(10) references country(country_code),
user_city varchar2(10) references city(city_code),   
user_street varchar2(100), 
user_registDate date,
user_birthDate date,
user_name varchar2(100) not null
);