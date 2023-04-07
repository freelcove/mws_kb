--����� �ڱ� �������� �ڵ� ��� Ʈ����
create or replace trigger change_money_record
before update on users
for each row
DECLARE
money_who varchar2(100);
money_old int;
money_new int;
begin
if :new.user_balance<0 then
dbms_output.put_line('������ �ܾ��� �����մϴ�.');
dbms_output.put_line('�ڰ��� �����ϼ���.');
raise_application_error(-20999,'�ڱ� ���� ! ! !');
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
dbms_output.put_line('�ش� ��ǰ�� ��� �����մϴ�.');
dbms_output.put_line('��� �ֹ��ϼ���.');
raise_application_error(-20999,'��� ���� ! ! !');
else
select corp_name into stock_product_corp_name from corporation where :old.product_own_corp=corp_num;
stock_product_change := :new.product_stock_count - :old.product_stock_count;
insert into backup_movement_stock(stock_who, stock_corp_name, stock_product_code, stock_product_name, stock_product_old, stock_product_new, stock_product_changing, stock_change_date)
values(:old.product_own_corp, stock_product_corp_name, :old.product_code, :old.product_name, :old.product_stock_count, :new.product_stock_count, 
stock_product_change,sysdate);
end if;
end change_stock_record;
/

