CREATE OR REPLACE PROCEDURE update_balance_and_sales (
    p_order_num IN orders.order_num%TYPE
)
IS
    v_user_id users.user_id%TYPE;
    v_user_balance users.user_balance%TYPE;
    v_menu_price menu.menu_price%TYPE;
    v_restaurant_num restaurant.restaurant_num%TYPE;
    v_restaurant_sales restaurant.restaurant_sales%TYPE;
BEGIN
    -- 주문 정보 가져오기
    SELECT order_user, order_price, order_restaurant
    INTO v_user_id, v_menu_price, v_restaurant_num
    FROM orders
    WHERE order_num = p_order_num;

    -- 유저 잔액 업데이트
    SELECT user_balance INTO v_user_balance
    FROM users
    WHERE user_id = v_user_id;

    IF v_user_balance >= v_menu_price THEN
        UPDATE users
        SET user_balance = user_balance - v_menu_price
        WHERE user_id = v_user_id;

        -- 음식점 매출 업데이트
        SELECT restaurant_sales INTO v_restaurant_sales
        FROM restaurant
        WHERE restaurant_num = v_restaurant_num;

        UPDATE restaurant
        SET restaurant_sales = restaurant_sales + v_menu_price
        WHERE restaurant_num = v_restaurant_num;

    -- orders 테이블에서 해당 주문 번호(p_order_num)에 대한 데이터를 삭제
    DELETE FROM orders WHERE order_num = p_order_num;
    
        DBMS_OUTPUT.PUT_LINE('User balance and restaurant sales updated successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Cannot update user balance and restaurant sales due to insufficient balance.');
    END IF;
END update_balance_and_sales;
/
select * from orders;
select * from users;
select * from delivery;
select * from payment;
select * from user_order_info;
execute update_balance_and_sales('001');
