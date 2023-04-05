--유저 테이블
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

-- 나라 테이블
create table country
(
country_code varchar2(10) primary key,
country_name_kr varchar2(100) not null
);

-- 도시 테이블
create table city
(
city_code varchar2(10) primary key,
city_name_kr varchar2(100) not null,
city_country_code varchar2(10) references country(country_code)
);

--음식점 테이블
create table restaurant
(
restaurant_num varchar2(10) primary key,
restaurant_name varchar2(100),
restaurant_country varchar2(100),
restaurant_city varchar2(100),  
restaurant_street varchar2(100), 
restaurant_sales number(38,2) default 0    
);
alter table restaurant add restaurant_category varchar2(3) references category(category_num);
alter table restaurant modify restaurant_country varchar2(10) references country(country_code);
alter table restaurant modify restaurant_city varchar2(10) references city(city_code);

--음식 카테고리 테이블
create table category
(
category_num varchar2(3) primary key,
category_name varchar2(30) 
);

--메뉴 테이블
create table menu
(
menu_num varchar2(10) primary key,
menu_restaurant varchar2(10) references restaurant(restaurant_num),
menu_name varchar2(100) not null,
menu_price number(38,2) not null,
menu_detail varchar2(100)
);

--주문현황 테이블
create table orders
(
order_num varchar2(10) primary key,
order_user varchar2(100) references users(user_id),
order_restaurant varchar2(10) references restaurant(restaurant_num),
order_menu varchar2(10) references menu(menu_num),
order_price number(38,2) not null,
order_date date
);

--결제정보 테이블
create table payment
(
pay_num varchar2(10) primary key,
pay_user varchar2(100) references users(user_id),
pay_restaurant varchar2(10) references restaurant(restaurant_num),
pay_menu varchar2(10) references menu(menu_num),
pay_method varchar2(20),
pay_price number(38,2) not null,
pay_date date
);

--배달정보 테이블
create table delivery
(
delivery_num varchar2(10) primary key,
delivery_receiver varchar2(100) references users(user_id),
delivery_restaurant varchar2(10) references restaurant(restaurant_num),
delivery_menu varchar2(10) references menu(menu_num),
delivery_country varchar2(100),
delivery_city varchar2(100),   -- 시(ex 대구)
delivery_street varchar2(100), -- 도로명 주소
delivery_date date,
delivery_situation varchar2(10)
);

--리뷰 테이블
create table review
(
review_num varchar2(10) primary key,
review_writer varchar2(100) references users(user_id),
review_restaurant varchar2(10) references restaurant(restaurant_num),
review_menu varchar2(10) references menu(menu_num),
review_detail varchar2(300) not null,
review_registDate date,
review_starpoint number(10,2) not null
);



