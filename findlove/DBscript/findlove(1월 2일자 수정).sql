
/* DB ���� ���� ���� �� ���� ���� */
--CREATE USER final
--IDENTIFIED BY final;
--GRANT CONNECT, RESOURCE TO final;

/*���̺� ����
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
 -- �����Խ��� ������ ���̺�

CREATE SEQUENCE TB_FREE_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
ORDER;
 
 -- 0. ���� ����
 CREATE TABLE TB_SESSION_INFO(
      Session_Key VARCHAR2(100) primary key,
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
COMMENT ON TABLE TB_FREE IS '�����Խ��� ���̺�';
COMMENT ON COLUMN TB_FREE.Free_NO IS '�����Խ��� ��ȣ';
COMMENT ON COLUMN TB_FREE.Free_Writer IS '�����Խ��� �ۼ��� �г���';
COMMENT ON COLUMN TB_FREE.Free_Title IS '�����Խ��� ����';
COMMENT ON COLUMN TB_FREE.Free_Content IS '�����Խ��� ����';
COMMENT ON COLUMN TB_FREE.Free_DT IS '�����Խ��� �ø���¥';
COMMENT ON COLUMN TB_FREE.Free_Read_CNT IS '��ȸ��';

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
CREATE TABLE TB_INQ(
INQ_NO NUMBER, --�ϴ��� ���� ��ȣ
INQ_TITLE VARCHAR2(50) NOT NULL, --�ϴ��� ���� ����
INQ_CONTENT LONG, --�ϴ��� ���� ����
INQ_DATE DATE DEFAULT SYSDATE, --�ϴ��� ���� �ۼ�����
INQ_ORIGINAL_FILENAME VARCHAR2(100) DEFAULT NULL, --�ϴ��� ���� ���� ÷�����ϸ�
INQ_RENAME_FILENAME VARCHAR2(100) DEFAULT NULL, --�ϴ��� ���� �ٲ� ÷�����ϸ�
INQ_WRITER VARCHAR2(15) NOT NULL, --�ϴ��� ���� ������ ����
INQ_RECIVER VARCHAR2(15), --�ϴ��� ���� �޴� ����

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


----------------- ���õ����� -------------------
-- 1. ����� ���̺�
INSERT INTO TB_USER VALUES('admin', 'admin', '������', '������', '1', 'admin@naver.com', '010-1234-5678', 1000, 1000, 'M', default, '2017-11-12', default, null); 
INSERT INTO TB_USER VALUES('user11', 'pass11', '����ȣ', '�ʱ���', '1', 'raccoon@naver.com', '010-1234-1111', 1000, 1000, 'D', 3, '2017-12-12', default, null); 
INSERT INTO TB_USER VALUES('user22', 'pass22', '������', '����', '1', 'pig22@naver.com', '010-1234-2222', default, default, 'P', 3.5, '2017-10-01', default, null); 
INSERT INTO TB_USER VALUES('user33', 'pass33', '������', '������', '1', 'keeper@naver.com', '010-1234-3333', default, default, 'G', 3.5, '2017-12-19', default, null); 
INSERT INTO TB_USER VALUES('user44', 'pass44', '������', '����', '2', 'tree@gmail.com', '010-1234-4444', default, default, 'S', 4, '2017-02-09', '2017-05-10', null); 
INSERT INTO TB_USER VALUES('user55', 'pass55', '������', '��', '3', 'bear55@naver.com', '010-1234-5555', default, default, 'B', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user66', 'pass66', '������', '��', '2', 'mouse@naver.com', '010-1234-6666', default, default, 'G', 4, '2017-06-06', '2017-06-06', null); 
INSERT INTO TB_USER VALUES('user77', 'pass77', '�迩��', '����', '4', 'fox77@naver.com', '010-1234-7777', default, default, 'G', 4.5, '2017-10-10', '2017-10-10', null); 
INSERT INTO TB_USER VALUES('user88', 'pass88', '�輱��', '����', '0', 'sun88@naver.com', '010-1234-8888', default, default, default, 3.5, default, default, null); 
INSERT INTO TB_USER VALUES('user99', 'pass99', '������', '����', '0', 'youjin99@naver.com', '010-1234-9999', default, default, default, 1.5, default, default, null); 
INSERT INTO TB_USER VALUES('user00', 'pass00', '������', '����', '0', 'genie00@naver.com', '010-1234-0000', default, default, default, 0.5, default, default, null); 

INSERT INTO TB_USER VALUES('user12', 'pass11', '����ȣ2', '�ʱ���2', '1', 'raccoon@naver.com', '010-1234-1111', default, default, 'D', 3, '2017-12-12', default, null); 
INSERT INTO TB_USER VALUES('user23', 'pass22', '������2', '����2', '1', 'pig22@naver.com', '010-1234-2222', default, default, 'P', 3.5, '2017-10-01', default, null); 
INSERT INTO TB_USER VALUES('user34', 'pass33', '������2', '������2', '1', 'keeper@naver.com', '010-1234-3333', default, default, 'G', 3.5, '2017-12-19', default, null); 
INSERT INTO TB_USER VALUES('user45', 'pass44', '������2', '����2', '2', 'tree@gmail.com', '010-1234-4444', default, default, 'S', 4, '2017-02-09', '2017-05-10', null); 
INSERT INTO TB_USER VALUES('user56', 'pass55', '������2', '��2', '3', 'bear55@naver.com', '010-1234-5555', default, default, 'B', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user67', 'pass66', '������2', '��2', '2', 'mouse@naver.com', '010-1234-6666', default, default, 'G', 4, '2017-06-06', '2017-06-06', null); 
INSERT INTO TB_USER VALUES('user78', 'pass77', '�迩��2', '����2', '4', 'fox77@naver.com', '010-1234-7777', default, default, 'G', 4.5, '2017-10-10', '2017-10-10', null); 
INSERT INTO TB_USER VALUES('user89', 'pass88', '�輱��2', '����2', '0', 'sun88@naver.com', '010-1234-8888', default, default, default, 3.5, default, default, null); 
INSERT INTO TB_USER VALUES('user90', 'pass99', '������2', '����2', '0', 'youjin99@naver.com', '010-1234-9999', default, default, default, 1.5, default, default, null); 

-- 2. �����(�Ǵ� �̻���) ������
INSERT INTO TB_PROFILE
VALUES ('user11', '0', 'M', 25, 182, '����', '���� ����', '4�����','ȸ���', 'O', '����', '���� ������ �ʾƿ�', '�⵶��', '��õ����,����,����Ƽ');
INSERT INTO TB_PROFILE
VALUES ('user22', '0', 'M', 25, 177, '�λ�', '����', '4�����','ȸ���', 'O', '����', '��¿ �� ���� ���� ���ſ�', '�ұ�', '���,������,â������');
INSERT INTO TB_PROFILE
VALUES ('user33', '0', 'M', 25, 188, '����', '���� źź', '4�����','ȸ���', 'O', '����', '���� ���ſ�', '����','��������,�����ִ�,����');
INSERT INTO TB_PROFILE
VALUES ('user44', '0', 'M', 21, 170, '�뱸', '����', '4�����','ȸ���', 'A', '��', '������� ���� ���̿���', 'õ�ֱ�', '�мųʺ�,������,�Ϳ���');
INSERT INTO TB_PROFILE
VALUES ('user55', '0', 'M', 22, 177, '����', '����', '4�����','ȸ���', 'AB', '����', '���� ���ڸ��� ������', '����', '����,����,����Ƽ');
INSERT INTO TB_PROFILE
VALUES ('user66', '0', 'F', 23, 160, '�λ�', '����', '4�����','ȸ���', 'B', '��', '��¿ �� ���� ���� ���ſ�', '����', '������,���,�����ִ�');
INSERT INTO TB_PROFILE
VALUES ('user77', '0', 'F', 24, 155, '����', '���� ����', '4�����','ȸ���', 'O', '����', '���� ���ſ�', '����', '����,������,�мųʺ�');
INSERT INTO TB_PROFILE
VALUES ('user88', '0', 'F', 28, 172, '���', '��Ű��', '4�����', '�ڿ���', 'B', '��', '������� ���� ���̿���', '�ұ�', '��õ����,���,��������');
INSERT INTO TB_PROFILE
VALUES ('user99', '0', 'F', 24, 150, '����', '����', '4�����', '��������', 'AB', '����', '���� ���ڸ��� ������', '����', '�мųʺ�,�����ִ�,��õ����');
INSERT INTO TB_PROFILE
VALUES ('user00', '0', 'F', 22, 157, '���-���� �α�', '��Ű��', '4�����', '���л�', 'B', '��', '���� ���ڸ��� ������', '�⵶��', '����,�����ִ�,����');

INSERT INTO TB_PROFILE
VALUES ('user12', '0', 'F', 25, 182, '����', '���� ����', '4�����','ȸ���', 'O', '����', '���� ������ �ʾƿ�', '�⵶��', '��õ����,����,����Ƽ');
INSERT INTO TB_PROFILE
VALUES ('user23', '0', 'F', 35, 177, '�λ�', '����', '4�����','ȸ���', 'O', '����', '��¿ �� ���� ���� ���ſ�', '�ұ�', '���,������,â������');
INSERT INTO TB_PROFILE
VALUES ('user34', '0', 'F', 25, 188, '����', '���� źź', '4�����','ȸ���', 'O', '����', '���� ���ſ�', '����','��������,�����ִ�,����');
INSERT INTO TB_PROFILE
VALUES ('user45', '0', 'F', 19, 170, '�뱸', '����', '4�����','ȸ���', 'A', '��', '������� ���� ���̿���', 'õ�ֱ�', '�мųʺ�,������,�Ϳ���');
INSERT INTO TB_PROFILE
VALUES ('user56', '0', 'F', 22, 177, '����', '����', '4�����','ȸ���', 'AB', '����', '���� ���ڸ��� ������', '����', '����,����,����Ƽ');
INSERT INTO TB_PROFILE
VALUES ('user67', '0', 'F', 33, 160, '�λ�', '����', '4�����','ȸ���', 'B', '��', '��¿ �� ���� ���� ���ſ�', '����', '������,���,�����ִ�');
INSERT INTO TB_PROFILE
VALUES ('user78', '0', 'F', 24, 155, '����', '���� ����', '4�����','ȸ���', 'O', '����', '���� ���ſ�', '����', '����,������,�мųʺ�');
INSERT INTO TB_PROFILE
VALUES ('user89', '0', 'F', 28, 172, '���', '��Ű��', '4�����', '�ڿ���', 'B', '��', '������� ���� ���̿���', '�ұ�', '��õ����,���,��������');
INSERT INTO TB_PROFILE
VALUES ('user90', '0', 'F', 24, 150, '����', '����', '4�����', '��������', 'AB', '����', '���� ���ڸ��� ������', '����', '�мųʺ�,�����ִ�,��õ����');

INSERT INTO TB_PROFILE
VALUES('user11', '1', 'F', '4������ ����', '�������' , '���� ������ �̼�', '��Ű��', null, null, null, '����', '������� ���� ���̿���', '���� �������̸� �� ���ƿ�', '��õ����,������,����Ƽ'); 
INSERT INTO TB_PROFILE
VALUES('user22', '1', 'F', '�������', '154����' , '��� ����', '���� ����', null, null, null, '����', '���� ���ſ�', '��� ����', '��õ����,������,�мųʺ�'); 
INSERT INTO TB_PROFILE
VALUES('user33', '1', 'F', '����', '155~159' , '�α� ���ñ��� ��ȣ', '���� ����', null, null, null, '����', '���� ���ڸ��� ������', '���� �������̸� �� ���ƿ�', '��õ����,������,����'); 
INSERT INTO TB_PROFILE
VALUES('user44', '1', 'F', '4������ ����', '165~169' , '��� ����', '����', null, null, null, '��', '��¿ �� ���� ���� ���ſ�', '��� ����', '����,�мųʺ�,�����ִ�'); 
INSERT INTO TB_PROFILE
VALUES('user55', '1', 'F', '2��~3�� ����', '��� 175�̻�' , '���� ������ �̼�', '����', null, null, null, '����', '���� ���ڸ��� ������', '���� �������̸� �� ���ƿ�', '����Ƽ,������,����'); 
INSERT INTO TB_PROFILE
VALUES('user66', '1', 'M', '2��~3�� ����', '175�̻�' , '�α� ���ñ��� ��ȣ', '��Ű��', null, null, null, '��', '���� ������ �ʾƿ�', '��� ����', 'â������,����,�����ִ�'); 
INSERT INTO TB_PROFILE
VALUES('user77', '1', 'M', '4���̻� ����', '175�̻�' , '���� ������ �̼�', '����', null, null, null, '����', '������� ���� ���̿���', '��� ����', '����,������,��������'); 
INSERT INTO TB_PROFILE
VALUES('user88', '1', 'M', '�������', '175�̻�' , '���� ������ �̼�', '����', null, null, null, '����', '���� ���ſ�', '���� �������̸� �� ���ƿ�', '�����ִ�,������,����'); 
INSERT INTO TB_PROFILE
VALUES('user99', '1', 'M', '�������', '175�̻�' , '�α� ���ñ��� ��ȣ', '���� źź', null, null, null, '����', '���� ���ڸ��� ������', '��� ����', '����,������,����'); 
INSERT INTO TB_PROFILE
VALUES('user00', '1', 'M', '����', '175�̻�' , '���� ������ �̼�', '����', null, null, null, '����', '������� ���� ���̿���', '��� ����', '����Ƽ,������,�мųʺ�'); 


-- 3. ������ ���� ���̺�
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

-- 4. ��Ī ���� ���̺�

-- 5. ��Ī �亯 ���̺�

-- 6. �޽��� ���̺�
INSERT INTO TB_MESSAGE
VALUES (1, 'user11', 'user44', '�ȳ�', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (2, 'user22', 'user55', '�ȳ�', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (3, 'user33', 'user22', '�ȳ�', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (4, 'user77', 'user44', '�ȳ�', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (5, 'user77', 'user11', '�ȳ�', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (6, 'user44', 'user11', '�ȳ�', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (7, 'user44', 'user11', '�ȳ�', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (8, 'user44', 'user11', '�ȳ�', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (9, 'user44', 'user11', '�ȳ�', default, default, default);
INSERT INTO TB_MESSAGE
VALUES (10, 'user12', 'user34', '�ȳ�', '2017-12-31', 1, 1);
INSERT INTO TB_MESSAGE
VALUES (11, 'user34', 'user55', '�ȳ�', '2018-01-01', 1, 1);
INSERT INTO TB_MESSAGE
VALUES (12, 'user99', 'user45', '�ȳ�', '2017-12-29', 1, 1);
INSERT INTO TB_MESSAGE
VALUES (13, 'user88', 'user78', '�ȳ�', '2018-01-01', 1, 1);

-- 7. ���� ���̺�

-- 8. �⼮ ���̺�

-- 9. ���� ���̺�

-- 10. ������ ��볻�� ���̺�

-- 11. �Ű� ���̺�
INSERT INTO TB_REPORT VALUES (1, '�弳/��', 'user11', 'user22', '�Ű�󼼳����Դϴ�.\r\n�Ű�󼼳����̿��������\r\n�׷��׷��׷�', default);
INSERT INTO TB_REPORT VALUES (2, '����(����)', 'user33', 'user55', '�Ű�󼼳��� ���� ��222222222222', 1);
INSERT INTO TB_REPORT VALUES (3, '����', 'user11', 'user33', '�Ű�󼼳��� ���� ��33333333333333', default);
INSERT INTO TB_REPORT VALUES (4, '�������� �Խñ�', 'user77', 'user11', '�Ű�󼼳��� ���� ��444444444444444', default);
INSERT INTO TB_REPORT VALUES (5, '�弳/��', 'user44', 'user55', '�Ű�󼼳��� ���� ��5555555555555', default);
INSERT INTO TB_REPORT VALUES (6, '�弳/��', 'user11', 'user66', '�Ű�󼼳��� ���� ��666666666666666', default);
INSERT INTO TB_REPORT VALUES (7, '�弳/��', 'user22', 'user33', '�Ű�󼼳����Դϴ�.\r\n�Ű�󼼳����̿��������\r\n�׷��׷��׷�', default);

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
VALUES (TB_FREE_SEQ.NEXTVAL, '���� �� ���� ��������', '����', '�ٵ� ���� �� ���̸��� ��������', DEFAULT, DEFAULT);
INSERT INTO TB_FREE
VALUES (TB_FREE_SEQ.NEXTVAL, '�� ���� ��������', '�ʱ���', '�ٵ� ���� �� ���� �޾ƶ�', DEFAULT, DEFAULT);
INSERT INTO TB_FREE
VALUES (TB_FREE_SEQ.NEXTVAL, '������ ���� �� ���� ��������', '������', '�ٵ� ���� �� ���̸��� ��������', DEFAULT, DEFAULT);

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

-- 19. �����Խ��� ��� ���̺�


COMMIT;