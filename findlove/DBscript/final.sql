/* DB 접근 계정 생성 및 권한 설정 */
--CREATE USER final
--IDENTIFIED BY final;
--GRANT CONNECT, RESOURCE TO final;

/*테이블 삭제
DROP TABLE TB_FAQ;
DROP TABLE TB_FREE;
DROP TABLE TB_NOTICE;
DROP TABLE TB_POLL_ANSWER;
DROP TABLE TB_POLL_QUESTION;
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
DROP TABLE TB_USER;
DROP TABLE TB_INQ CASCADE  CONSTRAINTS;
*/
 
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
  CONSTRAINT CHK_RANK CHECK (Rank_GB IN ('G', 'D', 'P', 'G', 'S', 'B'))
);
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
COMMENT ON COLUMN TB_USER.Rank_GB IS '관리자 및 등급 구분(관리자(G),일반회원(D:다이아/P:플래티넘/G:골드/S:실버/B:브론즈))';
COMMENT ON COLUMN TB_USER.Grade_AVG IS '평점';
COMMENT ON COLUMN TB_USER.Enroll_DT IS '가입일';
COMMENT ON COLUMN TB_USER.Latest_Access_DT IS '최근 접속일';
COMMENT ON COLUMN TB_USER.Delete_DT IS '삭제일';

-- 2. 사용자(또는 이상형) 프로필
CREATE TABLE TB_PROFILE (
  User_ID VARCHAR2(30),
  Target_GB CHAR(1) DEFAULT '0',
  Gender CHAR(1),
  Age NUMBER,
  Height NUMBER,
  Weight NUMBER,
  Area VARCHAR2(100),
  Hobby VARCHAR2(100),
  Achievement VARCHAR2(30),
  Blood_Type VARCHAR2(5),
  Smoking VARCHAR2(30),
  Drinking VARCHAR2(30),
  Religion VARCHAR2(30),
  Style VARCHAR2(30),
  
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
COMMENT ON COLUMN TB_PROFILE.Weight IS '몸무게';
COMMENT ON COLUMN TB_PROFILE.Area IS '지역';
COMMENT ON COLUMN TB_PROFILE.Hobby IS '취미';
COMMENT ON COLUMN TB_PROFILE.Achievement IS '학력';
COMMENT ON COLUMN TB_PROFILE.Blood_Type IS '혈액형';
COMMENT ON COLUMN TB_PROFILE.Smoking IS '흡연여부';
COMMENT ON COLUMN TB_PROFILE.Drinking IS '음주여부';
COMMENT ON COLUMN TB_PROFILE.Religion IS '지역';
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
  Sender_ID VARCHAR2(30),
  Receiver_ID VARCHAR2(30),
  Report_Content VARCHAR2(100),
  
  CONSTRAINT PK_REPORT PRIMARY KEY (Report_NO),
  CONSTRAINT FK_REPORT_SID FOREIGN KEY (Sender_ID) REFERENCES TB_USER ON DELETE SET NULL,
  CONSTRAINT FK_REPORT_RID FOREIGN KEY (Receiver_ID) REFERENCES TB_USER ON DELETE SET NULL
);
COMMENT ON TABLE TB_REPORT IS '신고 테이블';
COMMENT ON COLUMN TB_REPORT.Report_NO IS '신고 번호';
COMMENT ON COLUMN TB_REPORT.Sender_ID IS '신고자';
COMMENT ON COLUMN TB_REPORT.Receiver_ID IS '신고 대상자';
COMMENT ON COLUMN TB_REPORT.Report_Content IS '신고 사유';

-- 12. 설문조사 테이블
CREATE TABLE TB_POLL (
  Poll_NO NUMBER,
  Poll_Title VARCHAR2(30) NOT NULL,
  Poll_ST CHAR(1) DEFAULT '0',
  Start_DT DATE DEFAULT SYSDATE,
  End_DT DATE NOT NULL,
  ANSWER1 VARCHAR2(30) , 
  ANSWER2 VARCHAR2(30) ,
  ANSWER3 VARCHAR2(30),
  
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
  Notice_File_ONM VARCHAR2(100),
  Notice_File_RNM VARCHAR2(100),
  Notice_Read_CNT NUMBER DEFAULT 0,
  
  CONSTRAINT PK_NOTICE PRIMARY KEY (Notice_NO)  
);
COMMENT ON TABLE TB_NOTICE IS '공지사항 테이블';
COMMENT ON COLUMN TB_NOTICE.Notice_NO IS '공지사항 번호';
COMMENT ON COLUMN TB_NOTICE.Notice_Title IS '공지사항';
COMMENT ON COLUMN TB_NOTICE.Notice_Content IS '내용';
COMMENT ON COLUMN TB_NOTICE.Notice_DT IS '작성일';
COMMENT ON COLUMN TB_NOTICE.Notice_File_ONM IS '원래 첨부파일명';
COMMENT ON COLUMN TB_NOTICE.Notice_File_RNM IS '바뀐 첨부파일명';
COMMENT ON COLUMN TB_NOTICE.Notice_Read_CNT IS '조회수';

-- 16. 자유 게시판 테이블
CREATE TABLE TB_FREE (
  Free_NO NUMBER,
  Free_GB VARCHAR2(15),
  Free_Title VARCHAR2(50) NOT NULL,
  Free_Writer_ID VARCHAR2(30) NOT NULL,
  Free_Content VARCHAR2(2000) NOT NULL,
  Free_File_ONM VARCHAR2(100),
  Free_File_RNM VARCHAR2(100),
  Free_DT DATE DEFAULT SYSDATE,
  Free_Level NUMBER DEFAULT 0,
  Free_Ref NUMBER,
  Free_Reply_Ref NUMBER,
  Free_Reply_SQ NUMBER DEFAULT 0,
  Free_Read_CNT NUMBER DEFAULT 0,
  
  CONSTRAINT PK_FREE PRIMARY KEY (Free_NO),
  CONSTRAINT FK_FREE_WID FOREIGN KEY (Free_Writer_ID) REFERENCES TB_USER ON DELETE SET NULL,
  CONSTRAINT FK_FREE_REF FOREIGN KEY (Free_Ref) REFERENCES TB_FREE ON DELETE CASCADE,
  CONSTRAINT FK_FREE_REPLY_REF FOREIGN KEY (Free_Reply_Ref) REFERENCES TB_FREE ON DELETE CASCADE
);
COMMENT ON TABLE TB_FREE IS '자유게시판 테이블';
COMMENT ON COLUMN TB_FREE.Free_NO IS '자유게시판 번호';
COMMENT ON COLUMN TB_FREE.Free_GB IS '자유게시판 구분';
COMMENT ON COLUMN TB_FREE.Free_Writer_ID IS '자유게시판 작성자 아이디';
COMMENT ON COLUMN TB_FREE.Free_Title IS '자유게시판 제목';
COMMENT ON COLUMN TB_FREE.Free_Content IS '자유게시판 내용';
COMMENT ON COLUMN TB_FREE.Free_DT IS '자유게시판 올린날짜';
COMMENT ON COLUMN TB_FREE.Free_File_ONM IS '원래첨부파일명';
COMMENT ON COLUMN TB_FREE.Free_File_RNM IS '바뀐첨부파일명';
COMMENT ON COLUMN TB_FREE.Free_Level IS '글레벨(0:원글/1:댓글/2:대댓글)';
COMMENT ON COLUMN TB_FREE.Free_Ref IS '참조원글번호(원글:자기번호/댓글:참조원글번호)';
COMMENT ON COLUMN TB_FREE.Free_Reply_Ref IS '참조답글번호(0:원글/1:자기번호/2:참조댓글번호)';
COMMENT ON COLUMN TB_FREE.Free_Reply_SQ IS '답글순번(시퀀스)';
COMMENT ON COLUMN TB_FREE.Free_Read_CNT IS '조회수';

-- 17. FAQ 테이블
CREATE TABLE TB_FAQ(
  FAQ_NO NUMBER,
  FAQ_Title VARCHAR2(50) NOT NULL,
  FAQ_GB VARCHAR2(15) NOT NULL,
  FAQ_Content VARCHAR2(2000),
  FAQ_DT DATE DEFAULT SYSDATE,
  FAQ_File_ONM VARCHAR2(100),
  FAQ_File_RNM VARCHAR2(100),
  FAQ_Read_CNT  NUMBER DEFAULT 0,
  
  CONSTRAINT PK_FAQ PRIMARY KEY (FAQ_NO)
);
COMMENT ON TABLE TB_FAQ IS '자주묻는질문 테이블';
COMMENT ON COLUMN TB_FAQ.FAQ_NO IS 'FAQ 번호';
COMMENT ON COLUMN TB_FAQ.FAQ_GB IS 'FAQ 구분';
COMMENT ON COLUMN TB_FAQ.FAQ_Title IS 'FAQ 제목';
COMMENT ON COLUMN TB_FAQ.FAQ_Content IS 'FAQ 내용';
COMMENT ON COLUMN TB_FAQ.FAQ_DT IS 'FAQ 올린날짜';
COMMENT ON COLUMN TB_FAQ.FAQ_File_ONM IS '원래첨부파일명';
COMMENT ON COLUMN TB_FAQ.FAQ_File_RNM IS '바뀐첨부파일명';
COMMENT ON COLUMN TB_FAQ.FAQ_Read_CNT IS '조회수';

-- 18. 일대일 문의 테이블
CREATE TABLE TB_INQ(
INQ_NO NUMBER,
INQ_TITLE VARCHAR2(50) NOT NULL,
INQ_CONTENT VARCHAR2(2000),
INQ_DATE DATE DEFAULT SYSDATE,
INQ_ORIGINAL_FILENAME VARCHAR2(100),
INQ_RENAME_FILENAME VARCHAR2(100),
INQ_WRITER VARCHAR2(15) NOT NULL,
INQ_RECIVE VARCHAR2(15),

CONSTRAINT PK_INQNO PRIMARY KEY (INQ_NO),
CONSTRAINT FK_INQWR FOREIGN KEY (INQ_WRITER) REFERENCES TB_USER (User_ID),
CONSTRAINT FK_INQRE FOREIGN KEY (INQ_RECIVE) REFERENCES TB_USER (User_ID)
);

COMMENT ON COLUMN TB_INQ.INQ_NO IS '문의 번호';
COMMENT ON COLUMN TB_INQ.INQ_TITLE IS '문의 제목';
COMMENT ON COLUMN TB_INQ.INQ_CONTENT IS '문의 내용';
COMMENT ON COLUMN TB_INQ.INQ_DATE IS '문의 작성일자';
COMMENT ON COLUMN TB_INQ.INQ_ORIGINAL_FILENAME IS '문의 원래 첨부파일명';
COMMENT ON COLUMN TB_INQ.INQ_RENAME_FILENAME IS '문의 바뀐 첨부파일명';
COMMENT ON COLUMN TB_INQ.INQ_WRITER IS '문의 보내는 유저';
COMMENT ON COLUMN TB_INQ.INQ_RECIVE IS '문의 받는 유저';

COMMIT;


----------------- 샘플데이터 -------------------
-- 1. 사용자 테이블
INSERT INTO TB_USER VALUES('admin', 'admin', '관리자', '관리자', '1', 'admin@naver.com', '010-1234-5678', default, default, 'G', default, default, default, null); 
INSERT INTO TB_USER VALUES('user11', 'pass11', '윤찬호', '너구리', '1', 'raccoon@naver.com', '010-1234-1111', default, default, 'D', 3, default, default, null); 
INSERT INTO TB_USER VALUES('user22', 'pass22', '손정한', '돼지', '1', 'pig22@naver.com', '010-1234-2222', default, default, 'P', 3.5, default, default, null); 
INSERT INTO TB_USER VALUES('user33', 'pass33', '김지훈', '사육사', '2', 'keeper@naver.com', '010-1234-3333', default, default, 'G', 3.5, default, default, null); 
INSERT INTO TB_USER VALUES('user44', 'pass44', '남찬우', '나무', '2', 'tree@gmail.com', '010-1234-4444', default, default, 'S', 4, default, default, null); 
INSERT INTO TB_USER VALUES('user55', 'pass55', '조남훈', '곰', '3', 'bear55@naver.com', '010-1234-5555', default, default, 'B', 4, default, default, null); 
INSERT INTO TB_USER VALUES('user66', 'pass66', '김혜정', '쥐', '3', 'mouse@naver.com', '010-1234-6666', default, default, 'G', 4, default, default, null); 
INSERT INTO TB_USER VALUES('user77', 'pass77', '김여진', '여우', '4', 'fox77@naver.com', '010-1234-7777', default, default, 'G', 4.5, default, default, null); 

-- 2. 사용자(또는 이상형) 프로필

-- 3. 프로필 사진 테이블

-- 4. 매칭 질문 테이블

-- 5. 매칭 답변 테이블

-- 6. 메시지 테이블

-- 7. 별점 테이블

-- 8. 출석 테이블

-- 9. 결제 테이블

-- 10. 별사탕 사용내역 테이블

-- 11. 신고 테이블

-- 12. 설문조사 테이블

-- 13. 설문조사 질문 테이블

-- 14. 설문조사 답변 테이블

-- 15. 공지사항 테이블

-- 16. 자유 게시판 테이블

-- 17. FAQ 테이블

-- 18. 일대일 문의 테이블