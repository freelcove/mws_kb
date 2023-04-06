--���� �ֹ� ���
create view order_statement_by_cust as
select count(customer_orders.cust_order_num) "�� �ֹ� Ƚ��", sum(customer_orders.order_amount) "�� �ֹ� ����", sum(order_amount * sale_price) "�� �ֹ� �ݾ�",users.user_name ���� from customer_orders
join users on users.user_id=customer_orders.cust_id group by users.user_name;

--���� �ֹ� ��� ���� Ȯ��
select * from order_statement_by_cust;

--��з� �� �ֹ� ���
create view order_statement_by_main_category as
select count(cust_order_num) "�� �ֹ� Ƚ��", sum(order_amount) "�� �ֹ� ����", sum(sale_price * order_amount) "�� �ֹ� �ݾ�", prod_group_name "����"
from customer_orders join product_group on prod_group_num = (select product_group from products where product_code = (select sale_product_code from sale_product where sale_id=sale_code))
group by prod_group_name;

--��з� �� �ֹ� ��� Ȯ��
select * from order_statement_by_main_category;

--�ֹ� ��ü ���γ���

create or replace view merge_all_cust_order as
select customer_orders.cust_order_num �ֹ���ȣ,customer_orders.cust_id �����̵�,users.user_name ����, customer_orders.sale_code �ǸŹ�ȣ, 
customer_orders.order_amount �ֹ�����, customer_orders.sale_price �����ֹ�����, total_price(order_amount,customer_orders.sale_price) �ѱݾ�, customer_orders.order_date �ֹ�����,
sale_product.sale_product_code �Ǹ���ǰ�ڵ�, products.product_name ��ǰ��,products.product_stock_count ������, products.product_out_price �ǸŰ�, 
products.product_stocked_date �԰����� ,products.product_group ����ī�װ��ڵ�, 
product_group.prod_group_name ����ī�װ���, products.product_group_detail ����ī�װ��ڵ�, product_group_detail.prod_group_det_name ����ī�װ���,
customer_orders.corp_num ����ڹ�ȣ, corporation.corp_name ����ڸ�, corporation.corp_owner_code �Ǹ��ھ��̵�, corporation.corp_owner_name �Ǹ��ڸ�,
country_name_kr �����������, city_name_kr ��������ø�, delivery_address_street ��������θ��ּ� 
from customer_orders 
left join users on customer_orders.cust_id=users.user_id
left join sale_product on customer_orders.sale_code=sale_product.sale_id
left join products on sale_product.sale_product_code = products.product_code
left join product_group on products.product_group=product_group.prod_group_num
left join product_group_detail on products.product_group_detail = product_group_detail.prod_group_det_num
left join corporation on customer_orders.corp_num=corporation.corp_num
left join country on delivery_address_country = country_code
left join city on delivery_address_city = city_code;

--�ֹ� ��ü ���γ��� �� Ȯ��
select*from merge_all_cust_order;

--�ŷ�ó �ֹ� ��ü ���γ���
create or replace view merge_all_corp_order as
select corp_order_table.order_num �ֹ���ȣ, corp_order_table.order_product_id ��������ǰ�ڵ�, corp_order_table.stocked_product_id ��������ǰ�ڵ�, products.product_name ��ǰ��,
products.product_group ����ī�װ��ڵ�, product_group.prod_group_name ����ī�װ���, products.product_group_detail ����ī�װ��ڵ�, product_group_detail.prod_group_det_name ����ī�װ���,
corp_order_table.supplier_id �����ڻ���ڹ�ȣ, (select corp_name from corporation where corporation.corp_num= corp_order_table.supplier_id) �����ڻ���ڸ�, 
corp_order_table.buyer_id �����ڻ���ڹ�ȣ, (select corp_name from corporation where corporation.corp_num = corp_order_table.buyer_id) �����ڻ���ڸ�,
corp_order_table.buy_amount ���ż���, corp_order_table.order_price �������Ű�, total_price(corp_order_table.buy_amount,corp_order_table.order_price) �ѱݾ�,
corp_order_table.order_date ��������
from corp_order_table
left join products on corp_order_table.stocked_product_id = products.product_code
left join product_group on products.product_group=product_group.prod_group_num
left join product_group_detail on products.product_group_detail = product_group_detail.prod_group_det_num
;


select * from merge_all_corp_order;

select * from merge_all_cust_order where �����̵� = 'thqudtn';
select * from merge_all_cust_order where �����̵� = 'qkrwnsgh';

--��� ���� �� ����
create or replace view stock_management as
select products.product_code ��ǰ�ڵ�, product_name ��ǰ��, product_group ����ī�װ�, product_group_detail ����ī�װ�,
stock_product_old ����������, stock_product_new ������������, stock_product_changing ����淮, product_stock_count �����, stock_change_date ��������, product_own_corp ����ڹ�ȣ
from products
left join backup_movement_stock on stock_product_code = product_code
order by product_code;

select * from stock_management;

--��ǰ�� �� �Ǹż���
create or replace view sum_sale_amount_of_product as
select �Ǹ���ǰ�ڵ�, sum(�ֹ�����) ���ֹ����� from merge_all_cust_order group by �Ǹ���ǰ�ڵ�;

select * from sum_sale_amount_of_product;

--�Ǹ��ں� �� �Ǹż���
create or replace view sum_sale_amount_of_saller as
select ����ڹ�ȣ, sum(�ֹ�����) ���ֹ����� from merge_all_cust_order group by ����ڹ�ȣ;

select * from sum_sale_amount_of_saller;

--���� ī�װ��� �� �Ǹż���
create or replace view sum_sale_amount_of_group as
select ����ī�װ��ڵ�, sum(�ֹ�����) ���ֹ����� from merge_all_cust_order group by ����ī�װ��ڵ�;

select * from sum_sale_amount_of_group;

--���� 50% �Ǹ���ǰ�ڵ�
select �Ǹ���ǰ�ڵ� from merge_all_cust_order group by �Ǹ���ǰ�ڵ� having sum(�ֹ�����)>
(select avg(���ֹ�����) from sum_sale_amount_of_product);

--���� 50% �Ǹ��ڻ���ڹ�ȣ
select ����ڹ�ȣ from merge_all_cust_order group by ����ڹ�ȣ having sum(�ֹ�����)>
(select avg(���ֹ�����) from sum_sale_amount_of_saller);

--���� 50% ����ī�װ��ڵ�
select ����ī�װ��ڵ� from merge_all_cust_order group by ����ī�װ��ڵ� having sum(�ֹ�����)<
(select avg(���ֹ�����) from sum_sale_amount_of_group);
