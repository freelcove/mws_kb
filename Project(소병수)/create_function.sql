--�Ǹż��� X �ǸŰ��� �Լ�
create or replace function total_price
(
number int,
price int
)
return int
is begin 
if number is not null and price is not null then
return number*price;
else
return 0;
end if;
end total_price;
/
