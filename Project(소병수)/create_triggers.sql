--사용자 자금 변동사항 자동 기록 트리거

create or replace trigger change_money_record
before update on users
for each row
DECLARE
money_who varchar2(100);
money_old int;
money_new int;
begin
if :new.user_balance<0 then
dbms_output.put_line('지갑의 잔액이 부족합니다.');
dbms_output.put_line('자갑을 충전하세요.');
raise_application_error(-20999,'자금 부족 ! ! !');
else
money_old:=:old.user_balance;
money_new:=:new.user_balance;
insert into backup_movement_money(money_who, money_old, money_new, money_change)
values(:old.user_id, :old.user_balance, :new.user_balance, money_new - money_old);
end if;
end change_money_record;
/

create or replace trigger change_stock_record
before update on products
for each row
declare
stock_product_change int;
stock_product_corp_name varchar2(100);
begin
if :new.product_stock_count < 0 then
dbms_output.put_line('해당 제품의 재고가 부족합니다.');
dbms_output.put_line('재고를 주문하세요.');
raise_application_error(-20999,'재고 부족 ! ! !');
else
select corp_name into stock_product_corp_name from corporation where :old.product_own_corp=corp_num;
stock_product_change := :new.product_stock_count - :old.product_stock_count;
insert into backup_movement_stock
values(null, :old.product_own_corp, stock_product_corp_name, :old.product_code, :old.product_name, :old.product_stock_count, :new.product_stock_count, 
stock_product_change,sysdate);
end if;
end change_stock_record;
/

