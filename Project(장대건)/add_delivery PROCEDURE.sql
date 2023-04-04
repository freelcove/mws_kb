CREATE OR REPLACE PROCEDURE add_delivery (
    p_order_num IN orders.order_num%TYPE,
    p_delivery_num IN delivery.delivery_num%TYPE,
    p_situation IN VARCHAR2
) IS
    v_user_country VARCHAR2(10);
    v_user_city VARCHAR2(10);
    v_user_street VARCHAR2(100);
    v_user_id users.user_id%TYPE;
    v_restaurant_num restaurant.restaurant_num%TYPE;
    v_menu_num menu.menu_num%TYPE;
    v_order_price orders.order_price%TYPE;
BEGIN
    -- orders 테이블에서 해당 주문 번호(p_order_num)에 대한 데이터를 조회
    SELECT order_user, order_restaurant, order_menu, order_price
    INTO v_user_id, v_restaurant_num, v_menu_num, v_order_price
    FROM orders
    WHERE order_num = p_order_num;

    SELECT user_country, user_city, user_street INTO v_user_country, v_user_city, v_user_street
    FROM users
    WHERE user_id = (SELECT order_user FROM orders WHERE order_num=p_order_num);

    -- delivery 테이블에 데이터를 추가
    INSERT INTO delivery(delivery_num, delivery_receiver, delivery_restaurant, delivery_menu, delivery_country, delivery_city, delivery_street, delivery_date, delivery_situation)
    VALUES(p_delivery_num, v_user_id, v_restaurant_num, v_menu_num, v_user_country, v_user_city, v_user_street, SYSDATE, p_situation);

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for order_num ' || p_order_num);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while adding delivery data for order_num ' || p_order_num);
END add_delivery;
/



