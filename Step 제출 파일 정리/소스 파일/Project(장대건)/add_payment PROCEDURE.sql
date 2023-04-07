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
    -- orders ���̺��� �ش� �ֹ� ��ȣ(p_order_num)�� ���� �����͸� ��ȸ
    SELECT order_user, order_restaurant, order_menu, order_price
    INTO v_user_id, v_restaurant_num, v_menu_num, v_order_price
    FROM orders
    WHERE order_num = p_order_num;
    
    -- payment table�� ������ �߰�
    INSERT INTO payment(pay_num, pay_user, pay_restaurant, pay_menu, pay_method, pay_price, pay_date)
    VALUES(p_pay_num, v_user_id, v_restaurant_num, v_menu_num, p_pay_method, v_order_price, SYSDATE);
    
    UPDATE delivery d
    SET d.delivery_situation = '�Ϸ�'
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
        -- �ش� �ֹ���ȣ(p_order_num)�� ���� �����Ͱ� ���� ��� ���� ó���մϴ�.
        DBMS_OUTPUT.PUT_LINE('No data found for order_num ' || p_order_num);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END add_payment;
/
select * from orders;
select * from delivery;
select * from payment;
execute add_payment('001','PAY001','ī��');