--유저 등록(ID, EMAIL,BALANCE,COUNTRY,CITY,STREET NUM, REGIST DATE, BIRTH DATE, NAME)
insert into users values('thqudtn','thqudtn@naver.com',3000,'82','053','동구','2013-01-08','1991-01-09','소병수');
insert into users values('qkrwnsgh','qkrwnsgh@naver.com',4000,'82','053','서구','2010-02-14','1990-03-09','박준호');
insert into users values('wkdeorjs','wkderjs@naver.com',8000,'82','053','남구','2019-11-25','1992-05-28','장대건');
insert into users values('dlwlsrhs','dlwlsrhs@naver.com',8000,'82','053','달서구','2012-08-25','1998-07-18','이진곤');
insert into users values('tjwjdqls','tjwjdqls@naver.com',8000,'82','053','북구','2017-12-02','1997-09-13','서정빈');
insert into users values('dlehdwns','dlehdwns@naver.com',100000,'82','053','동구','2023-04-05','1999-09-04','이동준');

--대분류 등록(NAME)
exec insert_product_group('생활용품');
exec insert_product_group('식품');
exec insert_product_group('가구');
exec insert_product_group('잡화');
exec insert_product_group('의류');
exec insert_product_group('의약부외품');
exec insert_product_group('가전제품');

--소분류 등록(MAIN CATEGORY NUM, NAME)
exec insert_product_group_detail(1,'샴푸');
exec insert_product_group_detail(1,'바디워시');
exec insert_product_group_detail(1,'치약');
exec insert_product_group_detail(1,'칫솔');
exec insert_product_group_detail(1,'비누');
exec insert_product_group_detail(1,'컨디셔너');
exec insert_product_group_detail(21,'쌀');
exec insert_product_group_detail(21,'육류');
exec insert_product_group_detail(21,'어패류');
exec insert_product_group_detail(21,'조류');
exec insert_product_group_detail(21,'갑각류');
exec insert_product_group_detail(21,'야채');
exec insert_product_group_detail(22,'책상');
exec insert_product_group_detail(22,'의자');
exec insert_product_group_detail(22,'옷장');
exec insert_product_group_detail(22,'선반');
exec insert_product_group_detail(22,'책장');
exec insert_product_group_detail(22,'침대');
exec insert_product_group_detail(23,'손톱깍기');
exec insert_product_group_detail(23,'화장지');
exec insert_product_group_detail(23,'침대커버');
exec insert_product_group_detail(24,'상의');
exec insert_product_group_detail(24,'하의');
exec insert_product_group_detail(24,'내복');
exec insert_product_group_detail(24,'속옷');
exec insert_product_group_detail(25,'의약품');
exec insert_product_group_detail(25,'안마기기');
exec insert_product_group_detail(24,'영양제');
exec insert_product_group_detail(41,'냉장고');


--회사 등록(CORP NUM, CORP NAME, OWNER ID, PHON_NUM, GROUP)
exec insert_corp('123-12-12345','병수상사','thqudtn','010-1234-1234',1);
exec insert_corp('123-12-12346','준호생활용품','qkrwnsgh','010-1234-1232',1);
exec insert_corp('123-12-12347','진곤의료','dlwlsrhs','010-1234-8282',25);
exec insert_corp('123-12-12348','대건식품','wkdeorjs','010-1234-6868',21);
exec insert_corp('123-12-12349','정빈부띠끄','tjwjdqls','010-1234-7788',24);
exec insert_corp('123-12-12350','동준생활가전','dlehdwns','010-7755-7575',41);

--제품 등록( NAME , SUPPLIER NUM , MAIN CATEGORY NUM , SUBDIVISION , PURCHASE PRICE ,
--        SALE PRICE , STOCK , CORP NUM )
exec insert_product('엘라스틴 샴푸 4.2kg','123-12-12346', 1, 1, 4000, 7000, 50, '123-12-12345');
exec insert_product('엘라스틴 샴푸 4.2kg','', 1, 1, 4000, 7000, 50, '123-12-12346');
exec insert_product('알콜솜','', 25, 45, 350, 600, 5000, '123-12-12347');
exec insert_product('비타민 영양제','', 25, 47, 12000, 18000, 40, '123-12-12347');
exec insert_product('토닥토닥 안마의자','', 25, 46, 1200000, 2000000, 10, '123-12-12347');
exec insert_product('투닥투닥 안마기','', 25, 46, 9000, 15000, 40, '123-12-12347');
exec insert_product('후딱밴드','', 25, 45, 500, 800, 250, '123-12-12347');
exec insert_product('대건햅쌀','', 21, 26, 35000, 50000, 200, '123-12-12348');
exec insert_product('맛간고딩어','', 21, 28, 8000, 12000, 300, '123-12-12348');
exec insert_product('대왕대게','', 21, 30, 80000, 120000, 20, '123-12-12348');
exec insert_product('어건닭다리','', 21, 29, 5000, 9000, 200, '123-12-12348');
exec insert_product('남친룩 체크셔츠','', 24, 41, 35000, 50000, 20, '123-12-12349');
exec insert_product('여친룩 꽃치마','', 24, 42, 40000, 55000, 20, '123-12-12349');
exec insert_product('공대생 체크남방셔츠','', 24, 41, 20000, 30000, 20, '123-12-12349');
exec insert_product('누나가 뺏어입는 사각팬티','', 24, 44, 5000, 7500, 20, '123-12-12349');
exec insert_product('엄마마저 고개돌리는 빨간 내복','', 24, 43, 6000, 8500, 20, '123-12-12349');
exec insert_product('이것만은 컨디셔너','', 1, 25, 12000, 17000, 200, '123-12-12346');
exec insert_product('자연산 메밀국수 때비누','', 1, 23, 7000, 10000, 300, '123-12-12346');
exec insert_product('충치싫어 치약','', 1, 22, 3000, 4500, 250, '123-12-12346');
exec insert_product('철수세미 칫솔','', 1, 23, 5000, 7000, 250, '123-12-12346');
exec insert_product('평생가는 바디워시','', 1, 21, 7000, 11000, 100, '123-12-12346');
exec insert_product('엘사 하우징 냉장고','', 41, 61, 80000, 100000, 100, '123-12-12350');
exec insert_product('엘사 하우징 냉장고','123-12-12350', 41, 61, 90000, 100000, 10, '123-12-12345');


--판매등록(PRODUCT CODE, CORP NUM, PRICE)
exec regist_sale(2,'123-12-12345','');
exec regist_sale(3,'123-12-12346','');
exec regist_sale(21,'123-12-12347','');
exec regist_sale(22,'123-12-12347','');
exec regist_sale(23,'123-12-12347','');
exec regist_sale(24,'123-12-12347','');
exec regist_sale(25,'123-12-12347','');
exec regist_sale(26,'123-12-12348','');
exec regist_sale(27,'123-12-12348','');
exec regist_sale(28,'123-12-12348','');
exec regist_sale(29,'123-12-12348','');
exec regist_sale(30,'123-12-12349','');
exec regist_sale(31,'123-12-12349','');
exec regist_sale(32,'123-12-12349','');
exec regist_sale(33,'123-12-12349','');
exec regist_sale(34,'123-12-12349','');
exec regist_sale(35,'123-12-12346','');
exec regist_sale(36,'123-12-12346','');
exec regist_sale(37,'123-12-12346','');
exec regist_sale(38,'123-12-12346','');
exec regist_sale(39,'123-12-12346','');
exec regist_sale(41,'123-12-12350','');
exec regist_sale(42,'123-12-12345',95000);
--에러발생(PRODUCTS에 등록된 사업자 번호와 다른 사업자 번호로 제품 등록 시도시)
exec regist_sale(41,'123-12-12345',95000);

--고객 주문등록(CUST ID, SALE CODE, AMOUNT, COUNTRY, CITY, STREET)
exec insert_order('qkrwnsgh',1,10,'82','053','동구');
exec insert_order('thqudtn',3,10,'82','053','서구');
exec insert_order('dlwlsrhs',23,1,'82','053','서구');
exec insert_order('tjwjdqls',39,10,'82','053','서구');
exec insert_order('wkdeorjs',25,50,'82','053','서구');
exec insert_order('thqudtn',21,20,'82','053','서구');
exec insert_order('qkrwnsgh',33,10,'82','053','동구');
exec insert_order('dlwlsrhs',1,20,'82','053','서구');
exec insert_order('qkrwnsgh',41,1,'82','053','동구');

--잔액 부족으로 에러 발생할 입력!
exec insert_order('wkdeorjs',23,10,'82','053','동구');
exec insert_order('wkdeorjs',42,1,'82','053','동구');

--재고 부족으로 에러 발생할 입력!
exec insert_order('qkrwnsgh',1,20,'82','053','서구');
exec insert_order('dlehdwns',1,20,'82','053','동구');

--재고 주문등록(ORDER PRODUCT, STOCK PRODUCT, SUPPLIER, BUYER, AMOUNT, PRICE)
exec order_stock(3,2,'123-12-12346','123-12-12345',10,5000);


--사용자 자금 충전(USER ID, CHARGE AMOUNT)
exec charge_balance('qkrwnsgh',30000);
exec charge_balance('wkdeorjs',40000);


update users set users.user_balance=100000;

select * from users;
select * from corporation;
select * from products;
select * from sale_product;

select * from merge_all_cust_order order by 주문번호;



