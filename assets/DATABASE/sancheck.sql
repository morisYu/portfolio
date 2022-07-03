/* sancheck */

-- 사용자 추가(ID: user, PASSWORD: user1234)
CREATE USER 'user'@'%' IDENTIFIED BY 'user1234';
-- 사용자에게 권한 부여(모든 권한) 
GRANT ALL PRIVILEGES ON *.* TO 'user'@'%';

-- 데이터베이스 생성
DROP DATABASE IF EXISTS sancheck;
CREATE DATABASE sancheck;

-- 데이터베이스의 인코딩 설정
-- 기존 utf8(utf8mb3, 문자 하나에 3 byte 사용)은 이모지를 지원하지 않기 때문에 utf8mb4(문자 하나에 4 byte 사용)로 설정
ALTER DATABASE sancheck CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- A character set is an encoding system to let computers know how to recognize Character,
-- including letters, numbers, punctuation marks, and whitespace.(mozilla.org 참고)
-- MySQL 에서 지원하는 CHARACTER SET 목록 확인
SHOW CHAR SET;

-- COLLATE 는 문자셋을 어떻게 정렬할지 결정하는 알고리즘
-- MySQL 에서 제공하는 COLLATE 목록 확인
SHOW COLLATION;

-- db 선택
USE sancheck;

/************************* 사용자(user) ***************************/
-- 사용자 테이블 생성
DROP TABLE IF EXISTS user_tbl;
CREATE TABLE user_tbl (
	user_no INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(20) NOT NULL UNIQUE,
    user_password VARCHAR(20) NOT NULL,
    user_name VARCHAR(20) NOT NULL,
	user_nickname VARCHAR(20) UNIQUE,
    user_mobile VARCHAR(20) NOT NULL,
    user_region VARCHAR (20),
    user_email VARCHAR(30),
    user_grade VARCHAR(50),
    user_join_date VARCHAR(50)
)DEFAULT CHARSET=utf8mb4;

/************************* 장소정보(place) ***************************/
-- 장소정보 테이블 생성
DROP TABLE place_tbl;
CREATE TABLE place_tbl (
	place_no INT AUTO_INCREMENT PRIMARY KEY,
    place_write_id VARCHAR(20),
    place_name VARCHAR(20) NOT NULL,
    place_addr VARCHAR(50) NOT NULL,
    place_tel VARCHAR(20),
    place_business_hours VARCHAR(50),
    place_other VARCHAR(50),
    place_photo TEXT,
    CONSTRAINT user_place_id_fk
    FOREIGN KEY (place_write_id)
    REFERENCES user_tbl(user_id) 
)DEFAULT CHARSET=utf8mb4;

/************************* 일정관리(plan) ***************************/
-- 일정관리 테이블 생성
DROP TABLE IF EXISTS plan_tbl;
CREATE TABLE plan_tbl (
	plan_no INT AUTO_INCREMENT PRIMARY KEY,
    plan_id VARCHAR(20),
    plan_kind VARCHAR(20),
    plan_color VARCHAR(20),
    plan_content VARCHAR(20),
    plan_reg_date VARCHAR(20),
    CONSTRAINT user_plan_id_fk
    FOREIGN KEY (plan_id)
    REFERENCES user_tbl(user_id) 
)DEFAULT CHARSET=utf8mb4;

/************************* 산책기록(record) ***************************/
-- 산책기록 테이블 생성
DROP TABLE IF EXISTS record_tbl;
CREATE TABLE record_tbl (
	record_no INT AUTO_INCREMENT PRIMARY KEY,
    record_nickname VARCHAR(20),
    record_title VARCHAR(20),
    record_content TEXT,
    record_photo TEXT,
    record_nice INT,
    record_reg_date VARCHAR(20),
    record_open BOOL,
    record_ip VARCHAR(50),
	CONSTRAINT user_plan_nickname_fk
    FOREIGN KEY (record_nickname)
    REFERENCES user_tbl(user_nickname) 
)DEFAULT CHARSET=utf8mb4;

/************************* 산책기록 댓글(record_comment) ***************************/
-- 산책기록 댓글 테이블 생성
DROP TABLE IF EXISTS record_comment_tbl;
CREATE TABLE record_comment_tbl (
	record_comment_no INT AUTO_INCREMENT PRIMARY KEY,
    record_no INT,
    record_comment_nickname VARCHAR(20),
    record_comment VARCHAR(20),
    record_comment_reg_date VARCHAR(50)
);

/************************* 게시판(board) ***************************/
-- 게시판 테이블 생성
DROP TABLE IF EXISTS board_tbl;
CREATE TABLE board_tbl (
	board_no INT AUTO_INCREMENT PRIMARY KEY,
    board_nickname VARCHAR(20),
    board_title VARCHAR(20),
    board_content TEXT,
    board_nice INT,
    board_photo TEXT,
    board_reg_date VARCHAR(50),
    board_ip VARCHAR(50),
    CONSTRAINT user_board_nickname_fk
    FOREIGN KEY (board_nickname)
    REFERENCES user_tbl(user_nickname)
    ON UPDATE CASCADE
)DEFAULT CHARSET=utf8mb4;

/************************* 게시판 댓글(board_comment) ***************************/
-- 게시판 댓글 테이블 생성
DROP TABLE IF EXISTS board_comment_tbl;
CREATE TABLE board_comment_tbl (
	board_comment_No INT AUTO_INCREMENT PRIMARY KEY,
    board_no INT,
    board_comment_nickname VARCHAR(20),
    board_comment VARCHAR(20),
    board_comment_DT TIMESTAMP DEFAULT NOW()
);

/************************* 공지사항(notice) ***************************/
-- 공지사항 테이블 생성
DROP TABLE IF EXISTS notice_tbl;
CREATE TABLE notice_tbl (
	notice_no INT AUTO_INCREMENT PRIMARY KEY,
    notice_nickname VARCHAR(20),
    notice_title VARCHAR(20),
    notice_content LONGTEXT,
    notice_reg_date VARCHAR(50),
    CONSTRAINT user_notice_nickname_fk
    FOREIGN KEY (notice_nickname)
    REFERENCES user_tbl(user_nickname)
    ON UPDATE CASCADE
)DEFAULT CHARSET=utf8mb4;

-- 제약조건 확인
SELECT * FROM information_schema.table_constraints 
	WHERE table_name = 'notice_tbl';

-- 테이블 목록 확인
SHOW TABLES;