CREATE OR REPLACE PROCEDURE add_review (
    p_id IN user_order_info.ID%TYPE,
    p_review_num IN review.review_num%TYPE,
    p_review_detail IN review.review_detail%TYPE,
    p_review_starpoint IN review.review_starpoint%TYPE
)
IS
    v_user_id users.user_id%TYPE;
    v_user_name users.user_name%TYPE;
    v_delivery_restaurant user_order_info.�Ĵ��ȣ%TYPE;
    v_delivery_menu user_order_info.�޴���ȣ%TYPE;
    v_delivery_situation user_order_info.�����Ȳ%TYPE;
BEGIN
    -- users ���̺��� �ش� ���� ���̵�(p_id)�� ���� �����͸� ��ȸ 
    SELECT user_id, user_name INTO v_user_id, v_user_name
    FROM users
    WHERE user_id = p_id;
    
    -- user_order_info ���̺��� �ش� ���� ���̵�(p_id)�� ���� �����͸� ��ȸ
    SELECT �Ĵ��ȣ, �޴���ȣ, �����Ȳ INTO v_delivery_restaurant, v_delivery_menu, v_delivery_situation
    FROM user_order_info
    WHERE ID = p_id;
    
    -- �����Ȳ�� �Ϸ��� ��쿡�� ���� ������ �߰�
    IF v_delivery_situation = '�Ϸ�'
    THEN
    INSERT INTO review (review_num, review_writer, review_restaurant, review_menu, review_detail, review_registdate, review_starpoint)
    VALUES (p_review_num, v_user_id, v_delivery_restaurant, v_delivery_menu, p_review_detail, SYSDATE, p_review_starpoint);
    
    END IF;
END add_review;
/