CREATE OR REPLACE PROCEDURE insert_order_food
(
    p_order_num IN orders.order_num%TYPE,
    p_user_id IN users.user_id%TYPE,
    p_restaurant_num IN restaurant.restaurant_num%TYPE,
    p_menu_num IN menu.menu_num%TYPE
)
IS
    v_user_country VARCHAR2(10);
    v_user_city VARCHAR2(10);
    v_restaurant_country VARCHAR2(100);
    v_restaurant_city VARCHAR2(100);
    v_menu_num varchar2(100);
    v_menu_price menu.menu_price%TYPE;
BEGIN
    -- 메뉴의 가격을 조회합니다.
    SELECT menu_num, menu_price INTO v_menu_num, v_menu_price FROM menu WHERE menu_num = p_menu_num;
    
    SELECT user_country, user_city INTO v_user_country, v_user_city
    FROM users
    WHERE user_id = p_user_id;

    -- 식당 정보 가져오기
    SELECT restaurant_country, restaurant_city INTO v_restaurant_country, v_restaurant_city
    FROM restaurant
    WHERE restaurant_num = p_restaurant_num;
    
    -- 나라, 도시가 같은 경우에만 주문 생성
    IF v_user_country = v_restaurant_country AND v_user_city = v_restaurant_city THEN
        INSERT INTO orders (order_num, order_user, order_restaurant, order_menu, order_price, order_date)
        VALUES (p_order_num, p_user_id, p_restaurant_num, v_menu_num, v_menu_price, SYSDATE);
    END IF;
END insert_order_food;
/
select * from order_possible;
select * from order_impossible;
select * from restaurant_menu;
select * from orders;
select * from menu;
drop procedure update_balance_and_sales;

execute insert_order_food('001','user006','24','21');
execute insert_order_food('002','user004','24','22');
execute insert_order_food('003','user006','24','23');
execute insert_order_food('004','user009','29','35');

