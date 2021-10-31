create SEQUENCE member_seq;
create table member(
    member_no int primary key,
    member_id varchar2(20) UNIQUE not null,
    member_pw VARCHAR2(20) not null,
    member_name varchar2(20) not null,
    memeber_birth varchar2(20) not null,
    member_platform varchar2(10) check(member_platform in('kakao','naver','google','facebook')),
    member_addr VARCHAR2(500) not null,
    member_phone VARCHAR2(20) not null,
    member_email VARCHAR2(50) not null,
    member_gender varchar2(2) check(member_gender in ('F','M')),
    member_select int check(member_select in(0,1,2)), --������ 0 ,���� 1 , �л� 2
    member_question varchar2(100) not null,
    member_answer varchar2(100) not null,
    member_del int check(member_del in(0,1)), --������ 0 , Ż�� 1
    member_regdate date not null
);

drop table member; 

select * from member; where member_select = 2;

insert into member
values(member_seq.nextval, 'admin', 'admin1234', '������', '20210420',null,'kh����������','010-0000-0000', 'admin@kh.com', 'F', 0, '�����ڴ�?', '��',0, sysdate );
-------------------------------------------------------------
drop table class_board;
drop SEQUENCE classboard_seq;

delete from class_board where class_no = 162;

select* from class_board; where class_tag = 0 order by class_no desc;
select class_view from class_board order by class_view desc;
select * from class_board where class_tag = 1;



select class_title,class_view,dense_rank() OVER (ORDER BY class_view DESC ) as rk from class_board; 

select * from class_board; order by class_view desc;

select * from class_board where class_title like '%���%';

create SEQUENCE classboard_seq;
create table class_board(
    class_no int primary key,
    class_tag int check(class_tag in(0,1,2,3,4,5)), -- 0:IT , 1:cook , 2:language, 3: stock , 4: art , 5: sports
    class_title varchar2(100) not null,
    class_writer varchar2(20) not null,
    class_content varchar2(4000) not null,
    class_price int not null,
	class_view int,
    class_count int default 0 not null ,
    class_startdate date not null,
    class_lastdate date not null,
    class_eventcheck int check(class_eventcheck in(0,1)),--0:�̺�Ʈ�� �ƴ� 1:�̺�Ʈ������
    class_eventprice int default 0 not null,
    class_eventstartdate date,
    class_eventlastdate date
);

----------------------------------------------------------------

create SEQUENCE myclass_seq;
create table myclass(
    myclass_no int PRIMARY key,
    class_no int not null,
	class_title varchar2(100) not null,
	class_writer varchar2(20) not null,
	class_startdate date not null,
	class_lastdate date not null,
    member_id varchar2(20)
);

----------------------------------------------------------------
drop SEQUENCE media_seq; --안만듬
drop table media;		-- 안만듬

update media set class_title = '�ڹٸ� �ڹ��ڹ�2 �Ӿ��� c#' where class_title = '�ڹٸ� �ڹ��ڹ�2 �Ӿ��� c';
delete from media where media_no = 20;
create SEQUENCE media_seq;
create table media(
    media_no int primary key,
    class_title varchar2(100) not null,
    media_extension varchar2(100) check(media_extension in('photo','video')),
    media_path varchar2(2000) not null
);

select * from media;
------------------- ��������, ������ �Խ���-----------------
drop SEQUENCE board_seq;
drop SEQUENCE boardgroup_seq;
drop table board;


create SEQUENCE board_seq;
create SEQUENCE boardgroup_seq;
create table board(
    board_no int primary key,
    board_group int not null,
    boardgroup_no int not null,
    board_id varchar2(20) not null,
    board_title varchar2(500) not null,
    board_content varchar2(2000) not null,
    board_category int check(board_category in(0,1)), -- 0�� �������� 1�� ������
    board_date date not null
    );

----------------------------------------------------------------

create table webrtc(
	class_title varchar2(100) not null,
	webrtc_link varchar2(1000)
);

    