--제품 대분류 등록
create or replace procedure insert_product_group
(
input_prod_group_name in varchar2
)
is begin
insert into product_group(prod_group_name) values(input_prod_group_name);
commit;
end insert_product_group;

/
--제품 소분류 등록
create or replace procedure insert_product_group_detail
(

input_prod_higher in int,
input_prod_group_det_name in varchar2
)
is begin
insert into product_group_detail(prod_higher_group_num,prod_group_det_name) values(input_prod_higher,input_prod_group_det_name);
commit;
end insert_product_group_detail;

/
--회사 등록
create or replace procedure insert_corp
(
input_num in char,
input_name in varchar2,
input_owner_code in varchar2,
input_phnum in varchar2,
input_group in NUMBER
)
is 
input_owner varchar2(100);
input_email varchar2(100);
begin
select user_name into input_owner from users where user_id=input_owner_code;
select user_email into input_email from users where user_id=input_owner_code;

insert into corporation values(input_num,input_name,input_owner,
input_owner_code, input_phnum, input_email, input_group);
commit;
end insert_corp;

/
--제품등록
create or replace procedure insert_product
(
input_name varchar2,
input_supplier char default null,
input_group int,
input_group_detail int,
input_in_price int,
input_out_price int,
input_stock int, 
input_own_corp char
)
is 
input_supplier2 char(12);
begin
if input_supplier is null then select corp_num into input_supplier2 from corporation where input_own_corp=corp_num;
else
input_supplier2 := input_supplier;
end if;
insert into products(product_name, product_supplier, product_group, product_group_detail, product_in_price, product_out_price, product_stock_count,product_own_corp)
values(input_name, input_supplier2, input_group, input_group_detail, input_in_price, input_out_price, input_stock, input_own_corp);
commit;
end insert_product;


/
--고객 주문 등록
create or replace procedure insert_order
(
input_cust_id varchar2,
input_sale_code int,
input_order_amount int,
input_address_country varchar2,
input_address_city varchar2,
input_address_street varchar2
)
is
input_sale_price int;
input_corp_num char(12);
begin
select sale_price into input_sale_price from sale_product where input_sale_code=sale_id;
select sale_corp_num into input_corp_num from sale_product where input_sale_code=sale_id;
insert into customer_orders(cust_id,sale_code,sale_price,order_amount,delivery_address_country,delivery_address_city,delivery_address_street,corp_num)
values(input_cust_id,input_sale_code,input_sale_price,input_order_amount,input_address_country,input_address_city,input_address_street,input_corp_num);
--고객 자산 감소
update users set user_balance=user_balance - total_price(input_sale_price,input_order_amount) where input_cust_id=user_id;
--제품 재고수량 감소
update products set product_stock_count = product_stock_count - input_order_amount where products.product_code = (select sale_product_code from sale_product where input_sale_code = sale_id);

--판매자 자산 증가
update users set user_balance = user_balance + total_price(input_sale_price,input_order_amount) where user_id = (select corp_owner_code from corporation where corp_num=input_corp_num);
commit;
end insert_order;

/
select * from products;

--재고 구매
create or replace procedure order_stock(
input_order_product int,
input_stocked_product int,
input_supplier char,
input_buyer char,
input_amount int,
input_price int)
is 
comp_supplier char(12);
comp_buyer char(12);
existing_amount int;
begin
--해당 사업장의 제품코드 비교군 복사
select product_own_corp into comp_supplier from products where input_order_product=product_code;
select product_own_corp into comp_buyer from products where input_stocked_product=product_code;
--해당 사업장의 제품 코드로 입력했는지 확인
if input_supplier = comp_supplier then
    if input_buyer = comp_buyer then
        insert into corp_order_table(order_product_id, stocked_product_id, supplier_id, buyer_id, buy_amount,order_price)
        values(input_order_product, input_stocked_product, input_supplier, input_buyer, input_amount,input_price);
    end if;
end if;
--주문자 기존 재고수량 복사
select product_stock_count into existing_amount from products where product_code = input_stocked_product;
--주문자 자산 감소
update users set user_balance = user_balance - total_price(input_price , input_amount) where user_id = (select corp_owner_code from corporation where input_buyer = corp_num);
--공급자 자산 증가
update users set user_balance = user_balance + total_price(input_price , input_amount) where user_id = (select corp_owner_code from corporation where input_supplier = corp_num);
--주문자 재고수량 증가
update products set product_stock_count = product_stock_count + input_amount where product_code = input_stocked_product;
--주문자 제품 매입가 평균값으로 변경
update products set product_in_price = (total_price(product_in_price , existing_amount) + total_price(input_price , input_amount))/(input_amount + existing_amount) where product_code = input_stocked_product;
--공급자 제품 재고수량 감소
update products set product_stock_count = product_stock_count - input_amount where product_code = input_order_product;
commit;
end order_stock;

/
--판매등록
create or replace procedure regist_sale
(
input_product_code int,
input_corp_num char,
input_sale_price int
)
is 
    v_price int;
    v_corp char(12);
begin
select product_own_corp into v_corp from products where input_product_code = product_code;
if input_corp_num = v_corp
then 

    if input_sale_price is null then select product_out_price into v_price from products where 
    input_product_code = product_code;
    else
    v_price :=input_sale_price;
    end if;
end if;
insert into sale_product(sale_product_code, sale_corp_num, sale_price) 
values(input_product_code, input_corp_num, v_price);
commit;
end regist_sale;

/
--사용자 자금 충전 프로시저
create or replace procedure charge_balance
(
input_user_id varchar2,
input_money int
)
is
current_balance int;
begin
update users set user_balance = user_balance+input_money where user_id=input_user_id;
commit;
end charge_balance;





