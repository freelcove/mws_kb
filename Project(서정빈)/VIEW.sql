--�� �޴��� ��
CREATE OR REPLACE VIEW CUSTOMER_MENU
                    AS SELECT MENU_NAME, MENU_PRICE
                         FROM C_MENU
                         WHERE NOT (MENU_CODE = 'MAT');

SELECT * FROM CUSTOMER_MENU;

--ȸ��Ȯ�� ��
CREATE OR REPLACE VIEW USER_INFO
             AS SELECT A.MEMBERSHIP_USERID
                     , B.USER_NAME
                     , B.USER_BALANCE
                     , A.MEMBERSHIP_COUPONID
                  FROM C_MEMBERSHIP A
                  JOIN USERS B ON A.MEMBERSHIP_USERID = B.USER_ID;  

--������ ��
CREATE OR REPLACE VIEW RECEIPT
             AS SELECT A.USER_ID 
                     , A.USER_NAME ȸ����
                     , B.ORDER_ID �ֹ���ȣ
                     , D.MENU_NAME �ֹ��޴�
                     , D.MENU_PRICE ����
                     , C.ORDER_STOCK �ֹ�����
                     , D.MENU_PRICE * C.ORDER_STOCK �Ѿ�
                  FROM USERS A 
                  JOIN C_ORDER B ON A.USER_ID = B.ORDER_USERID
                  JOIN C_DETAIL_ORDER C ON B.ORDER_ID = C.ORDER_ID
                  JOIN C_MENU D ON C.ORDER_MENU_ID = D.MENU_ID;

SELECT * FROM RECEIPT;
                            