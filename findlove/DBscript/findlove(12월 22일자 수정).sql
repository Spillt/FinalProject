
/* DB ���� ���� ���� �� ���� ���� */
--CREATE USER final
--IDENTIFIED BY final;
--GRANT CONNECT, RESOURCE TO final;

/*���̺� ����*/
DROP TABLE TB_FAQ;
DROP TABLE TB_FREE;
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
DROP TABLE TB_INQ CASCADE  CONSTRAINTS;


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
);
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
COMMENT ON TABLE TB_PROFILE IS 'ȸ�� ������ ���̺�';
COMMENT ON COLUMN TB_PROFILE.User_ID IS '���̵�';
COMMENT ON COLUMN TB_PROFILE.Target_GB IS '��� ����(0:��/1:�̻���)';
COMMENT ON COLUMN TB_PROFILE.Gender IS '����';
COMMENT ON COLUMN TB_PROFILE.Age IS '����';
COMMENT ON COLUMN TB_PROFILE.Height IS 'Ű';
COMMENT ON COLUMN TB_PROFILE.Weight IS '������';
COMMENT ON COLUMN TB_PROFILE.Area IS '����';
COMMENT ON COLUMN TB_PROFILE.Hobby IS '���';
COMMENT ON COLUMN TB_PROFILE.Achievement IS '�з�';
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
COMMENT ON TABLE TB_POLL IS '�������� ���̺�';
COMMENT ON COLUMN TB_POLL.Poll_NO IS '������ȣ';
COMMENT ON COLUMN TB_POLL.Poll_Title IS '��������';
COMMENT ON COLUMN TB_POLL.Poll_ST IS '���� ����(0:�غ�/1:����/2:����)';
COMMENT ON COLUMN TB_POLL.Start_DT IS '����������';
COMMENT ON COLUMN TB_POLL.End_DT IS '����������';
COMMENT ON COLUMN TB_POLL.ANSWER1 IS '�亯1';
COMMENT ON COLUMN TB_POLL.ANSWER2 IS '�亯2';
COMMENT ON COLUMN TB_POLL.ANSWER3 IS '�亯3';

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
  Notice_File_ONM VARCHAR2(100),
  Notice_File_RNM VARCHAR2(100),
  Notice_Read_CNT NUMBER DEFAULT 0,
  
  CONSTRAINT PK_NOTICE PRIMARY KEY (Notice_NO)  
);
COMMENT ON TABLE TB_NOTICE IS '�������� ���̺�';
COMMENT ON COLUMN TB_NOTICE.Notice_NO IS '�������� ��ȣ';
COMMENT ON COLUMN TB_NOTICE.Notice_Title IS '��������';
COMMENT ON COLUMN TB_NOTICE.Notice_Content IS '����';
COMMENT ON COLUMN TB_NOTICE.Notice_DT IS '�ۼ���';
COMMENT ON COLUMN TB_NOTICE.Notice_File_ONM IS '���� ÷�����ϸ�';
COMMENT ON COLUMN TB_NOTICE.Notice_File_RNM IS '�ٲ� ÷�����ϸ�';
COMMENT ON COLUMN TB_NOTICE.Notice_Read_CNT IS '��ȸ��';

-- 16. ���� �Խ��� ���̺�
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
COMMENT ON TABLE TB_FREE IS '�����Խ��� ���̺�';
COMMENT ON COLUMN TB_FREE.Free_NO IS '�����Խ��� ��ȣ';
COMMENT ON COLUMN TB_FREE.Free_GB IS '�����Խ��� ����';
COMMENT ON COLUMN TB_FREE.Free_Writer_ID IS '�����Խ��� �ۼ��� ���̵�';
COMMENT ON COLUMN TB_FREE.Free_Title IS '�����Խ��� ����';
COMMENT ON COLUMN TB_FREE.Free_Content IS '�����Խ��� ����';
COMMENT ON COLUMN TB_FREE.Free_DT IS '�����Խ��� �ø���¥';
COMMENT ON COLUMN TB_FREE.Free_File_ONM IS '����÷�����ϸ�';
COMMENT ON COLUMN TB_FREE.Free_File_RNM IS '�ٲ�÷�����ϸ�';
COMMENT ON COLUMN TB_FREE.Free_Level IS '�۷���(0:����/1:���/2:����)';
COMMENT ON COLUMN TB_FREE.Free_Ref IS '�������۹�ȣ(����:�ڱ��ȣ/���:�������۹�ȣ)';
COMMENT ON COLUMN TB_FREE.Free_Reply_Ref IS '������۹�ȣ(0:����/1:�ڱ��ȣ/2:������۹�ȣ)';
COMMENT ON COLUMN TB_FREE.Free_Reply_SQ IS '��ۼ���(������)';
COMMENT ON COLUMN TB_FREE.Free_Read_CNT IS '��ȸ��';

-- 17. FAQ ���̺�
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
COMMENT ON TABLE TB_FAQ IS '���ֹ������� ���̺�';
COMMENT ON COLUMN TB_FAQ.FAQ_NO IS 'FAQ ��ȣ';
COMMENT ON COLUMN TB_FAQ.FAQ_GB IS 'FAQ ����';
COMMENT ON COLUMN TB_FAQ.FAQ_Title IS 'FAQ ����';
COMMENT ON COLUMN TB_FAQ.FAQ_Content IS 'FAQ ����';
COMMENT ON COLUMN TB_FAQ.FAQ_DT IS 'FAQ �ø���¥';
COMMENT ON COLUMN TB_FAQ.FAQ_File_ONM IS '����÷�����ϸ�';
COMMENT ON COLUMN TB_FAQ.FAQ_File_RNM IS '�ٲ�÷�����ϸ�';
COMMENT ON COLUMN TB_FAQ.FAQ_Read_CNT IS '��ȸ��';

-- 18. �ϴ��� ���� ���̺�
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

COMMENT ON COLUMN TB_INQ.INQ_NO IS '���� ��ȣ';
COMMENT ON COLUMN TB_INQ.INQ_TITLE IS '���� ����';
COMMENT ON COLUMN TB_INQ.INQ_CONTENT IS '���� ����';
COMMENT ON COLUMN TB_INQ.INQ_DATE IS '���� �ۼ�����';
COMMENT ON COLUMN TB_INQ.INQ_ORIGINAL_FILENAME IS '���� ���� ÷�����ϸ�';
COMMENT ON COLUMN TB_INQ.INQ_RENAME_FILENAME IS '���� �ٲ� ÷�����ϸ�';
COMMENT ON COLUMN TB_INQ.INQ_WRITER IS '���� ������ ����';
COMMENT ON COLUMN TB_INQ.INQ_RECIVE IS '���� �޴� ����';



----------------- ���õ����� -------------------
-- 1. ����� ���̺�
INSERT INTO TB_USER VALUES('admin', 'admin', '������', '������', '1', 'admin@naver.com', '010-1234-5678', default, default, 'M', default, '2017-11-12', default, null); 
INSERT INTO TB_USER VALUES('user11', 'pass11', '����ȣ', '�ʱ���', '1', 'raccoon@naver.com', '010-1234-1111', default, default, 'D', 3, '2017-12-12', default, null); 
INSERT INTO TB_USER VALUES('user22', 'pass22', '������', '����', '1', 'pig22@naver.com', '010-1234-2222', default, default, 'P', 3.5, '2017-10-01', default, null); 
INSERT INTO TB_USER VALUES('user33', 'pass33', '������', '������', '1', 'keeper@naver.com', '010-1234-3333', default, default, 'G', 3.5, '2017-12-19', default, null); 
INSERT INTO TB_USER VALUES('user44', 'pass44', '������', '����', '2', 'tree@gmail.com', '010-1234-4444', default, default, 'S', 4, '2017-02-09', '2017-05-10', null); 
INSERT INTO TB_USER VALUES('user55', 'pass55', '������', '��', '3', 'bear55@naver.com', '010-1234-5555', default, default, 'B', 4, '2017-11-11', default, null); 
INSERT INTO TB_USER VALUES('user66', 'pass66', '������', '��', '2', 'mouse@naver.com', '010-1234-6666', default, default, 'G', 4, '2017-06-06', '2017-06-06', null); 
INSERT INTO TB_USER VALUES('user77', 'pass77', '�迩��', '����', '4', 'fox77@naver.com', '010-1234-7777', default, default, 'G', 4.5, '2017-10-10', '2017-10-10', null); 
INSERT INTO TB_USER VALUES('user88', 'pass88', '������', '����1', '0', 'fox88@naver.com', '010-1234-8888', default, default, default, 3.5, default, default, null); 
INSERT INTO TB_USER VALUES('user99', 'pass99', '���迩', '����2', '0', 'fox99@naver.com', '010-1234-9999', default, default, default, 1.5, default, default, null); 
INSERT INTO TB_USER VALUES('user00', 'pass00', '������', '����3', '0', 'fox00@naver.com', '010-1234-0000', default, default, default, 0.5, default, default, null); 

-- 2. �����(�Ǵ� �̻���) ������
INSERT INTO TB_PROFILE
VALUES ('user11', '0', 'M', 25, 182, 85, '���� ������', '����,���� ����,��Ÿ', '4�����', 'O', 'NO', '��1��', '�⵶��', '�Ϳ�,����');
INSERT INTO TB_PROFILE
VALUES ('user22', '0', 'M', 25, 177, 85, '���� ������', '����,���� ����,��Ÿ', '4�����', 'O', 'NO', '��1��', '�ұ�', '�Ϳ�,����');
INSERT INTO TB_PROFILE
VALUES ('user33', '0', 'M', 25, 188, 85, '���� ������', '����,���� ����,��Ÿ', '4�����', 'O', 'NO', '��1��', '����','��Ż1,��Ż2');
INSERT INTO TB_PROFILE
VALUES ('user44', '0', 'F', 21, 170, 100, '�뱸', '����,�뷡', '4�����', 'A', '��1��', 'NO', 'õ�ֱ�', '��Ż1,��Ż2');
INSERT INTO TB_PROFILE
VALUES ('user55', '0', 'M', 22, 177, 66, '����', '���1,���2', '4�����', 'AB', 'NO', '��2��', '����', '��Ż1,��Ż2');
INSERT INTO TB_PROFILE
VALUES ('user66', '0', 'F', 23, 160, 45, '�λ�', '���ǰ���,���1', '4�����', 'B', '��3��', '��3��', '����', '��Ż1,��Ż2');
INSERT INTO TB_PROFILE
VALUES ('user77', '0', 'M', 24, 155, 55, '����', '���,���,���', '4�����', 'O', 'NO', '��1��', '����', '��Ż1,��Ż2');


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
INSERT INTO TB_POLL VALUES('1','���� ��¼��','0','2017/12/13','2017/12/13','qwww','�̻��Ѹ�', '�ֱ�'); 
INSERT INTO TB_POLL VALUES('2','���� ��¼��','0','2017/12/13','2017/12/13','asasd','�ȳ�', '�ȳ��ϼ���'); 
INSERT INTO TB_POLL VALUES('3','���� ��¼��','0','2017/12/13','2017/12/13','asasd','�ȳ�', '�ȳ��ϼ���'); 
INSERT INTO TB_POLL VALUES('4','���� ��¼��','0','2017/12/13','2017/12/13','asasd','�ȳ�', '�ȳ��ϼ���'); 
INSERT INTO TB_POLL VALUES('5','���� ��¼��','0','2017/12/13','2017/12/13','asasd','�ȳ�', '�ȳ��ϼ���'); 
INSERT INTO TB_POLL VALUES('6','���� ��¼��','0','2017/12/13','2017/12/13','asasd','�ȳ�', '�ȳ��ϼ���'); 
INSERT INTO TB_POLL VALUES('7','���� ��¼��','0','2017/12/13','2017/12/13','asasd','�ȳ�', '�ȳ��ϼ���'); 
INSERT INTO TB_POLL VALUES('8','���� ��¼��','0','2017/12/13','2017/12/13','asasd','�ȳ�', '�ȳ��ϼ���'); 
INSERT INTO TB_POLL VALUES('9','���� ��¼��','0','2017/12/13','2017/12/13','asasd','�ȳ�', '�ȳ��ϼ���'); 
INSERT INTO TB_POLL VALUES('10','���� ��¼��','0','2017/12/13','2017/12/13','asasd','�ȳ�', '�ȳ��ϼ���'); 
INSERT INTO TB_POLL VALUES('11','���� ��¼��','0','2017/12/13','2017/12/13','asasd','�ȳ�', '�ȳ��ϼ���'); 
      
-- 14. �������� �亯 ���̺�
INSERT INTO TB_POLL_ANSWER VALUES('user11','1','1'); 
INSERT INTO TB_POLL_ANSWER VALUES('user22','2','2'); 
INSERT INTO TB_POLL_ANSWER VALUES('user22','3','3'); 
-- 15. �������� ���̺�

-- 16. ���� �Խ��� ���̺�

-- 17. FAQ ���̺�

-- 18. �ϴ��� ���� ���̺�


COMMIT;