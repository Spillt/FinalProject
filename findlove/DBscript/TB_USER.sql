DROP TABLE TB_USER CASCADE  CONSTRAINTS;

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
COMMENT ON COLUMN TB_USER.Rank_GB IS '������ �� ��� ����(������(G),�Ϲ�ȸ��(D:���̾�/P:�÷�Ƽ��/G:���/S:�ǹ�/B:�����))';
COMMENT ON COLUMN TB_USER.Grade_AVG IS '����';
COMMENT ON COLUMN TB_USER.Enroll_DT IS '������';
COMMENT ON COLUMN TB_USER.Latest_Access_DT IS '�ֱ� ������';
COMMENT ON COLUMN TB_USER.Delete_DT IS '������';

INSERT INTO TB_USER VALUES('admin', 'admin', '������', '������', '1', 'admin@naver.com', '010-1234-5678', 
default, default, 'G', default, default, default, null); 
INSERT INTO TB_USER VALUES('user11', 'pass11', '����ȣ', '�ʱ���', '1', 'raccoon@naver.com', '010-1234-
1111', default, default, 'D', 1, default, default, null); 
INSERT INTO TB_USER VALUES('user22', 'pass22', '������', '����', '1', 'pig22@naver.com', '010-1234-2222', 
default, default, 'P', 2, default, default, null); 
INSERT INTO TB_USER VALUES('user33', 'pass33', '������', '������', '2', 'keeper@naver.com', '010-1234-
3333', default, default, 'G', 3, default, default, null); 
INSERT INTO TB_USER VALUES('user44', 'pass44', '������', '����', '2', 'tree@gmail.com', '010-1234-4444', 
default, default, 'S', 4, default, default, null); 
INSERT INTO TB_USER VALUES('user55', 'pass55', '������', '��', '3', 'bear55@naver.com', '010-1234-5555', 
default, default, 'B', 5, default, default, null); 
INSERT INTO TB_USER VALUES('user66', 'pass66', '������', '��', '3', 'mouse@naver.com', '010-1234-6666', 
default, default, 'G', 6, default, default, null); 
INSERT INTO TB_USER VALUES('user77', 'pass77', '�迩��', '����', '4', 'fox77@naver.com', '010-1234-7777', 
default, default, 'G', 7, default, default, null); 


COMMIT;