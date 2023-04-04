CREATE OR REPLACE PROCEDURE add_review (
    p_id IN user_order_info.ID%TYPE,
    p_review_num IN review.review_num%TYPE,
    p_review_detail IN review.review_detail%TYPE,
    p_review_starpoint IN review.review_starpoint%TYPE
)
IS
    v_user_id users.user_id%TYPE;
    v_user_name users.user_name%TYPE;
    v_delivery_restaurant user_order_info.식당번호%TYPE;
    v_delivery_menu user_order_info.메뉴번호%TYPE;
    v_delivery_situation user_order_info.배달현황%TYPE;
BEGIN
    -- users 테이블에서 해당 유저 아이디(p_id)에 대한 데이터를 조회 
    SELECT user_id, user_name INTO v_user_id, v_user_name
    FROM users
    WHERE user_id = p_id;
    
    -- user_order_info 테이블에서 해당 유저 아이디(p_id)에 대한 데이터를 조회
    SELECT 식당번호, 메뉴번호, 배달현황 INTO v_delivery_restaurant, v_delivery_menu, v_delivery_situation
    FROM user_order_info
    WHERE ID = p_id;
    
    -- 배달현황이 완료일 경우에만 리뷰 데이터 추가
    IF v_delivery_situation = '완료'
    THEN
    INSERT INTO review (review_num, review_writer, review_restaurant, review_menu, review_detail, review_registdate, review_starpoint)
    VALUES (p_review_num, v_user_id, v_delivery_restaurant, v_delivery_menu, p_review_detail, SYSDATE, p_review_starpoint);
    
    END IF;
END add_review;
/