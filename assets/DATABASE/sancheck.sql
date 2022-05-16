/* sancheck */

-- 데이터베이스 생성
/*
DROP DATABASE IF EXISTS sancheck;
CREATE DATABASE sancheck;
*/

-- 테이블 전체 삭제
/*
DROP TABLE IF EXISTS user_tbl, place_tbl, plan_tbl, record_tbl, record_comment_tbl, 
					 board_tbl, board_comment_tbl, notice_tbl;
*/
DROP TABLE IF EXISTS user_tbl, place_tbl, plan_tbl, record_tbl, record_comment_tbl, 
					 board_tbl, board_comment_tbl, notice_tbl;
USE sancheck;

/************************* 사용자(user) ***************************/
-- 사용자 테이블 생성
CREATE TABLE user_tbl (
	user_No INT AUTO_INCREMENT PRIMARY KEY,
    user_ID VARCHAR(20) NOT NULL,
    user_Pass VARCHAR(20) NOT NULL,
    user_name VARCHAR(20) NOT NULL,
	user_nickname VARCHAR(20) UNIQUE,
    user_mobile VARCHAR(20) NOT NULL,
    user_region VARCHAR (20),
    user_grade VARCHAR(20),
    user_join_DT DATETIME
);

/************************* 장소정보(place) ***************************/
-- 장소정보 테이블 생성
CREATE TABLE place_tbl (
	place_No INT AUTO_INCREMENT PRIMARY KEY,
    place_name VARCHAR(20) NOT NULL,
    place_addr VARCHAR(20) NOT NULL,
    place_telephone VARCHAR(20),
    place_business_hours VARCHAR(20),
    place_other VARCHAR(20),
    place_photo BLOB
);

/************************* 일정관리(plan) ***************************/
-- 일정관리 테이블 생성
CREATE TABLE plan_tbl (
	plan_No INT AUTO_INCREMENT PRIMARY KEY,
    plan_nickname VARCHAR(20),
    plan_kind VARCHAR(20),
    plan_color VARCHAR(20),
    plan_content VARCHAR(20),
    plan_DT DATETIME
);

/************************* 산책기록(record) ***************************/
-- 산책기록 테이블 생성
CREATE TABLE record_tbl (
	record_No INT AUTO_INCREMENT PRIMARY KEY,
    record_nickname VARCHAR(20),
    record_title VARCHAR(20),
    record_content TEXT,
    record_photo BLOB,
    record_nice INT,
    record_DT DATETIME
);

/************************* 산책기록 댓글(record_comment) ***************************/
-- 산책기록 댓글 테이블 생성
CREATE TABLE record_comment_tbl (
	record_comment_No INT AUTO_INCREMENT PRIMARY KEY,
    record_comment_nickname VARCHAR(20),
    record_comment VARCHAR(20),
    record_comment_DT TIMESTAMP DEFAULT NOW()
);

/************************* 게시판(board) ***************************/
-- 게시판 테이블 생성
CREATE TABLE board_tbl (
	board_No INT AUTO_INCREMENT PRIMARY KEY,
    board_nickname VARCHAR(20),
    board_title VARCHAR(20),
    board_content TEXT,
    board_nice INT,
    board_photo BLOB,
    board_DT TIMESTAMP DEFAULT NOW()
);

/************************* 게시판 댓글(board_comment) ***************************/
-- 게시판 댓글 테이블 생성
CREATE TABLE board_comment_tbl (
	board_comment_No INT AUTO_INCREMENT PRIMARY KEY,
    board_comment_nickname VARCHAR(20),
    board_comment VARCHAR(20),
    board_comment_DT TIMESTAMP DEFAULT NOW()
);

/************************* 공지사항(notice) ***************************/
-- 공지사항 테이블 생성
CREATE TABLE notice_tbl (
	notice_No INT AUTO_INCREMENT PRIMARY KEY,
    notice_nickname VARCHAR(20),
    notice_title VARCHAR(20),
    notice_content LONGTEXT,
    notice_DT TIMESTAMP DEFAULT NOW()
);

-- 테이블 목록 확인
SHOW TABLES;