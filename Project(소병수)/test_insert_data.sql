--���� ���(ID, EMAIL,BALANCE,COUNTRY,CITY,STREET NUM, REGIST DATE, BIRTH DATE, NAME)
insert into users values('thqudtn','thqudtn@naver.com',3000,'���ѹα�','�뱸','����','2013-01-08','1991-01-09','�Һ���');
insert into users values('qkrwnsgh','qkrwnsgh@naver.com',4000,'���ѹα�','�뱸','����','2010-02-14','1990-03-09','����ȣ');

--��з� ���(NAME)
exec insert_product_group('��Ȱ��ǰ');

--�Һз� ���(MAIN CATEGORY NUM, NAME)
exec insert_product_group_detail(1,'��Ǫ');

--ȸ�� ���(CORP NUM, CORP NAME, OWNER ID, PHON_NUM)
exec insert_corp('123-12-12345','�������','thqudtn','010-1234-1234',1);
exec insert_corp('123-12-12346','��ȣ��Ȱ��ǰ','qkrwnsgh','010-1234-1232',1);

--��ǰ ���( NAME , SUPPLIER NUM , MAIN CATEGORY NUM , SUBDIVISION , PURCHASE PRICE ,
--        SALE PRICE , STOCK , CORP NUM )
exec insert_product('����ƾ ��Ǫ 4.2kg','123-12-12346', 1, 1, 4000, 7000, 50, '123-12-12345');
exec insert_product('����ƾ ��Ǫ 4.2kg','', 1, 1, 4000, 7000, 50, '123-12-12346');

--�Ǹŵ��(PRODUCT CODE, CORP NUM, PRICE)
exec regist_sale(2,'123-12-12345','');

--�� �ֹ����(CUST ID, SALE CODE, AMOUNT, COUNTRY, CITY, STREET)
exec insert_order('qkrwnsgh',1,10,'���ѹα�','�뱸������','����');

--��� �ֹ����(ORDER PRODUCT, STOCK PRODUCT, SUPPLIER, BUYER, AMOUNT, PRICE)
exec order_stock(3,2,'123-12-12346','123-12-12345',10,5000);




select * from users;
select * from corporation;
select * from products;
select * from sale_product;

