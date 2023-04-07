create view order_possible as select user_id 아이디,country_name_kr 국가,city_name_kr 도시, user_name 이름, restaurant_name 주문가능식당,restaurant_num 식당번호, menu_name 메뉴, menu_num 메뉴번호, menu_price 가격
from users u, restaurant r, menu m, country, city
where user_country = restaurant_country
and user_city = restaurant_city
and restaurant_num = menu_restaurant
and user_country = country_code and user_city = city_code
order by user_id;

create view order_impossible as select distinct user_id 아이디, country_name_kr 국가,city_name_kr 도시, user_name 이름,restaurant_name 주문불가능식당, restaurant_num 식당번호
from users u, restaurant r, menu m, country co, city c
where user_city != restaurant_city
and restaurant_num = menu_restaurant
and user_country = country_code and user_city = city_code
order by user_id;

create view restaurant_menu as select restaurant_num, restaurant_name, menu_num, menu_name
from restaurant, menu
where restaurant_num = menu_restaurant;

create view user_order_info as select user_id ID, order_num 주문번호, delivery_num 배달번호,restaurant_name 주문식당, delivery_restaurant 식당번호
,menu_name 주문메뉴, delivery_menu 메뉴번호, order_price 가격, pay_method 결제방법, delivery_situation 배달현황
from users, orders, delivery, payment, restaurant, menu
where user_id = order_user
and order_user = delivery_receiver
and order_user = pay_user
and order_restaurant = restaurant_num
and order_menu = menu_num;

create view current_delivery_info_not_distinct as select user_id ID, order_num 주문번호, delivery_num 배달번호,restaurant_name 주문식당, delivery_restaurant 식당번호
,menu_name 주문메뉴, delivery_menu 메뉴번호, order_price 가격, pay_method 결제방법, delivery_situation 배달현황
from users, orders, delivery, payment, restaurant, menu
where user_id = order_user
and order_user = delivery_receiver
and order_restaurant = restaurant_num
and order_menu = delivery_menu
and order_menu = menu_num;

create view current_delivery_info as select distinct * from current_delivery_info_not_distinct;

create view current_order_info as select user_id ID, order_num 주문번호, restaurant_name 주문식당, restaurant_num 식당번호
,menu_name 주문메뉴, menu_num 메뉴번호, order_price 가격, order_date 주문날짜
from users, orders, restaurant, menu
where user_id = order_user
and order_restaurant = restaurant_num
and order_menu = menu_num;