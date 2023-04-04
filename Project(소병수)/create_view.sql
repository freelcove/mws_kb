--고객별 주문 요약
create view order_statement_by_cust as
select count(customer_orders.cust_order_num) "총 주문 횟수", sum(customer_orders.order_amount) "총 주문 수량", sum(order_amount * sale_price) "총 주문 금액",users.user_name 고객명 from customer_orders
join users on users.user_id=customer_orders.cust_id group by users.user_name;

--고객벽 주문 요약 내용 확인
select * from order_statement_by_cust;

--대분류 별 주문 요약
create view order_statement_by_main_category as
select count(cust_order_num) "총 주문 횟수", sum(order_amount) "총 주문 수량", sum(sale_price * order_amount) "총 주문 금액", prod_group_name "종류"
from customer_orders join product_group on prod_group_num = (select product_group from products where product_code = (select sale_product_code from sale_product where sale_id=sale_code))
group by prod_group_name;

--대분류 별 주문 요약 확인
select * from order_statement_by_main_category;

--주문 전체 세부내역

create or replace view merge_all_cust_order as
select customer_orders.cust_order_num 주문번호,customer_orders.cust_id 고객아이디,users.user_name 고객명, customer_orders.sale_code 판매번호, customer_orders.order_amount 주문수량, customer_orders.sale_price 개당주문가격, total_price(order_amount,customer_orders.sale_price) 총금액, customer_orders.order_date 주문일자,
sale_product.sale_product_code 판매제품코드, products.product_name 제품명,products.product_stock_count 재고수량, products.product_out_price 판매가, products.product_stocked_date 입고일자 ,products.product_group 상위카테고리코드, 
product_group.prod_group_name 상위카테고리명, products.product_group_detail 하위카테고리코드, product_group_detail.prod_group_det_name 하위카테고리명,
customer_orders.corp_num 사업자번호, corporation.corp_name 사업자명, corporation.corp_owner_code 판매자아이디, corporation.corp_owner_name 판매자명,
country_name_kr 배송지국가명, city_name_kr 배송지도시명, delivery_address_street 배송지도로명주소 
from customer_orders 
left join users on customer_orders.cust_id=users.user_id
left join sale_product on customer_orders.sale_code=sale_product.sale_id
left join products on sale_product.sale_product_code = products.product_code
left join product_group on products.product_group=product_group.prod_group_num
left join product_group_detail on products.product_group_detail = product_group_detail.prod_group_det_num
left join corporation on customer_orders.corp_num=corporation.corp_num
left join country on delivery_address_country = country_code
left join city on delivery_address_city = city_code;

--주문 전체 세부내역 뷰 확인
select*from merge_all_cust_order;

--거래처 주문 전체 세부내역
create or replace view merge_all_corp_order as
select corp_order_table.order_num 주문번호, corp_order_table.order_product_id 공급자제품코드, corp_order_table.stocked_product_id 구매자제품코드, products.product_name 제품명,
products.product_group 상위카테고리코드, product_group.prod_group_name 상위카테고리명, products.product_group_detail 하위카테고리코드, product_group_detail.prod_group_det_name 하위카테고리명,
corp_order_table.supplier_id 공급자사업자번호, (select corp_name from corporation where corporation.corp_num= corp_order_table.supplier_id) 공급자사업자명, 
corp_order_table.buyer_id 구매자사업자번호, (select corp_name from corporation where corporation.corp_num = corp_order_table.buyer_id) 구매자사업자명,
corp_order_table.buy_amount 구매수량, corp_order_table.order_price 개별구매가, total_price(corp_order_table.buy_amount,corp_order_table.order_price) 총금액,
corp_order_table.order_date 구매일자
from corp_order_table
left join products on corp_order_table.stocked_product_id = products.product_code
left join product_group on products.product_group=product_group.prod_group_num
left join product_group_detail on products.product_group_detail = product_group_detail.prod_group_det_num
;


select * from merge_all_corp_order;

select * from merge_all_cust_order where 고객아이디 = 'thqudtn';
select * from merge_all_cust_order where 고객아이디 = 'qkrwnsgh';

--재고 관리 뷰 생성
create or replace view stock_management as
select products.product_code 제품코드, product_name 제품명, product_group 상위카테고리, product_group_detail 하위카테고리,
stock_product_old 기존재고수량, stock_product_new 변경후재고수량, stock_product_changing 재고변경량, product_stock_count 현재고량, stock_change_date 변경일자, product_own_corp 사업자번호
from products
left join backup_movement_stock on stock_product_code = product_code
order by product_code;

select * from stock_management;

--제품별 총 판매수량
create or replace view sum_sale_amount_of_product as
select 판매제품코드, sum(주문수량) 총주문수량 from merge_all_cust_order group by 판매제품코드;

select * from sum_sale_amount_of_product;

--판매자별 총 판매수량
create or replace view sum_sale_amount_of_saller as
select 사업자번호, sum(주문수량) 총주문수량 from merge_all_cust_order group by 사업자번호;

select * from sum_sale_amount_of_saller;

--상위 카테고리별 총 판매수량
create or replace view sum_sale_amount_of_group as
select 상위카테고리코드, sum(주문수량) 총주문수량 from merge_all_cust_order group by 상위카테고리코드;

select * from sum_sale_amount_of_group;

--상위 50% 판매제품코드
select 판매제품코드 from merge_all_cust_order group by 판매제품코드 having sum(주문수량)>
(select avg(총주문수량) from sum_sale_amount_of_product);

--상위 50% 판매자사업자번호
select 사업자번호 from merge_all_cust_order group by 사업자번호 having sum(주문수량)>
(select avg(총주문수량) from sum_sale_amount_of_saller);

--하위 50% 판매자사업자번호
select 상위카테고리코드 from merge_all_cust_order group by 상위카테고리코드 having sum(주문수량)<
(select avg(총주문수량) from sum_sale_amount_of_group);
