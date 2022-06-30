-- root 로 접속 후 계정 생성, ID(postuser) PASSWORD(bitc5600)
CREATE USER 'postuser'@'%' IDENTIFIED BY 'bitc5600';
-- 모든 권한을 부여('%' 는 어디에서든지 접속 가능하게 함, 'localhost'로 하면 외부 접속 안됨)
GRANT ALL PRIVILEGES ON *.* TO 'postuser'@'%';

-- DB 생성
CREATE DATABASE postdb;

USE postdb;
DROP TABLE post;
CREATE TABLE post(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    content LONGTEXT
)DEFAULT CHARSET = utf8mb4;

INSERT INTO post(title, content) VALUES('제목1', '내용1');
INSERT INTO post(title, content) VALUES('제목2', '내용2');

SELECT * FROM post;