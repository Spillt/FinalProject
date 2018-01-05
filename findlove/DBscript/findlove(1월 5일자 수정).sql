
/* DB 접근 계정 생성 및 권한 설정 */
--CREATE USER final
--IDENTIFIED BY final;
--GRANT CONNECT, RESOURCE TO final;

/*테이블 삭제
DROP TABLE TB_FAQ CASCADE  CONSTRAINTS;
DROP TABLE TB_FREE CASCADE CONSTRAINTS;
DROP TABLE TB_NOTICE CASCADE CONSTRAINTS;
DROP TABLE TB_POLL_ANSWER CASCADE CONSTRAINTS;
DROP TABLE TB_POLL CASCADE CONSTRAINTS;
DROP TABLE TB_REPORT CASCADE CONSTRAINTS;
DROP TABLE TB_KONPEITO_BREAKDOWN CASCADE CONSTRAINTS;
DROP TABLE TB_PAYMENT CASCADE CONSTRAINTS;
DROP TABLE TB_ATTENDANCE CASCADE CONSTRAINTS;
DROP TABLE TB_GRADE CASCADE CONSTRAINTS;
DROP TABLE TB_MESSAGE CASCADE CONSTRAINTS;
DROP SEQUENCE MESSAGE_SEQ;
DROP TABLE TB_MATCHING_ANSWER CASCADE CONSTRAINTS;
DROP TABLE TB_MATCHING_QUESTION CASCADE CONSTRAINTS;
DROP TABLE TB_PROFILE_PICTURE CASCADE CONSTRAINTS;
DROP TABLE TB_PROFILE CASCADE CONSTRAINTS;
DROP TABLE TB_USER CASCADE CONSTRAINTS;
DROP TABLE TB_INQ CASCADE CONSTRAINTS;
DROP TABLE TB_MATCH_USER CASCADE CONSTRAINTS;
DROP TABLE TB_FREE_REPLY CASCADE  CONSTRAINTS;
DROP TABLE TB_SESSION_INFO CASCADE CONSTRAINTS;
DROP TABLE TB_CHAT;
DROP SEQUENCE TB_FREE_SEQ;
DROP SEQUENCE TB_INQ_SEQ;
*/
 -- 자유게시판 시퀀스 테이블

 -- 0. 세션 정보
 CREATE TABLE TB_SESSION_INFO(
      Session_Key VARCHAR2(100),
      User_Id VARCHAR2(30)
      ); 

 -- 1. 사용자 테이블
CREATE TABLE TB_USER (
  User_ID VARCHAR2(30),
  User_PWD VARCHAR2(30) NOT NULL,
  User_NM VARCHAR2(30) NOT NULL,
  User_NickNM VARCHAR2(30) NOT NULL,
  User_ST CHAR(1) DEFAULT '0',
  Email VARCHAR2(30) NOT NULL,
  Phone VARCHAR2(13) NOT NULL,
  Point_CNT NUMBER DEFAULT 0,
  Konpeito_CNT NUMBER DEFAULT 0,
  Rank_GB CHAR(1) DEFAULT 'B',
  Grade_AVG NUMBER DEFAULT 0,
  Enroll_DT DATE DEFAULT SYSDATE,
  Latest_Access_DT DATE DEFAULT SYSDATE,
  Delete_DT DATE,
  
  CONSTRAINT PK_USER PRIMARY KEY (User_ID),
  CONSTRAINT CHK_UST CHECK (User_ST IN ('0', '1', '2', '3', '4')),
  CONSTRAINT CHK_RANK CHECK (Rank_GB IN ('M', 'D', 'P', 'G', 'S', 'B'))
--  ALTER TABLE TB_USER ADD CONSTRAINT UK_USER UNIQUE (User_NickNM);
);
ALTER TABLE TB_USER
ADD CONSTRAINT UK_USER UNIQUE (User_NickNM);

COMMENT ON TABLE TB_USER IS '회원 테이블';
COMMENT ON COLUMN TB_USER.User_ID IS '아이디';
COMMENT ON COLUMN TB_USER.User_PWD IS '비밀번호';
COMMENT ON COLUMN TB_USER.User_NM IS '이름';
COMMENT ON COLUMN TB_USER.User_NickNM IS '닉네임';
COMMENT ON COLUMN TB_USER.User_ST IS '사용자 상태(0:승인대기/1:일반/2:휴면/3:정지/4:삭제대기)';
COMMENT ON COLUMN TB_USER.Email IS '이메일';
COMMENT ON COLUMN TB_USER.Phone IS '휴대폰번호';
COMMENT ON COLUMN TB_USER.Point_CNT IS '포인트 수';
COMMENT ON COLUMN TB_USER.Konpeito_CNT IS '별사탕 수';
COMMENT ON COLUMN TB_USER.Rank_GB IS '관리자 및 등급 구분(관리자(M),일반회원(D:다이아/P:플래티넘/G:골드/S:실버/B:브론즈))';
COMMENT ON COLUMN TB_USER.Grade_AVG IS '평점';
COMMENT ON COLUMN TB_USER.Enroll_DT IS '가입일';
COMMENT ON COLUMN TB_USER.Latest_Access_DT IS '최근 접속일';
COMMENT ON COLUMN TB_USER.Delete_DT IS '삭제일';

-- 2. 사용자(또는 이상형) 프로필
CREATE TABLE TB_PROFILE (
  User_ID VARCHAR2(30),
  Target_GB CHAR(1) DEFAULT '0',
  Gender CHAR(1),
  Age VARCHAR2(100),
  Height VARCHAR2(100),
  Area VARCHAR2(100),
  Bodyform VARCHAR2(100),
  Achievement VARCHAR2(100),
  Job VARCHAR2(100),
  Blood_Type VARCHAR2(5),
  Smoking VARCHAR2(100),
  Drinking VARCHAR2(100),
  Religion VARCHAR2(100),
  Style VARCHAR2(100),
  
  
  CONSTRAINT PK_PROFILE PRIMARY KEY (User_ID, Target_GB),
  CONSTRAINT FK_PROFILE_UID FOREIGN KEY (User_ID) REFERENCES TB_USER ON DELETE CASCADE,
  CONSTRAINT CHK_TARGET CHECK (Target_GB IN ('0', '1'))
);
COMMENT ON TABLE TB_PROFILE IS '회원 프로필 테이블';
COMMENT ON COLUMN TB_PROFILE.User_ID IS '아이디';
COMMENT ON COLUMN TB_PROFILE.Target_GB IS '대상 구분(0:나/1:이상형)';
COMMENT ON COLUMN TB_PROFILE.Gender IS '성별';
COMMENT ON COLUMN TB_PROFILE.Age IS '나이';
COMMENT ON COLUMN TB_PROFILE.Height IS '키';
COMMENT ON COLUMN TB_PROFILE.Bodyform IS '체형';
COMMENT ON COLUMN TB_PROFILE.Area IS '지역';
COMMENT ON COLUMN TB_PROFILE.Achievement IS '학력';
COMMENT ON COLUMN TB_PROFILE.Job IS '직업';
COMMENT ON COLUMN TB_PROFILE.Blood_Type IS '혈액형';
COMMENT ON COLUMN TB_PROFILE.Smoking IS '흡연여부';
COMMENT ON COLUMN TB_PROFILE.Drinking IS '음주여부';
COMMENT ON COLUMN TB_PROFILE.Religion IS '종교';
COMMENT ON COLUMN TB_PROFILE.Style IS '스타일';

-- 3. 프로필 사진 테이블
CREATE TABLE TB_PROFILE_PICTURE (

  Picture_NM VARCHAR2(30),
  User_ID VARCHAR2(30) NOT NULL,
  Thumnail_FL CHAR(1) DEFAULT '0',
  
  CONSTRAINT PK_PP PRIMARY KEY (Picture_NM),
  CONSTRAINT FK_PP_UID FOREIGN KEY (User_ID) REFERENCES TB_USER ON DELETE CASCADE,
  CONSTRAINT CHK_THUMNAIL CHECK (Thumnail_FL IN ('0', '1'))
);
COMMENT ON TABLE TB_PROFILE_PICTURE IS '프로필 사진 테이블';
COMMENT ON COLUMN TB_PROFILE_PICTURE.Picture_NM IS '사진파일명';
COMMENT ON COLUMN TB_PROFILE_PICTURE.User_ID IS '아이디';
COMMENT ON COLUMN TB_PROFILE_PICTURE.Thumnail_FL IS '썸네일 지정 플래그(0/1)';

-- 4. 매칭 질문 테이블
CREATE TABLE TB_MATCHING_QUESTION (
  Question_NO NUMBER,
  Question VARCHAR2(300) NOT NULL,
  Choice1 VARCHAR2(100) NOT NULL,
  Choice2 VARCHAR2(100) NOT NULL,
  Choice3 VARCHAR2(100),
  
  CONSTRAINT PK_MQ PRIMARY KEY (Question_NO)
);
COMMENT ON TABLE TB_MATCHING_QUESTION IS '삼지선다 매칭 질문 테이블';
COMMENT ON COLUMN TB_MATCHING_QUESTION.Question_NO IS '질문번호';
COMMENT ON COLUMN TB_MATCHING_QUESTION.Question IS '질문';
COMMENT ON COLUMN TB_MATCHING_QUESTION.Choice1 IS '보기1';
COMMENT ON COLUMN TB_MATCHING_QUESTION.Choice2 IS '보기2';
COMMENT ON COLUMN TB_MATCHING_QUESTION.Choice3 IS '보기3';

-- 5. 매칭 답변 테이블
CREATE TABLE TB_MATCHING_ANSWER (
  User_ID VARCHAR2(30),
  Question_NO NUMBER,
  Answer CHAR(1) NOT NULL,
  
  CONSTRAINT PK_MA PRIMARY KEY (User_ID, Question_NO),
  CONSTRAINT FK_MA_UID FOREIGN KEY (User_ID) REFERENCES TB_USER,
  CONSTRAINT CHK_ANS CHECK (Answer IN ('1', '2', '3'))
);
COMMENT ON TABLE TB_MATCHING_ANSWER IS '삼지선다 매칭 답변 테이블';
COMMENT ON COLUMN TB_MATCHING_ANSWER.User_ID IS '아이디';
COMMENT ON COLUMN TB_MATCHING_ANSWER.Question_NO IS '질문번호';
COMMENT ON COLUMN TB_MATCHING_ANSWER.Answer IS '답변';

-- 6. 메시지 테이블
CREATE SEQUENCE MESSAGE_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
ORDER;

CREATE TABLE TB_MESSAGE (
  Message_NO NUMBER,
  Sender_ID VARCHAR2(30) NOT NULL,
  Receiver_ID VARCHAR2(30) NOT NULL,
  Message_Content VARCHAR2(300),
  Send_DT DATE DEFAULT SYSDATE,
  Read_FL CHAR(1) DEFAULT '0',
  Accept_ST CHAR(1) DEFAULT '0',
  
  CONSTRAINT PK_MSG PRIMARY KEY (Message_NO),
  CONSTRAINT FK_MSG_SID FOREIGN KEY (Sender_ID) REFERENCES TB_USER ON DELETE SET NULL,
  CONSTRAINT FK_MSG_RID FOREIGN KEY (Receiver_ID) REFERENCES TB_USER ON DELETE SET NULL,
  CONSTRAINT CHK_MSG_FL CHECK (Read_FL IN ('0', '1')),
  CONSTRAINT CHK_MSG_ST CHECK (Accept_ST IN ('0', '1', '2'))
);
COMMENT ON TABLE TB_MESSAGE IS '메세지 테이블';
COMMENT ON COLUMN TB_MESSAGE.Message_NO IS '메세지 번호';
COMMENT ON COLUMN TB_MESSAGE.Sender_ID IS '보내는 아이디';
COMMENT ON COLUMN TB_MESSAGE.Receiver_ID IS '받는 아이디';
COMMENT ON COLUMN TB_MESSAGE.Message_Content IS '내용';
COMMENT ON COLUMN TB_MESSAGE.Send_DT IS '보내는 날짜';
COMMENT ON COLUMN TB_MESSAGE.Read_FL IS '읽음 여부 플래그(0/1)';
COMMENT ON COLUMN TB_MESSAGE.Accept_ST IS '수락 상태(0:대기/1:수락/2: 거절)';

-- 7. 별점 테이블
CREATE TABLE TB_GRADE (
  Sender_ID VARCHAR2(30),
  Receiver_ID VARCHAR2(30),
  Grade NUMBER,
  
  CONSTRAINT PK_GRADE PRIMARY KEY (Sender_ID, Receiver_ID),
  CONSTRAINT FK_GRADE_SID FOREIGN KEY (Sender_ID) REFERENCES TB_USER ON DELETE CASCADE,
  CONSTRAINT FK_GRADE_RID FOREIGN KEY (Receiver_ID) REFERENCES TB_USER ON DELETE CASCADE,
  CONSTRAINT CHK_GRADE CHECK (Grade > 0 AND Grade < 11)
);
COMMENT ON TABLE TB_GRADE IS '별점 테이블';
COMMENT ON COLUMN TB_GRADE.Sender_ID IS '보내는 아이디';
COMMENT ON COLUMN TB_GRADE.Receiver_ID IS '받는 아이디';
COMMENT ON COLUMN TB_GRADE.Grade IS '별점';

-- 8. 출석 테이블
CREATE TABLE TB_ATTENDANCE (
  User_ID VARCHAR2(30),
  Attendance_DT DATE,
  
  CONSTRAINT PK_ATTENDANCE PRIMARY KEY (User_ID, Attendance_DT),
  CONSTRAINT FK_ATTENDANCE_UID FOREIGN KEY (User_ID) REFERENCES TB_USER ON DELETE CASCADE
);
COMMENT ON TABLE TB_ATTENDANCE IS '출석 테이블';
COMMENT ON COLUMN TB_ATTENDANCE.User_ID IS '아이디';
COMMENT ON COLUMN TB_ATTENDANCE.Attendance_DT IS '출석날짜';

-- 9. 결제 테이블
CREATE TABLE TB_PAYMENT (
  Payment_NO NUMBER,
  User_ID VARCHAR2(30) NOT NULL,
  Payment_DT DATE DEFAULT SYSDATE,
  Charge_Konpeito_CNT NUMBER NOT NULL,
  Use_Point_CNT NUMBER DEFAULT 0,
  Payment_Amount NUMBER NOT NULL,
  Payment_ST CHAR(1),
  
  CONSTRAINT PK_PAYMENT PRIMARY KEY (Payment_NO),
  CONSTRAINT FK_PAYMENT_UID FOREIGN KEY (User_ID) REFERENCES TB_USER ON DELETE CASCADE,
  CONSTRAINT CHK_PAYMENT_ST CHECK (Payment_ST IN ('0', '1', '2', '3'))
);
COMMENT ON TABLE TB_PAYMENT IS '결제 테이블';
COMMENT ON COLUMN TB_PAYMENT.Payment_NO IS '결제 번호';
COMMENT ON COLUMN TB_PAYMENT.User_ID IS '아이디';
COMMENT ON COLUMN TB_PAYMENT.Payment_DT IS '결제 날짜';
COMMENT ON COLUMN TB_PAYMENT.Charge_Konpeito_CNT IS '충전할 별사탕 수';
COMMENT ON COLUMN TB_PAYMENT.Use_Point_CNT IS '사용할 포인트 수';
COMMENT ON COLUMN TB_PAYMENT.Payment_Amount IS '결제 금액';
COMMENT ON COLUMN TB_PAYMENT.Payment_ST IS '결제 상태(0:결제실패/1:결제완료/2:환불요청/3:환불완료)';

-- 10. 별사탕 사용내역 테이블
CREATE TABLE TB_KONPEITO_BREAKDOWN (
  User_ID VARCHAR2(30),
  Use_DT DATE,
  Use_Konpeito_CNT NUMBER,
  
  CONSTRAINT PK_KB PRIMARY KEY (User_ID, Use_DT),
  CONSTRAINT FK_KB_UID FOREIGN KEY (User_ID) REFERENCES TB_USER ON DELETE CASCADE
);
COMMENT ON TABLE TB_KONPEITO_BREAKDOWN IS '별사탕 사용내역 테이블';
COMMENT ON COLUMN TB_KONPEITO_BREAKDOWN.User_ID IS '아이디';
COMMENT ON COLUMN TB_KONPEITO_BREAKDOWN.Use_DT IS '사용 날짜';
COMMENT ON COLUMN TB_KONPEITO_BREAKDOWN.Use_Konpeito_CNT IS '별사탕 사용 갯수';

-- 11. 신고 테이블
CREATE TABLE TB_REPORT (
  Report_NO NUMBER,
  Report_Type VARCHAR2(30),
  Sender_ID VARCHAR2(30),
  Receiver_ID VARCHAR2(30),
  Report_Content VARCHAR2(100),
  Report_ST CHAR(1) DEFAULT '0',
  
  CONSTRAINT PK_REPORT PRIMARY KEY (Report_NO),
  CONSTRAINT FK_REPORT_SID FOREIGN KEY (Sender_ID) REFERENCES TB_USER ON DELETE SET NULL,
  CONSTRAINT FK_REPORT_RID FOREIGN KEY (Receiver_ID) REFERENCES TB_USER ON DELETE SET NULL
);
COMMENT ON TABLE TB_REPORT IS '신고 테이블';
COMMENT ON COLUMN TB_REPORT.Report_NO IS '신고 번호';
COMMENT ON COLUMN TB_REPORT.Report_Type IS '신고 유형';
COMMENT ON COLUMN TB_REPORT.Sender_ID IS '신고자';
COMMENT ON COLUMN TB_REPORT.Receiver_ID IS '신고 대상자';
COMMENT ON COLUMN TB_REPORT.Report_Content IS '신고 사유';
COMMENT ON COLUMN TB_REPORT.Report_ST IS '신고 상태(0:신고접수/1:정지처리/2:보류처리)';


-- 12. 설문조사 테이블
CREATE TABLE TB_POLL (
  Poll_NO NUMBER,
  Poll_Title VARCHAR2(100) NOT NULL,
  Poll_ST CHAR(1) DEFAULT '0',
  Start_DT DATE DEFAULT SYSDATE,
  End_DT DATE NOT NULL,
  ANSWER1 VARCHAR2(100) , 
  ANSWER2 VARCHAR2(100) ,
  ANSWER3 VARCHAR2(100),
  
  CONSTRAINT PK_POLL PRIMARY KEY (Poll_NO),
  CONSTRAINT CHK_POLL_ST CHECK (Poll_ST IN ('0', '1', '2'))
);
COMMENT ON TABLE TB_POLL IS '설문조사 테이블';
COMMENT ON COLUMN TB_POLL.Poll_NO IS '설문번호';
COMMENT ON COLUMN TB_POLL.Poll_Title IS '설문제목';
COMMENT ON COLUMN TB_POLL.Poll_ST IS '설문 상태(0:준비/1:진행/2:마감)';
COMMENT ON COLUMN TB_POLL.Start_DT IS '설문시작일';
COMMENT ON COLUMN TB_POLL.End_DT IS '설문종료일';
COMMENT ON COLUMN TB_POLL.ANSWER1 IS '답변1';
COMMENT ON COLUMN TB_POLL.ANSWER2 IS '답변2';
COMMENT ON COLUMN TB_POLL.ANSWER3 IS '답변3';

-- 13. 매칭 유저 테이블
CREATE TABLE TB_MATCH_USER(
My_Id VARCHAR2(30) PRIMARY KEY,
Insert_Date DATE DEFAULT SYSDATE,
User_Id1 VARCHAR2(30),
User_Id2 VARCHAR2(30),
User_Id3 VARCHAR2(30),
Matching NUMBER(1)
);
comment on column tb_match_user.my_id is '내 아이디';
comment on column tb_match_user.insert_date is '매칭 갱신일';
comment on column tb_match_user.user_id1 is '매칭대상1';
comment on column tb_match_user.user_id2 is '매칭대상2';
comment on column tb_match_user.user_id3 is '매칭대상3';
comment on column tb_match_user.matching is '매칭상태(0,1)';

-- 14. 설문조사 답변 테이블
CREATE TABLE TB_POLL_ANSWER (
  User_ID VARCHAR2(30),
  Poll_NO NUMBER,
  Answer NUMBER NOT NULL,
  
  CONSTRAINT PK_PA PRIMARY KEY (User_ID, Poll_NO),
  CONSTRAINT FK_PA_UID FOREIGN KEY (User_ID) REFERENCES TB_USER ON DELETE SET NULL
);
COMMENT ON TABLE TB_POLL_ANSWER IS '설문조사 답변 테이블';
COMMENT ON COLUMN TB_POLL_ANSWER.User_ID IS '아이디';
COMMENT ON COLUMN TB_POLL_ANSWER.Poll_NO IS '설문번호';
COMMENT ON COLUMN TB_POLL_ANSWER.Answer IS '답변';

-- 15. 공지사항 테이블
CREATE TABLE TB_NOTICE (
  Notice_NO NUMBER,
  Notice_Title VARCHAR2(50) NOT NULL,
  Notice_Content VARCHAR2(2000) NOT NULL,
  Notice_DT DATE DEFAULT SYSDATE,
  Notice_Read_CNT NUMBER DEFAULT 0,
  
  CONSTRAINT PK_NOTICE PRIMARY KEY (Notice_NO)  
);
COMMENT ON TABLE TB_NOTICE IS '공지사항 테이블';
COMMENT ON COLUMN TB_NOTICE.Notice_NO IS '공지사항 번호';
COMMENT ON COLUMN TB_NOTICE.Notice_Title IS '공지사항';
COMMENT ON COLUMN TB_NOTICE.Notice_Content IS '내용';
COMMENT ON COLUMN TB_NOTICE.Notice_DT IS '작성일';
COMMENT ON COLUMN TB_NOTICE.Notice_Read_CNT IS '조회수';

-- 16. 자유 게시판 테이블
CREATE SEQUENCE TB_FREE_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
ORDER;

CREATE TABLE TB_FREE (
  Free_NO NUMBER,
  Free_Title VARCHAR2(50) NOT NULL,
  Free_Writer VARCHAR2(30) NOT NULL,
  Free_Content VARCHAR2(2000) NOT NULL,
  Free_DT DATE DEFAULT SYSDATE,
  Free_Read_CNT NUMBER DEFAULT 0,
  Free_YN VARCHAR2(10) NOT NULL,
  
  CONSTRAINT PK_FREE PRIMARY KEY (Free_NO),
  CONSTRAINT FK_FREE_WID FOREIGN KEY (Free_Writer) REFERENCES TB_USER (User_NickNM) ON DELETE SET NULL
);
COMMENT ON TABLE TB_FREE IS '자유게시판 테이블';
COMMENT ON COLUMN TB_FREE.Free_NO IS '자유게시판 번호';
COMMENT ON COLUMN TB_FREE.Free_Writer IS '자유게시판 작성자 닉네임';
COMMENT ON COLUMN TB_FREE.Free_Title IS '자유게시판 제목';
COMMENT ON COLUMN TB_FREE.Free_Content IS '자유게시판 내용';
COMMENT ON COLUMN TB_FREE.Free_DT IS '자유게시판 올린날짜';
COMMENT ON COLUMN TB_FREE.Free_Read_CNT IS '조회수';
COMMENT ON COLUMN TB_FREE.Free_YN IS '익명여부';

-- 17. FAQ 테이블
CREATE TABLE TB_FAQ(
  FAQ_NO NUMBER,
  FAQ_GB VARCHAR2(15) NOT NULL,
  FAQ_Title VARCHAR2(50) NOT NULL,
  FAQ_Content VARCHAR2(2000),
  FAQ_Writer VARCHAR2(30) NOT NULL,
  FAQ_Date DATE DEFAULT SYSDATE,
  
  CONSTRAINT PK_FAQ PRIMARY KEY (FAQ_NO)
);

COMMENT ON TABLE TB_FAQ IS '자주묻는질문 테이블';
COMMENT ON COLUMN TB_FAQ.FAQ_NO IS 'FAQ 번호';
COMMENT ON COLUMN TB_FAQ.FAQ_GB IS 'FAQ 구분';
COMMENT ON COLUMN TB_FAQ.FAQ_Title IS 'FAQ 제목';
COMMENT ON COLUMN TB_FAQ.FAQ_Content IS 'FAQ 내용';
COMMENT ON COLUMN TB_FAQ.FAQ_Writer IS 'FAQ 작성자';
COMMENT ON COLUMN TB_FAQ.FAQ_Date IS 'FAQ 날짜';


-- 18. 일대일 문의 테이블
CREATE SEQUENCE TB_INQ_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
ORDER;


CREATE TABLE TB_INQ(
INQ_NO NUMBER, --일대일 문의 번호
INQ_TITLE VARCHAR2(50) NOT NULL, --일대일 문의 제목
INQ_CONTENT LONG, --일대일 문의 내용
INQ_DATE DATE DEFAULT SYSDATE, --일대일 문의 작성일자
INQ_ORIGINAL_FILENAME VARCHAR2(100) DEFAULT NULL, --일대일 문의 원래 첨부파일명
INQ_RENAME_FILENAME VARCHAR2(100) DEFAULT NULL, --일대일 문의 바뀐 첨부파일명
INQ_WRITER VARCHAR2(15) NOT NULL, --일대일 문의 보내는 유저
INQ_RECIVER VARCHAR2(15), --일대일 문의 받는 유저
INQ_REPLY_FL NUMBER DEFAULT '0',

CONSTRAINT PK_INQ PRIMARY KEY (INQ_NO),
CONSTRAINT FK_INQWR FOREIGN KEY (INQ_WRITER) REFERENCES TB_USER ON DELETE CASCADE,
CONSTRAINT FK_INQRE FOREIGN KEY (INQ_RECIVER) REFERENCES TB_USER ON DELETE CASCADE
);

COMMENT ON COLUMN TB_INQ.INQ_NO IS '일대일 문의 번호';
COMMENT ON COLUMN TB_INQ.INQ_TITLE IS '일대일 문의 제목';
COMMENT ON COLUMN TB_INQ.INQ_CONTENT IS '일대일 문의 내용';
COMMENT ON COLUMN TB_INQ.INQ_DATE IS '일대일 문의 작성일자';
COMMENT ON COLUMN TB_INQ.INQ_ORIGINAL_FILENAME IS '일대일 문의 원래 첨부파일명';
COMMENT ON COLUMN TB_INQ.INQ_RENAME_FILENAME IS '일대일 문의 바뀐 첨부파일명';
COMMENT ON COLUMN TB_INQ.INQ_WRITER IS '일대일 문의 보내는 유저';
COMMENT ON COLUMN TB_INQ.INQ_RECIVER IS '일대일 문의 받는 유저';
COMMENT ON COLUMN TB_INQ.INQ_REPLY_FL IS '답변 플래그(0:사용자 질문/나머지 번호: INQ_NO에 해당하는 관리자의 답변';



-- 19. 자유게시판 댓글 테이블
CREATE TABLE TB_FREE_REPLY (
Reply_No NUMBER, --댓글 번호
Free_No NUMBER, --게시글 번호
Reply_Text VARCHAR2(300), --댓글 내용
Reply_Writer VARCHAR2(30), --댓글 작성자 아이디
Reply_NickNM VARCHAR2(30), --댓글 작성자 닉네임
Regdate DATE DEFAULT SYSDATE,--댓글 작성일자

CONSTRAINT PK_RNO PRIMARY KEY (Reply_No),
CONSTRAINT FK_FREE_REPLYWID FOREIGN KEY (Reply_Writer) REFERENCES TB_USER ON DELETE SET NULL,
CONSTRAINT FK_FREE_REPLYWNNM FOREIGN KEY (Reply_NickNM) REFERENCES TB_USER ON DELETE SET NULL,
CONSTRAINT FK_FREE_REPLYFN FOREIGN KEY (Free_NO) REFERENCES TB_FREE ON DELETE SET NULL
);

COMMENT ON TABLE TB_FREE_REPLY IS '자유게시판 댓글 테이블';
COMMENT ON COLUMN TB_FREE_REPLY.Reply_No IS '댓글 번호';
COMMENT ON COLUMN TB_FREE_REPLY.Free_No IS '게시글 번호';
COMMENT ON COLUMN TB_FREE_REPLY.Reply_Text IS '댓글 내용';
COMMENT ON COLUMN TB_FREE_REPLY.Reply_Writer IS '댓글 작성자 아이디';
COMMENT ON COLUMN TB_FREE_REPLY.Reply_NickNM IS '댓글 작성자 닉네임';
COMMENT ON COLUMN TB_FREE_REPLY.Regdate IS '댓글 작성일자';

create table tb_chat(
  send_user varchar2(30),
  receive_user varchar2(30)
  );



----------------- 샘플데이터 -------------------
-- 1. 사용자 테이블
-- 남자
INSERT INTO TB_USER VALUES('admin', 'admin', '관리자', '관리자', '1', 'admin@naver.com', '010-1234-5678', 1000, 1000, 'M', default, '2017-11-12', default, null); 
INSERT INTO TB_USER VALUES('user01', 'pass01', '윤찬호', '너구리', '1', 'raccoon@naver.com', '010-1234-1111', 1000, 1000, 'D', 3, '2017-12-12', default, null); 
INSERT INTO TB_USER VALUES('user02', 'pass02', '손정한', '돼지', '1', 'pig22@naver.com', '010-1234-2222', default, default, 'P', 3.5, '2017-10-01', default, null); 
INSERT INTO TB_USER VALUES('user03', 'pass03', '김지훈', '사육사', '1', 'keeper@naver.com', '010-1234-3333', default, default, 'G', 3.5, '2017-12-19', default, null); 
INSERT INTO TB_USER VALUES('user04', 'pass04', '남찬우', '나무', '1', 'tree@gmail.com', '010-1234-4444', default, default, 'S', 4, '2017-02-09', '2017-05-10', null); 
INSERT INTO TB_USER VALUES('user05', 'pass05', '조남훈', '곰', '1', 'bear55@naver.com', '010-1234-5555', default, default, 'B', 4, '2017-11-11', default, null);
INSERT INTO TB_USER VALUES('user06', 'pass06', '이종석', '이종석', '1', 'ljs11@naver.com', '010-1234-5556', default, default, 'D', 5, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user07', 'pass07', '김우빈', '김우빈', '1', 'kwb12@naver.com', '010-1234-5557', default, default, 'P', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user08', 'pass08', '유승호', '유승호', '1', 'ysh214@naver.com', '010-1234-5558', default, default, 'G', 5, '2017-11-11', default, null);
INSERT INTO TB_USER VALUES('user09', 'pass09', '현빈', '현빈', '1', 'hbeen1231@naver.com', '010-2244-5522', default, default, 'B', 4, '2017-11-11', default, null);
INSERT INTO TB_USER VALUES('user10', 'pass10', '박보검', '박보검', '1', 'pbk124@naver.com', '010-1234-5559', default, default, 'B', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user11', 'pass11', '전현무', '전현무', '1', 'jhm1235@naver.com', '010-1234-5560', default, default, 'D', 3, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user12', 'pass12', '에릭남', '에릭남', '1', 'eric2384@naver.com', '010-1234-5561', default, default, 'G', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user13', 'pass13', '김희철', '김희철', '1', 'khc4745@naver.com', '010-1234-5562', default, default, 'B', 5, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user14', 'pass14', '박서준', '박서준', '1', 'psj8765@naver.com', '010-1234-5563', default, default, 'G', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user15', 'pass15', '강다니엘', '강다니엘', '1', 'kdanial@naver.com', '010-1234-5564', default, default, 'B', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user16', 'pass16', '유재석', '유재석', '1', 'yjs4424@naver.com', '010-1234-5565', default, default, 'B', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user17', 'pass17', '이승기', '이승기', '1', 'lsk7958@naver.com', '010-1234-5566', default, default, 'P', 2, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user18', 'pass18', '육성재', '육성재', '1', 'ysj6652@naver.com', '010-1234-5567', default, default, 'B', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user19', 'pass19', '원빈', '원빈', '1', 'wbwb447@naver.com', '010-1234-5568', default, default, 'B', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user20', 'pass20', '강동원', '강동원', '2', 'kdj1255@naver.com', '010-1234-5569', default, default, 'P', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user21', 'pass21', '이민호', '이민호', '2', 'lmh7711@naver.com', '010-1234-5570', default, default, 'B', 3, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user22', 'pass22', '김수현', '김수현', '3', 'ksh4528@naver.com', '010-1234-5571', default, default, 'G', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user23', 'pass23', '송중기', '송중기', '0', 'sjk3258@naver.com', '010-1234-5572', default, default, 'B', 3, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user24', 'pass24', '정용화', '정용화', '0', 'jyh4484@naver.com', '010-1234-5573', default, default, 'G', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user25', 'pass25', '마동석', '마동석', '3', 'mds6588@naver.com', '010-1234-5574', default, default, 'B', 2, '2017-11-11', default, null); 


-- 여자
INSERT INTO TB_USER VALUES('user26', 'pass26', '김혜정', '쥐', '2', 'mouse@naver.com', '010-1234-6666', default, default, 'G', 4, '2017-06-06', '2017-06-06', null); 
INSERT INTO TB_USER VALUES('user27', 'pass27', '김여진', '여우', '4', 'fox77@naver.com', '010-1234-7777', default, default, 'G', 4.5, '2017-10-10', '2017-10-10', null); 
INSERT INTO TB_USER VALUES('user28', 'pass28', '김선진', '선진', '1', 'sun88@naver.com', '010-1234-8888', default, default, default, 3.5, default, default, null); 
INSERT INTO TB_USER VALUES('user29', 'pass29', '김유진', '유진', '1', 'youjin99@naver.com', '010-1234-9999', default, default, default, 1.5, default, default, null); 
INSERT INTO TB_USER VALUES('user30', 'pass30', '김혜진', '지니', '1', 'genie00@naver.com', '010-1234-0000', default, default, default, 4.5, default, default, null);
INSERT INTO TB_USER VALUES('user31', 'pass31', '손예진', '손예진', '1', 'syj1234@naver.com', '010-1234-0001', default, default, default, 4.5, default, default, null); 
INSERT INTO TB_USER VALUES('user32', 'pass32', '박보영', '박보영', '1', 'pby4487@naver.com', '010-1234-0002', default, default, default, 5, default, default, null); 
INSERT INTO TB_USER VALUES('user33', 'pass33', '조보아', '조보아', '1', 'jboa6587@naver.com', '010-1234-0003', default, default, default, 4, default, default, null); 
INSERT INTO TB_USER VALUES('user34', 'pass34', '전지현', '전지현', '1', 'jjh1124@naver.com', '010-1234-0004', default, default, default, 5, default, default, null); 
INSERT INTO TB_USER VALUES('user35', 'pass35', '설인아', '설인아', '1', 'sia6556@naver.com', '010-1234-0005', default, default, default, 3, default, default, null); 
INSERT INTO TB_USER VALUES('user36', 'pass36', '김소현', '김소현', '1', 'ksh9987@naver.com', '010-1234-0006', default, default, default, 3.5, default, default, null); 
INSERT INTO TB_USER VALUES('user37', 'pass37', '배수지', '배수지', '1', 'bsz1115@naver.com', '010-1234-0007', default, default, default, 3.5, default, default, null); 
INSERT INTO TB_USER VALUES('user38', 'pass38', '임윤아', '임윤아', '1', 'lya3355@naver.com', '010-1234-0008', default, default, default, 2.5, default, default, null); 
INSERT INTO TB_USER VALUES('user39', 'pass39', '김태희', '김태희', '2', 'kth4421@naver.com', '010-1234-0009', default, default, default, 2.5, default, default, null); 
INSERT INTO TB_USER VALUES('user40', 'pass40', '안지현', '안지현', '1', 'ajh1864@naver.com', '010-1234-0010', default, default, default, 1.5, default, default, null); 
INSERT INTO TB_USER VALUES('user41', 'pass41', '공승연', '공승연', '1', 'ksy9975@naver.com', '010-1234-0011', default, default, default, 1.5, default, default, null); 
INSERT INTO TB_USER VALUES('user42', 'pass42', '김연아', '김연아', '1', 'kya2210@naver.com', '010-1234-0012', default, default, default, 3.5, default, default, null); 
INSERT INTO TB_USER VALUES('user43', 'pass43', '쯔위', '쯔위', '1', 'zzwhi1151@naver.com', '010-1234-0013', default, default, default, 4.5, default, default, null); 
INSERT INTO TB_USER VALUES('user44', 'pass44', '김설현', '김설현', '1', 'ksh2200@naver.com', '010-1234-0014', default, default, default, 5, default, default, null); 
INSERT INTO TB_USER VALUES('user45', 'pass45', '경리', '경리', '3', 'klee4411@naver.com', '010-1234-0015', default, default, default,3, default, default, null); 
INSERT INTO TB_USER VALUES('user46', 'pass46', '성유리', '성유리', '3', 'syl4447@naver.com', '010-1234-0016', default, default, default, 5, default, default, null); 
INSERT INTO TB_USER VALUES('user47', 'pass47', '채수빈', '채수빈', '1', 'csb6689@naver.com', '010-1234-0017', default, default, default, 2, default, default, null); 
INSERT INTO TB_USER VALUES('user48', 'pass48', '김지원', '김지원', '1', 'kjw1005@naver.com', '010-1234-0018', default, default, default, 2.5, default, default, null); 
INSERT INTO TB_USER VALUES('user49', 'pass49', '신아영', '신아영', '1', 'say1149@naver.com', '010-1234-0019', default, default, default, 2.5, default, default, null); 
INSERT INTO TB_USER VALUES('user50', 'pass50', '박나래', '박나래', '1', 'pnr2206@naver.com', '010-1234-0020', default, default, default, 1.5, default, default, null); 



-- 2. 사용자(또는 이상형) 프로필
-- 남자(사용자 프로필)
INSERT INTO TB_PROFILE
VALUES ('user01', '0', 'M', 25, 182, '서울', '조금 마름', '4년대졸','회사원', 'O', '비흡연', '전혀 마시지 않아요', '기독교', '낙천적인,섬세,스포티');
INSERT INTO TB_PROFILE
VALUES ('user02', '0', 'M', 25, 177, '부산', '보통', '4년대재학','학생', 'O', '비흡연', '어쩔 수 없을 때만 마셔요', '불교', '대범,도도한,창의적인');
INSERT INTO TB_PROFILE
VALUES ('user03', '0', 'M', 25, 188, '광주', '슬림 탄탄', '4년대재학','학생', 'O', '비흡연', '가끔 마셔요', '무교','열정적인,유머있는,착한');
INSERT INTO TB_PROFILE
VALUES ('user04', '0', 'M', 21, 170, '대구', '마름', '고졸','회사원', 'A', '흡연', '어느정도 즐기는 편이에요', '천주교', '패셔너블,지적인,귀여운');
INSERT INTO TB_PROFILE
VALUES ('user05', '0', 'M', 22, 177, '대전', '보통', '4년대재학','학생', 'AB', '비흡연', '자주 술자리를 가져요', '불교', '대범,도도한,창의적인');
INSERT INTO TB_PROFILE
VALUES ('user06', '0', 'M', 31, 164, '광주', '슬림 탄탄', '고졸','자영업', 'A', '흡연', '자주 술자리를 가져요', '무교', '열정적인,유머있는,착한');
INSERT INTO TB_PROFILE
VALUES ('user07', '0', 'M', 36, 181, '전주', '보통', '4년대졸','회사원', 'B', '비흡연', '어느정도 즐기는 편이에요', '기독교', '터프,섹시,스포티');
INSERT INTO TB_PROFILE
VALUES ('user08', '0', 'M', 27, 193, '파주', '슬림 탄탄', '4년대졸','회사원', 'AB', '비흡연', '어느정도 즐기는 편이에요', '무교', '열정적인,유머있는,착한');
INSERT INTO TB_PROFILE
VALUES ('user09', '0', 'M', 28, 172, '춘천', '보통', '4년대졸','회사원', 'A', '비흡연', '못마십니다.', '기독교', '터프,섹시,스포티');
INSERT INTO TB_PROFILE
VALUES ('user10', '0', 'M', 21, 178, '강릉', '슬림 탄탄', '고졸','회사원', 'A', '비흡연', '자주 술자리를 가져요', '무교', '터프,섹시,스포티');
INSERT INTO TB_PROFILE
VALUES ('user11', '0', 'M', 26, 170, '제주', '마름', '고졸','회사원', 'AB', '비흡연', '어느정도 즐기는 편이에요', '기독교', '대범,도도한,창의적인');
INSERT INTO TB_PROFILE
VALUES ('user12', '0', 'M', 33, 175, '인천', '보통', '전문대졸','회사원', 'AB', '비흡연', '어느정도 즐기는 편이에요', '무교', '터프,섹시,스포티');
INSERT INTO TB_PROFILE
VALUES ('user13', '0', 'M', 42, 167, '경기', '슬림 탄탄', '4년대졸','자영업', 'B', '흡연', '어느정도 즐기는 편이에요', '무교', '대범,도도한,창의적인');
INSERT INTO TB_PROFILE
VALUES ('user14', '0', 'M', 30, 181, '수원', '통통', '4년대졸','회사원', 'AB', '흡연', '자주 술자리를 가져요', '무교', '터프,섹시,스포티');
INSERT INTO TB_PROFILE
VALUES ('user15', '0', 'M', 29, 168, '남양주', '보통', '4년대졸','회사원', 'O', '비흡연', '자주 술자리를 가져요', '기독교', '대범,도도한,창의적인');
INSERT INTO TB_PROFILE
VALUES ('user16', '0', 'M', 22, 172, '서울', '보통', '전문대졸','회사원', 'AB', '비흡연', '자주 술자리를 가져요', '무교', '터프,섹시,스포티');
INSERT INTO TB_PROFILE
VALUES ('user17', '0', 'M', 35, 177, '서울', '슬림 탄탄', '4년대졸','자영업', 'AB', '비흡연', '자주 술자리를 가져요', '불교', '대범,도도한,창의적인');
INSERT INTO TB_PROFILE
VALUES ('user18', '0', 'M', 36, 181, '대전', '보통', '4년대졸','회사원', 'O', '비흡연', '어느정도 즐기는 편이에요', '기독교', '터프,섹시,스포티');
INSERT INTO TB_PROFILE
VALUES ('user19', '0', 'M', 22, 183, '포항', '마름', '4년대재학','학생', 'AB', '흡연', '자주 술자리를 가져요', '무교', '터프,섹시,스포티');
INSERT INTO TB_PROFILE
VALUES ('user20', '0', 'M', 26, 177, '울산', '보통', '4년대졸','회사원', 'AB', '비흡연', '자주 술자리를 가져요', '무교', '열정적인,유머있는,착한');
INSERT INTO TB_PROFILE
VALUES ('user21', '0', 'M', 29, 170, '인천', '슬림 탄탄', '4년대졸','회사원', 'B', '비흡연', '자어느정도 즐기는 편이에요', '무교', '터프,섹시,스포티');
INSERT INTO TB_PROFILE
VALUES ('user22', '0', 'M', 37, 177, '서울', '보통', '4년대졸','회사원', 'B', '비흡연', '어느정도 즐기는 편이에요', '기독교', '터프,섹시,스포티');
INSERT INTO TB_PROFILE
VALUES ('user23', '0', 'M', 35, 174, '대전', '보통', '고졸','회사원', 'A', '비흡연', '자주 술자리를 가져요', '무교', '터프,섹시,스포티');
INSERT INTO TB_PROFILE
VALUES ('user24', '0', 'M', 21, 175, '의정부', '통통', '고졸','회사원', 'B', '흡연', '어느정도 즐기는 편이에요', '불교', '열정적인,유머있는,착한');
INSERT INTO TB_PROFILE
VALUES ('user25', '0', 'M', 27, 182, '대구', '통통', '4년대졸','회사원', 'AB', '비흡연', '자주 술자리를 가져요', '기독교', '터프,섹시,스포티');


-- 여자(사용자 프로필)
INSERT INTO TB_PROFILE
VALUES ('user26', '0', 'F', 23, 160, '부산', '보통', '4년대졸','회사원', 'B', '흡연', '어쩔 수 없을 때만 마셔요', '무교', '신중한,상냥,유머있는');
INSERT INTO TB_PROFILE
VALUES ('user27', '0', 'F', 24, 155, '서울', '조금 통통', '4년대졸','회사원', 'O', '비흡연', '가끔 마셔요', '무교', '착한,듬직한,패셔너블');
INSERT INTO TB_PROFILE
VALUES ('user28', '0', 'F', 28, 172, '경기', '스키니', '4년대졸', '자영업', 'B', '흡연', '어느정도 즐기는 편이에요', '불교', '낙천적인,대범,열정적인');
INSERT INTO TB_PROFILE
VALUES ('user29', '0', 'F', 24, 150, '강원', '보통', '4년대졸', '프리랜서', 'AB', '비흡연', '자주 술자리를 가져요', '무교', '패셔너블,유머있는,낙천적인');
INSERT INTO TB_PROFILE
VALUES ('user30', '0', 'F', 22, 157, '경기-수원 인근', '스키니', '4년대졸', '대학생', 'B', '흡연', '자주 술자리를 가져요', '기독교', '터프,유머있는,착한');
INSERT INTO TB_PROFILE
VALUES ('user31', '0', 'F', 26, 171, '의정부', '스키니', '4년대졸', '취업준비생', 'A', '비흡연흡연', '자주 술자리를 가져요', '기독교', '터프,유머있는,착한');
INSERT INTO TB_PROFILE
VALUES ('user32', '0', 'F', 31, 167, '부천', '조금 통통', '4년대졸', '회사원', 'O', '비흡연', '자주 술자리를 가져요', '기독교', '터프,유머있는,착한');
INSERT INTO TB_PROFILE
VALUES ('user33', '0', 'F', 28, 162, '부산', '스키니', '4년대졸', '회사원', 'AB', '비흡연', '가끔 마셔요', '무교', '터프,유머있는,착한');
INSERT INTO TB_PROFILE
VALUES ('user34', '0', 'F', 29, 163, '울산', '스키니', '4년대졸', '회사원', 'B', '비흡연', '가끔 마셔요', '기독교', '터프,유머있는,착한');
INSERT INTO TB_PROFILE
VALUES ('user35', '0', 'F', 22, 152, '전주', '스키니', '4년대재학', '대학생', 'AB', '비흡연', '자주 술자리를 가져요', '기독교', '터프,유머있는,착한');
INSERT INTO TB_PROFILE
VALUES ('user36', '0', 'F', 23, 168, '부산', '보통', '전문대졸','자영업', 'B', '흡연', '어쩔 수 없을 때만 마셔요', '무교', '신중한,상냥,유머있는');
INSERT INTO TB_PROFILE
VALUES ('user37', '0', 'F', 24, 170, '서울', '조금 통통', '고졸','회사원', 'O', '비흡연', '가끔 마셔요', '무교', '착한,듬직한,패셔너블');
INSERT INTO TB_PROFILE
VALUES ('user38', '0', 'F', 28, 172, '경기', '스키니', '4년대졸', '자영업', 'O', '흡연', '어느정도 즐기는 편이에요', '불교', '낙천적인,대범,열정적인');
INSERT INTO TB_PROFILE
VALUES ('user39', '0', 'F', 24, 160, '강원', '보통', '4년대졸', '프리랜서', 'AB', '비흡연', '자주 술자리를 가져요', '무교', '패셔너블,유머있는,낙천적인');
INSERT INTO TB_PROFILE
VALUES ('user40', '0', 'F', 22, 166, '경기-수원 인근', '스키니', '4년대재학', '학생', 'B', '비흡연', '자주 술자리를 가져요', '기독교', '터프,유머있는,착한');
INSERT INTO TB_PROFILE
VALUES ('user41', '0', 'F', 22, 164, '의정부', '스키니', '4년대재학', '학생', 'AB', '비흡연', '가끔 마셔요', '기독교', '터프,유머있는,착한');
INSERT INTO TB_PROFILE
VALUES ('user42', '0', 'F', 24, 162, '부천', '스키니', '4년대재학', '학생', 'AB', '비흡연', '자주 술자리를 가져요', '기독교', '터프,유머있는,착한');
INSERT INTO TB_PROFILE
VALUES ('user43', '0', 'F', 33, 161, '부산', '조금 통통', '4년대졸', '회사원', 'B', '비흡연', '가끔 마셔요', '기독교', '터프,유머있는,착한');
INSERT INTO TB_PROFILE
VALUES ('user44', '0', 'F', 27, 157, '울산', '스키니', '고졸', '회사원', 'B', '비흡연', '자주 술자리를 가져요', '무교', '터프,유머있는,착한');
INSERT INTO TB_PROFILE
VALUES ('user45', '0', 'F', 24, 168, '전주', '스키니', '전문대졸', '프리랜서', 'O', '흡연', '어느정도 즐기는 편이에요', '기독교', '터프,유머있는,착한');
INSERT INTO TB_PROFILE
VALUES ('user46', '0', 'F', 25, 166, '부산', '보통', '4년대졸','회사원', 'O', '비흡연', '어쩔 수 없을 때만 마셔요', '무교', '신중한,상냥,유머있는');
INSERT INTO TB_PROFILE
VALUES ('user47', '0', 'F', 27, 155, '서울', '조금 통통', '4년대졸','회사원', 'A', '비흡연', '가끔 마셔요', '무교', '착한,듬직한,패셔너블');
INSERT INTO TB_PROFILE
VALUES ('user48', '0', 'F', 30, 172, '경기', '스키니', '고졸', '자영업', 'B', '비흡연', '어느정도 즐기는 편이에요', '불교', '낙천적인,대범,열정적인');
INSERT INTO TB_PROFILE
VALUES ('user49', '0', 'F', 24, 150, '강원', '보통', '4년대재학', '학생', 'AB', '비흡연', '자주 술자리를 가져요', '무교', '패셔너블,유머있는,낙천적인');
INSERT INTO TB_PROFILE
VALUES ('user50', '0', 'F', 22, 167, '경기-수원 인근', '스키니', '4년대재학', '학생', 'B', '흡연', '자주 술자리를 가져요', '기독교', '터프,유머있는,착한');


-- 남자(이상형 프로필)
INSERT INTO TB_PROFILE
VALUES('user01', '1', 'F', '4살이하 연하', '상관없음' , '같은 도시의 이성', '스키니', null, null, null, '비흡연', '어느정도 즐기는 편이에요', '같은 종교인이면 더 좋아요', '낙천적인,신중한,스포티'); 
INSERT INTO TB_PROFILE
VALUES('user02', '1', 'F', '상관없음', '154이하' , '상관 없음', '조금 마름', null, null, null, '비흡연', '가끔 마셔요', '상관 없음', '낙천적인,신중한,패셔너블'); 
INSERT INTO TB_PROFILE
VALUES('user03', '1', 'F', '동갑', '155~159' , '인근 도시까지 선호', '조금 마름', null, null, null, '비흡연', '자주 술자리를 가져요', '같은 종교인이면 더 좋아요', '낙천적인,신중한,섹시'); 
INSERT INTO TB_PROFILE
VALUES('user04', '1', 'F', '4살이하 연하', '165~169' , '상관 없음', '보통', null, null, null, '흡연', '어쩔 수 없을 때만 마셔요', '상관 없음', '착한,패셔너블,유머있는'); 
INSERT INTO TB_PROFILE
VALUES('user05', '1', 'F', '2살~3살 연상', '175이상' , '같은 도시의 이성', '통통', null, null, null, '비흡연', '자주 술자리를 가져요', '같은 종교인이면 더 좋아요', '스포티,신중한,터프'); 
INSERT INTO TB_PROFILE
VALUES('user06', '1', 'F', '동갑', '165~169' , '같은 도시의 이성', '슬림 탄탄', null, null, null, '비흡연', '어느정도 즐기는 편이에요', '상관 없음', '착한,패셔너블,유머있는'); 
INSERT INTO TB_PROFILE
VALUES('user07', '1', 'F', '상관없음', '155~159' , '상관 없음', '조금 마름', null, null, null, '비흡연', '어쩔 수 없을 때만 마셔요', '같은 종교인이면 더 좋아요', '착한,패셔너블,유머있는'); 
INSERT INTO TB_PROFILE
VALUES('user08', '1', 'F', '4살이하 연하', '165~169' , '같은 도시의 이성', '스키니', null, null, null, '비흡연', '자주 술자리를 가져요', '같은 종교인이면 더 좋아요', '낙천적인,신중한,섹시'); 
INSERT INTO TB_PROFILE
VALUES('user09', '1', 'F', '동갑', '155~159' , '같은 도시의 이성', '슬림 탄탄', null, null, null, '흡연', '어쩔 수 없을 때만 마셔요', '같은 종교인이면 더 좋아요', '착한,패셔너블,유머있는'); 
INSERT INTO TB_PROFILE
VALUES('user10', '1', 'F', '4살이상 연상', '상관없음' , '상관 없음', '슬림 탄탄', null, null, null, '비흡연', '어느정도 즐기는 편이에요', '상관 없음', '착한,패셔너블,유머있는'); 
INSERT INTO TB_PROFILE
VALUES('user11', '1', 'F', '2살~3살 연상', '175이상' , '인근 도시까지 선호', '통통', null, null, null, '비흡연', '자주 술자리를 가져요', '상관 없음', '낙천적인,신중한,섹시'); 
INSERT INTO TB_PROFILE
VALUES('user12', '1', 'F', '동갑', '160~164', '같은 도시의 이성','스키니' ,null, null, null, '비흡연', '어쩔 수 없을 때만 마셔요', '상관 없음', '낙천적인,신중한,스포티'); 
INSERT INTO TB_PROFILE
VALUES('user13', '1', 'F', '2살~3살 연상', '160~164' , '인근 도시까지 선호', '스키니', null, null, null, '흡연', '자주 술자리를 가져요', '같은 종교인이면 더 좋아요', '착한,패셔너블,유머있는'); 
INSERT INTO TB_PROFILE
VALUES('user14', '1', 'F', '동갑', '175이상' , '같은 도시의 이성', '슬림 탄탄', null, null, null, '흡연', '가끔 마셔요', '상관 없음', '착한,패셔너블,유머있는'); 
INSERT INTO TB_PROFILE
VALUES('user15', '1', 'F', '4살이하 연하', '155~159' , '인근 도시까지 선호', '보통', null, null, null, '비흡연', '어느정도 즐기는 편이에요', '상관 없음', '착한,패셔너블,유머있는'); 
INSERT INTO TB_PROFILE
VALUES('user16', '1', 'F', '2살~3살 연상', '165~169' , '같은 도시의 이성', '보통', null, null, null, '흡연', '어쩔 수 없을 때만 마셔요', '상관 없음', '낙천적인,신중한,스포티'); 
INSERT INTO TB_PROFILE
VALUES('user17', '1', 'F', '2살~3살 연하', '상관없음' , '상관 없음', '조금 마름', null, null, null, '비흡연', '어쩔 수 없을 때만 마셔요', '상관 없음', '스포티,신중한,터프'); 
INSERT INTO TB_PROFILE
VALUES('user18', '1', 'F', '2살~3살 연상', '155~159' , '인근 도시까지 선호', '스키니', null, null, null, '흡연', '가끔 마셔요', '같은 종교인이면 더 좋아요', '착한,패셔너블,유머있는'); 
INSERT INTO TB_PROFILE
VALUES('user19', '1', 'F', '동갑', '160~164' , '상관 없음', '조금 마름', null, null, null, '흡연', '어느정도 즐기는 편이에요', '상관 없음', '스포티,신중한,터프'); 
INSERT INTO TB_PROFILE
VALUES('user20', '1', 'F', '2살~3살 연상', '175이상' , '같은 도시의 이성', '슬림 탄탄', null, null, null, '비흡연', '자주 술자리를 가져요', '상관 없음', '낙천적인,신중한,스포티'); 
INSERT INTO TB_PROFILE
VALUES('user21', '1', 'F', '4살이하 연하', '상관없음' , '인근 도시까지 선호', '보통', null, null, null, '흡연', '전혀 마시지 않아요', '상관 없음', '낙천적인,신중한,섹시'); 
INSERT INTO TB_PROFILE
VALUES('user22', '1', 'F', '2살~3살 연상', '155~159' , '같은 도시의 이성', '스키니', null, null, null, '비흡연', '전혀 마시지 않아요', '같은 종교인이면 더 좋아요', '착한,패셔너블,유머있는'); 
INSERT INTO TB_PROFILE
VALUES('user23', '1', 'F', '2살~3살 연하', '175이상' , '인근 도시까지 선호', '통통', null, null, null, '비흡연', '자주 술자리를 가져요', '상관 없음', '스포티,신중한,터프'); 
INSERT INTO TB_PROFILE
VALUES('user24', '1', 'F', '동갑', '165~169' , '상관 없음', '보통', null, null, null, '비흡연', '어느정도 즐기는 편이에요', '상관 없음', '낙천적인,신중한,섹시'); 
INSERT INTO TB_PROFILE
VALUES('user25', '1', 'F', '4살이상 연상', '155~159' , '같은 도시의 이성', '스키니', null, null, null, '비흡연', '자주 술자리를 가져요', '같은 종교인이면 더 좋아요', '착한,패셔너블,유머있는'); 

-- 여자(이상형 프로필)
INSERT INTO TB_PROFILE
VALUES('user26', '1', 'M', '4살이하 연하', '상관없음' , '같은 도시의 이성', '스키니', null, null, null, '비흡연', '어느정도 즐기는 편이에요', '같은 종교인이면 더 좋아요', '낙천적인,신중한,스포티'); 
INSERT INTO TB_PROFILE
VALUES('user27', '1', 'M', '상관없음', '154이하' , '상관 없음', '조금 마름', null, null, null, '비흡연', '가끔 마셔요', '상관 없음', '낙천적인,신중한,패셔너블'); 
INSERT INTO TB_PROFILE
VALUES('user28', '1', 'M', '동갑', '155~159' , '인근 도시까지 선호', '조금 마름', null, null, null, '비흡연', '자주 술자리를 가져요', '같은 종교인이면 더 좋아요', '낙천적인,신중한,섹시'); 
INSERT INTO TB_PROFILE
VALUES('user29', '1', 'M', '4살이하 연하', '165~169' , '상관 없음', '보통', null, null, null, '흡연', '어쩔 수 없을 때만 마셔요', '상관 없음', '착한,패셔너블,유머있는'); 
INSERT INTO TB_PROFILE
VALUES('user30', '1', 'M', '2살~3살 연상', '상관 175이상' , '같은 도시의 이성', '통통', null, null, null, '비흡연', '자주 술자리를 가져요', '같은 종교인이면 더 좋아요', '스포티,신중한,터프'); 
INSERT INTO TB_PROFILE
VALUES('user31', '1', 'M', '2살~3살 연상', '175이상' , '인근 도시까지 선호', '스키니', null, null, null, '흡연', '전혀 마시지 않아요', '상관 없음', '창의적인,섬세,유머있는'); 
INSERT INTO TB_PROFILE
VALUES('user32', '1', 'M', '4살이상 연상', '175이상' , '상관 없음', '보통', null, null, null, '비흡연', '어느정도 즐기는 편이에요', '상관 없음', '터프,듬직한,열정적인'); 
INSERT INTO TB_PROFILE
VALUES('user33', '1', 'M', '상관없음', '175이상' , '같은 도시의 이성', '보통', null, null, null, '비흡연', '가끔 마셔요', '같은 종교인이면 더 좋아요', '유머있는,듬직한,착한'); 
INSERT INTO TB_PROFILE
VALUES('user34', '1', 'M', '상관없음', '175이상' , '인근 도시까지 선호', '슬림 탄탄', null, null, null, '비흡연', '자주 술자리를 가져요', '상관 없음', '터프,신중한,섹시'); 
INSERT INTO TB_PROFILE
VALUES('user35', '1', 'M', '4살이상 연상', '175이상' , '같은 도시의 이성', '조금 마름', null, null, null, '비흡연', '어느정도 즐기는 편이에요', '같은 종교인이면 더 좋아요', '낙천적인,신중한,섹시'); 
INSERT INTO TB_PROFILE
VALUES('user36', '1', 'M', '상관없음', '175이상' , '같은 도시의 이성', '슬림 탄탄', null, null, null, '비흡연', '어쩔 수 없을 때만 마셔요', '상관 없음', '스포티,듬직한,패셔너블'); 
INSERT INTO TB_PROFILE
VALUES('user37', '1', 'M', '동갑', '175이상' , '같은 도시의 이성', '보통', null, null, null, '비흡연', '가끔 마셔요', '상관 없음', '스포티,듬직한,패셔너블'); 
INSERT INTO TB_PROFILE
VALUES('user38', '1', 'M', '상관없음', '175이상' , '인근 도시까지 선호', '통통', null, null, null, '흡연', '어느정도 즐기는 편이에요', '상관 없음', '착한,패셔너블,유머있는'); 
INSERT INTO TB_PROFILE
VALUES('user39', '1', 'M', '2살~3살 연상', '175이상' , '같은 도시의 이성', '조금 마름', null, null, null, '비흡연', '전혀 마시지 않아요', '같은 종교인이면 더 좋아요', '스포티,듬직한,패셔너블'); 
INSERT INTO TB_PROFILE
VALUES('user40', '1', 'M', '동갑', '175이상' , '인근 도시까지 선호', '슬림 탄탄', null, null, null, '비흡연', '자주 술자리를 가져요', '상관 없음', '창의적인,섬세,유머있는'); 
INSERT INTO TB_PROFILE
VALUES('user41', '1', 'M', '4살이상 연상', '175이상' , '상관 없음', '스키니', null, null, null, '흡연', '가끔 마셔요', '상관 없음', '스포티,듬직한,패셔너블'); 
INSERT INTO TB_PROFILE
VALUES('user42', '1', 'M', '동갑', '175이상' , '인근 도시까지 선호', '조금 마름', null, null, null, '비흡연', '어쩔 수 없을 때만 마셔요', '상관 없음', '낙천적인,신중한,섹시'); 
INSERT INTO TB_PROFILE
VALUES('user43', '1', 'M', '상관없음', '175이상' , '같은 도시의 이성', '슬림 탄탄', null, null, null, '비흡연', '어느정도 즐기는 편이에요', '같은 종교인이면 더 좋아요', '스포티,듬직한,패셔너블'); 
INSERT INTO TB_PROFILE
VALUES('user44', '1', 'M', '동갑', '175이상' , '같은 도시의 이성', '통통', null, null, null, '비흡연', '어느정도 즐기는 편이에요', '상관 없음', '창의적인,섬세,유머있는'); 
INSERT INTO TB_PROFILE
VALUES('user45', '1', 'M', '4살이상 연상', '175이상' , '상관 없음', '보통', null, null, null, '흡연', '자주 술자리를 가져요', '같은 종교인이면 더 좋아요', '스포티,듬직한,패셔너블'); 
INSERT INTO TB_PROFILE
VALUES('user46', '1', 'M', '상관없음', '175이상' , '같은 도시의 이성', '슬림 탄탄', null, null, null, '비흡연', '가끔 마셔요', '상관 없음', '터프,신중한,섹시'); 
INSERT INTO TB_PROFILE
VALUES('user47', '1', 'M', '2살~3살 연상', '175이상' , '상관 없음', '보통', null, null, null, '비흡연', '자주 술자리를 가져요', '상관 없음', '낙천적인,신중한,섹시'); 
INSERT INTO TB_PROFILE
VALUES('user48', '1', 'M', '상관없음', '175이상' , '같은 도시의 이성', '통통', null, null, null, '흡연', '어느정도 즐기는 편이에요', '상관 없음', '스포티,듬직한,패셔너블'); 
INSERT INTO TB_PROFILE
VALUES('user49', '1', 'M', '4살이상 연상', '175이상' , '같은 도시의 이성', '슬림 탄탄', null, null, null, '비흡연', '자주 술자리를 가져요', '상관 없음', '창의적인,섬세,유머있는'); 
INSERT INTO TB_PROFILE
VALUES('user50', '1', 'M', '2살~3살 연상', '175이상' , '같은 도시의 이성', '통통', null, null, null, '흡연', '가끔 마셔요', '같은 종교인이면 더 좋아요', '착한,패셔너블,유머있는'); 


-- 3. 프로필 사진 테이블
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user01_0.jpg', 'user01', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user01_1.jpg', 'user01', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user01_2.jpg', 'user01', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user02_0.jpg', 'user02', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user02_1.jpg', 'user02', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user02_2.jpg', 'user02', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user03_0.jpg', 'user03', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user03_1.jpg', 'user03', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user03_2.jpg', 'user03', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user04_0.jpg', 'user04', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user04_1.jpg', 'user04', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user04_2.jpg', 'user04', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user05_0.jpg', 'user05', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user05_1.jpg', 'user05', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user05_2.jpg', 'user05', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user06_0.jpg', 'user06', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user06_1.jpg', 'user06', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user06_2.jpg', 'user06', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user07_0.jpg', 'user07', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user07_1.jpg', 'user07', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user07_2.jpg', 'user07', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user08_0.jpg', 'user08', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user08_1.jpg', 'user08', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user08_2.jpg', 'user08', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user09_0.jpg', 'user09', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user09_1.jpg', 'user09', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user09_2.jpg', 'user09', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user10_0.jpg', 'user10', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user10_1.jpg', 'user10', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user10_2.jpg', 'user10', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user11_0.jpg', 'user11', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user11_1.jpg', 'user11', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user11_2.jpg', 'user11', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user12_0.jpg', 'user12', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user12_1.jpg', 'user12', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user12_2.jpg', 'user12', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user13_0.jpg', 'user13', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user13_1.jpg', 'user13', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user13_2.jpg', 'user13', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user14_0.jpg', 'user14', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user14_1.jpg', 'user14', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user14_2.jpg', 'user14', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user15_0.jpg', 'user15', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user15_1.jpg', 'user15', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user15_2.jpg', 'user15', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user16_0.jpg', 'user16', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user16_1.jpg', 'user16', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user16_2.jpg', 'user16', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user17_0.jpg', 'user17', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user17_1.jpg', 'user17', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user17_2.jpg', 'user17', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user18_0.jpg', 'user18', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user18_1.jpg', 'user18', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user18_2.jpg', 'user18', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user19_0.jpg', 'user19', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user19_1.jpg', 'user19', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user19_2.jpg', 'user19', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user20_0.jpg', 'user20', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user20_1.jpg', 'user20', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user20_2.jpg', 'user20', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user21_0.jpg', 'user21', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user21_1.jpg', 'user21', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user21_2.jpg', 'user21', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user22_0.jpg', 'user22', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user22_1.jpg', 'user22', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user22_2.jpg', 'user22', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user23_0.jpg', 'user23', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user23_1.jpg', 'user23', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user23_2.jpg', 'user23', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user24_0.jpg', 'user24', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user24_1.jpg', 'user24', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user24_2.jpg', 'user24', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user25_0.jpg', 'user25', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user25_1.jpg', 'user25', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user25_2.jpg', 'user25', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user26_0.jpg', 'user26', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user26_1.jpg', 'user26', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user26_2.jpg', 'user26', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user27_0.jpg', 'user27', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user27_1.jpg', 'user27', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user27_2.jpg', 'user27', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user28_0.jpg', 'user28', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user28_1.jpg', 'user28', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user28_2.jpg', 'user28', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user29_0.jpg', 'user29', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user29_1.jpg', 'user29', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user29_2.jpg', 'user29', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user30_0.jpg', 'user30', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user30_1.jpg', 'user30', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user30_2.jpg', 'user30', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user31_0.jpg', 'user31', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user31_1.jpg', 'user31', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user31_2.jpg', 'user31', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user32_0.jpg', 'user32', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user32_1.jpg', 'user32', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user32_2.jpg', 'user32', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user33_0.jpg', 'user33', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user33_1.jpg', 'user33', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user33_2.jpg', 'user33', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user34_0.jpg', 'user34', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user34_1.jpg', 'user34', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user34_2.jpg', 'user34', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user35_0.jpg', 'user35', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user35_1.jpg', 'user35', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user35_2.jpg', 'user35', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user36_0.jpg', 'user36', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user36_1.jpg', 'user36', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user36_2.jpg', 'user36', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user37_0.jpg', 'user37', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user37_1.jpg', 'user37', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user37_2.jpg', 'user37', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user38_0.jpg', 'user38', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user38_1.jpg', 'user38', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user38_2.jpg', 'user38', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user39_0.jpg', 'user39', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user39_1.jpg', 'user39', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user39_2.jpg', 'user39', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user40_0.jpg', 'user40', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user40_1.jpg', 'user40', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user40_2.jpg', 'user40', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user41_0.jpg', 'user41', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user41_1.jpg', 'user41', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user41_2.jpg', 'user41', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user42_0.jpg', 'user42', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user42_1.jpg', 'user42', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user42_2.jpg', 'user42', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user43_0.jpg', 'user43', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user43_1.jpg', 'user43', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user43_2.jpg', 'user43', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user44_0.jpg', 'user44', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user44_1.jpg', 'user44', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user44_2.jpg', 'user44', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user45_0.jpg', 'user45', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user45_1.jpg', 'user45', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user45_2.jpg', 'user45', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user46_0.jpg', 'user46', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user46_1.jpg', 'user46', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user46_2.jpg', 'user46', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user47_0.jpg', 'user47', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user47_1.jpg', 'user47', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user47_2.jpg', 'user47', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user48_0.jpg', 'user48', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user48_1.jpg', 'user48', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user48_2.jpg', 'user48', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user49_0.jpg', 'user49', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user49_1.jpg', 'user49', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user49_2.jpg', 'user49', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user50_0.jpg', 'user50', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user50_1.jpg', 'user50', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user50_2.jpg', 'user50', default);



-- 4. 매칭 질문 테이블

-- 5. 매칭 답변 테이블
-- 5. 매칭 답변 테이블
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user01', 1, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user01', 2, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user01', 3, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user01', 4, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user01', 5, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user01', 6, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user01', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user01', 8, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user01', 9, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user01', 10, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user02', 1, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user02', 2, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user02', 3, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user02', 4, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user02', 5, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user02', 6, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user02', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user02', 8, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user02', 9, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user02', 10, 2);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user03', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user03', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user03', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user03', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user03', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user03', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user03', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user03', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user03', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user03', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user04', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user04', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user04', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user04', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user04', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user04', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user04', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user04', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user04', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user04', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user05', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user05', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user05', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user05', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user05', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user05', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user05', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user05', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user05', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user05', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user06', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user06', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user06', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user06', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user06', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user06', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user06', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user06', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user06', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user06', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user07', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user07', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user07', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user07', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user07', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user07', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user07', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user07', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user07', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user07', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user08', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user08', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user08', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user08', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user08', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user08', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user08', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user08', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user08', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user08', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user09', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user09', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user09', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user09', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user09', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user09', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user09', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user09', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user09', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user09', 10, 3);


INSERT INTO TB_MATCHING_ANSWER
VALUES ('user10', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user10', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user10', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user10', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user10', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user10', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user10', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user10', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user10', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user10', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user11', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user11', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user11', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user11', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user11', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user11', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user11', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user11', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user11', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user11', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user12', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user12', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user12', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user12', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user12', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user12', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user12', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user12', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user12', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user12', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user13', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user13', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user13', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user13', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user13', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user13', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user13', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user13', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user13', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user13', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user14', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user14', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user14', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user14', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user14', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user14', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user14', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user14', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user14', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user14', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user15', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user15', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user15', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user15', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user15', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user15', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user15', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user15', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user15', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user15', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user16', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user16', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user16', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user16', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user16', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user16', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user16', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user16', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user16', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user16', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user17', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user17', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user17', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user17', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user17', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user17', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user17', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user17', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user17', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user17', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user18', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user18', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user18', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user18', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user18', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user18', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user18', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user18', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user18', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user18', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user19', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user19', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user19', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user19', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user19', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user19', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user19', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user19', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user19', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user19', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user20', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user20', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user20', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user20', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user20', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user20', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user20', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user20', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user20', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user20', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user21', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user21', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user21', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user21', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user21', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user21', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user21', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user21', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user21', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user21', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user22', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user22', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user22', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user22', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user22', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user22', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user22', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user22', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user22', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user22', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user23', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user23', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user23', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user23', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user23', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user23', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user23', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user23', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user23', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user23', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user24', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user24', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user24', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user24', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user24', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user24', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user24', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user24', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user24', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user24', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user25', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user25', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user25', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user25', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user25', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user25', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user25', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user25', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user25', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user25', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user26', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user26', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user26', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user26', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user26', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user26', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user26', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user26', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user26', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user26', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user27', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user27', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user27', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user27', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user27', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user27', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user27', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user27', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user27', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user27', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user28', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user28', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user28', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user28', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user28', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user28', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user28', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user28', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user28', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user28', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user29', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user29', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user29', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user29', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user29', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user29', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user29', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user29', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user29', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user29', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user30', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user30', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user30', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user30', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user30', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user30', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user30', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user30', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user30', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user30', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user31', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user31', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user31', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user31', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user31', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user31', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user31', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user31', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user31', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user31', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user32', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user32', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user32', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user32', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user32', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user32', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user32', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user32', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user32', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user32', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user33', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user33', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user33', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user33', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user33', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user33', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user33', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user33', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user33', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user33', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user34', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user34', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user34', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user34', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user34', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user34', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user34', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user34', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user34', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user34', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user35', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user35', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user35', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user35', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user35', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user35', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user35', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user35', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user35', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user35', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user36', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user36', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user36', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user36', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user36', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user36', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user36', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user36', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user36', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user36', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user37', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user37', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user37', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user37', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user37', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user37', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user37', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user37', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user37', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user37', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user38', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user38', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user38', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user38', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user38', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user38', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user38', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user38', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user38', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user38', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user39', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user39', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user39', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user39', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user39', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user39', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user39', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user39', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user39', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user39', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user40', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user40', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user40', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user40', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user40', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user40', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user40', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user40', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user40', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user40', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user41', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user41', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user41', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user41', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user41', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user41', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user41', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user41', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user41', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user41', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user42', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user42', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user42', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user42', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user42', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user42', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user42', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user42', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user42', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user42', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user43', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user43', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user43', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user43', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user43', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user43', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user43', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user43', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user43', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user43', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user44', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user44', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user44', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user44', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user44', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user44', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user44', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user44', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user44', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user44', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user45', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user45', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user45', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user45', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user45', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user45', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user45', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user45', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user45', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user45', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user46', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user46', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user46', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user46', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user46', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user46', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user46', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user46', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user46', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user46', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user47', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user47', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user47', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user47', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user47', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user47', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user47', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user47', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user47', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user47', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user48', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user48', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user48', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user48', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user48', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user48', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user48', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user48', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user48', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user48', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user49', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user49', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user49', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user49', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user49', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user49', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user49', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user49', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user49', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user49', 10, 3);

INSERT INTO TB_MATCHING_ANSWER
VALUES ('user50', 1, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user50', 2, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user50', 3, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user50', 4, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user50', 5, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user50', 6, 3);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user50', 7, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user50', 8, 1);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user50', 9, 2);
INSERT INTO TB_MATCHING_ANSWER
VALUES ('user50', 10, 3);

-- 6. 메시지 테이블
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user11', 'user44', '안녕', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user22', 'user50', '안녕', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user33', 'user22', '안녕', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user47', 'user44', '안녕', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user37', 'user11', '안녕', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user44', 'user25', '안녕', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user40', 'user19', '안녕', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user24', 'user11', '안녕', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user44', 'user11', '안녕', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user12', 'user34', '안녕', '2017-12-31', 1, 1);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user34', 'user27', '안녕', '2018-01-01', 1, 1);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user22', 'user46', '안녕', '2017-12-29', 1, 1);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user11', 'user23', '안녕', '2018-01-01', 1, 1);

-- 7. 별점 테이블

-- 8. 출석 테이블

-- 9. 결제 테이블

-- 10. 별사탕 사용내역 테이블

-- 11. 신고 테이블
INSERT INTO TB_REPORT VALUES (1, '욕설/비난', 'user11', 'user22', '신고상세내용입니다.\r\n신고상세내용이에요요요용요요\r\n그래그래그래', default);
INSERT INTO TB_REPORT VALUES (2, '광고(스팸)', 'user33', 'user44', '신고상세내용 적는 곳222222222222', 1);
INSERT INTO TB_REPORT VALUES (3, '도배', 'user11', 'user33', '신고상세내용 적는 곳33333333333333', default);
INSERT INTO TB_REPORT VALUES (4, '부적절한 게시글', 'user23', 'user11', '신고상세내용 적는 곳444444444444444', default);
INSERT INTO TB_REPORT VALUES (5, '욕설/비난', 'user04', 'user29', '신고상세내용 적는 곳5555555555555', default);
INSERT INTO TB_REPORT VALUES (6, '욕설/비난', 'user09', 'user35', '신고상세내용 적는 곳666666666666666', default);
INSERT INTO TB_REPORT VALUES (7, '욕설/비난', 'user20', 'user39', '신고상세내용입니다.\r\n신고상세내용이에요요요용요요\r\n그래그래그래', default);

-- 12. 설문조사 테이블
INSERT INTO TB_POLL VALUES('1', '내가 선택할 거절 방법은?' ,'0', '17/12/13', '17/12/13', '연란자체를 원.천.차.단', '돌직구로 마음에 안든다고 얘기한다', '느리게 답장하다가 잠수');
INSERT INTO TB_POLL VALUES('2', '고백타이밍을 확신할 수 있는 시그널은?', '0', '17/12/13', '17/12/13', '손잡기 이상의 스킨쉽', '밤중에 통화', '특별한 장소에서의 데이트(칵테일바/놀이공원)');
INSERT INTO TB_POLL VALUES('3', '어장관리로 걱정되는 경우는?', '0', '17/12/13', '17/12/13', '외모가 평균이상인 경우', '본인이 편할때만 연락이 되는 경우', '먼저 보자는 연락이 없는 경우');
INSERT INTO TB_POLL VALUES('4', '내가 제일 극혐하는 버릇은?', '0', '17/12/13', '17/12/13', '밥먹을때 쩝쩝 소리내며 먹기', '앉아있을때 다리를 격하게 떨기', '틈만나면 땅꺼지듯이 한숨쉬기');
INSERT INTO TB_POLL VALUES('5', '사귀기 전 잠자리를 갖게 되버린 우리... 이제 우리 사이는?', '0', '17/12/13', '17/12/13', '오늘부터 1일!', '잠자리가 상관이 있나요? 아직 썸이죠!', '이제 얼굴도 못볼거 같아요..');
INSERT INTO TB_POLL VALUES('6', '내 연인의 과거, 뭐가 제일 궁금하세요?', '0', '17/12/13', '17/12/13', '전여친/남친이랑은 왜 헤어진거야?', '마지막 연애는 언제야? 누군데...?', '첫경험은 언제했어?? 누구랑 했어...?');
INSERT INTO TB_POLL VALUES('7', '솔로로서 공감되는 특징은?', '0', '17/12/13', '17/12/13', '사라진 연애세포', '자신감 하락', '혼자 앞서나가는 착각');
INSERT INTO TB_POLL VALUES('8', '소개팅, 몇 시에 만나는게 좋아요?', '0', '17/12/13', '17/12/13', '많이 늦지 않은 저녁시간대', '점심과 저녁 사이 3~5시', '하루 중 가장 밝은때,정오');
INSERT INTO TB_POLL VALUES('9', '콩깍지가 나에게 미치는 영향 1위는?', '0', '17/12/13', '17/12/13', '뭐든 다 주고 싶고, 돈이 아깝지 않다.', '함께라면 싫어하던 것도 즐겁다.', '단점이 전혀 보이지 않는다.');
INSERT INTO TB_POLL VALUES('10', '내 애인에게 없었으면 하는 이성친구는?', '0', '17/12/13', '17/12/13', '애인의 입에서 자주 언급되는 친구', '데이트에 눈치 없이 자주 나타나는 친구', '어렸을때부터 알고 지냈던 소꿉친구');
INSERT INTO TB_POLL VALUES('11', '내가 만나고 싶은 이성 스타일은?', '0', '17/12/13', '17/12/13', '나에게 집중하는 솔직하고 믿음직한 곰', '어디로 통통 튈지 모르는 여우/늑대', '둘다 아닌듯 둘다 맞는듯한 너구리');

-- 13.매칭 유저 테이블
 insert into TB_MATCHING_QUESTION values(1,'연애하고싶은 스타일을 선택해주세요','연애를 한번도 하지않은사람','한두번 연애하본사람','연애경험이 풍부한사람');
    insert into TB_MATCHING_QUESTION values(2,'다음 보기 중 데이트에서 가장 중요하게 보는 것은 무엇인가요?','분위기','돈','시간');
    insert into TB_MATCHING_QUESTION values(3,'좋아하는 음식 스타일','한식','양식','중식');
    insert into TB_MATCHING_QUESTION values(4,'평균 수면시간은?','6시간미만','6시간이상 8시간 미만','8시간 이상');
    insert into TB_MATCHING_QUESTION values(5,'강아지파?고양이파?','강아지','고양이','어느쪽도 아니다');
    insert into TB_MATCHING_QUESTION values(6,'해외 여행을 간다면 어디로 가고싶나요','동남아','유럽','북아메리카');
    insert into TB_MATCHING_QUESTION values(7,'본인이 생각하는 하루 평균 데이트비용은?','5만원 미만','5만원 이상 10만원 미만','10만원 이상');
    insert into TB_MATCHING_QUESTION values(8,'1+1?','2','긔요미','또하나의 1');
    insert into TB_MATCHING_QUESTION values(9,'사귀고싶은 스타일은?','여우같은 애교쟁이 애인','친구같은 애인','곰같은 믿음직한 애인');
    insert into TB_MATCHING_QUESTION values(10,'만약 로또에 당첨되면 하고싶은 것은?','불우이웃을 위한 기부','사치와 향락','부모님께 효도');
      
-- 14. 설문조사 답변 테이블
INSERT INTO TB_POLL_ANSWER VALUES('user11','1','1'); 
INSERT INTO TB_POLL_ANSWER VALUES('user22','2','2'); 
INSERT INTO TB_POLL_ANSWER VALUES('user22','3','3'); 
-- 15. 공지사항 테이블
INSERT INTO TB_NOTICE VALUES(1, '12/27 첫 공지사항', '안녕하세요 연애의 발견입니다.', sysdate, DEFAULT);
INSERT INTO TB_NOTICE VALUES(2, '두번째 공지사항', '안녕하세요 연애의 발견입니다.', sysdate, DEFAULT);
INSERT INTO TB_NOTICE VALUES(3, '세번째 공지사항', '안녕하세요 연애의 발견입니다.', sysdate, DEFAULT);
INSERT INTO TB_NOTICE VALUES(4, '네번째 공지사항', '안녕하세요 연애의 발견입니다.', sysdate, DEFAULT);
INSERT INTO TB_NOTICE VALUES(5, '다섯번째 공지사항', '안녕하세요 연애의 발견입니다.', sysdate, DEFAULT);
INSERT INTO TB_NOTICE VALUES(6, '여섯번째 공지사항', '안녕하세요 연애의 발견입니다.', sysdate, DEFAULT);
INSERT INTO TB_NOTICE VALUES(7, '일곱번째 공지사항', '안녕하세요 연애의 발견입니다.', sysdate, DEFAULT);
INSERT INTO TB_NOTICE VALUES(8, '여덟번째 공지사항', '안녕하세요 연애의 발견입니다.', sysdate, DEFAULT);
INSERT INTO TB_NOTICE VALUES(9, '아홉번째 공지사항', '안녕하세요 연애의 발견입니다.', sysdate, DEFAULT);
INSERT INTO TB_NOTICE VALUES(10, '열번째 공지사항', '안녕하세요 연애의 발견입니다.', sysdate, DEFAULT);

-- 16. 자유 게시판 테이블
INSERT INTO TB_FREE
VALUES (TB_FREE_SEQ.NEXTVAL, '새해 복 많이 받으세요', '여우', '다들 새해 복 많이많이 받으세요', DEFAULT, DEFAULT, 'false');
INSERT INTO TB_FREE
VALUES (TB_FREE_SEQ.NEXTVAL, '복 많이 받으세요', '너구리', '다들 새해 복 많이 받아라', DEFAULT, DEFAULT, 'true');
INSERT INTO TB_FREE
VALUES (TB_FREE_SEQ.NEXTVAL, '여러분 새해 복 많이 받으세요', '관리자', '다들 새해 복 많이많이 받으세요', DEFAULT, DEFAULT, 'false');

-- 17. FAQ 테이블
INSERT INTO TB_FAQ
VALUES (1, '결제', '결제가 안됩니다.', '답변답변답변답변', '관리자', DEFAULT);
INSERT INTO TB_FAQ
VALUES (2, '계정', '회원가입은 어떻게 하나요?', '답변답변답변답변', '관리자', DEFAULT);
INSERT INTO TB_FAQ
VALUES (3, '계정', '아이디를 찾을 수 없습니다.', '답변답변답변답변', '관리자', DEFAULT);
INSERT INTO TB_FAQ
VALUES (4, '게시판', '글이 안보입니다.', '답변답변답변답변답변', '관리자', DEFAULT);
INSERT INTO TB_FAQ
VALUES (5, '결제', '결제는 어디서 하나요?', '답변답변답변답변답변답변', '관리자', DEFAULT);
INSERT INTO TB_FAQ
VALUES (6, '게시판', '자유게시판은 무엇인가요?', '답변답변답변답변답변', '관리자', DEFAULT);
INSERT INTO TB_FAQ
VALUES (7, '게시판', '자주묻는질문 7', '답변답변답변답변답변답변', '관리자', DEFAULT);
INSERT INTO TB_FAQ
VALUES (8, '이벤트', '출석체크는 무엇인가요?', '답변답변답변답변답변답변', '관리자', DEFAULT);
INSERT INTO TB_FAQ
VALUES (9, '이벤트', '별사탕은 어떻게 얻나요?', '답변답변답변답변답변답변', '관리자', DEFAULT);
INSERT INTO TB_FAQ
VALUES (10, '결제', '자주묻는질문 10', '답변답변답변답변답변답변', '관리자', DEFAULT);
INSERT INTO TB_FAQ
VALUES (11, '결제', '결제확인은 어디서 하나요?', '답변답변답변답변답변답변', '관리자', DEFAULT);
INSERT INTO TB_FAQ
VALUES (12, '프로필', '프로필 사진은 어떻게 등록하나요?', '답변답변답변답변답변답변답변', '관리자', DEFAULT);
INSERT INTO TB_FAQ
VALUES (13, '프로필', '사진 변경 가능한가요?', '답변답변답변답변답변답변답변', '관리자', DEFAULT);
INSERT INTO TB_FAQ
VALUES (14, '매칭', '매칭은 어떻게 하나요?', '답변답변답변답변답변답변답변', '관리자', DEFAULT);
INSERT INTO TB_FAQ
VALUES (15, '프로필', '프로필이란 무엇인가요?', '답변답변답변답변답변답변답변', '관리자', DEFAULT);
INSERT INTO TB_FAQ
VALUES (16, '매칭', '매칭완료시 어떻게 되나요?', '답변답변답변답변답변답변답변', '관리자', DEFAULT);
INSERT INTO TB_FAQ
VALUES (17, '프로필', '프로필 항목 다 채워야 하는것인가요?', '답변답변답변답변답변답변답변', '관리자', DEFAULT);

-- 18. 일대일 문의 테이블
INSERT INTO TB_INQ
VALUES (TB_INQ_SEQ.NEXTVAL, '매칭 문의드립니다.', '매칭 애니메이션 너무 잘만드셨어요!', DEFAULT, NULL, NULL, 'user11', 'admin', 0);
INSERT INTO TB_INQ
VALUES (TB_INQ_SEQ.NEXTVAL, '출석체크 문의합니다.', '하루에 포인트 얼마나 주나요?', DEFAULT, NULL, NULL, 'user22', 'admin', 0);
INSERT INTO TB_INQ
VALUES (TB_INQ_SEQ.NEXTVAL, '매칭 질문', '매칭 완료시 메시지 보내는건 무료인가요?', DEFAULT, NULL, NULL, 'user33', 'admin', 0);
INSERT INTO TB_INQ
VALUES (TB_INQ_SEQ.NEXTVAL, 'RE: 매칭 문의드립니다.', '안녕하세요 고객님 findlove 입니다. 앞으로 더 발전하는 모습을 보여드리도록 노력하겠습니다. 항상 findlove를 이용해주셔서 감사합니다.', DEFAULT, NULL, NULL, 'admin', 'user11', 1);
INSERT INTO TB_INQ
VALUES (TB_INQ_SEQ.NEXTVAL, 'RE: 출석체크 문의합니다.', '안녕하세요 고객님 findlove 입니다. 하루 출석체크시 지급해드리는 포인트는 100p로 한달 연속 출첵시 추가로 1000p를 더 지급해드리고 있습니다. 항상 findlove를 이용해주셔서 감사합니다.', DEFAULT, NULL, NULL, 'admin', 'user22', 2);
INSERT INTO TB_INQ
VALUES (TB_INQ_SEQ.NEXTVAL, 'RE: QnA 매칭 질문', '안녕하세요 고객님 findlove 입니다. QnA 매칭 성공시 메세지 보내는 무료로 제공해 드리고있습니다. 항상 findlove를 이용해주셔서 감사합니다.', DEFAULT, NULL, NULL, 'admin', 'user33', 3);
INSERT INTO TB_INQ
VALUES (TB_INQ_SEQ.NEXTVAL, '문의드립니다222222', '아아아아아아아아아아아', DEFAULT, NULL, NULL, 'user11', 'admin', 0);
INSERT INTO TB_INQ
VALUES (TB_INQ_SEQ.NEXTVAL, '문의드립니다3333', '아efefe', DEFAULT, NULL, NULL, 'user11', 'admin', 0);

-- 19. 자유게시판 댓글 테이블


COMMIT;
