SELECT * FROM BOARD;

--DROP SEQUENCE GROUPSEQ;
--CREATE SEQUENCE GROUPSEQ;




--create SEQUENCE board_seq;
--create table board(
--    board_no int primary key,
--    board_id varchar2(20) not null,
--    board_title varchar2(20) not null,
--    board_content varchar2(2000) not null,
---    board_group int not null,
 --   board_category int check(board_category in(0,1)),-- 0은 공지사항 1은 고객지원
--    board_date date not null
--);


--수정
--create SEQUENCE board_seq;
--create SEQUENCE boardgroup_seq;
--create table board(
--    board_no int primary key,
--    board_group int not null,
--    boardgroup_no int not null,
--    board_id varchar2(20) not null,
--    board_title varchar2(20) not null,
--    board_content varchar2(2000) not null,
--    board_category int check(board_category in(0,1)),-- 0은 공지사항 1은 고객지원
--    board_date date not null
--    );



SELECT * FROM BOARD;

SELECT BOARD_NO, BOARD_GROUP, BOARD_TITLE, BOARD_CONTENT, BOARD_DATE
    	FROM BOARD
    	WHERE BOARD_CATEGORY = '1'
    	ORDER BY BOARD_NO DESC;
    	
INSERT INTO BOARD
VALUES(BOARD_SEQ.NEXTVAL, 'admin', '제목1', '내용1', 0, 1, SYSDATE);


    	SELECT *
    	FROM BOARD
    	WHERE BOARD_CATEGORY = '1'
    	ORDER BY BOARD_NO DESC

	INSERT INTO BOARD
		VALUES(BOARD_SEQ.NEXTVAL,
		(SELECT BOARDGROUP_NO FROM BOARD WHERE BOARD_NO=#{board_no}),
		(SELECT BOARD_GROUP+1 FROM BOARD WHERE BOARD_NO=#{board_no})
		,#{board_id},#{board_title},#{board_content},1,SYSDATE)
		
SELECT BOARD_NO FROM BOARD WHERE BOARD_NO=13;
SELECT BOARD_GROUP+1 FROM BOARD WHERE BOARD_NO=13;