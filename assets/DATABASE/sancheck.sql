/* sancheck */

-- 데이터베이스 생성
/*
DROP DATABASE IF EXISTS sancheck;
CREATE DATABASE sancheck;
USE sancheck;
*/

/************************* 사용자(user) ***************************/
-- 사용자 테이블 생성
CREATE TABLE `user_tbl` (
	`num` INT AUTO_INCREMENT PRIMARY KEY,
    userID VARCHAR(15),
    `userPass` VARCHAR(15) NOT NULL,
	nickname VARCHAR(10),
    mobile VARCHAR(15) NOT NULL,
    site VARCHAR (10),
    `joindate` DATE
);


/************************* 장소정보(place) ***************************/
-- 장소정보 테이블 생성
CREATE TABLE `place_tbl` (
	`num` INT AUTO_INCREMENT PRIMARY KEY,
    addr VARCHAR(20) NOT NULL,
    `telephone` VARCHAR(15),
    business_hours VARCHAR(15),
    other VARCHAR(15),
    `photo` BLOB
);


/************************* 일정관리(plan) ***************************/
-- 일정관리 테이블 생성
CREATE TABLE `plan_tbl` (
	`num` INT AUTO_INCREMENT PRIMARY KEY,
    `plandate` DATE,
    kind VARCHAR(10),
    color VARCHAR(10),
    `content` VARCHAR(15)
);


/************************* 산책기록(record) ***************************/
-- 산책기록 테이블 생성
CREATE TABLE `record_tbl` (
	`num` INT AUTO_INCREMENT PRIMARY KEY,
    `content` TEXT,
    `nice` INT,
    `photo` BLOB,
    `recorddate` DATE
);


/************************* 산책기록 댓글(record_comment) ***************************/
-- 산책기록 댓글 테이블 생성
CREATE TABLE `record_comment_tbl` (
	`num` INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(10),
    `commentdate` DATE,
    reply VARCHAR(20)
);


/************************* 게시판(board) ***************************/
-- 게시판 테이블 생성
CREATE TABLE `board_tbl` (
	`num` INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(10),
    `boarddate` DATE,
    `title` VARCHAR(20),
    `content` TEXT,
    `board_nice` INT,
    `photo` BLOB
);


/************************* 게시판 댓글(board_comment) ***************************/
-- 게시판 댓글 테이블 생성
CREATE TABLE `board_comment_tbl` (
	`num` INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(10),
    `commentdate` DATE,
    `reply` VARCHAR(20),
    `photo` BLOB
);


/************************* 공지사항(notice) ***************************/
-- 공지사항 테이블 생성
CREATE TABLE `notice_tbl` (
	`num` INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(10),
    `title` VARCHAR(20),
    `content` TEXT,
    `noticedate` DATE
);

-- 테이블 목록 확인
SHOW TABLES;