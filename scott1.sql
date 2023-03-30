create table users
(
user_id varchar2(100) primary key,
user_email varchar2(100) not null unique,
user_balance number(38,2) default 0,
user_country varchar2(100),
user_city varchar2(100),   -- 시(ex 대구)
user_street varchar2(100), -- 도로명 주소
user_registDate date,
user_birthDate date,
user_name varchar2(100) not null
);

