--���� ���(ID, EMAIL,BALANCE,COUNTRY,CITY,STREET NUM, REGIST DATE, BIRTH DATE, NAME)
insert into users values('thqudtn','thqudtn@naver.com',3000,'82','053','����','2013-01-08','1991-01-09','�Һ���');
insert into users values('qkrwnsgh','qkrwnsgh@naver.com',4000,'82','053','����','2010-02-14','1990-03-09','����ȣ');
insert into users values('wkdeorjs','wkderjs@naver.com',8000,'82','053','����','2019-11-25','1992-05-28','����');
insert into users values('dlwlsrhs','dlwlsrhs@naver.com',8000,'82','053','�޼���','2012-08-25','1998-07-18','������');
insert into users values('tjwjdqls','tjwjdqls@naver.com',8000,'82','053','�ϱ�','2017-12-02','1997-09-13','������');
insert into users values('dlehdwns','dlehdwns@naver.com',100000,'82','053','����','2023-04-05','1999-09-04','�̵���');

--��з� ���(NAME)
exec insert_product_group('��Ȱ��ǰ');
exec insert_product_group('��ǰ');
exec insert_product_group('����');
exec insert_product_group('��ȭ');
exec insert_product_group('�Ƿ�');
exec insert_product_group('�Ǿ�ο�ǰ');
exec insert_product_group('������ǰ');

--�Һз� ���(MAIN CATEGORY NUM, NAME)
exec insert_product_group_detail(1,'��Ǫ');
exec insert_product_group_detail(1,'�ٵ����');
exec insert_product_group_detail(1,'ġ��');
exec insert_product_group_detail(1,'ĩ��');
exec insert_product_group_detail(1,'��');
exec insert_product_group_detail(1,'����ų�');
exec insert_product_group_detail(21,'��');
exec insert_product_group_detail(21,'����');
exec insert_product_group_detail(21,'���з�');
exec insert_product_group_detail(21,'����');
exec insert_product_group_detail(21,'������');
exec insert_product_group_detail(21,'��ä');
exec insert_product_group_detail(22,'å��');
exec insert_product_group_detail(22,'����');
exec insert_product_group_detail(22,'����');
exec insert_product_group_detail(22,'����');
exec insert_product_group_detail(22,'å��');
exec insert_product_group_detail(22,'ħ��');
exec insert_product_group_detail(23,'������');
exec insert_product_group_detail(23,'ȭ����');
exec insert_product_group_detail(23,'ħ��Ŀ��');
exec insert_product_group_detail(24,'����');
exec insert_product_group_detail(24,'����');
exec insert_product_group_detail(24,'����');
exec insert_product_group_detail(24,'�ӿ�');
exec insert_product_group_detail(25,'�Ǿ�ǰ');
exec insert_product_group_detail(25,'�ȸ����');
exec insert_product_group_detail(24,'������');
exec insert_product_group_detail(41,'�����');


--ȸ�� ���(CORP NUM, CORP NAME, OWNER ID, PHON_NUM, GROUP)
exec insert_corp('123-12-12345','�������','thqudtn','010-1234-1234',1);
exec insert_corp('123-12-12346','��ȣ��Ȱ��ǰ','qkrwnsgh','010-1234-1232',1);
exec insert_corp('123-12-12347','�����Ƿ�','dlwlsrhs','010-1234-8282',25);
exec insert_corp('123-12-12348','��ǽ�ǰ','wkdeorjs','010-1234-6868',21);
exec insert_corp('123-12-12349','����ζ��','tjwjdqls','010-1234-7788',24);
exec insert_corp('123-12-12350','���ػ�Ȱ����','dlehdwns','010-7755-7575',41);

--��ǰ ���( NAME , SUPPLIER NUM , MAIN CATEGORY NUM , SUBDIVISION , PURCHASE PRICE ,
--        SALE PRICE , STOCK , CORP NUM )
exec insert_product('����ƾ ��Ǫ 4.2kg','123-12-12346', 1, 1, 4000, 7000, 50, '123-12-12345');
exec insert_product('����ƾ ��Ǫ 4.2kg','', 1, 1, 4000, 7000, 50, '123-12-12346');
exec insert_product('���ݼ�','', 25, 45, 350, 600, 5000, '123-12-12347');
exec insert_product('��Ÿ�� ������','', 25, 47, 12000, 18000, 40, '123-12-12347');
exec insert_product('������ �ȸ�����','', 25, 46, 1200000, 2000000, 10, '123-12-12347');
exec insert_product('�������� �ȸ���','', 25, 46, 9000, 15000, 40, '123-12-12347');
exec insert_product('�ĵ����','', 25, 45, 500, 800, 250, '123-12-12347');
exec insert_product('����ݽ�','', 21, 26, 35000, 50000, 200, '123-12-12348');
exec insert_product('���������','', 21, 28, 8000, 12000, 300, '123-12-12348');
exec insert_product('��մ��','', 21, 30, 80000, 120000, 20, '123-12-12348');
exec insert_product('��Ǵߴٸ�','', 21, 29, 5000, 9000, 200, '123-12-12348');
exec insert_product('��ģ�� üũ����','', 24, 41, 35000, 50000, 20, '123-12-12349');
exec insert_product('��ģ�� ��ġ��','', 24, 42, 40000, 55000, 20, '123-12-12349');
exec insert_product('����� üũ�������','', 24, 41, 20000, 30000, 20, '123-12-12349');
exec insert_product('������ �����Դ� �簢��Ƽ','', 24, 44, 5000, 7500, 20, '123-12-12349');
exec insert_product('�������� �������� ���� ����','', 24, 43, 6000, 8500, 20, '123-12-12349');
exec insert_product('�̰͸��� ����ų�','', 1, 25, 12000, 17000, 200, '123-12-12346');
exec insert_product('�ڿ��� �޹б��� ����','', 1, 23, 7000, 10000, 300, '123-12-12346');
exec insert_product('��ġ�Ⱦ� ġ��','', 1, 22, 3000, 4500, 250, '123-12-12346');
exec insert_product('ö������ ĩ��','', 1, 23, 5000, 7000, 250, '123-12-12346');
exec insert_product('������� �ٵ����','', 1, 21, 7000, 11000, 100, '123-12-12346');
exec insert_product('���� �Ͽ�¡ �����','', 41, 61, 80000, 100000, 100, '123-12-12350');
exec insert_product('���� �Ͽ�¡ �����','123-12-12350', 41, 61, 90000, 100000, 10, '123-12-12345');


--�Ǹŵ��(PRODUCT CODE, CORP NUM, PRICE)
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
--�����߻�(PRODUCTS�� ��ϵ� ����� ��ȣ�� �ٸ� ����� ��ȣ�� ��ǰ ��� �õ���)
exec regist_sale(41,'123-12-12345',95000);

--�� �ֹ����(CUST ID, SALE CODE, AMOUNT, COUNTRY, CITY, STREET)
exec insert_order('qkrwnsgh',1,10,'82','053','����');
exec insert_order('thqudtn',3,10,'82','053','����');
exec insert_order('dlwlsrhs',23,1,'82','053','����');
exec insert_order('tjwjdqls',39,10,'82','053','����');
exec insert_order('wkdeorjs',25,50,'82','053','����');
exec insert_order('thqudtn',21,20,'82','053','����');
exec insert_order('qkrwnsgh',33,10,'82','053','����');
exec insert_order('dlwlsrhs',1,20,'82','053','����');
exec insert_order('qkrwnsgh',41,1,'82','053','����');

--�ܾ� �������� ���� �߻��� �Է�!
exec insert_order('wkdeorjs',23,10,'82','053','����');
exec insert_order('wkdeorjs',42,1,'82','053','����');

--��� �������� ���� �߻��� �Է�!
exec insert_order('qkrwnsgh',1,20,'82','053','����');
exec insert_order('dlehdwns',1,20,'82','053','����');

--��� �ֹ����(ORDER PRODUCT, STOCK PRODUCT, SUPPLIER, BUYER, AMOUNT, PRICE)
exec order_stock(3,2,'123-12-12346','123-12-12345',30,5000);


--����� �ڱ� ����(USER ID, CHARGE AMOUNT)
exec charge_balance('qkrwnsgh',130000);
exec charge_balance('dlehdwns',140000);


update users set users.user_balance=100000;

select * from users;
select * from corporation;
select * from products;
select * from sale_product;

select * from merge_all_cust_order order by �ֹ���ȣ;



