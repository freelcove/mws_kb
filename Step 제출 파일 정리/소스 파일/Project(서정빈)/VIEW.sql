--고객 메뉴판 뷰
CREATE OR REPLACE VIEW CUSTOMER_MENU
                    AS SELECT MENU_NAME, MENU_PRICE
                         FROM C_MENU
                         WHERE NOT (MENU_CODE = 'MAT');

SELECT * FROM CUSTOMER_MENU;

--회원확인 뷰
CREATE OR REPLACE VIEW USER_INFO
             AS SELECT A.MEMBERSHIP_USERID
                     , B.USER_NAME
                     , B.USER_BALANCE
                     , A.MEMBERSHIP_COUPONID
                  FROM C_MEMBERSHIP A
                  JOIN USERS B ON A.MEMBERSHIP_USERID = B.USER_ID;  

--영수증 뷰
CREATE OR REPLACE VIEW RECEIPT
             AS SELECT A.USER_ID 
                     , A.USER_NAME 회원명
                     , B.ORDER_ID 주문번호
                     , D.MENU_NAME 주문메뉴
                     , D.MENU_PRICE 가격
                     , C.ORDER_STOCK 주문수량
                     , D.MENU_PRICE * C.ORDER_STOCK 총액
                  FROM USERS A 
                  JOIN C_ORDER B ON A.USER_ID = B.ORDER_USERID
                  JOIN C_DETAIL_ORDER C ON B.ORDER_ID = C.ORDER_ID
                  JOIN C_MENU D ON C.ORDER_MENU_ID = D.MENU_ID;

SELECT * FROM RECEIPT;
                            