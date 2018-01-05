
/* DB 접근 계정 생성 및 권한 설정 */
--CREATE USER final
--IDENTIFIED BY final;
--GRANT CONNECT, RESOURCE TO final;

/*테이블 삭제
DROP TABLE TB_FAQ CASCADE  CONSTRAINTS;
DROP TABLE TB_FREE CASCADE CONSTRAINTS;
DROP TABLE TB_NOTICE;
DROP TABLE TB_POLL_ANSWER;
DROP TABLE TB_POLL;
DROP TABLE TB_REPORT;
DROP TABLE TB_KONPEITO_BREAKDOWN;
DROP TABLE TB_PAYMENT;
DROP TABLE TB_ATTENDANCE;
DROP TABLE TB_GRADE;
DROP TABLE TB_MESSAGE;
DROP TABLE TB_MATCHING_ANSWER;
DROP TABLE TB_MATCHING_QUESTION;
DROP TABLE TB_PROFILE_PICTURE;
DROP TABLE TB_PROFILE;
DROP TABLE TB_USER CASCADE  CONSTRAINTS;
DROP TABLE TB_INQ CASCADE CONSTRAINTS;
DROP TABLE TB_MATCH_USER;
DROP TABLE TB_FREE_REPLY CASCADE  CONSTRAINTS;
DROP TABLE TB_SESSION_INFO;
DROP SEQUENCE TB_FREE_SEQ;

*/
 -- 자유게시판 시퀀스 테이블

CREATE SEQUENCE TB_FREE_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
ORDER;
 
 -- 0. 세션 정보
 CREATE TABLE TB_SESSION_INFO(
      Session_Key VARCHAR2(100) primary key,
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
CREATE TABLE TB_FREE (
  Free_NO NUMBER,
  Free_Title VARCHAR2(50) NOT NULL,
  Free_Writer VARCHAR2(30) NOT NULL,
  Free_Content VARCHAR2(2000) NOT NULL,
  Free_DT DATE DEFAULT SYSDATE,
  Free_Read_CNT NUMBER DEFAULT 0,
  
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
CREATE TABLE TB_INQ(
INQ_NO NUMBER, --일대일 문의 번호
INQ_TITLE VARCHAR2(50) NOT NULL, --일대일 문의 제목
INQ_CONTENT LONG, --일대일 문의 내용
INQ_DATE DATE DEFAULT SYSDATE, --일대일 문의 작성일자
INQ_ORIGINAL_FILENAME VARCHAR2(100) DEFAULT NULL, --일대일 문의 원래 첨부파일명
INQ_RENAME_FILENAME VARCHAR2(100) DEFAULT NULL, --일대일 문의 바뀐 첨부파일명
INQ_WRITER VARCHAR2(15) NOT NULL, --일대일 문의 보내는 유저
INQ_RECIVER VARCHAR2(15), --일대일 문의 받는 유저

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


----------------- 샘플데이터 -------------------
-- 1. 사용자 테이블
INSERT INTO TB_USER VALUES('admin', 'admin', '관리자', '관리자', '1', 'admin@naver.com', '010-1234-5678', 1000, 1000, 'M', default, '2017-11-12', default, null); 
INSERT INTO TB_USER VALUES('user11', 'pass11', '윤찬호', '너구리', '1', 'raccoon@naver.com', '010-1234-1111', 1000, 1000, 'D', 3, '2017-12-12', default, null); 
INSERT INTO TB_USER VALUES('user22', 'pass22', '손정한', '돼지', '1', 'pig22@naver.com', '010-1234-2222', default, default, 'P', 3.5, '2017-10-01', default, null); 
INSERT INTO TB_USER VALUES('user33', 'pass33', '김지훈', '사육사', '1', 'keeper@naver.com', '010-1234-3333', default, default, 'G', 3.5, '2017-12-19', default, null); 
INSERT INTO TB_USER VALUES('user44', 'pass44', '남찬우', '나무', '2', 'tree@gmail.com', '010-1234-4444', default, default, 'S', 4, '2017-02-09', '2017-05-10', null); 
INSERT INTO TB_USER VALUES('user55', 'pass55', '조남훈', '곰', '3', 'bear55@naver.com', '010-1234-5555', default, default, 'B', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user66', 'pass66', '김혜정', '쥐', '2', 'mouse@naver.com', '010-1234-6666', default, default, 'G', 4, '2017-06-06', '2017-06-06', null); 
INSERT INTO TB_USER VALUES('user77', 'pass77', '김여진', '여우', '4', 'fox77@naver.com', '010-1234-7777', default, default, 'G', 4.5, '2017-10-10', '2017-10-10', null); 
INSERT INTO TB_USER VALUES('user88', 'pass88', '김선진', '선진', '0', 'sun88@naver.com', '010-1234-8888', default, default, default, 3.5, default, default, null); 
INSERT INTO TB_USER VALUES('user99', 'pass99', '김유진', '유진', '0', 'youjin99@naver.com', '010-1234-9999', default, default, default, 1.5, default, default, null); 
INSERT INTO TB_USER VALUES('user00', 'pass00', '김혜진', '지니', '0', 'genie00@naver.com', '010-1234-0000', default, default, default, 0.5, default, default, null); 

INSERT INTO TB_USER VALUES('user12', 'pass11', '윤찬호2', '너구리2', '1', 'raccoon@naver.com', '010-1234-1111', default, default, 'D', 3, '2017-12-12', default, null); 
INSERT INTO TB_USER VALUES('user23', 'pass22', '손정한2', '돼지2', '1', 'pig22@naver.com', '010-1234-2222', default, default, 'P', 3.5, '2017-10-01', default, null); 
INSERT INTO TB_USER VALUES('user34', 'pass33', '김지훈2', '사육사2', '1', 'keeper@naver.com', '010-1234-3333', default, default, 'G', 3.5, '2017-12-19', default, null); 
INSERT INTO TB_USER VALUES('user45', 'pass44', '남찬우2', '나무2', '2', 'tree@gmail.com', '010-1234-4444', default, default, 'S', 4, '2017-02-09', '2017-05-10', null); 
INSERT INTO TB_USER VALUES('user56', 'pass55', '조남훈2', '곰2', '3', 'bear55@naver.com', '010-1234-5555', default, default, 'B', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user67', 'pass66', '김혜정2', '쥐2', '2', 'mouse@naver.com', '010-1234-6666', default, default, 'G', 4, '2017-06-06', '2017-06-06', null); 
INSERT INTO TB_USER VALUES('user78', 'pass77', '김여진2', '여우2', '4', 'fox77@naver.com', '010-1234-7777', default, default, 'G', 4.5, '2017-10-10', '2017-10-10', null); 
INSERT INTO TB_USER VALUES('user89', 'pass88', '김선진2', '선진2', '0', 'sun88@naver.com', '010-1234-8888', default, default, default, 3.5, default, default, null); 
INSERT INTO TB_USER VALUES('user90', 'pass99', '김유진2', '유진2', '0', 'youjin99@naver.com', '010-1234-9999', default, default, default, 1.5, default, default, null); 

-- 2. 사용자(또는 이상형) 프로필
INSERT INTO TB_PROFILE
VALUES ('user11', '0', 'M', 25, 182, '서울', '조금 마름', '4년대졸','회사원', 'O', '비흡연', '전혀 마시지 않아요', '기독교', '낙천적인,섬세,스포티');
INSERT INTO TB_PROFILE
VALUES ('user22', '0', 'M', 25, 177, '부산', '보통', '4년대졸','회사원', 'O', '비흡연', '어쩔 수 없을 때만 마셔요', '불교', '대범,도도한,창의적인');
INSERT INTO TB_PROFILE
VALUES ('user33', '0', 'M', 25, 188, '광주', '슬림 탄탄', '4년대졸','회사원', 'O', '비흡연', '가끔 마셔요', '무교','열정적인,유머있는,착한');
INSERT INTO TB_PROFILE
VALUES ('user44', '0', 'M', 21, 170, '대구', '통통', '4년대졸','회사원', 'A', '흡연', '어느정도 즐기는 편이에요', '천주교', '패셔너블,지적인,귀여운');
INSERT INTO TB_PROFILE
VALUES ('user55', '0', 'M', 22, 177, '대전', '보통', '4년대졸','회사원', 'AB', '비흡연', '자주 술자리를 가져요', '무교', '터프,섹시,스포티');
INSERT INTO TB_PROFILE
VALUES ('user66', '0', 'F', 23, 160, '부산', '보통', '4년대졸','회사원', 'B', '흡연', '어쩔 수 없을 때만 마셔요', '무교', '신중한,상냥,유머있는');
INSERT INTO TB_PROFILE
VALUES ('user77', '0', 'F', 24, 155, '서울', '조금 통통', '4년대졸','회사원', 'O', '비흡연', '가끔 마셔요', '무교', '착한,듬직한,패셔너블');
INSERT INTO TB_PROFILE
VALUES ('user88', '0', 'F', 28, 172, '경기', '스키니', '4년대졸', '자영업', 'B', '흡연', '어느정도 즐기는 편이에요', '불교', '낙천적인,대범,열정적인');
INSERT INTO TB_PROFILE
VALUES ('user99', '0', 'F', 24, 150, '강원', '보통', '4년대졸', '프리랜서', 'AB', '비흡연', '자주 술자리를 가져요', '무교', '패셔너블,유머있는,낙천적인');
INSERT INTO TB_PROFILE
VALUES ('user00', '0', 'F', 22, 157, '경기-수원 인근', '스키니', '4년대졸', '대학생', 'B', '흡연', '자주 술자리를 가져요', '기독교', '터프,유머있는,착한');

INSERT INTO TB_PROFILE
VALUES ('user12', '0', 'F', 25, 182, '서울', '조금 마름', '4년대졸','회사원', 'O', '비흡연', '전혀 마시지 않아요', '기독교', '낙천적인,섬세,스포티');
INSERT INTO TB_PROFILE
VALUES ('user23', '0', 'F', 35, 177, '부산', '보통', '4년대졸','회사원', 'O', '비흡연', '어쩔 수 없을 때만 마셔요', '불교', '대범,도도한,창의적인');
INSERT INTO TB_PROFILE
VALUES ('user34', '0', 'F', 25, 188, '광주', '슬림 탄탄', '4년대졸','회사원', 'O', '비흡연', '가끔 마셔요', '무교','열정적인,유머있는,착한');
INSERT INTO TB_PROFILE
VALUES ('user45', '0', 'F', 19, 170, '대구', '통통', '4년대졸','회사원', 'A', '흡연', '어느정도 즐기는 편이에요', '천주교', '패셔너블,지적인,귀여운');
INSERT INTO TB_PROFILE
VALUES ('user56', '0', 'F', 22, 177, '대전', '보통', '4년대졸','회사원', 'AB', '비흡연', '자주 술자리를 가져요', '무교', '터프,섹시,스포티');
INSERT INTO TB_PROFILE
VALUES ('user67', '0', 'F', 33, 160, '부산', '보통', '4년대졸','회사원', 'B', '흡연', '어쩔 수 없을 때만 마셔요', '무교', '신중한,상냥,유머있는');
INSERT INTO TB_PROFILE
VALUES ('user78', '0', 'F', 24, 155, '서울', '조금 통통', '4년대졸','회사원', 'O', '비흡연', '가끔 마셔요', '무교', '착한,듬직한,패셔너블');
INSERT INTO TB_PROFILE
VALUES ('user89', '0', 'F', 28, 172, '경기', '스키니', '4년대졸', '자영업', 'B', '흡연', '어느정도 즐기는 편이에요', '불교', '낙천적인,대범,열정적인');
INSERT INTO TB_PROFILE
VALUES ('user90', '0', 'F', 24, 150, '강원', '보통', '4년대졸', '프리랜서', 'AB', '비흡연', '자주 술자리를 가져요', '무교', '패셔너블,유머있는,낙천적인');

INSERT INTO TB_PROFILE
VALUES('user11', '1', 'F', '4살이하 연하', '상관없음' , '같은 도시의 이성', '스키니', null, null, null, '비흡연', '어느정도 즐기는 편이에요', '같은 종교인이면 더 좋아요', '낙천적인,신중한,스포티'); 
INSERT INTO TB_PROFILE
VALUES('user22', '1', 'F', '상관없음', '154이하' , '상관 없음', '조금 마름', null, null, null, '비흡연', '가끔 마셔요', '상관 없음', '낙천적인,신중한,패셔너블'); 
INSERT INTO TB_PROFILE
VALUES('user33', '1', 'F', '동갑', '155~159' , '인근 도시까지 선호', '조금 마름', null, null, null, '비흡연', '자주 술자리를 가져요', '같은 종교인이면 더 좋아요', '낙천적인,신중한,섹시'); 
INSERT INTO TB_PROFILE
VALUES('user44', '1', 'F', '4살이하 연하', '165~169' , '상관 없음', '보통', null, null, null, '흡연', '어쩔 수 없을 때만 마셔요', '상관 없음', '착한,패셔너블,유머있는'); 
INSERT INTO TB_PROFILE
VALUES('user55', '1', 'F', '2살~3살 연상', '상관 175이상' , '같은 도시의 이성', '통통', null, null, null, '비흡연', '자주 술자리를 가져요', '같은 종교인이면 더 좋아요', '스포티,신중한,터프'); 
INSERT INTO TB_PROFILE
VALUES('user66', '1', 'M', '2살~3살 연상', '175이상' , '인근 도시까지 선호', '스키니', null, null, null, '흡연', '전혀 마시지 않아요', '상관 없음', '창의적인,섬세,유머있는'); 
INSERT INTO TB_PROFILE
VALUES('user77', '1', 'M', '4살이상 연상', '175이상' , '같은 도시의 이성', '보통', null, null, null, '비흡연', '어느정도 즐기는 편이에요', '상관 없음', '터프,듬직한,열정적인'); 
INSERT INTO TB_PROFILE
VALUES('user88', '1', 'M', '상관없음', '175이상' , '같은 도시의 이성', '보통', null, null, null, '비흡연', '가끔 마셔요', '같은 종교인이면 더 좋아요', '유머있는,듬직한,착한'); 
INSERT INTO TB_PROFILE
VALUES('user99', '1', 'M', '상관없음', '175이상' , '인근 도시까지 선호', '슬림 탄탄', null, null, null, '비흡연', '자주 술자리를 가져요', '상관 없음', '터프,신중한,섹시'); 
INSERT INTO TB_PROFILE
VALUES('user00', '1', 'M', '동갑', '175이상' , '같은 도시의 이성', '보통', null, null, null, '비흡연', '어느정도 즐기는 편이에요', '상관 없음', '스포티,듬직한,패셔너블'); 


-- 3. 프로필 사진 테이블
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user11_0.jpg', 'user11', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user11_1.jpg', 'user11', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user11_2.jpg', 'user11', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user22_0.jpg', 'user22', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user22_1.jpg', 'user22', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user22_2.jpg', 'user22', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user33_0.jpg', 'user33', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user33_1.jpg', 'user33', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user33_2.jpg', 'user33', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user44_0.jpg', 'user44', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user44_1.jpg', 'user44', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user44_2.jpg', 'user44', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user55_0.jpg', 'user55', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user55_1.jpg', 'user55', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user55_2.jpg', 'user55', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user66_0.jpg', 'user66', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user66_1.jpg', 'user66', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user66_2.jpg', 'user66', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user77_0.jpg', 'user77', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user77_1.jpg', 'user77', default);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user77_2.jpg', 'user77', default);

INSERT INTO TB_PROFILE_PICTURE
VALUES ('user12_0.jpg', 'user12', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user23_0.jpg', 'user23', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user34_0.jpg', 'user34', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user45_0.jpg', 'user45', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user56_0.jpg', 'user56', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user67_0.jpg', 'user67', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user78_0.jpg', 'user78', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user89_0.jpg', 'user89', 1);
INSERT INTO TB_PROFILE_PICTURE
VALUES ('user90_0.jpg', 'user90', 1);

-- 4. 매칭 질문 테이블

-- 5. 매칭 답변 테이블

-- 6. 메시지 테이블
INSERT INTO TB_MESSAGE
VALUES (1, 'user11', 'user44', '안녕', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (2, 'user22', 'user55', '안녕', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (3, 'user33', 'user22', '안녕', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (4, 'user77', 'user44', '안녕', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (5, 'user77', 'user11', '안녕', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (6, 'user44', 'user11', '안녕', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (7, 'user44', 'user11', '안녕', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (8, 'user44', 'user11', '안녕', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (9, 'user44', 'user11', '안녕', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (10, 'user12', 'user34', '안녕', '2017-12-31', 1, 1);
INSERT INTO TB_MESSAGE
VALUES (11, 'user34', 'user55', '안녕', '2018-01-01', 1, 1);
INSERT INTO TB_MESSAGE
VALUES (12, 'user99', 'user45', '안녕', '2017-12-29', 1, 1);
INSERT INTO TB_MESSAGE
VALUES (13, 'user88', 'user78', '안녕', '2018-01-01', 1, 1);

-- 7. 별점 테이블

-- 8. 출석 테이블

-- 9. 결제 테이블

-- 10. 별사탕 사용내역 테이블

-- 11. 신고 테이블
INSERT INTO TB_REPORT VALUES (1, '욕설/비난', 'user11', 'user22', '신고상세내용입니다.\r\n신고상세내용이에요요요용요요\r\n그래그래그래', default);
INSERT INTO TB_REPORT VALUES (2, '광고(스팸)', 'user33', 'user55', '신고상세내용 적는 곳222222222222', 1);
INSERT INTO TB_REPORT VALUES (3, '도배', 'user11', 'user33', '신고상세내용 적는 곳33333333333333', default);
INSERT INTO TB_REPORT VALUES (4, '부적절한 게시글', 'user77', 'user11', '신고상세내용 적는 곳444444444444444', default);
INSERT INTO TB_REPORT VALUES (5, '욕설/비난', 'user44', 'user55', '신고상세내용 적는 곳5555555555555', default);
INSERT INTO TB_REPORT VALUES (6, '욕설/비난', 'user11', 'user66', '신고상세내용 적는 곳666666666666666', default);
INSERT INTO TB_REPORT VALUES (7, '욕설/비난', 'user22', 'user33', '신고상세내용입니다.\r\n신고상세내용이에요요요용요요\r\n그래그래그래', default);

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
VALUES (TB_FREE_SEQ.NEXTVAL, '새해 복 많이 받으세요', '여우', '다들 새해 복 많이많이 받으세요', DEFAULT, DEFAULT);
INSERT INTO TB_FREE
VALUES (TB_FREE_SEQ.NEXTVAL, '복 많이 받으세요', '너구리', '다들 새해 복 많이 받아라', DEFAULT, DEFAULT);
INSERT INTO TB_FREE
VALUES (TB_FREE_SEQ.NEXTVAL, '여러분 새해 복 많이 받으세요', '관리자', '다들 새해 복 많이많이 받으세요', DEFAULT, DEFAULT);

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

-- 19. 자유게시판 댓글 테이블


COMMIT;