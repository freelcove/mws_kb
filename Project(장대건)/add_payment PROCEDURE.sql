CREATE OR REPLACE PROCEDURE add_payment (
    p_order_num IN orders.order_num%TYPE,
    p_pay_num IN payment.pay_num%TYPE,
    p_pay_method IN payment.pay_method%TYPE
)
IS
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
    
    -- payment table에 데이터 추가
    INSERT INTO payment(pay_num, pay_user, pay_restaurant, pay_menu, pay_method, pay_price, pay_date)
    VALUES(p_pay_num, v_user_id, v_restaurant_num, v_menu_num, p_pay_method, v_order_price, SYSDATE);
    
    UPDATE delivery d
    SET d.delivery_situation = '완료'
    WHERE d.delivery_receiver = v_user_id
    AND d.delivery_restaurant = v_restaurant_num
    AND d.delivery_menu = v_menu_num
    AND EXISTS (
    SELECT 1
    FROM payment p
    WHERE p.pay_user = v_user_id
      AND p.pay_restaurant = v_restaurant_num
      AND p.pay_menu = v_menu_num
      AND p.pay_price = v_order_price
    );

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- 해당 주문번호(p_order_num)에 대한 데이터가 없을 경우 예외 처리합니다.
        DBMS_OUTPUT.PUT_LINE('No data found for order_num ' || p_order_num);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END add_payment;
/
select * from orders;
select * from delivery;
select * from payment;
execute add_payment('001','PAY001','카드');