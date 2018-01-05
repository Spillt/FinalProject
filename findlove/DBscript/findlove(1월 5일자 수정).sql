
/* DB ���� ���� ���� �� ���� ���� */
--CREATE USER final
--IDENTIFIED BY final;
--GRANT CONNECT, RESOURCE TO final;

/*���̺� ����
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
 -- �����Խ��� ������ ���̺�

 -- 0. ���� ����
 CREATE TABLE TB_SESSION_INFO(
      Session_Key VARCHAR2(100),
      User_Id VARCHAR2(30)
      ); 

 -- 1. ����� ���̺�
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

COMMENT ON TABLE TB_USER IS 'ȸ�� ���̺�';
COMMENT ON COLUMN TB_USER.User_ID IS '���̵�';
COMMENT ON COLUMN TB_USER.User_PWD IS '��й�ȣ';
COMMENT ON COLUMN TB_USER.User_NM IS '�̸�';
COMMENT ON COLUMN TB_USER.User_NickNM IS '�г���';
COMMENT ON COLUMN TB_USER.User_ST IS '����� ����(0:���δ��/1:�Ϲ�/2:�޸�/3:����/4:�������)';
COMMENT ON COLUMN TB_USER.Email IS '�̸���';
COMMENT ON COLUMN TB_USER.Phone IS '�޴�����ȣ';
COMMENT ON COLUMN TB_USER.Point_CNT IS '����Ʈ ��';
COMMENT ON COLUMN TB_USER.Konpeito_CNT IS '������ ��';
COMMENT ON COLUMN TB_USER.Rank_GB IS '������ �� ��� ����(������(M),�Ϲ�ȸ��(D:���̾�/P:�÷�Ƽ��/G:���/S:�ǹ�/B:�����))';
COMMENT ON COLUMN TB_USER.Grade_AVG IS '����';
COMMENT ON COLUMN TB_USER.Enroll_DT IS '������';
COMMENT ON COLUMN TB_USER.Latest_Access_DT IS '�ֱ� ������';
COMMENT ON COLUMN TB_USER.Delete_DT IS '������';

-- 2. �����(�Ǵ� �̻���) ������
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
COMMENT ON TABLE TB_PROFILE IS 'ȸ�� ������ ���̺�';
COMMENT ON COLUMN TB_PROFILE.User_ID IS '���̵�';
COMMENT ON COLUMN TB_PROFILE.Target_GB IS '��� ����(0:��/1:�̻���)';
COMMENT ON COLUMN TB_PROFILE.Gender IS '����';
COMMENT ON COLUMN TB_PROFILE.Age IS '����';
COMMENT ON COLUMN TB_PROFILE.Height IS 'Ű';
COMMENT ON COLUMN TB_PROFILE.Bodyform IS 'ü��';
COMMENT ON COLUMN TB_PROFILE.Area IS '����';
COMMENT ON COLUMN TB_PROFILE.Achievement IS '�з�';
COMMENT ON COLUMN TB_PROFILE.Job IS '����';
COMMENT ON COLUMN TB_PROFILE.Blood_Type IS '������';
COMMENT ON COLUMN TB_PROFILE.Smoking IS '������';
COMMENT ON COLUMN TB_PROFILE.Drinking IS '���ֿ���';
COMMENT ON COLUMN TB_PROFILE.Religion IS '����';
COMMENT ON COLUMN TB_PROFILE.Style IS '��Ÿ��';

-- 3. ������ ���� ���̺�
CREATE TABLE TB_PROFILE_PICTURE (

  Picture_NM VARCHAR2(30),
  User_ID VARCHAR2(30) NOT NULL,
  Thumnail_FL CHAR(1) DEFAULT '0',
  
  CONSTRAINT PK_PP PRIMARY KEY (Picture_NM),
  CONSTRAINT FK_PP_UID FOREIGN KEY (User_ID) REFERENCES TB_USER ON DELETE CASCADE,
  CONSTRAINT CHK_THUMNAIL CHECK (Thumnail_FL IN ('0', '1'))
);
COMMENT ON TABLE TB_PROFILE_PICTURE IS '������ ���� ���̺�';
COMMENT ON COLUMN TB_PROFILE_PICTURE.Picture_NM IS '�������ϸ�';
COMMENT ON COLUMN TB_PROFILE_PICTURE.User_ID IS '���̵�';
COMMENT ON COLUMN TB_PROFILE_PICTURE.Thumnail_FL IS '����� ���� �÷���(0/1)';

-- 4. ��Ī ���� ���̺�
CREATE TABLE TB_MATCHING_QUESTION (
  Question_NO NUMBER,
  Question VARCHAR2(300) NOT NULL,
  Choice1 VARCHAR2(100) NOT NULL,
  Choice2 VARCHAR2(100) NOT NULL,
  Choice3 VARCHAR2(100),
  
  CONSTRAINT PK_MQ PRIMARY KEY (Question_NO)
);
COMMENT ON TABLE TB_MATCHING_QUESTION IS '�������� ��Ī ���� ���̺�';
COMMENT ON COLUMN TB_MATCHING_QUESTION.Question_NO IS '������ȣ';
COMMENT ON COLUMN TB_MATCHING_QUESTION.Question IS '����';
COMMENT ON COLUMN TB_MATCHING_QUESTION.Choice1 IS '����1';
COMMENT ON COLUMN TB_MATCHING_QUESTION.Choice2 IS '����2';
COMMENT ON COLUMN TB_MATCHING_QUESTION.Choice3 IS '����3';

-- 5. ��Ī �亯 ���̺�
CREATE TABLE TB_MATCHING_ANSWER (
  User_ID VARCHAR2(30),
  Question_NO NUMBER,
  Answer CHAR(1) NOT NULL,
  
  CONSTRAINT PK_MA PRIMARY KEY (User_ID, Question_NO),
  CONSTRAINT FK_MA_UID FOREIGN KEY (User_ID) REFERENCES TB_USER,
  CONSTRAINT CHK_ANS CHECK (Answer IN ('1', '2', '3'))
);
COMMENT ON TABLE TB_MATCHING_ANSWER IS '�������� ��Ī �亯 ���̺�';
COMMENT ON COLUMN TB_MATCHING_ANSWER.User_ID IS '���̵�';
COMMENT ON COLUMN TB_MATCHING_ANSWER.Question_NO IS '������ȣ';
COMMENT ON COLUMN TB_MATCHING_ANSWER.Answer IS '�亯';

-- 6. �޽��� ���̺�
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
COMMENT ON TABLE TB_MESSAGE IS '�޼��� ���̺�';
COMMENT ON COLUMN TB_MESSAGE.Message_NO IS '�޼��� ��ȣ';
COMMENT ON COLUMN TB_MESSAGE.Sender_ID IS '������ ���̵�';
COMMENT ON COLUMN TB_MESSAGE.Receiver_ID IS '�޴� ���̵�';
COMMENT ON COLUMN TB_MESSAGE.Message_Content IS '����';
COMMENT ON COLUMN TB_MESSAGE.Send_DT IS '������ ��¥';
COMMENT ON COLUMN TB_MESSAGE.Read_FL IS '���� ���� �÷���(0/1)';
COMMENT ON COLUMN TB_MESSAGE.Accept_ST IS '���� ����(0:���/1:����/2: ����)';

-- 7. ���� ���̺�
CREATE TABLE TB_GRADE (
  Sender_ID VARCHAR2(30),
  Receiver_ID VARCHAR2(30),
  Grade NUMBER,
  
  CONSTRAINT PK_GRADE PRIMARY KEY (Sender_ID, Receiver_ID),
  CONSTRAINT FK_GRADE_SID FOREIGN KEY (Sender_ID) REFERENCES TB_USER ON DELETE CASCADE,
  CONSTRAINT FK_GRADE_RID FOREIGN KEY (Receiver_ID) REFERENCES TB_USER ON DELETE CASCADE,
  CONSTRAINT CHK_GRADE CHECK (Grade > 0 AND Grade < 11)
);
COMMENT ON TABLE TB_GRADE IS '���� ���̺�';
COMMENT ON COLUMN TB_GRADE.Sender_ID IS '������ ���̵�';
COMMENT ON COLUMN TB_GRADE.Receiver_ID IS '�޴� ���̵�';
COMMENT ON COLUMN TB_GRADE.Grade IS '����';

-- 8. �⼮ ���̺�
CREATE TABLE TB_ATTENDANCE (
  User_ID VARCHAR2(30),
  Attendance_DT DATE,
  
  CONSTRAINT PK_ATTENDANCE PRIMARY KEY (User_ID, Attendance_DT),
  CONSTRAINT FK_ATTENDANCE_UID FOREIGN KEY (User_ID) REFERENCES TB_USER ON DELETE CASCADE
);
COMMENT ON TABLE TB_ATTENDANCE IS '�⼮ ���̺�';
COMMENT ON COLUMN TB_ATTENDANCE.User_ID IS '���̵�';
COMMENT ON COLUMN TB_ATTENDANCE.Attendance_DT IS '�⼮��¥';

-- 9. ���� ���̺�
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
COMMENT ON TABLE TB_PAYMENT IS '���� ���̺�';
COMMENT ON COLUMN TB_PAYMENT.Payment_NO IS '���� ��ȣ';
COMMENT ON COLUMN TB_PAYMENT.User_ID IS '���̵�';
COMMENT ON COLUMN TB_PAYMENT.Payment_DT IS '���� ��¥';
COMMENT ON COLUMN TB_PAYMENT.Charge_Konpeito_CNT IS '������ ������ ��';
COMMENT ON COLUMN TB_PAYMENT.Use_Point_CNT IS '����� ����Ʈ ��';
COMMENT ON COLUMN TB_PAYMENT.Payment_Amount IS '���� �ݾ�';
COMMENT ON COLUMN TB_PAYMENT.Payment_ST IS '���� ����(0:��������/1:�����Ϸ�/2:ȯ�ҿ�û/3:ȯ�ҿϷ�)';

-- 10. ������ ��볻�� ���̺�
CREATE TABLE TB_KONPEITO_BREAKDOWN (
  User_ID VARCHAR2(30),
  Use_DT DATE,
  Use_Konpeito_CNT NUMBER,
  
  CONSTRAINT PK_KB PRIMARY KEY (User_ID, Use_DT),
  CONSTRAINT FK_KB_UID FOREIGN KEY (User_ID) REFERENCES TB_USER ON DELETE CASCADE
);
COMMENT ON TABLE TB_KONPEITO_BREAKDOWN IS '������ ��볻�� ���̺�';
COMMENT ON COLUMN TB_KONPEITO_BREAKDOWN.User_ID IS '���̵�';
COMMENT ON COLUMN TB_KONPEITO_BREAKDOWN.Use_DT IS '��� ��¥';
COMMENT ON COLUMN TB_KONPEITO_BREAKDOWN.Use_Konpeito_CNT IS '������ ��� ����';

-- 11. �Ű� ���̺�
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
COMMENT ON TABLE TB_REPORT IS '�Ű� ���̺�';
COMMENT ON COLUMN TB_REPORT.Report_NO IS '�Ű� ��ȣ';
COMMENT ON COLUMN TB_REPORT.Report_Type IS '�Ű� ����';
COMMENT ON COLUMN TB_REPORT.Sender_ID IS '�Ű���';
COMMENT ON COLUMN TB_REPORT.Receiver_ID IS '�Ű� �����';
COMMENT ON COLUMN TB_REPORT.Report_Content IS '�Ű� ����';
COMMENT ON COLUMN TB_REPORT.Report_ST IS '�Ű� ����(0:�Ű�����/1:����ó��/2:����ó��)';


-- 12. �������� ���̺�
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
COMMENT ON TABLE TB_POLL IS '�������� ���̺�';
COMMENT ON COLUMN TB_POLL.Poll_NO IS '������ȣ';
COMMENT ON COLUMN TB_POLL.Poll_Title IS '��������';
COMMENT ON COLUMN TB_POLL.Poll_ST IS '���� ����(0:�غ�/1:����/2:����)';
COMMENT ON COLUMN TB_POLL.Start_DT IS '����������';
COMMENT ON COLUMN TB_POLL.End_DT IS '����������';
COMMENT ON COLUMN TB_POLL.ANSWER1 IS '�亯1';
COMMENT ON COLUMN TB_POLL.ANSWER2 IS '�亯2';
COMMENT ON COLUMN TB_POLL.ANSWER3 IS '�亯3';

-- 13. ��Ī ���� ���̺�
CREATE TABLE TB_MATCH_USER(
My_Id VARCHAR2(30) PRIMARY KEY,
Insert_Date DATE DEFAULT SYSDATE,
User_Id1 VARCHAR2(30),
User_Id2 VARCHAR2(30),
User_Id3 VARCHAR2(30),
Matching NUMBER(1)
);
comment on column tb_match_user.my_id is '�� ���̵�';
comment on column tb_match_user.insert_date is '��Ī ������';
comment on column tb_match_user.user_id1 is '��Ī���1';
comment on column tb_match_user.user_id2 is '��Ī���2';
comment on column tb_match_user.user_id3 is '��Ī���3';
comment on column tb_match_user.matching is '��Ī����(0,1)';

-- 14. �������� �亯 ���̺�
CREATE TABLE TB_POLL_ANSWER (
  User_ID VARCHAR2(30),
  Poll_NO NUMBER,
  Answer NUMBER NOT NULL,
  
  CONSTRAINT PK_PA PRIMARY KEY (User_ID, Poll_NO),
  CONSTRAINT FK_PA_UID FOREIGN KEY (User_ID) REFERENCES TB_USER ON DELETE SET NULL
);
COMMENT ON TABLE TB_POLL_ANSWER IS '�������� �亯 ���̺�';
COMMENT ON COLUMN TB_POLL_ANSWER.User_ID IS '���̵�';
COMMENT ON COLUMN TB_POLL_ANSWER.Poll_NO IS '������ȣ';
COMMENT ON COLUMN TB_POLL_ANSWER.Answer IS '�亯';

-- 15. �������� ���̺�
CREATE TABLE TB_NOTICE (
  Notice_NO NUMBER,
  Notice_Title VARCHAR2(50) NOT NULL,
  Notice_Content VARCHAR2(2000) NOT NULL,
  Notice_DT DATE DEFAULT SYSDATE,
  Notice_Read_CNT NUMBER DEFAULT 0,
  
  CONSTRAINT PK_NOTICE PRIMARY KEY (Notice_NO)  
);
COMMENT ON TABLE TB_NOTICE IS '�������� ���̺�';
COMMENT ON COLUMN TB_NOTICE.Notice_NO IS '�������� ��ȣ';
COMMENT ON COLUMN TB_NOTICE.Notice_Title IS '��������';
COMMENT ON COLUMN TB_NOTICE.Notice_Content IS '����';
COMMENT ON COLUMN TB_NOTICE.Notice_DT IS '�ۼ���';
COMMENT ON COLUMN TB_NOTICE.Notice_Read_CNT IS '��ȸ��';

-- 16. ���� �Խ��� ���̺�
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
COMMENT ON TABLE TB_FREE IS '�����Խ��� ���̺�';
COMMENT ON COLUMN TB_FREE.Free_NO IS '�����Խ��� ��ȣ';
COMMENT ON COLUMN TB_FREE.Free_Writer IS '�����Խ��� �ۼ��� �г���';
COMMENT ON COLUMN TB_FREE.Free_Title IS '�����Խ��� ����';
COMMENT ON COLUMN TB_FREE.Free_Content IS '�����Խ��� ����';
COMMENT ON COLUMN TB_FREE.Free_DT IS '�����Խ��� �ø���¥';
COMMENT ON COLUMN TB_FREE.Free_Read_CNT IS '��ȸ��';
COMMENT ON COLUMN TB_FREE.Free_YN IS '�͸���';

-- 17. FAQ ���̺�
CREATE TABLE TB_FAQ(
  FAQ_NO NUMBER,
  FAQ_GB VARCHAR2(15) NOT NULL,
  FAQ_Title VARCHAR2(50) NOT NULL,
  FAQ_Content VARCHAR2(2000),
  FAQ_Writer VARCHAR2(30) NOT NULL,
  FAQ_Date DATE DEFAULT SYSDATE,
  
  CONSTRAINT PK_FAQ PRIMARY KEY (FAQ_NO)
);

COMMENT ON TABLE TB_FAQ IS '���ֹ������� ���̺�';
COMMENT ON COLUMN TB_FAQ.FAQ_NO IS 'FAQ ��ȣ';
COMMENT ON COLUMN TB_FAQ.FAQ_GB IS 'FAQ ����';
COMMENT ON COLUMN TB_FAQ.FAQ_Title IS 'FAQ ����';
COMMENT ON COLUMN TB_FAQ.FAQ_Content IS 'FAQ ����';
COMMENT ON COLUMN TB_FAQ.FAQ_Writer IS 'FAQ �ۼ���';
COMMENT ON COLUMN TB_FAQ.FAQ_Date IS 'FAQ ��¥';


-- 18. �ϴ��� ���� ���̺�
CREATE SEQUENCE TB_INQ_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
ORDER;


CREATE TABLE TB_INQ(
INQ_NO NUMBER, --�ϴ��� ���� ��ȣ
INQ_TITLE VARCHAR2(50) NOT NULL, --�ϴ��� ���� ����
INQ_CONTENT LONG, --�ϴ��� ���� ����
INQ_DATE DATE DEFAULT SYSDATE, --�ϴ��� ���� �ۼ�����
INQ_ORIGINAL_FILENAME VARCHAR2(100) DEFAULT NULL, --�ϴ��� ���� ���� ÷�����ϸ�
INQ_RENAME_FILENAME VARCHAR2(100) DEFAULT NULL, --�ϴ��� ���� �ٲ� ÷�����ϸ�
INQ_WRITER VARCHAR2(15) NOT NULL, --�ϴ��� ���� ������ ����
INQ_RECIVER VARCHAR2(15), --�ϴ��� ���� �޴� ����
INQ_REPLY_FL NUMBER DEFAULT '0',

CONSTRAINT PK_INQ PRIMARY KEY (INQ_NO),
CONSTRAINT FK_INQWR FOREIGN KEY (INQ_WRITER) REFERENCES TB_USER ON DELETE CASCADE,
CONSTRAINT FK_INQRE FOREIGN KEY (INQ_RECIVER) REFERENCES TB_USER ON DELETE CASCADE
);

COMMENT ON COLUMN TB_INQ.INQ_NO IS '�ϴ��� ���� ��ȣ';
COMMENT ON COLUMN TB_INQ.INQ_TITLE IS '�ϴ��� ���� ����';
COMMENT ON COLUMN TB_INQ.INQ_CONTENT IS '�ϴ��� ���� ����';
COMMENT ON COLUMN TB_INQ.INQ_DATE IS '�ϴ��� ���� �ۼ�����';
COMMENT ON COLUMN TB_INQ.INQ_ORIGINAL_FILENAME IS '�ϴ��� ���� ���� ÷�����ϸ�';
COMMENT ON COLUMN TB_INQ.INQ_RENAME_FILENAME IS '�ϴ��� ���� �ٲ� ÷�����ϸ�';
COMMENT ON COLUMN TB_INQ.INQ_WRITER IS '�ϴ��� ���� ������ ����';
COMMENT ON COLUMN TB_INQ.INQ_RECIVER IS '�ϴ��� ���� �޴� ����';
COMMENT ON COLUMN TB_INQ.INQ_REPLY_FL IS '�亯 �÷���(0:����� ����/������ ��ȣ: INQ_NO�� �ش��ϴ� �������� �亯';



-- 19. �����Խ��� ��� ���̺�
CREATE TABLE TB_FREE_REPLY (
Reply_No NUMBER, --��� ��ȣ
Free_No NUMBER, --�Խñ� ��ȣ
Reply_Text VARCHAR2(300), --��� ����
Reply_Writer VARCHAR2(30), --��� �ۼ��� ���̵�
Reply_NickNM VARCHAR2(30), --��� �ۼ��� �г���
Regdate DATE DEFAULT SYSDATE,--��� �ۼ�����

CONSTRAINT PK_RNO PRIMARY KEY (Reply_No),
CONSTRAINT FK_FREE_REPLYWID FOREIGN KEY (Reply_Writer) REFERENCES TB_USER ON DELETE SET NULL,
CONSTRAINT FK_FREE_REPLYWNNM FOREIGN KEY (Reply_NickNM) REFERENCES TB_USER ON DELETE SET NULL,
CONSTRAINT FK_FREE_REPLYFN FOREIGN KEY (Free_NO) REFERENCES TB_FREE ON DELETE SET NULL
);

COMMENT ON TABLE TB_FREE_REPLY IS '�����Խ��� ��� ���̺�';
COMMENT ON COLUMN TB_FREE_REPLY.Reply_No IS '��� ��ȣ';
COMMENT ON COLUMN TB_FREE_REPLY.Free_No IS '�Խñ� ��ȣ';
COMMENT ON COLUMN TB_FREE_REPLY.Reply_Text IS '��� ����';
COMMENT ON COLUMN TB_FREE_REPLY.Reply_Writer IS '��� �ۼ��� ���̵�';
COMMENT ON COLUMN TB_FREE_REPLY.Reply_NickNM IS '��� �ۼ��� �г���';
COMMENT ON COLUMN TB_FREE_REPLY.Regdate IS '��� �ۼ�����';

create table tb_chat(
  send_user varchar2(30),
  receive_user varchar2(30)
  );



----------------- ���õ����� -------------------
-- 1. ����� ���̺�
-- ����
INSERT INTO TB_USER VALUES('admin', 'admin', '������', '������', '1', 'admin@naver.com', '010-1234-5678', 1000, 1000, 'M', default, '2017-11-12', default, null); 
INSERT INTO TB_USER VALUES('user01', 'pass01', '����ȣ', '�ʱ���', '1', 'raccoon@naver.com', '010-1234-1111', 1000, 1000, 'D', 3, '2017-12-12', default, null); 
INSERT INTO TB_USER VALUES('user02', 'pass02', '������', '����', '1', 'pig22@naver.com', '010-1234-2222', default, default, 'P', 3.5, '2017-10-01', default, null); 
INSERT INTO TB_USER VALUES('user03', 'pass03', '������', '������', '1', 'keeper@naver.com', '010-1234-3333', default, default, 'G', 3.5, '2017-12-19', default, null); 
INSERT INTO TB_USER VALUES('user04', 'pass04', '������', '����', '1', 'tree@gmail.com', '010-1234-4444', default, default, 'S', 4, '2017-02-09', '2017-05-10', null); 
INSERT INTO TB_USER VALUES('user05', 'pass05', '������', '��', '1', 'bear55@naver.com', '010-1234-5555', default, default, 'B', 4, '2017-11-11', default, null);
INSERT INTO TB_USER VALUES('user06', 'pass06', '������', '������', '1', 'ljs11@naver.com', '010-1234-5556', default, default, 'D', 5, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user07', 'pass07', '����', '����', '1', 'kwb12@naver.com', '010-1234-5557', default, default, 'P', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user08', 'pass08', '����ȣ', '����ȣ', '1', 'ysh214@naver.com', '010-1234-5558', default, default, 'G', 5, '2017-11-11', default, null);
INSERT INTO TB_USER VALUES('user09', 'pass09', '����', '����', '1', 'hbeen1231@naver.com', '010-2244-5522', default, default, 'B', 4, '2017-11-11', default, null);
INSERT INTO TB_USER VALUES('user10', 'pass10', '�ں���', '�ں���', '1', 'pbk124@naver.com', '010-1234-5559', default, default, 'B', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user11', 'pass11', '������', '������', '1', 'jhm1235@naver.com', '010-1234-5560', default, default, 'D', 3, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user12', 'pass12', '������', '������', '1', 'eric2384@naver.com', '010-1234-5561', default, default, 'G', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user13', 'pass13', '����ö', '����ö', '1', 'khc4745@naver.com', '010-1234-5562', default, default, 'B', 5, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user14', 'pass14', '�ڼ���', '�ڼ���', '1', 'psj8765@naver.com', '010-1234-5563', default, default, 'G', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user15', 'pass15', '���ٴϿ�', '���ٴϿ�', '1', 'kdanial@naver.com', '010-1234-5564', default, default, 'B', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user16', 'pass16', '���缮', '���缮', '1', 'yjs4424@naver.com', '010-1234-5565', default, default, 'B', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user17', 'pass17', '�̽±�', '�̽±�', '1', 'lsk7958@naver.com', '010-1234-5566', default, default, 'P', 2, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user18', 'pass18', '������', '������', '1', 'ysj6652@naver.com', '010-1234-5567', default, default, 'B', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user19', 'pass19', '����', '����', '1', 'wbwb447@naver.com', '010-1234-5568', default, default, 'B', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user20', 'pass20', '������', '������', '2', 'kdj1255@naver.com', '010-1234-5569', default, default, 'P', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user21', 'pass21', '�̹�ȣ', '�̹�ȣ', '2', 'lmh7711@naver.com', '010-1234-5570', default, default, 'B', 3, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user22', 'pass22', '�����', '�����', '3', 'ksh4528@naver.com', '010-1234-5571', default, default, 'G', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user23', 'pass23', '���߱�', '���߱�', '0', 'sjk3258@naver.com', '010-1234-5572', default, default, 'B', 3, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user24', 'pass24', '����ȭ', '����ȭ', '0', 'jyh4484@naver.com', '010-1234-5573', default, default, 'G', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user25', 'pass25', '������', '������', '3', 'mds6588@naver.com', '010-1234-5574', default, default, 'B', 2, '2017-11-11', default, null); 


-- ����
INSERT INTO TB_USER VALUES('user26', 'pass26', '������', '��', '2', 'mouse@naver.com', '010-1234-6666', default, default, 'G', 4, '2017-06-06', '2017-06-06', null); 
INSERT INTO TB_USER VALUES('user27', 'pass27', '�迩��', '����', '4', 'fox77@naver.com', '010-1234-7777', default, default, 'G', 4.5, '2017-10-10', '2017-10-10', null); 
INSERT INTO TB_USER VALUES('user28', 'pass28', '�輱��', '����', '1', 'sun88@naver.com', '010-1234-8888', default, default, default, 3.5, default, default, null); 
INSERT INTO TB_USER VALUES('user29', 'pass29', '������', '����', '1', 'youjin99@naver.com', '010-1234-9999', default, default, default, 1.5, default, default, null); 
INSERT INTO TB_USER VALUES('user30', 'pass30', '������', '����', '1', 'genie00@naver.com', '010-1234-0000', default, default, default, 4.5, default, default, null);
INSERT INTO TB_USER VALUES('user31', 'pass31', '�տ���', '�տ���', '1', 'syj1234@naver.com', '010-1234-0001', default, default, default, 4.5, default, default, null); 
INSERT INTO TB_USER VALUES('user32', 'pass32', '�ں���', '�ں���', '1', 'pby4487@naver.com', '010-1234-0002', default, default, default, 5, default, default, null); 
INSERT INTO TB_USER VALUES('user33', 'pass33', '������', '������', '1', 'jboa6587@naver.com', '010-1234-0003', default, default, default, 4, default, default, null); 
INSERT INTO TB_USER VALUES('user34', 'pass34', '������', '������', '1', 'jjh1124@naver.com', '010-1234-0004', default, default, default, 5, default, default, null); 
INSERT INTO TB_USER VALUES('user35', 'pass35', '���ξ�', '���ξ�', '1', 'sia6556@naver.com', '010-1234-0005', default, default, default, 3, default, default, null); 
INSERT INTO TB_USER VALUES('user36', 'pass36', '�����', '�����', '1', 'ksh9987@naver.com', '010-1234-0006', default, default, default, 3.5, default, default, null); 
INSERT INTO TB_USER VALUES('user37', 'pass37', '�����', '�����', '1', 'bsz1115@naver.com', '010-1234-0007', default, default, default, 3.5, default, default, null); 
INSERT INTO TB_USER VALUES('user38', 'pass38', '������', '������', '1', 'lya3355@naver.com', '010-1234-0008', default, default, default, 2.5, default, default, null); 
INSERT INTO TB_USER VALUES('user39', 'pass39', '������', '������', '2', 'kth4421@naver.com', '010-1234-0009', default, default, default, 2.5, default, default, null); 
INSERT INTO TB_USER VALUES('user40', 'pass40', '������', '������', '1', 'ajh1864@naver.com', '010-1234-0010', default, default, default, 1.5, default, default, null); 
INSERT INTO TB_USER VALUES('user41', 'pass41', '���¿�', '���¿�', '1', 'ksy9975@naver.com', '010-1234-0011', default, default, default, 1.5, default, default, null); 
INSERT INTO TB_USER VALUES('user42', 'pass42', '�迬��', '�迬��', '1', 'kya2210@naver.com', '010-1234-0012', default, default, default, 3.5, default, default, null); 
INSERT INTO TB_USER VALUES('user43', 'pass43', '����', '����', '1', 'zzwhi1151@naver.com', '010-1234-0013', default, default, default, 4.5, default, default, null); 
INSERT INTO TB_USER VALUES('user44', 'pass44', '�輳��', '�輳��', '1', 'ksh2200@naver.com', '010-1234-0014', default, default, default, 5, default, default, null); 
INSERT INTO TB_USER VALUES('user45', 'pass45', '�渮', '�渮', '3', 'klee4411@naver.com', '010-1234-0015', default, default, default,3, default, default, null); 
INSERT INTO TB_USER VALUES('user46', 'pass46', '������', '������', '3', 'syl4447@naver.com', '010-1234-0016', default, default, default, 5, default, default, null); 
INSERT INTO TB_USER VALUES('user47', 'pass47', 'ä����', 'ä����', '1', 'csb6689@naver.com', '010-1234-0017', default, default, default, 2, default, default, null); 
INSERT INTO TB_USER VALUES('user48', 'pass48', '������', '������', '1', 'kjw1005@naver.com', '010-1234-0018', default, default, default, 2.5, default, default, null); 
INSERT INTO TB_USER VALUES('user49', 'pass49', '�žƿ�', '�žƿ�', '1', 'say1149@naver.com', '010-1234-0019', default, default, default, 2.5, default, default, null); 
INSERT INTO TB_USER VALUES('user50', 'pass50', '�ڳ���', '�ڳ���', '1', 'pnr2206@naver.com', '010-1234-0020', default, default, default, 1.5, default, default, null); 



-- 2. �����(�Ǵ� �̻���) ������
-- ����(����� ������)
INSERT INTO TB_PROFILE
VALUES ('user01', '0', 'M', 25, 182, '����', '���� ����', '4�����','ȸ���', 'O', '����', '���� ������ �ʾƿ�', '�⵶��', '��õ����,����,����Ƽ');
INSERT INTO TB_PROFILE
VALUES ('user02', '0', 'M', 25, 177, '�λ�', '����', '4�������','�л�', 'O', '����', '��¿ �� ���� ���� ���ſ�', '�ұ�', '���,������,â������');
INSERT INTO TB_PROFILE
VALUES ('user03', '0', 'M', 25, 188, '����', '���� źź', '4�������','�л�', 'O', '����', '���� ���ſ�', '����','��������,�����ִ�,����');
INSERT INTO TB_PROFILE
VALUES ('user04', '0', 'M', 21, 170, '�뱸', '����', '����','ȸ���', 'A', '��', '������� ���� ���̿���', 'õ�ֱ�', '�мųʺ�,������,�Ϳ���');
INSERT INTO TB_PROFILE
VALUES ('user05', '0', 'M', 22, 177, '����', '����', '4�������','�л�', 'AB', '����', '���� ���ڸ��� ������', '�ұ�', '���,������,â������');
INSERT INTO TB_PROFILE
VALUES ('user06', '0', 'M', 31, 164, '����', '���� źź', '����','�ڿ���', 'A', '��', '���� ���ڸ��� ������', '����', '��������,�����ִ�,����');
INSERT INTO TB_PROFILE
VALUES ('user07', '0', 'M', 36, 181, '����', '����', '4�����','ȸ���', 'B', '����', '������� ���� ���̿���', '�⵶��', '����,����,����Ƽ');
INSERT INTO TB_PROFILE
VALUES ('user08', '0', 'M', 27, 193, '����', '���� źź', '4�����','ȸ���', 'AB', '����', '������� ���� ���̿���', '����', '��������,�����ִ�,����');
INSERT INTO TB_PROFILE
VALUES ('user09', '0', 'M', 28, 172, '��õ', '����', '4�����','ȸ���', 'A', '����', '�����ʴϴ�.', '�⵶��', '����,����,����Ƽ');
INSERT INTO TB_PROFILE
VALUES ('user10', '0', 'M', 21, 178, '����', '���� źź', '����','ȸ���', 'A', '����', '���� ���ڸ��� ������', '����', '����,����,����Ƽ');
INSERT INTO TB_PROFILE
VALUES ('user11', '0', 'M', 26, 170, '����', '����', '����','ȸ���', 'AB', '����', '������� ���� ���̿���', '�⵶��', '���,������,â������');
INSERT INTO TB_PROFILE
VALUES ('user12', '0', 'M', 33, 175, '��õ', '����', '��������','ȸ���', 'AB', '����', '������� ���� ���̿���', '����', '����,����,����Ƽ');
INSERT INTO TB_PROFILE
VALUES ('user13', '0', 'M', 42, 167, '���', '���� źź', '4�����','�ڿ���', 'B', '��', '������� ���� ���̿���', '����', '���,������,â������');
INSERT INTO TB_PROFILE
VALUES ('user14', '0', 'M', 30, 181, '����', '����', '4�����','ȸ���', 'AB', '��', '���� ���ڸ��� ������', '����', '����,����,����Ƽ');
INSERT INTO TB_PROFILE
VALUES ('user15', '0', 'M', 29, 168, '������', '����', '4�����','ȸ���', 'O', '����', '���� ���ڸ��� ������', '�⵶��', '���,������,â������');
INSERT INTO TB_PROFILE
VALUES ('user16', '0', 'M', 22, 172, '����', '����', '��������','ȸ���', 'AB', '����', '���� ���ڸ��� ������', '����', '����,����,����Ƽ');
INSERT INTO TB_PROFILE
VALUES ('user17', '0', 'M', 35, 177, '����', '���� źź', '4�����','�ڿ���', 'AB', '����', '���� ���ڸ��� ������', '�ұ�', '���,������,â������');
INSERT INTO TB_PROFILE
VALUES ('user18', '0', 'M', 36, 181, '����', '����', '4�����','ȸ���', 'O', '����', '������� ���� ���̿���', '�⵶��', '����,����,����Ƽ');
INSERT INTO TB_PROFILE
VALUES ('user19', '0', 'M', 22, 183, '����', '����', '4�������','�л�', 'AB', '��', '���� ���ڸ��� ������', '����', '����,����,����Ƽ');
INSERT INTO TB_PROFILE
VALUES ('user20', '0', 'M', 26, 177, '���', '����', '4�����','ȸ���', 'AB', '����', '���� ���ڸ��� ������', '����', '��������,�����ִ�,����');
INSERT INTO TB_PROFILE
VALUES ('user21', '0', 'M', 29, 170, '��õ', '���� źź', '4�����','ȸ���', 'B', '����', '�ھ������ ���� ���̿���', '����', '����,����,����Ƽ');
INSERT INTO TB_PROFILE
VALUES ('user22', '0', 'M', 37, 177, '����', '����', '4�����','ȸ���', 'B', '����', '������� ���� ���̿���', '�⵶��', '����,����,����Ƽ');
INSERT INTO TB_PROFILE
VALUES ('user23', '0', 'M', 35, 174, '����', '����', '����','ȸ���', 'A', '����', '���� ���ڸ��� ������', '����', '����,����,����Ƽ');
INSERT INTO TB_PROFILE
VALUES ('user24', '0', 'M', 21, 175, '������', '����', '����','ȸ���', 'B', '��', '������� ���� ���̿���', '�ұ�', '��������,�����ִ�,����');
INSERT INTO TB_PROFILE
VALUES ('user25', '0', 'M', 27, 182, '�뱸', '����', '4�����','ȸ���', 'AB', '����', '���� ���ڸ��� ������', '�⵶��', '����,����,����Ƽ');


-- ����(����� ������)
INSERT INTO TB_PROFILE
VALUES ('user26', '0', 'F', 23, 160, '�λ�', '����', '4�����','ȸ���', 'B', '��', '��¿ �� ���� ���� ���ſ�', '����', '������,���,�����ִ�');
INSERT INTO TB_PROFILE
VALUES ('user27', '0', 'F', 24, 155, '����', '���� ����', '4�����','ȸ���', 'O', '����', '���� ���ſ�', '����', '����,������,�мųʺ�');
INSERT INTO TB_PROFILE
VALUES ('user28', '0', 'F', 28, 172, '���', '��Ű��', '4�����', '�ڿ���', 'B', '��', '������� ���� ���̿���', '�ұ�', '��õ����,���,��������');
INSERT INTO TB_PROFILE
VALUES ('user29', '0', 'F', 24, 150, '����', '����', '4�����', '��������', 'AB', '����', '���� ���ڸ��� ������', '����', '�мųʺ�,�����ִ�,��õ����');
INSERT INTO TB_PROFILE
VALUES ('user30', '0', 'F', 22, 157, '���-���� �α�', '��Ű��', '4�����', '���л�', 'B', '��', '���� ���ڸ��� ������', '�⵶��', '����,�����ִ�,����');
INSERT INTO TB_PROFILE
VALUES ('user31', '0', 'F', 26, 171, '������', '��Ű��', '4�����', '����غ��', 'A', '������', '���� ���ڸ��� ������', '�⵶��', '����,�����ִ�,����');
INSERT INTO TB_PROFILE
VALUES ('user32', '0', 'F', 31, 167, '��õ', '���� ����', '4�����', 'ȸ���', 'O', '����', '���� ���ڸ��� ������', '�⵶��', '����,�����ִ�,����');
INSERT INTO TB_PROFILE
VALUES ('user33', '0', 'F', 28, 162, '�λ�', '��Ű��', '4�����', 'ȸ���', 'AB', '����', '���� ���ſ�', '����', '����,�����ִ�,����');
INSERT INTO TB_PROFILE
VALUES ('user34', '0', 'F', 29, 163, '���', '��Ű��', '4�����', 'ȸ���', 'B', '����', '���� ���ſ�', '�⵶��', '����,�����ִ�,����');
INSERT INTO TB_PROFILE
VALUES ('user35', '0', 'F', 22, 152, '����', '��Ű��', '4�������', '���л�', 'AB', '����', '���� ���ڸ��� ������', '�⵶��', '����,�����ִ�,����');
INSERT INTO TB_PROFILE
VALUES ('user36', '0', 'F', 23, 168, '�λ�', '����', '��������','�ڿ���', 'B', '��', '��¿ �� ���� ���� ���ſ�', '����', '������,���,�����ִ�');
INSERT INTO TB_PROFILE
VALUES ('user37', '0', 'F', 24, 170, '����', '���� ����', '����','ȸ���', 'O', '����', '���� ���ſ�', '����', '����,������,�мųʺ�');
INSERT INTO TB_PROFILE
VALUES ('user38', '0', 'F', 28, 172, '���', '��Ű��', '4�����', '�ڿ���', 'O', '��', '������� ���� ���̿���', '�ұ�', '��õ����,���,��������');
INSERT INTO TB_PROFILE
VALUES ('user39', '0', 'F', 24, 160, '����', '����', '4�����', '��������', 'AB', '����', '���� ���ڸ��� ������', '����', '�мųʺ�,�����ִ�,��õ����');
INSERT INTO TB_PROFILE
VALUES ('user40', '0', 'F', 22, 166, '���-���� �α�', '��Ű��', '4�������', '�л�', 'B', '����', '���� ���ڸ��� ������', '�⵶��', '����,�����ִ�,����');
INSERT INTO TB_PROFILE
VALUES ('user41', '0', 'F', 22, 164, '������', '��Ű��', '4�������', '�л�', 'AB', '����', '���� ���ſ�', '�⵶��', '����,�����ִ�,����');
INSERT INTO TB_PROFILE
VALUES ('user42', '0', 'F', 24, 162, '��õ', '��Ű��', '4�������', '�л�', 'AB', '����', '���� ���ڸ��� ������', '�⵶��', '����,�����ִ�,����');
INSERT INTO TB_PROFILE
VALUES ('user43', '0', 'F', 33, 161, '�λ�', '���� ����', '4�����', 'ȸ���', 'B', '����', '���� ���ſ�', '�⵶��', '����,�����ִ�,����');
INSERT INTO TB_PROFILE
VALUES ('user44', '0', 'F', 27, 157, '���', '��Ű��', '����', 'ȸ���', 'B', '����', '���� ���ڸ��� ������', '����', '����,�����ִ�,����');
INSERT INTO TB_PROFILE
VALUES ('user45', '0', 'F', 24, 168, '����', '��Ű��', '��������', '��������', 'O', '��', '������� ���� ���̿���', '�⵶��', '����,�����ִ�,����');
INSERT INTO TB_PROFILE
VALUES ('user46', '0', 'F', 25, 166, '�λ�', '����', '4�����','ȸ���', 'O', '����', '��¿ �� ���� ���� ���ſ�', '����', '������,���,�����ִ�');
INSERT INTO TB_PROFILE
VALUES ('user47', '0', 'F', 27, 155, '����', '���� ����', '4�����','ȸ���', 'A', '����', '���� ���ſ�', '����', '����,������,�мųʺ�');
INSERT INTO TB_PROFILE
VALUES ('user48', '0', 'F', 30, 172, '���', '��Ű��', '����', '�ڿ���', 'B', '����', '������� ���� ���̿���', '�ұ�', '��õ����,���,��������');
INSERT INTO TB_PROFILE
VALUES ('user49', '0', 'F', 24, 150, '����', '����', '4�������', '�л�', 'AB', '����', '���� ���ڸ��� ������', '����', '�мųʺ�,�����ִ�,��õ����');
INSERT INTO TB_PROFILE
VALUES ('user50', '0', 'F', 22, 167, '���-���� �α�', '��Ű��', '4�������', '�л�', 'B', '��', '���� ���ڸ��� ������', '�⵶��', '����,�����ִ�,����');


-- ����(�̻��� ������)
INSERT INTO TB_PROFILE
VALUES('user01', '1', 'F', '4������ ����', '�������' , '���� ������ �̼�', '��Ű��', null, null, null, '����', '������� ���� ���̿���', '���� �������̸� �� ���ƿ�', '��õ����,������,����Ƽ'); 
INSERT INTO TB_PROFILE
VALUES('user02', '1', 'F', '�������', '154����' , '��� ����', '���� ����', null, null, null, '����', '���� ���ſ�', '��� ����', '��õ����,������,�мųʺ�'); 
INSERT INTO TB_PROFILE
VALUES('user03', '1', 'F', '����', '155~159' , '�α� ���ñ��� ��ȣ', '���� ����', null, null, null, '����', '���� ���ڸ��� ������', '���� �������̸� �� ���ƿ�', '��õ����,������,����'); 
INSERT INTO TB_PROFILE
VALUES('user04', '1', 'F', '4������ ����', '165~169' , '��� ����', '����', null, null, null, '��', '��¿ �� ���� ���� ���ſ�', '��� ����', '����,�мųʺ�,�����ִ�'); 
INSERT INTO TB_PROFILE
VALUES('user05', '1', 'F', '2��~3�� ����', '175�̻�' , '���� ������ �̼�', '����', null, null, null, '����', '���� ���ڸ��� ������', '���� �������̸� �� ���ƿ�', '����Ƽ,������,����'); 
INSERT INTO TB_PROFILE
VALUES('user06', '1', 'F', '����', '165~169' , '���� ������ �̼�', '���� źź', null, null, null, '����', '������� ���� ���̿���', '��� ����', '����,�мųʺ�,�����ִ�'); 
INSERT INTO TB_PROFILE
VALUES('user07', '1', 'F', '�������', '155~159' , '��� ����', '���� ����', null, null, null, '����', '��¿ �� ���� ���� ���ſ�', '���� �������̸� �� ���ƿ�', '����,�мųʺ�,�����ִ�'); 
INSERT INTO TB_PROFILE
VALUES('user08', '1', 'F', '4������ ����', '165~169' , '���� ������ �̼�', '��Ű��', null, null, null, '����', '���� ���ڸ��� ������', '���� �������̸� �� ���ƿ�', '��õ����,������,����'); 
INSERT INTO TB_PROFILE
VALUES('user09', '1', 'F', '����', '155~159' , '���� ������ �̼�', '���� źź', null, null, null, '��', '��¿ �� ���� ���� ���ſ�', '���� �������̸� �� ���ƿ�', '����,�мųʺ�,�����ִ�'); 
INSERT INTO TB_PROFILE
VALUES('user10', '1', 'F', '4���̻� ����', '�������' , '��� ����', '���� źź', null, null, null, '����', '������� ���� ���̿���', '��� ����', '����,�мųʺ�,�����ִ�'); 
INSERT INTO TB_PROFILE
VALUES('user11', '1', 'F', '2��~3�� ����', '175�̻�' , '�α� ���ñ��� ��ȣ', '����', null, null, null, '����', '���� ���ڸ��� ������', '��� ����', '��õ����,������,����'); 
INSERT INTO TB_PROFILE
VALUES('user12', '1', 'F', '����', '160~164', '���� ������ �̼�','��Ű��' ,null, null, null, '����', '��¿ �� ���� ���� ���ſ�', '��� ����', '��õ����,������,����Ƽ'); 
INSERT INTO TB_PROFILE
VALUES('user13', '1', 'F', '2��~3�� ����', '160~164' , '�α� ���ñ��� ��ȣ', '��Ű��', null, null, null, '��', '���� ���ڸ��� ������', '���� �������̸� �� ���ƿ�', '����,�мųʺ�,�����ִ�'); 
INSERT INTO TB_PROFILE
VALUES('user14', '1', 'F', '����', '175�̻�' , '���� ������ �̼�', '���� źź', null, null, null, '��', '���� ���ſ�', '��� ����', '����,�мųʺ�,�����ִ�'); 
INSERT INTO TB_PROFILE
VALUES('user15', '1', 'F', '4������ ����', '155~159' , '�α� ���ñ��� ��ȣ', '����', null, null, null, '����', '������� ���� ���̿���', '��� ����', '����,�мųʺ�,�����ִ�'); 
INSERT INTO TB_PROFILE
VALUES('user16', '1', 'F', '2��~3�� ����', '165~169' , '���� ������ �̼�', '����', null, null, null, '��', '��¿ �� ���� ���� ���ſ�', '��� ����', '��õ����,������,����Ƽ'); 
INSERT INTO TB_PROFILE
VALUES('user17', '1', 'F', '2��~3�� ����', '�������' , '��� ����', '���� ����', null, null, null, '����', '��¿ �� ���� ���� ���ſ�', '��� ����', '����Ƽ,������,����'); 
INSERT INTO TB_PROFILE
VALUES('user18', '1', 'F', '2��~3�� ����', '155~159' , '�α� ���ñ��� ��ȣ', '��Ű��', null, null, null, '��', '���� ���ſ�', '���� �������̸� �� ���ƿ�', '����,�мųʺ�,�����ִ�'); 
INSERT INTO TB_PROFILE
VALUES('user19', '1', 'F', '����', '160~164' , '��� ����', '���� ����', null, null, null, '��', '������� ���� ���̿���', '��� ����', '����Ƽ,������,����'); 
INSERT INTO TB_PROFILE
VALUES('user20', '1', 'F', '2��~3�� ����', '175�̻�' , '���� ������ �̼�', '���� źź', null, null, null, '����', '���� ���ڸ��� ������', '��� ����', '��õ����,������,����Ƽ'); 
INSERT INTO TB_PROFILE
VALUES('user21', '1', 'F', '4������ ����', '�������' , '�α� ���ñ��� ��ȣ', '����', null, null, null, '��', '���� ������ �ʾƿ�', '��� ����', '��õ����,������,����'); 
INSERT INTO TB_PROFILE
VALUES('user22', '1', 'F', '2��~3�� ����', '155~159' , '���� ������ �̼�', '��Ű��', null, null, null, '����', '���� ������ �ʾƿ�', '���� �������̸� �� ���ƿ�', '����,�мųʺ�,�����ִ�'); 
INSERT INTO TB_PROFILE
VALUES('user23', '1', 'F', '2��~3�� ����', '175�̻�' , '�α� ���ñ��� ��ȣ', '����', null, null, null, '����', '���� ���ڸ��� ������', '��� ����', '����Ƽ,������,����'); 
INSERT INTO TB_PROFILE
VALUES('user24', '1', 'F', '����', '165~169' , '��� ����', '����', null, null, null, '����', '������� ���� ���̿���', '��� ����', '��õ����,������,����'); 
INSERT INTO TB_PROFILE
VALUES('user25', '1', 'F', '4���̻� ����', '155~159' , '���� ������ �̼�', '��Ű��', null, null, null, '����', '���� ���ڸ��� ������', '���� �������̸� �� ���ƿ�', '����,�мųʺ�,�����ִ�'); 

-- ����(�̻��� ������)
INSERT INTO TB_PROFILE
VALUES('user26', '1', 'M', '4������ ����', '�������' , '���� ������ �̼�', '��Ű��', null, null, null, '����', '������� ���� ���̿���', '���� �������̸� �� ���ƿ�', '��õ����,������,����Ƽ'); 
INSERT INTO TB_PROFILE
VALUES('user27', '1', 'M', '�������', '154����' , '��� ����', '���� ����', null, null, null, '����', '���� ���ſ�', '��� ����', '��õ����,������,�мųʺ�'); 
INSERT INTO TB_PROFILE
VALUES('user28', '1', 'M', '����', '155~159' , '�α� ���ñ��� ��ȣ', '���� ����', null, null, null, '����', '���� ���ڸ��� ������', '���� �������̸� �� ���ƿ�', '��õ����,������,����'); 
INSERT INTO TB_PROFILE
VALUES('user29', '1', 'M', '4������ ����', '165~169' , '��� ����', '����', null, null, null, '��', '��¿ �� ���� ���� ���ſ�', '��� ����', '����,�мųʺ�,�����ִ�'); 
INSERT INTO TB_PROFILE
VALUES('user30', '1', 'M', '2��~3�� ����', '��� 175�̻�' , '���� ������ �̼�', '����', null, null, null, '����', '���� ���ڸ��� ������', '���� �������̸� �� ���ƿ�', '����Ƽ,������,����'); 
INSERT INTO TB_PROFILE
VALUES('user31', '1', 'M', '2��~3�� ����', '175�̻�' , '�α� ���ñ��� ��ȣ', '��Ű��', null, null, null, '��', '���� ������ �ʾƿ�', '��� ����', 'â������,����,�����ִ�'); 
INSERT INTO TB_PROFILE
VALUES('user32', '1', 'M', '4���̻� ����', '175�̻�' , '��� ����', '����', null, null, null, '����', '������� ���� ���̿���', '��� ����', '����,������,��������'); 
INSERT INTO TB_PROFILE
VALUES('user33', '1', 'M', '�������', '175�̻�' , '���� ������ �̼�', '����', null, null, null, '����', '���� ���ſ�', '���� �������̸� �� ���ƿ�', '�����ִ�,������,����'); 
INSERT INTO TB_PROFILE
VALUES('user34', '1', 'M', '�������', '175�̻�' , '�α� ���ñ��� ��ȣ', '���� źź', null, null, null, '����', '���� ���ڸ��� ������', '��� ����', '����,������,����'); 
INSERT INTO TB_PROFILE
VALUES('user35', '1', 'M', '4���̻� ����', '175�̻�' , '���� ������ �̼�', '���� ����', null, null, null, '����', '������� ���� ���̿���', '���� �������̸� �� ���ƿ�', '��õ����,������,����'); 
INSERT INTO TB_PROFILE
VALUES('user36', '1', 'M', '�������', '175�̻�' , '���� ������ �̼�', '���� źź', null, null, null, '����', '��¿ �� ���� ���� ���ſ�', '��� ����', '����Ƽ,������,�мųʺ�'); 
INSERT INTO TB_PROFILE
VALUES('user37', '1', 'M', '����', '175�̻�' , '���� ������ �̼�', '����', null, null, null, '����', '���� ���ſ�', '��� ����', '����Ƽ,������,�мųʺ�'); 
INSERT INTO TB_PROFILE
VALUES('user38', '1', 'M', '�������', '175�̻�' , '�α� ���ñ��� ��ȣ', '����', null, null, null, '��', '������� ���� ���̿���', '��� ����', '����,�мųʺ�,�����ִ�'); 
INSERT INTO TB_PROFILE
VALUES('user39', '1', 'M', '2��~3�� ����', '175�̻�' , '���� ������ �̼�', '���� ����', null, null, null, '����', '���� ������ �ʾƿ�', '���� �������̸� �� ���ƿ�', '����Ƽ,������,�мųʺ�'); 
INSERT INTO TB_PROFILE
VALUES('user40', '1', 'M', '����', '175�̻�' , '�α� ���ñ��� ��ȣ', '���� źź', null, null, null, '����', '���� ���ڸ��� ������', '��� ����', 'â������,����,�����ִ�'); 
INSERT INTO TB_PROFILE
VALUES('user41', '1', 'M', '4���̻� ����', '175�̻�' , '��� ����', '��Ű��', null, null, null, '��', '���� ���ſ�', '��� ����', '����Ƽ,������,�мųʺ�'); 
INSERT INTO TB_PROFILE
VALUES('user42', '1', 'M', '����', '175�̻�' , '�α� ���ñ��� ��ȣ', '���� ����', null, null, null, '����', '��¿ �� ���� ���� ���ſ�', '��� ����', '��õ����,������,����'); 
INSERT INTO TB_PROFILE
VALUES('user43', '1', 'M', '�������', '175�̻�' , '���� ������ �̼�', '���� źź', null, null, null, '����', '������� ���� ���̿���', '���� �������̸� �� ���ƿ�', '����Ƽ,������,�мųʺ�'); 
INSERT INTO TB_PROFILE
VALUES('user44', '1', 'M', '����', '175�̻�' , '���� ������ �̼�', '����', null, null, null, '����', '������� ���� ���̿���', '��� ����', 'â������,����,�����ִ�'); 
INSERT INTO TB_PROFILE
VALUES('user45', '1', 'M', '4���̻� ����', '175�̻�' , '��� ����', '����', null, null, null, '��', '���� ���ڸ��� ������', '���� �������̸� �� ���ƿ�', '����Ƽ,������,�мųʺ�'); 
INSERT INTO TB_PROFILE
VALUES('user46', '1', 'M', '�������', '175�̻�' , '���� ������ �̼�', '���� źź', null, null, null, '����', '���� ���ſ�', '��� ����', '����,������,����'); 
INSERT INTO TB_PROFILE
VALUES('user47', '1', 'M', '2��~3�� ����', '175�̻�' , '��� ����', '����', null, null, null, '����', '���� ���ڸ��� ������', '��� ����', '��õ����,������,����'); 
INSERT INTO TB_PROFILE
VALUES('user48', '1', 'M', '�������', '175�̻�' , '���� ������ �̼�', '����', null, null, null, '��', '������� ���� ���̿���', '��� ����', '����Ƽ,������,�мųʺ�'); 
INSERT INTO TB_PROFILE
VALUES('user49', '1', 'M', '4���̻� ����', '175�̻�' , '���� ������ �̼�', '���� źź', null, null, null, '����', '���� ���ڸ��� ������', '��� ����', 'â������,����,�����ִ�'); 
INSERT INTO TB_PROFILE
VALUES('user50', '1', 'M', '2��~3�� ����', '175�̻�' , '���� ������ �̼�', '����', null, null, null, '��', '���� ���ſ�', '���� �������̸� �� ���ƿ�', '����,�мųʺ�,�����ִ�'); 


-- 3. ������ ���� ���̺�
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



-- 4. ��Ī ���� ���̺�

-- 5. ��Ī �亯 ���̺�
-- 5. ��Ī �亯 ���̺�
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

-- 6. �޽��� ���̺�
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user11', 'user44', '�ȳ�', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user22', 'user50', '�ȳ�', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user33', 'user22', '�ȳ�', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user47', 'user44', '�ȳ�', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user37', 'user11', '�ȳ�', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user44', 'user25', '�ȳ�', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user40', 'user19', '�ȳ�', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user24', 'user11', '�ȳ�', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user44', 'user11', '�ȳ�', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user12', 'user34', '�ȳ�', '2017-12-31', 1, 1);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user34', 'user27', '�ȳ�', '2018-01-01', 1, 1);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user22', 'user46', '�ȳ�', '2017-12-29', 1, 1);
INSERT INTO TB_MESSAGE
VALUES (MESSAGE_SEQ.NEXTVAL, 'user11', 'user23', '�ȳ�', '2018-01-01', 1, 1);

-- 7. ���� ���̺�

-- 8. �⼮ ���̺�

-- 9. ���� ���̺�

-- 10. ������ ��볻�� ���̺�

-- 11. �Ű� ���̺�
INSERT INTO TB_REPORT VALUES (1, '�弳/��', 'user11', 'user22', '�Ű�󼼳����Դϴ�.\r\n�Ű�󼼳����̿��������\r\n�׷��׷��׷�', default);
INSERT INTO TB_REPORT VALUES (2, '����(����)', 'user33', 'user44', '�Ű�󼼳��� ���� ��222222222222', 1);
INSERT INTO TB_REPORT VALUES (3, '����', 'user11', 'user33', '�Ű�󼼳��� ���� ��33333333333333', default);
INSERT INTO TB_REPORT VALUES (4, '�������� �Խñ�', 'user23', 'user11', '�Ű�󼼳��� ���� ��444444444444444', default);
INSERT INTO TB_REPORT VALUES (5, '�弳/��', 'user04', 'user29', '�Ű�󼼳��� ���� ��5555555555555', default);
INSERT INTO TB_REPORT VALUES (6, '�弳/��', 'user09', 'user35', '�Ű�󼼳��� ���� ��666666666666666', default);
INSERT INTO TB_REPORT VALUES (7, '�弳/��', 'user20', 'user39', '�Ű�󼼳����Դϴ�.\r\n�Ű�󼼳����̿��������\r\n�׷��׷��׷�', default);

-- 12. �������� ���̺�
INSERT INTO TB_POLL VALUES('1', '���� ������ ���� �����?' ,'0', '17/12/13', '17/12/13', '������ü�� ��.õ.��.��', '�������� ������ �ȵ�ٰ� ����Ѵ�', '������ �����ϴٰ� ���');
INSERT INTO TB_POLL VALUES('2', '���Ÿ�̹��� Ȯ���� �� �ִ� �ñ׳���?', '0', '17/12/13', '17/12/13', '����� �̻��� ��Ų��', '���߿� ��ȭ', 'Ư���� ��ҿ����� ����Ʈ(Ĭ���Ϲ�/���̰���)');
INSERT INTO TB_POLL VALUES('3', '��������� �����Ǵ� ����?', '0', '17/12/13', '17/12/13', '�ܸ� ����̻��� ���', '������ ���Ҷ��� ������ �Ǵ� ���', '���� ���ڴ� ������ ���� ���');
INSERT INTO TB_POLL VALUES('4', '���� ���� �����ϴ� ������?', '0', '17/12/13', '17/12/13', '������� ���� �Ҹ����� �Ա�', '�ɾ������� �ٸ��� ���ϰ� ����', 'ƴ������ ���������� �Ѽ�����');
INSERT INTO TB_POLL VALUES('5', '��ͱ� �� ���ڸ��� ���� �ǹ��� �츮... ���� �츮 ���̴�?', '0', '17/12/13', '17/12/13', '���ú��� 1��!', '���ڸ��� ����� �ֳ���? ���� ������!', '���� �󱼵� ������ ���ƿ�..');
INSERT INTO TB_POLL VALUES('6', '�� ������ ����, ���� ���� �ñ��ϼ���?', '0', '17/12/13', '17/12/13', '����ģ/��ģ�̶��� �� ������ž�?', '������ ���ִ� ������? ������...?', 'ù������ �����߾�?? ������ �߾�...?');
INSERT INTO TB_POLL VALUES('7', '�ַημ� �����Ǵ� Ư¡��?', '0', '17/12/13', '17/12/13', '����� ���ּ���', '�ڽŰ� �϶�', 'ȥ�� �ռ������� ����');
INSERT INTO TB_POLL VALUES('8', '�Ұ���, �� �ÿ� �����°� ���ƿ�?', '0', '17/12/13', '17/12/13', '���� ���� ���� ����ð���', '���ɰ� ���� ���� 3~5��', '�Ϸ� �� ���� ������,����');
INSERT INTO TB_POLL VALUES('9', '������� ������ ��ġ�� ���� 1����?', '0', '17/12/13', '17/12/13', '���� �� �ְ� �Ͱ�, ���� �Ʊ��� �ʴ�.', '�Բ���� �Ⱦ��ϴ� �͵� ��̴�.', '������ ���� ������ �ʴ´�.');
INSERT INTO TB_POLL VALUES('10', '�� ���ο��� �������� �ϴ� �̼�ģ����?', '0', '17/12/13', '17/12/13', '������ �Կ��� ���� ��޵Ǵ� ģ��', '����Ʈ�� ��ġ ���� ���� ��Ÿ���� ģ��', '����������� �˰� ���´� �Ҳ�ģ��');
INSERT INTO TB_POLL VALUES('11', '���� ������ ���� �̼� ��Ÿ����?', '0', '17/12/13', '17/12/13', '������ �����ϴ� �����ϰ� �������� ��', '���� ���� ƥ�� �𸣴� ����/����', '�Ѵ� �ƴѵ� �Ѵ� �´µ��� �ʱ���');

-- 13.��Ī ���� ���̺�
 insert into TB_MATCHING_QUESTION values(1,'�����ϰ���� ��Ÿ���� �������ּ���','���ָ� �ѹ��� �����������','�ѵι� �����Ϻ����','���ְ����� ǳ���ѻ��');
    insert into TB_MATCHING_QUESTION values(2,'���� ���� �� ����Ʈ���� ���� �߿��ϰ� ���� ���� �����ΰ���?','������','��','�ð�');
    insert into TB_MATCHING_QUESTION values(3,'�����ϴ� ���� ��Ÿ��','�ѽ�','���','�߽�');
    insert into TB_MATCHING_QUESTION values(4,'��� ����ð���?','6�ð��̸�','6�ð��̻� 8�ð� �̸�','8�ð� �̻�');
    insert into TB_MATCHING_QUESTION values(5,'��������?�������?','������','�����','����ʵ� �ƴϴ�');
    insert into TB_MATCHING_QUESTION values(6,'�ؿ� ������ ���ٸ� ���� ����ͳ���','������','����','�ϾƸ޸�ī');
    insert into TB_MATCHING_QUESTION values(7,'������ �����ϴ� �Ϸ� ��� ����Ʈ�����?','5���� �̸�','5���� �̻� 10���� �̸�','10���� �̻�');
    insert into TB_MATCHING_QUESTION values(8,'1+1?','2','����','���ϳ��� 1');
    insert into TB_MATCHING_QUESTION values(9,'��Ͱ���� ��Ÿ����?','���찰�� �ֱ����� ����','ģ������ ����','������ �������� ����');
    insert into TB_MATCHING_QUESTION values(10,'���� �ζǿ� ��÷�Ǹ� �ϰ���� ����?','�ҿ��̿��� ���� ���','��ġ�� ���','�θ�Բ� ȿ��');
      
-- 14. �������� �亯 ���̺�
INSERT INTO TB_POLL_ANSWER VALUES('user11','1','1'); 
INSERT INTO TB_POLL_ANSWER VALUES('user22','2','2'); 
INSERT INTO TB_POLL_ANSWER VALUES('user22','3','3'); 
-- 15. �������� ���̺�
INSERT INTO TB_NOTICE VALUES(1, '12/27 ù ��������', '�ȳ��ϼ��� ������ �߰��Դϴ�.', sysdate, DEFAULT);
INSERT INTO TB_NOTICE VALUES(2, '�ι�° ��������', '�ȳ��ϼ��� ������ �߰��Դϴ�.', sysdate, DEFAULT);
INSERT INTO TB_NOTICE VALUES(3, '����° ��������', '�ȳ��ϼ��� ������ �߰��Դϴ�.', sysdate, DEFAULT);
INSERT INTO TB_NOTICE VALUES(4, '�׹�° ��������', '�ȳ��ϼ��� ������ �߰��Դϴ�.', sysdate, DEFAULT);
INSERT INTO TB_NOTICE VALUES(5, '�ټ���° ��������', '�ȳ��ϼ��� ������ �߰��Դϴ�.', sysdate, DEFAULT);
INSERT INTO TB_NOTICE VALUES(6, '������° ��������', '�ȳ��ϼ��� ������ �߰��Դϴ�.', sysdate, DEFAULT);
INSERT INTO TB_NOTICE VALUES(7, '�ϰ���° ��������', '�ȳ��ϼ��� ������ �߰��Դϴ�.', sysdate, DEFAULT);
INSERT INTO TB_NOTICE VALUES(8, '������° ��������', '�ȳ��ϼ��� ������ �߰��Դϴ�.', sysdate, DEFAULT);
INSERT INTO TB_NOTICE VALUES(9, '��ȩ��° ��������', '�ȳ��ϼ��� ������ �߰��Դϴ�.', sysdate, DEFAULT);
INSERT INTO TB_NOTICE VALUES(10, '����° ��������', '�ȳ��ϼ��� ������ �߰��Դϴ�.', sysdate, DEFAULT);

-- 16. ���� �Խ��� ���̺�
INSERT INTO TB_FREE
VALUES (TB_FREE_SEQ.NEXTVAL, '���� �� ���� ��������', '����', '�ٵ� ���� �� ���̸��� ��������', DEFAULT, DEFAULT, 'false');
INSERT INTO TB_FREE
VALUES (TB_FREE_SEQ.NEXTVAL, '�� ���� ��������', '�ʱ���', '�ٵ� ���� �� ���� �޾ƶ�', DEFAULT, DEFAULT, 'true');
INSERT INTO TB_FREE
VALUES (TB_FREE_SEQ.NEXTVAL, '������ ���� �� ���� ��������', '������', '�ٵ� ���� �� ���̸��� ��������', DEFAULT, DEFAULT, 'false');

-- 17. FAQ ���̺�
INSERT INTO TB_FAQ
VALUES (1, '����', '������ �ȵ˴ϴ�.', '�亯�亯�亯�亯', '������', DEFAULT);
INSERT INTO TB_FAQ
VALUES (2, '����', 'ȸ�������� ��� �ϳ���?', '�亯�亯�亯�亯', '������', DEFAULT);
INSERT INTO TB_FAQ
VALUES (3, '����', '���̵� ã�� �� �����ϴ�.', '�亯�亯�亯�亯', '������', DEFAULT);
INSERT INTO TB_FAQ
VALUES (4, '�Խ���', '���� �Ⱥ��Դϴ�.', '�亯�亯�亯�亯�亯', '������', DEFAULT);
INSERT INTO TB_FAQ
VALUES (5, '����', '������ ��� �ϳ���?', '�亯�亯�亯�亯�亯�亯', '������', DEFAULT);
INSERT INTO TB_FAQ
VALUES (6, '�Խ���', '�����Խ����� �����ΰ���?', '�亯�亯�亯�亯�亯', '������', DEFAULT);
INSERT INTO TB_FAQ
VALUES (7, '�Խ���', '���ֹ������� 7', '�亯�亯�亯�亯�亯�亯', '������', DEFAULT);
INSERT INTO TB_FAQ
VALUES (8, '�̺�Ʈ', '�⼮üũ�� �����ΰ���?', '�亯�亯�亯�亯�亯�亯', '������', DEFAULT);
INSERT INTO TB_FAQ
VALUES (9, '�̺�Ʈ', '�������� ��� �򳪿�?', '�亯�亯�亯�亯�亯�亯', '������', DEFAULT);
INSERT INTO TB_FAQ
VALUES (10, '����', '���ֹ������� 10', '�亯�亯�亯�亯�亯�亯', '������', DEFAULT);
INSERT INTO TB_FAQ
VALUES (11, '����', '����Ȯ���� ��� �ϳ���?', '�亯�亯�亯�亯�亯�亯', '������', DEFAULT);
INSERT INTO TB_FAQ
VALUES (12, '������', '������ ������ ��� ����ϳ���?', '�亯�亯�亯�亯�亯�亯�亯', '������', DEFAULT);
INSERT INTO TB_FAQ
VALUES (13, '������', '���� ���� �����Ѱ���?', '�亯�亯�亯�亯�亯�亯�亯', '������', DEFAULT);
INSERT INTO TB_FAQ
VALUES (14, '��Ī', '��Ī�� ��� �ϳ���?', '�亯�亯�亯�亯�亯�亯�亯', '������', DEFAULT);
INSERT INTO TB_FAQ
VALUES (15, '������', '�������̶� �����ΰ���?', '�亯�亯�亯�亯�亯�亯�亯', '������', DEFAULT);
INSERT INTO TB_FAQ
VALUES (16, '��Ī', '��Ī�Ϸ�� ��� �ǳ���?', '�亯�亯�亯�亯�亯�亯�亯', '������', DEFAULT);
INSERT INTO TB_FAQ
VALUES (17, '������', '������ �׸� �� ä���� �ϴ°��ΰ���?', '�亯�亯�亯�亯�亯�亯�亯', '������', DEFAULT);

-- 18. �ϴ��� ���� ���̺�
INSERT INTO TB_INQ
VALUES (TB_INQ_SEQ.NEXTVAL, '��Ī ���ǵ帳�ϴ�.', '��Ī �ִϸ��̼� �ʹ� �߸���̾��!', DEFAULT, NULL, NULL, 'user11', 'admin', 0);
INSERT INTO TB_INQ
VALUES (TB_INQ_SEQ.NEXTVAL, '�⼮üũ �����մϴ�.', '�Ϸ翡 ����Ʈ �󸶳� �ֳ���?', DEFAULT, NULL, NULL, 'user22', 'admin', 0);
INSERT INTO TB_INQ
VALUES (TB_INQ_SEQ.NEXTVAL, '��Ī ����', '��Ī �Ϸ�� �޽��� �����°� �����ΰ���?', DEFAULT, NULL, NULL, 'user33', 'admin', 0);
INSERT INTO TB_INQ
VALUES (TB_INQ_SEQ.NEXTVAL, 'RE: ��Ī ���ǵ帳�ϴ�.', '�ȳ��ϼ��� ���� findlove �Դϴ�. ������ �� �����ϴ� ����� �����帮���� ����ϰڽ��ϴ�. �׻� findlove�� �̿����ּż� �����մϴ�.', DEFAULT, NULL, NULL, 'admin', 'user11', 1);
INSERT INTO TB_INQ
VALUES (TB_INQ_SEQ.NEXTVAL, 'RE: �⼮üũ �����մϴ�.', '�ȳ��ϼ��� ���� findlove �Դϴ�. �Ϸ� �⼮üũ�� �����ص帮�� ����Ʈ�� 100p�� �Ѵ� ���� ��ý�� �߰��� 1000p�� �� �����ص帮�� �ֽ��ϴ�. �׻� findlove�� �̿����ּż� �����մϴ�.', DEFAULT, NULL, NULL, 'admin', 'user22', 2);
INSERT INTO TB_INQ
VALUES (TB_INQ_SEQ.NEXTVAL, 'RE: QnA ��Ī ����', '�ȳ��ϼ��� ���� findlove �Դϴ�. QnA ��Ī ������ �޼��� ������ ����� ������ �帮���ֽ��ϴ�. �׻� findlove�� �̿����ּż� �����մϴ�.', DEFAULT, NULL, NULL, 'admin', 'user33', 3);
INSERT INTO TB_INQ
VALUES (TB_INQ_SEQ.NEXTVAL, '���ǵ帳�ϴ�222222', '�ƾƾƾƾƾƾƾƾƾƾ�', DEFAULT, NULL, NULL, 'user11', 'admin', 0);
INSERT INTO TB_INQ
VALUES (TB_INQ_SEQ.NEXTVAL, '���ǵ帳�ϴ�3333', '��efefe', DEFAULT, NULL, NULL, 'user11', 'admin', 0);

-- 19. �����Խ��� ��� ���̺�


COMMIT;
