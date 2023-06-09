--MENU 테이블을 위한 SEQ
CREATE SEQUENCE MENU_SEQ 
START WITH 1
INCREMENT BY 1 
MAXVALUE 99999;

--MENU 테이블 입력 프로시저(PK : 'CM' || 현재날짜(YYMMDD) || MENU_SEQ(세자리))
CREATE OR REPLACE PROCEDURE INPUT_MENU
(
CODE IN VARCHAR2,
NAME IN VARCHAR2,
PRICE IN NUMBER
)
IS 
M_ID_PK VARCHAR2(30) := 'CM';
BEGIN 
M_ID_PK := M_ID_PK || TO_CHAR(SYSDATE,'YYMMDD')|| TO_CHAR(LPAD(MENU_SEQ.NEXTVAL,3,0));
    INSERT INTO C_MENU (MENU_ID, MENU_CODE, MENU_NAME, MENU_PRICE)
         VALUES (
                M_ID_PK
              , CODE
              , NAME
              , PRICE);
END INPUT_MENU;
/


--ORDER 테이블을 위한 SEQ
CREATE SEQUENCE ORDER_SEQ 
START WITH 1
INCREMENT BY 1 
MAXVALUE 99999;

--재고관리 SEQ
CREATE SEQUENCE MANAGE_SEQ 
START WITH 1
INCREMENT BY 1 
MAXVALUE 99999;

--재고관리 프로시저(첫 입고시)
CREATE OR REPLACE PROCEDURE STOCK_MANAGER
(
MANU_ID IN VARCHAR2,
UNIT_PRICE IN NUMBER,
ENTER_QUANTITY IN NUMBER,
STOCK IN NUMBER,
INPUT_DATE IN DATE,
EXPIRY_DATE IN DATE
)
IS 
MANAGE_STOCK_PK VARCHAR2(30) := 'MS';
BEGIN 
MANAGE_STOCK_PK := MANAGE_STOCK_PK || TO_CHAR(SYSDATE,'YYYYMMDD')|| TO_CHAR(LPAD(MANAGE_SEQ.NEXTVAL,2,0));
    INSERT INTO C_MANAGE_STOCK 
                ( MANAGE_ID
                , MANAGE_MN_ID
                , MANAGE_UNIT_PRICE
                , MANAGE_ENTER_QUANTITY
                , MANAGE_STOCK
                , MANAGE_INPUT_DATE
                , MANAGE_EXPIRY_DATE )
         VALUES ( MANAGE_STOCK_PK
                , MANU_ID
                , UNIT_PRICE
                , ENTER_QUANTITY
                , STOCK
                , INPUT_DATE
                , EXPIRY_DATE);
END STOCK_MANAGER;
/

--멤버십 테이블 시퀀스
CREATE SEQUENCE MEM_SEQ 
START WITH 1
INCREMENT BY 1 
MAXVALUE 99999;

--멤버십 테이블 쿠폰 등록 프로시저
CREATE OR REPLACE PROCEDURE ADD_COUPON
(
USERID IN VARCHAR2,
COUPONID IN VARCHAR2
)
IS
MEMBER_ID VARCHAR2(30) := 'M';
BEGIN
MEMBER_ID := MEMBER_ID || USERID || TO_CHAR(LPAD(MEM_SEQ.NEXTVAL, 5, 0));

INSERT INTO C_MEMBERSHIP VALUES( MEMBER_ID, USERID, COUPONID);

END ADD_COUPON;
/