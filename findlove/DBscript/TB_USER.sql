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

INSERT INTO TB_USER VALUES('admin', 'admin', '관리자', '관리자', '1', 'admin@naver.com', '010-1234-5678', 
default, default, 'G', default, default, default, null); 
INSERT INTO TB_USER VALUES('user11', 'pass11', '윤찬호', '너구리', '1', 'raccoon@naver.com', '010-1234-
1111', default, default, 'D', 1, default, default, null); 
INSERT INTO TB_USER VALUES('user22', 'pass22', '손정한', '돼지', '1', 'pig22@naver.com', '010-1234-2222', 
default, default, 'P', 2, default, default, null); 
INSERT INTO TB_USER VALUES('user33', 'pass33', '김지훈', '사육사', '2', 'keeper@naver.com', '010-1234-
3333', default, default, 'G', 3, default, default, null); 
INSERT INTO TB_USER VALUES('user44', 'pass44', '남찬우', '나무', '2', 'tree@gmail.com', '010-1234-4444', 
default, default, 'S', 4, default, default, null); 
INSERT INTO TB_USER VALUES('user55', 'pass55', '조남훈', '곰', '3', 'bear55@naver.com', '010-1234-5555', 
default, default, 'B', 5, default, default, null); 
INSERT INTO TB_USER VALUES('user66', 'pass66', '김혜정', '쥐', '3', 'mouse@naver.com', '010-1234-6666', 
default, default, 'G', 6, default, default, null); 
INSERT INTO TB_USER VALUES('user77', 'pass77', '김여진', '여우', '4', 'fox77@naver.com', '010-1234-7777', 
default, default, 'G', 7, default, default, null); 


COMMIT;