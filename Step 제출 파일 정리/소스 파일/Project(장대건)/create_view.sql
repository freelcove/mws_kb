create view order_possible as select user_id ���̵�,country_name_kr ����,city_name_kr ����, user_name �̸�, restaurant_name �ֹ����ɽĴ�,restaurant_num �Ĵ��ȣ, menu_name �޴�, menu_num �޴���ȣ, menu_price ����
from users u, restaurant r, menu m, country, city
where user_country = restaurant_country
and user_city = restaurant_city
and restaurant_num = menu_restaurant
and user_country = country_code and user_city = city_code
order by user_id;

create view order_impossible as select distinct user_id ���̵�, country_name_kr ����,city_name_kr ����, user_name �̸�,restaurant_name �ֹ��Ұ��ɽĴ�, restaurant_num �Ĵ��ȣ
from users u, restaurant r, menu m, country co, city c
where user_city != restaurant_city
and restaurant_num = menu_restaurant
and user_country = country_code and user_city = city_code
order by user_id;

create view restaurant_menu as select restaurant_num, restaurant_name, menu_num, menu_name
from restaurant, menu
where restaurant_num = menu_restaurant;

create view user_order_info as select user_id ID, order_num �ֹ���ȣ, delivery_num ��޹�ȣ,restaurant_name �ֹ��Ĵ�, delivery_restaurant �Ĵ��ȣ
,menu_name �ֹ��޴�, delivery_menu �޴���ȣ, order_price ����, pay_method �������, delivery_situation �����Ȳ
from users, orders, delivery, payment, restaurant, menu
where user_id = order_user
and order_user = delivery_receiver
and order_user = pay_user
and order_restaurant = restaurant_num
and order_menu = menu_num;

create view current_delivery_info_not_distinct as select user_id ID, order_num �ֹ���ȣ, delivery_num ��޹�ȣ,restaurant_name �ֹ��Ĵ�, delivery_restaurant �Ĵ��ȣ
,menu_name �ֹ��޴�, delivery_menu �޴���ȣ, order_price ����, pay_method �������, delivery_situation �����Ȳ
from users, orders, delivery, payment, restaurant, menu
where user_id = order_user
and order_user = delivery_receiver
and order_restaurant = restaurant_num
and order_menu = delivery_menu
and order_menu = menu_num;

create view current_delivery_info as select distinct * from current_delivery_info_not_distinct;

create view current_order_info as select user_id ID, order_num �ֹ���ȣ, restaurant_name �ֹ��Ĵ�, restaurant_num �Ĵ��ȣ
,menu_name �ֹ��޴�, menu_num �޴���ȣ, order_price ����, order_date �ֹ���¥
from users, orders, restaurant, menu
where user_id = order_user
and order_restaurant = restaurant_num
and order_menu = menu_num;