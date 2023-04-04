create sequence product_id;
create sequence p_group_id;
create sequence cust_order_id;
create sequence sale_product_id;
create sequence p_group_det_id;
create sequence corp_order_id;
create sequence movement_money_id;
create sequence stock_movement_id;

create table product_group
(
prod_group_num     int default p_group_id.nextval primary key,
prod_group_name    varchar2(30) not null
);



create table product_group_detail
(
prod_group_det_num  int default p_group_det_id.nextval primary key,
prod_higher_group_num int references product_group(prod_group_num),
prod_group_det_name varchar2(50) not null
);



create table corporation
(
corp_num    char(7) primary key,
corp_name   varchar2(100) not null,
corp_owner_name  varchar2(100),
corp_owner_code varchar2(100) references users(user_id),
corp_phnum  varchar2(13),
corp_email  varchar2(100),
corp_group  int references product_group(prod_group_num)
);



create table products
(
product_code        int default product_id.nextval primary key,
product_name        varchar2(100) not null,
product_supplier    char(12) references corporation(corp_num) not null,
product_group       int references product_group(prod_group_num) not null,
product_group_detail     int references product_group_detail(prod_group_det_num) not null,
product_stocked_date    date default sysdate,
product_in_price    int default 0,
product_out_price   int default 0,
product_stock_count int default 0,
product_own_corp       char(12) references corporation(corp_num)
);


create table sale_product
(
sale_id int default sale_product_id.nextval primary key,
sale_product_code int references products(product_code) not null,
sale_corp_num char(12) references corporation(corp_num) not null,
sale_price int not null

);


create table customer_orders
(
cust_order_num          int default cust_order_id.nextval primary key,
cust_id                 varchar2(100) references users(user_id) not null,
sale_code            int references sale_product(sale_id) not null,
sale_price              int not null,
order_amount            int not null,
order_date              date default sysdate not null,
delivery_address_country varchar2(10) not null references country(country_code),
delivery_address_city   varchar2(10) not null references city(city_code),
delivery_address_street   varchar2(300) not null,
corp_num                char(12) references corporation(corp_num) not null
);


create table corp_order_table
(
order_num int default corp_order_id.nextval primary key,
order_product_id int references products(product_code) not null,
stocked_product_id int references products(product_code) not null,
supplier_id char(12) references corporation(corp_num) not null,
buyer_id char(12) references corporation(corp_num) not null,
buy_amount int default 0,
order_price int default 0,
order_date date default sysdate
);

create table backup_movement_money
(
money_serial_num varchar2(100) default sysdate || movement_money_id.nextval primary key,
money_who varchar2(100) not null references users(user_id),
money_old int,
money_new int default 0,
money_change int default 0,
money_trade_date date default sysdate
);


create table backup_stock_movement
(
stock_serial_num varchar2(100) default sysdate||stock_movement_id.nextval primary key,
stock_who char(12) not null references corporation(corp_num),
stock_corp_name varchar2(100),
stock_product_code int references products(product_code),
stock_product_name varchar2(100),
stock_product_old int,
stock_product_new int,
stock_product_changing int,
stock_change_date date default sysdate
);
drop table backup_stock_movement;

alter table backup_stock_movement modify stock_serial_num default sysdate||stock_movement_id.nextval;
