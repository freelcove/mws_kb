insert into category values ('001', '�ѽ�');
insert into category values ('002', '���');
insert into category values ('003', '�߽�');
insert into category values ('004', 'ī�䡤����Ʈ');
insert into category values ('005', '�н�ƮǪ��');
insert into category values ('006', '�н�');

insert into users values ('user001', 'user001@example.com', 500000, '1', '1', '��ε���� St.', TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'John Smith');
insert into users values ('user002', 'user002@example.com', 200000, '1', '2', '������Ʈ St.', TO_DATE('2022-02-01', 'YYYY-MM-DD'), TO_DATE('1985-02-15', 'YYYY-MM-DD'), 'Emma Lee');
insert into users values ('user003', 'user003@example.com', 150000, '1', '1', '���� St.', TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('1995-07-20', 'YYYY-MM-DD'), 'Alex Wong');
insert into users values ('user004', 'user004@example.com', 10000, '82', '02', '������', TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('1992-11-10', 'YYYY-MM-DD'), '�̹�ȣ');
insert into users values ('user005', 'user005@example.com', 20000, '82', '02', '������', TO_DATE('2022-05-01', 'YYYY-MM-DD'), TO_DATE('1990-12-25', 'YYYY-MM-DD'), '�ڽ���');
insert into users values ('user006', 'user006@example.com', 3000, '82', '02', '���ʱ�', TO_DATE('2022-05-02', 'YYYY-MM-DD'), TO_DATE('1992-08-25', 'YYYY-MM-DD'), '���缮');
insert into users values ('user009', 'user009@example.com', 100000, '82', '042', '������', TO_DATE('2022-05-02', 'YYYY-MM-DD'), TO_DATE('1992-08-25', 'YYYY-MM-DD'), '��ȣ��');
insert into users values ('user007', 'user007@example.com', 1003000, '82', '053', '�߱�', TO_DATE('2022-05-02', 'YYYY-MM-DD'), TO_DATE('1991-04-25', 'YYYY-MM-DD'), '�̱���');
insert into users values ('user008', 'user008@example.com', 100000, '82', '051', '�ؿ�뱸', TO_DATE('2022-05-02', 'YYYY-MM-DD'), TO_DATE('1990-07-12', 'YYYY-MM-DD'), '����');

insert into country values ('82','�ѱ�');
insert into country values ('1','�̱�');

insert into city values ('02','����','82');
insert into city values ('042','����','82');
insert into city values ('053','�뱸','82');
insert into city values ('051','�λ�','82');
insert into city values ('1','������','1');
insert into city values ('2','����','1');

insert into restaurant VALUES (restaurant_seq.nextval, '001', '�ѱ���', '82', '02', '������', 0);
insert into restaurant VALUES (restaurant_seq.nextval, '006', '���õ��', '82', '053', '�߱�', 0);
insert into restaurant VALUES (restaurant_seq.nextval, '001', '�����սĴ�', '82', '02', '������', 0);
insert into restaurant VALUES (restaurant_seq.nextval, '003', 'û����', '82', '051', '�ؿ�뱸', 0);
insert into restaurant VALUES (restaurant_seq.nextval, '003', '��ȭ�丮��', '82', '053', '�ϱ�',0);
insert into restaurant VALUES (restaurant_seq.nextval, '002', '����ġ', '82', '042', '������', 0);
insert into restaurant VALUES (restaurant_seq.nextval, '005', '�Ƶ�����', '82', '02', '���ʱ�', 0);
insert into restaurant VALUES (restaurant_seq.nextval, '006', '����', '82', '02', '��������', 0);

insert into menu values (menu_seq.nextval, '24', '�����', 10000, 'ä�ҿ� ��Ⱑ ������ ���� �����ϰ� �ÿ��� ������Դϴ�.');
insert into menu values (menu_seq.nextval, '24', '�Ұ��', 15000, '������ �ҺҰ��� ����� ������ �Բ� ��� �� �ִ� �޴��Դϴ�.');
insert into menu values (menu_seq.nextval, '24', '��ġ�', 8000, '������ �Դ� ��ġ� ���Դϴ�.');
insert into menu values (menu_seq.nextval, '25', '��������', 10000, 'ä�ҿ� ��Ⱑ ������ ���� ������ ���������Դϴ�.');
insert into menu values (menu_seq.nextval, '25', '���', 5000, '���� �Դ� ��� ���Դϴ�.');
insert into menu values (menu_seq.nextval, '25', '���', 8000, '������ ��� ���Դϴ�.');
insert into menu values (menu_seq.nextval, '26', '�����պ����', 6000, '������ ���� ������Դϴ�.');
insert into menu values (menu_seq.nextval, '26', '�����յ����', 6000, 'ĮĮ�ϰ� ���ִ� ������Դϴ�.');
insert into menu values (menu_seq.nextval, '26', '������Į����', 6000, '���� �̾Ƴ� ������ ���� Į�����Դϴ�.');
insert into menu values (menu_seq.nextval, '27', 'û����', 7000, '�߾��� ���� ���� �� �ֽ��ϴ�.');
insert into menu values (menu_seq.nextval, '28', '¥���', 5000, '�޴��� ¥����Դϴ�.');
insert into menu values (menu_seq.nextval, '28', '«��', 5000, '�����ϰ� �ع��� ����ִ� «���Դϴ�.');
insert into menu values (menu_seq.nextval, '28', '������', 2000, '������ �����ϴ� �����θ��Դϴ�.');
insert into menu values (menu_seq.nextval, '28', '���󼧱�', 22000, '������ �ٽ� �ֹ��ϰ�;����� ���󼧱��Դϴ�.');
insert into menu values (menu_seq.nextval, '29', '�����佺Ʈ', 3000, '������ �������� ���ర�� �佺Ʈ�Դϴ�.');
insert into menu values (menu_seq.nextval, '30', '�ܹ���', 4000, '��Ƽ�� ���� ����߰� �� ��︮�� �ܹ����Դϴ�.');
insert into menu values (menu_seq.nextval, '30', '�ܹ���', 4000, '��Ƽ�� ���� ����߰� �� ��︮�� �ܹ����Դϴ�.');
insert into menu values (menu_seq.nextval, '41', '������', 15000, '�ſ���� ��ǰ�� �������Դϴ�.');
insert into menu values (menu_seq.nextval, '41', 'Ƣ��', 3000, '������ ������ �������� ���ִ� Ƣ���Դϴ�.');