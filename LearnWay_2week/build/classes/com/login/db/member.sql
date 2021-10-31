drop table member;
drop sequence member_seq;

create SEQUENCE member_seq;
create table member(
    member_no int primary key,
    member_id varchar2(20) unique not null,
    member_pw VARCHAR2(20) not null,
    member_name varchar2(20) not null,
    memeber_birth varchar2(20) not null,
    member_platform varchar2(10) check(member_platform in('kakao','naver','google','facebook')),
    member_addr VARCHAR2(500) not null,
    member_phone VARCHAR2(20) not null,
    member_email VARCHAR2(50) not null,
    member_gender varchar2(2) check(member_gender in ('F','M')),
    member_select int check(member_select in(0,1,2)), --관리자 0 ,강사 1 , 학생 2
    member_question varchar2(100) not null,
    member_answer varchar2(100) not null,
    member_del int check(member_del in(0,1)), --가입중 0 , 탈퇴 1
    member_regdate date not null
    );
    
    
   
	
	
select * from member;




insert into member
values(member_seq.nextval,'admin','admin1234','관리자','20210420',null,'kh정보교육원','010-0000-0000',
        'admin@kh.com','F',0,'관리자니?','네',0,sysdate);
        

create SEQUENCE board_seq;
create table board(
    board_no int primary key,
    board_id varchar2(20) not null,
    board_title varchar2(20) not null,
    board_content varchar2(2000) not null,
    board_group int not null,
    board_category int check(board_category in(0,1)),-- 0은 공지사항 1은 고객지원
    board_date date not null
);


create SEQUENCE classboard_seq;
create table class_board(
    class_no int primary key,
    class_tag int check(class_tag in(0,1,2,3,4,5)), -- 0:IT , 1:cook , 2:language, 3: stock , 4: art , 5: sports
    class_title varchar2(100) not null,
    class_writer varchar2(20) REFERENCES member(member_id),
    class_content varchar2(4000) not null,
    class_price int not null,
    class_count int default 0 not null ,
    class_startdate date not null,
    class_lastdate date not null,
    class_eventcheck int check(class_eventcheck in(0,1)),--0:이벤트중 아님 1:이벤트진행중
    class_eventprice int default 0 not null,
    class_eventstartdate date not null,
    class_eventlastdate date not null
);

create SEQUENCE myclass_seq;

create table myclass(
    myclass_no int PRIMARY key,
    class_no int REFERENCES class_board(class_no),
    member_id varchar2(20) REFERENCES member(member_id)
);

create SEQUENCE media_seq;
create table media(
    media_no int primary key,
    class_no int REFERENCES class_board(class_no),
    media_extension varchar2(10) not null,
    media_path varchar2(2000) not null
);


