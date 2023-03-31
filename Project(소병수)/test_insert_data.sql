--유저 등록(ID, EMAIL,BALANCE,COUNTRY,CITY,STREET NUM, REGIST DATE, BIRTH DATE, NAME)
insert into users values('thqudtn','thqudtn@naver.com',3000,'대한민국','대구','동구','2013-01-08','1991-01-09','소병수');
insert into users values('qkrwnsgh','qkrwnsgh@naver.com',4000,'대한민국','대구','서구','2010-02-14','1990-03-09','박준호');

--대분류 등록(NAME)
exec insert_product_group('생활용품');

--소분류 등록(MAIN CATEGORY NUM, NAME)
exec insert_product_group_detail(1,'샴푸');

--회사 등록(CORP NUM, CORP NAME, OWNER ID, PHON_NUM)
exec insert_corp('123-12-12345','병수상사','thqudtn','010-1234-1234',1);
exec insert_corp('123-12-12346','준호생활용품','qkrwnsgh','010-1234-1232',1);

--제품 등록( NAME , SUPPLIER NUM , MAIN CATEGORY NUM , SUBDIVISION , PURCHASE PRICE ,
--        SALE PRICE , STOCK , CORP NUM )
exec insert_product('엘라스틴 샴푸 4.2kg','123-12-12346', 1, 1, 4000, 7000, 50, '123-12-12345');
exec insert_product('엘라스틴 샴푸 4.2kg','', 1, 1, 4000, 7000, 50, '123-12-12346');

--판매등록(PRODUCT CODE, CORP NUM, PRICE)
exec regist_sale(2,'123-12-12345','');

--고객 주문등록(CUST ID, SALE CODE, AMOUNT, COUNTRY, CITY, STREET)
exec insert_order('qkrwnsgh',1,10,'대한민국','대구광역시','동구');

--재고 주문등록(ORDER PRODUCT, STOCK PRODUCT, SUPPLIER, BUYER, AMOUNT, PRICE)
exec order_stock(3,2,'123-12-12346','123-12-12345',10,5000);




select * from users;
select * from corporation;
select * from products;
select * from sale_product;

