--주문 프로시저
CREATE OR REPLACE PROCEDURE INPUT_ORDER
(
USERID IN VARCHAR2,         -- 회원 ID
MENU IN VARCHAR2,           -- 메뉴명 (한글)
STOCK IN VARCHAR2,          -- 주문 수량
PAYTYPE IN VARCHAR2,        -- 결제 방식
COUPONNUM IN VARCHAR2       -- 쿠폰 번호
)
IS
ORDER_PK VARCHAR2(30) := 'CO';
LIST_PK VARCHAR2(30) := 'CDL';
M_ID VARCHAR2(30) := NULL;
TOTPRICE NUMBER := 0;
COUPON VARCHAR2(30) := NULL;
DCRATE NUMBER := 0;
DCPRICE NUMBER := 0;
CPERIOD DATE;
CPRICE NUMBER := 0;
USER_INFO VARCHAR2(30) := '';

BEGIN

--회원 정보 확인
SELECT USER_ID INTO USER_INFO FROM USERS WHERE USER_ID = USERID;
IF USER_INFO IS NULL THEN 
    DBMS_OUTPUT.PUT_LINE('회원 정보가 없습니다.'); 
    RETURN; 
END IF;

--메뉴테이블과 상세테이블의 PK 생성
ORDER_PK := ORDER_PK || TO_CHAR(SYSDATE, 'YYMMDD') || TO_CHAR(LPAD(ORDER_SEQ.NEXTVAL, 4,0));
LIST_PK := LIST_PK || SUBSTR(ORDER_PK,3);

--한글로 메뉴를 입력받고 MENU_ID를 찾음
SELECT MENU_ID INTO M_ID FROM C_MENU WHERE MENU_NAME = MENU;
IF M_ID IS NULL THEN 
    DBMS_OUTPUT.PUT_LINE('일치하는 메뉴가 없습니다.'); 
    RETURN; 
END IF;

--입력받은 정보를 바탕으로 주문테이블에 주문정보 생성
INSERT INTO C_ORDER(ORDER_ID, ORDER_USERID, ORDER_DATE, ORDER_PAYMENT_TYPE) 
     VALUES ( ORDER_PK
            , USERID
            , TO_DATE(SYSDATE)
            , PAYTYPE );

-- 주문 상세 테이블에 주문 메뉴 정보를 생성
INSERT INTO C_DETAIL_ORDER
     VALUES ( LIST_PK
            , ORDER_PK
            , M_ID
            , STOCK );

--쿠폰 정보 확인
IF COUPONNUM IS NOT NULL THEN
    SELECT A.COUPON_ID 
         , A.COUPON_DC_RATE 
         , A.COUPON_DC_PRICE 
         , A.COUPON_PERIOD 
      INTO COUPON, DCRATE, DCPRICE, CPERIOD 
      FROM C_COUPON A
      JOIN C_MEMBERSHIP B 
        ON B.MEMBERSHIP_COUPONID = A.COUPON_ID
     WHERE B.MEMBERSHIP_USERID = USERID
       AND B.MEMBERSHIP_COUPONID = COUPONNUM;

--쿠폰이 만료되었을 경우     
     IF TO_CHAR(CPERIOD, 'YYYY-MM-DD') < TO_CHAR(SYSDATE, 'YYYY-MM-DD') THEN
     DBMS_OUTPUT.PUT_LINE('만료된 쿠폰입니다. 할인이 적용되지 않습니다.'); 
     END IF;
     
--쿠폰 적용(할인률/할인금액에 따라 나뉘어짐)
    SELECT MENU_PRICE INTO CPRICE 
      FROM C_MENU 
     WHERE MENU_ID = M_ID;  
    
    --할인률 적용
    IF DCRATE != 0 
    THEN CPRICE := CPRICE -((CPRICE/100) * DCRATE);
    END IF;
    --할인금액 적용
    IF DCPRICE != 0
    THEN CPRICE := CPRICE - DCPRICE; 
    END IF;
    
ELSE
    SELECT MENU_PRICE INTO CPRICE 
      FROM C_MENU 
     WHERE MENU_ID = M_ID;  
END IF;

--주문테이블에 할인과 수량이 적용된 합계 금액 추가
TOTPRICE := CPRICE * STOCK;
UPDATE C_ORDER SET ORDER_TOTAL_PRICE = TOTPRICE WHERE ORDER_USERID = USERID AND ORDER_ID = ORDER_PK;  

--회원 잔액에서 결제 금액만큼 차감
UPDATE USERS SET USER_BALANCE = (USER_BALANCE - TOTPRICE) WHERE USER_ID = USERID; 

COMMIT;

--예외처리
EXCEPTION
  WHEN OTHERS THEN 
  DBMS_OUTPUT.PUT_LINE('EXCEPTION OCCURRED! ('||SQLCODE||'):'||SQLERRM);  
  DBMS_OUTPUT.PUT_LINE(SYS.DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  --ROLLBACK;
  
END INPUT_ORDER;