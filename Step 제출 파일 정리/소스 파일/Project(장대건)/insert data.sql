insert into category values ('001', '한식');
insert into category values ('002', '양식');
insert into category values ('003', '중식');
insert into category values ('004', '카페·디저트');
insert into category values ('005', '패스트푸드');
insert into category values ('006', '분식');

insert into users values ('user001', 'user001@example.com', 500000, '1', '1', '브로드웨이 St.', TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'John Smith');
insert into users values ('user002', 'user002@example.com', 200000, '1', '2', '옥스포트 St.', TO_DATE('2022-02-01', 'YYYY-MM-DD'), TO_DATE('1985-02-15', 'YYYY-MM-DD'), 'Emma Lee');
insert into users values ('user003', 'user003@example.com', 150000, '1', '1', '욘지 St.', TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('1995-07-20', 'YYYY-MM-DD'), 'Alex Wong');
insert into users values ('user004', 'user004@example.com', 10000, '82', '02', '강남구', TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('1992-11-10', 'YYYY-MM-DD'), '이민호');
insert into users values ('user005', 'user005@example.com', 20000, '82', '02', '광진구', TO_DATE('2022-05-01', 'YYYY-MM-DD'), TO_DATE('1990-12-25', 'YYYY-MM-DD'), '박신혜');
insert into users values ('user006', 'user006@example.com', 3000, '82', '02', '서초구', TO_DATE('2022-05-02', 'YYYY-MM-DD'), TO_DATE('1992-08-25', 'YYYY-MM-DD'), '유재석');
insert into users values ('user009', 'user009@example.com', 100000, '82', '042', '유성구', TO_DATE('2022-05-02', 'YYYY-MM-DD'), TO_DATE('1992-08-25', 'YYYY-MM-DD'), '강호동');
insert into users values ('user007', 'user007@example.com', 1003000, '82', '053', '중구', TO_DATE('2022-05-02', 'YYYY-MM-DD'), TO_DATE('1991-04-25', 'YYYY-MM-DD'), '이광수');
insert into users values ('user008', 'user008@example.com', 100000, '82', '051', '해운대구', TO_DATE('2022-05-02', 'YYYY-MM-DD'), TO_DATE('1990-07-12', 'YYYY-MM-DD'), '하하');

insert into country values ('82','한국');
insert into country values ('1','미국');

insert into city values ('02','서울','82');
insert into city values ('042','대전','82');
insert into city values ('053','대구','82');
insert into city values ('051','부산','82');
insert into city values ('1','워싱턴','1');
insert into city values ('2','뉴욕','1');

insert into restaurant VALUES (restaurant_seq.nextval, '001', '한국관', '82', '02', '강남구', 0);
insert into restaurant VALUES (restaurant_seq.nextval, '006', '김밥천국', '82', '053', '중구', 0);
insert into restaurant VALUES (restaurant_seq.nextval, '001', '엄마손식당', '82', '02', '강남구', 0);
insert into restaurant VALUES (restaurant_seq.nextval, '003', '청국장', '82', '051', '해운대구', 0);
insert into restaurant VALUES (restaurant_seq.nextval, '003', '중화요리집', '82', '053', '북구',0);
insert into restaurant VALUES (restaurant_seq.nextval, '002', '프렌치', '82', '042', '유성구', 0);
insert into restaurant VALUES (restaurant_seq.nextval, '005', '맥도날드', '82', '02', '서초구', 0);
insert into restaurant VALUES (restaurant_seq.nextval, '006', '엽떡', '82', '02', '영등포구', 0);

insert into menu values (menu_seq.nextval, '24', '비빔밥', 10000, '채소와 고기가 적당히 섞여 매콤하고 시원한 비빔밥입니다.');
insert into menu values (menu_seq.nextval, '24', '불고기', 15000, '달콤한 소불고기와 고소한 쌈장을 함께 즐길 수 있는 메뉴입니다.');
insert into menu values (menu_seq.nextval, '24', '김치찌개', 8000, '집에서 먹는 김치찌개 맛입니다.');
insert into menu values (menu_seq.nextval, '25', '제육볶음', 10000, '채소와 고기가 적당히 섞여 매콤한 제육볶음입니다.');
insert into menu values (menu_seq.nextval, '25', '라면', 5000, '계곡에서 먹는 라면 맛입니다.');
insert into menu values (menu_seq.nextval, '25', '돈까스', 8000, '연돈급 돈까스 맛입니다.');
insert into menu values (menu_seq.nextval, '26', '엄마손비빔밥', 6000, '엄마가 만든 비빔밥입니다.');
insert into menu values (menu_seq.nextval, '26', '엄마손된장찌개', 6000, '칼칼하게 맛있는 된장찌개입니다.');
insert into menu values (menu_seq.nextval, '26', '엄마손칼국수', 6000, '직접 뽑아낸 면으로 만든 칼국수입니다.');
insert into menu values (menu_seq.nextval, '27', '청국장', 7000, '추억의 맛을 느낄 수 있습니다.');
insert into menu values (menu_seq.nextval, '28', '짜장면', 5000, '달달한 짜장면입니다.');
insert into menu values (menu_seq.nextval, '28', '짬뽕', 5000, '매콤하고 해물이 들어있는 짬뽕입니다.');
insert into menu values (menu_seq.nextval, '28', '군만두', 2000, '먹으면 기절하는 군만두맛입니다.');
insert into menu values (menu_seq.nextval, '28', '마라샹궈', 22000, '먹으면 다시 주문하고싶어지는 마라샹궈입니다.');
insert into menu values (menu_seq.nextval, '29', '마약토스트', 3000, '먹으면 생각나는 마약같은 토스트입니다.');
insert into menu values (menu_seq.nextval, '30', '햄버거', 4000, '패티와 고기와 양배추가 잘 어울리는 햄버거입니다.');
insert into menu values (menu_seq.nextval, '30', '햄버거', 4000, '패티와 고기와 양배추가 잘 어울리는 햄버거입니다.');
insert into menu values (menu_seq.nextval, '41', '떡볶이', 15000, '매운맛이 일품인 떡볶이입니다.');
insert into menu values (menu_seq.nextval, '41', '튀김', 3000, '떡볶이 국물에 찍어먹으면 맛있는 튀김입니다.');