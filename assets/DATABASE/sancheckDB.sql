/* sancheck */

USE sancheck;

/************************* 사용자(user) 테이블 데이터 ***************************/
DESC user_tbl;
INSERT INTO user_tbl (user_no, user_id, user_password, user_name, user_nickname, 
					  user_mobile, user_region, user_email, user_grade, user_join_date)
	VALUES (NULL, 'admin',  '0000', '유성화', '관리자', '010-1234-5543', '구미', 'YSH@sancheck.com', 'admin', '2022/05/10(10:30:23)');
INSERT INTO user_tbl VALUES (NULL, 'user01', '1111', '이승기', 'LSG', '010-1234-5543', '서울', 'LSG@example.com', 'user', '2022/05/11(11:21:35)');
INSERT INTO user_tbl VALUES (NULL, 'user02', '2222', '성시경', 'SSG', '010-2435-1232', '대구', 'SSG@example.com', 'user', '2022/05/12(15:11:05)');
INSERT INTO user_tbl VALUES (NULL, 'user03', '3333', '김경호', 'KKH', '010-6654-7768', '부산', 'KKH@example.com', 'user', '2022/05/15(09:30:23)');
INSERT INTO user_tbl VALUES (NULL, 'user04', '4444', '강호동', 'KHD', '010-5543-8789', '대전', 'KHD@gooble.co.kr', 'admin', '2022/05/18(10:30:23)');
INSERT INTO user_tbl VALUES (NULL, 'user05', '5555', '윤종신', 'YJS', '010-7821-0023', '구미', 'YJS@gooble.co.kr', 'user', '2022/05/20(10:30:23)');
INSERT INTO user_tbl VALUES (NULL, 'user06', '6666', '조세호', 'JSH', '010-3345-3214', '경기', 'JSH@gooble.co.kr', 'user', '2022/05/21(15:55:11)');
INSERT INTO user_tbl VALUES (NULL, 'user07', '7777', '박재범', 'PJB', '010-5546-7657', '서울', 'PJB@hanmaum.net', 'user', '2022/05/22(20:30:45)');
INSERT INTO user_tbl VALUES (NULL, 'user08', '8888', '신성우', 'SSW', '010-3455-6789', '세종', 'SSW@hanmaum.net', 'user', '2022/06/05(21:15:18)');
INSERT INTO user_tbl VALUES (NULL, 'user09', '9999', '박진영', 'PJY', '010-9876-5432', '대구', 'PJY@hanmaum.net', 'user', '2022/06/10(17:06:42)');
INSERT INTO user_tbl VALUES (NULL, 'guest', 'guest', '게스트', 'GUEST', '011-1111-2222', '제주', 'guest@sancheck.com', 'user', '2022/01/01(21:15:18)');

-- 조회
SELECT * FROM user_tbl;
SELECT * FROM user_tbl WHERE user_id = 'admin';
SELECT user_nickname FROM user_tbl WHERE user_id = 'admin';

-- 삽입
INSERT INTO user_tbl (user_no, user_id, user_password, user_name, user_nickname, 
					  user_mobile, user_region, user_email, user_grade, user_join_date)
	VALUES (0, 'aaa',  '0000', '유성화', 'aaa', '010-1234-5543', '구미', 'YSH@sancheck.com', 'admin','2022/05/10(10:30:23)');

-- 수정
UPDATE user_tbl 
	SET user_password = 'test', user_name = 'test', 
		user_nickname = 'test', user_mobile = 'test', user_region = 'test'
	WHERE user_id = 'LSG@example.com';

-- 삭제
DELETE FROM user_tbl WHERE user_no = 12;
DELETE FROM user_tbl WHERE user_id = 'LSG@example.com';

/************************* 장소정보(place) 테이블 데이터 ***************************/
DESC place_tbl;
INSERT INTO place_tbl (place_no, place_write_id, place_name, place_addr, place_tel, place_business_hours, place_other, place_photo)
	VALUES (NULL, 'admin', '동락공원', '경상북도 구미시 3공단1로 191', '054-480-4612', '24 시간', '입장료: 무료', 'assisi.jpg,beach.jpg,beach-2.jpg');
INSERT INTO place_tbl VALUES (NULL, 'admin', '낙동강체육공원', '경상북도 구미시 낙동제방길 200', '없음', '24 시간', '일부 시설 유료', 'berchtesgaden.jpg,bow-lake.jpg,bridge.jpg');
INSERT INTO place_tbl VALUES (NULL, 'admin', '월광수변공원', '대구광역시 달서구 월곡로 5', '053-667-2851', '24 시간', '입장료: 무료', 'bridge-2.jpg,sunset.jpg,christmas.jpg');
INSERT INTO place_tbl VALUES (NULL, 'admin', '디아크문화관', '대구 달성군 다사읍 강정본길 57', '053-585-0916', '10:00 ~ 18:00(매주 월요일 휴무)', '입장료: 일부 유료', 'forest.jpg,garden.jpg,gdansk.jpg');
INSERT INTO place_tbl VALUES (NULL, 'admin', '북서울꿈의숲', '서울 강북구 월계로 173', '02-2289-4001', '24 시간', '입장료: 무료', 'hd-wallpaper.jpg,hokkaido.jpg,indiana-dunes-state-park.jpg');
INSERT INTO place_tbl VALUES (NULL, 'admin', '한강공원', '서울 마포구 마포나루길 467', '02-3780-0601', '24 시간', '입장료: 무료', 'island.png,ireland.jpg,lake.jpg');
INSERT INTO place_tbl VALUES (NULL, 'admin', '몽마르뜨 공원', '서울 서초구 서초동 산177-3', '02-2155-6860', '24 시간', '입장료: 무료', 'lin-zhi.jpg,maldives.jpg,mountains.jpg');
INSERT INTO place_tbl VALUES (NULL, 'admin', '인천대공원', '인천 남동구 장수동 산79', '042-466-7282', '09:00 ~ 17:30(우천 시 휴관)', '입장료: 무료', 'mountains-2.jpg,new-york.jpg,paris.jpg');
INSERT INTO place_tbl VALUES (NULL, 'admin', '유림공원', '대전 유성구 어은로 27', '042-824-4581', '24 시간', '입장료: 무료', 'pathway.jpg,river.jpg,rocky-coast.jpg');
INSERT INTO place_tbl VALUES (NULL, 'admin', '은구비공원', '대전 유성구 노은동로 166', '042-611-2718', '24 시간', '입장료: 무료', 'sandstones.jpg,skyline.jpg,stonehenge.jpg');
INSERT INTO place_tbl VALUES (NULL, 'admin', '용두산공원', '부산 중구 용두산길 37-55', '051-860-7820', '24 시간', '입장료: 무료', 'sunset.jpg,thin.jpg,towards-the-garden.jpg');

-- 데이터 전체 조회
SELECT * FROM place_tbl ORDER BY place_no DESC;

-- 조건으로 데이터 조회
SELECT * FROM place_tbl WHERE place_name LIKE '%공원%';

/************************* 일정관리(plan) 테이블 데이터 ***************************/
DESC plan_tbl;
INSERT INTO plan_tbl (plan_no, plan_id, plan_kind, plan_color, plan_content, plan_reg_date)
	VALUES (NULL, 'admin', '기념일', '#FF0000', '세계야생동물의날', '2022/03/03');
INSERT INTO plan_tbl VALUES (NULL, 'admin', '기념일', '#FF0000', '국제강아지의날', '2022/03/23');
INSERT INTO plan_tbl VALUES (NULL, 'admin', '기념일', '#FF0000', '세계실험동물의날', '2022/04/24');
INSERT INTO plan_tbl VALUES (NULL, 'admin', '기념일', '#FF0000', '국제떠돌이동물의날', '2022/07/10');
INSERT INTO plan_tbl VALUES (NULL, 'user02', '병원', '#FF00DD', '건강검진', '2022/05/05');
INSERT INTO plan_tbl VALUES (NULL, 'user03', '모임', '#FF00DD', '강사모 모임', '2022/04/05');
INSERT INTO plan_tbl VALUES (NULL, 'user01', '여행', '#FF00DD', '부산 펜션', '2022/07/08');
INSERT INTO plan_tbl VALUES (NULL, 'admin', '기념일', '#FF0000', '테스트의날', '2022/08/19');
INSERT INTO plan_tbl VALUES (NULL, 'user01', '산책', '#FF00DD', '동락공원산책', '2022/03/15');
INSERT INTO plan_tbl VALUES (NULL, 'user05', '일반', '#FF00DD', '일산펫쇼', '2022/05/28');
INSERT INTO plan_tbl VALUES (NULL, 'user02', '접종', '#FF00DD', '심장사상충접종', '2022/10/05');
INSERT INTO plan_tbl VALUES (NULL, 'user04', '일반', '#FF00DD', '목욕', '2022/07/04');

-- 조회
SELECT * FROM plan_tbl;
SELECT * FROM plan_tbl WHERE plan_id IN ('admin', 'user02') AND plan_reg_date LIKE '%2022/03%';
SELECT * FROM plan_tbl WHERE plan_id='admin' AND plan_reg_date LIKE '%2022/06%';
SELECT * FROM plan_tbl WHERE plan_no=3;

-- 수정
UPDATE plan_tbl SET plan_kind='실험실' WHERE plan_no=20;

-- 일정관리 테이블 확인
SELECT ut.user_id, pt.plan_kind, pt.plan_content, pt.plan_reg_date
	FROM user_tbl AS ut
	JOIN plan_tbl AS pt
    ON ut.user_id = pt.plan_id
    ORDER BY ut.user_nickname ASC, pt.plan_reg_date DESC;

/************************* 산책기록(record) 테이블 데이터 ***************************/
DESC record_tbl;
INSERT INTO record_tbl (record_no, record_nickname, record_title, record_content, record_photo, record_nice,
	record_reg_date, record_open, record_ip)
	VALUES (0, 'KHD', '부산갔다왔어요', '오늘 부산가서 좋았습니다. 날씨가 너무 좋네요', 'forest.jpg', 0, '2022/03/10', true, '0:0:0:0:1'),
		   (0, 'KKH', '서울갔다왔어요', '서울 차가 많이 막히네요', 'hokkaido.jpg', 0, '2022/03/10', true, '0:0:0:0:1'),
           (0, 'KHD', '대구갔다왔어요', '대구 너무 덥네요', 'ireland.jpg', 0, '2022/03/10', true, '0:0:0:0:2'),
           (0, 'LSG', '인천갔다왔어요', '인천 경치 좋습니다', 'house.jpg', 0, '2022/03/10', true, '0:0:0:0:1'),
           (0, 'KHD', '강원도 날씨 좋네요', '강원도에 오랜만에 왔는데 강아지가 너무 좋아하네요', 'mountains.jpg', 0, '2022/03/10', true, '0:0:0:0:3'),
           (0, 'SSW', '서해 놀러왔어요', '간만에 서해 바다에 왔습니다', 'maldives.jpg', 0, '2022/03/10', true, '0:0:0:0:1'),
           (0, 'PJB', '거제도 최고입니다', '거제도에 친구가 있어서 왔는데 회가 최고에요', 'svihov.jpg', 0, '2022/03/10', true, '0:0:0:0:5'),
           (0, '관리자', '구미 여행001', '동구미 여행001', 'thin.jpg', 0, '2022/04/10', true, '0:0:0:0:1'),
           (0, '관리자', '구미 여행002', '남구미 여행001', 'new-york.jpg', 0, '2022/04/13', true, '0:0:0:0:1'),
           (0, '관리자', '구미 여행003', '남구미 여행002', 'bridge-2.jpg', 0, '2022/04/15', true, '0:0:0:0:1'),
           (0, '관리자', '구미 여행004', '구미 여행001', 'pathway.jpg', 0, '2022/04/20', true, '0:0:0:0:1'),
           (0, '관리자', '구미 여행005', '동구미 여행002', NULL, 0, '2022/05/10', true, '0:0:0:0:1'),
           (0, 'LSG', '남해 왔습니다', '남해 펜션에 왔는데 강아지 동반이라 좋았어요', NULL, 0, '2022/03/10', true, '0:0:0:0:1');

-- 조회
SELECT * FROM record_tbl;
SELECT user_nickname FROM user_tbl WHERE user_id = 'user02';

-- 산책기록 테이블 확인
SELECT ut.user_nickname, rt.record_title, rt.record_content, rt.record_reg_date
	FROM user_tbl AS ut
	JOIN record_tbl AS rt
    ON ut.user_nickname = rt.record_nickname
    ORDER BY ut.user_nickname ASC, rt.record_reg_date DESC;

/************************* 산책기록 댓글(record_comment) 테이블 데이터 ***************************/
DESC record_comment_tbl;
INSERT INTO record_comment_tbl (record_comment_No, record_comment_nickname, record_comment, record_comment_DT)
	VALUES (NULL, 'LSG', '반갑습니다.', DEFAULT),
		   (NULL, 'SSG', '어서오세요', DEFAULT),
           (NULL, 'KHD', '거기 위치가 어디인가요?', DEFAULT),
           (NULL, 'YJS', '서울 대공원입니다', DEFAULT),
           (NULL, 'PJB', '반가워요', DEFAULT),
           (NULL, 'LSG', '내일 모임하는데 오실래요', DEFAULT),
           (NULL, 'SSW', '어디서 모임을 하나요', DEFAULT),
           (NULL, 'SSG', '네 내일 봐요', DEFAULT),
           (NULL, '관리자', '반갑습니다.', DEFAULT);

-- 조회
SELECT * FROM record_comment_tbl;

/************************* 게시판(board) 테이블 데이터***************************/
DESC board_tbl;
INSERT INTO board_tbl (board_no, board_nickname, board_title, board_content, board_nice, board_photo, board_reg_date, board_ip)
	VALUES (0, '관리자', '게시판에는 뭐 써요 001', '여기에는 어떤 내용을 쓰나요? 001', 10, 'vietnam.jpg', '2022/01/10(13:10:53)', '127:0:0:1'),
		   (0, 'LSG', '게시판에는 뭐 써요 002', '여기에는 어떤 내용을 쓰나요? 002', 3, 'thin.jpg', '2022/01/17(12:11:13)', '127:8:64:1'),
           (0, 'SSG', '게시판에는 뭐 써요 003', '여기에는 어떤 내용을 쓰나요? 003', 0, 'svihov.jpg', '2022/01/19(11:34:21)', '127:9:66:1'),
           (0, 'PJB', '게시판에는 뭐 써요 004', '여기에는 어떤 내용을 쓰나요? 004', 2, 'sunset.jpg', '2022/02/02(09:55:12)', '127:100:87:1'),
           (0, 'SSW', '게시판에는 뭐 써요 005', '여기에는 어떤 내용을 쓰나요? 005', 0, 'rocky-coast.jpg', '2022/02/15(21:10:11)', '127:68:6:1'),
           (0, 'PJY', '게시판에는 뭐 써요 006', '여기에는 어떤 내용을 쓰나요? 006', 1, 'new-york.jpg', '2022/03/16(11:51:22)', '127:44:5:1');
           
SELECT * FROM board_tbl ORDER BY board_reg_date DESC;

SELECT count(*) FROM board_tbl WHERE board_title LIKE '%뭐%';

/************************* 게시판 댓글(board_comment) 테이블 데이터 ***************************/
DESC board_comment_tbl;
INSERT INTO board_comment_tbl (board_comment_No, board_comment_nickname, board_comment, board_comment_DT)
	VALUES (NULL, 'SSG', '안녕하세요', DEFAULT),
		   (NULL, 'KKH', '안녕하세요', DEFAULT),
           (NULL, 'SSG', '안녕하세요', DEFAULT),
           (NULL, 'PJB', '안녕하세요', DEFAULT),
           (NULL, 'SSW', '안녕하세요', DEFAULT);

SELECT * FROM board_comment_tbl;

/************************* 공지사항(notice) 테이블 데이터 ***************************/
DESC notice_tbl;
INSERT INTO notice_tbl (notice_no, notice_nickname, notice_title, notice_content, notice_reg_date)
	VALUES (NULL, '관리자', '공지사항입니다001', '내용11111111', '2021/11/03(09:10:30)'),
		   (NULL, '관리자', '공지사항입니다002', '내용22222222', '2021/11/03(10:23:55)'),
           (NULL, '관리자', '공지사항입니다003', '내용33333333', '2021/11/03(11:13:12)'),
           (NULL, '관리자', '공지사항입니다004', '내용44444444', '2021/11/04(11:17:02)'),
           (NULL, '관리자', '공지사항입니다005', '내용55555555', '2021/11/05(16:09:10)'),
           (NULL, '관리자', '공지사항입니다006', '내용66666666', '2021/11/05(19:11:53)'),
           (NULL, '관리자', '공지사항입니다007', '내용77777777', '2021/12/06(21:17:05)'),
           (NULL, '관리자', '공지사항입니다008', '내용88888888', '2021/12/18(10:21:08)'),
           (NULL, '관리자', '공지사항입니다009', '내용99999999', '2022/01/03(09:00:30)'),
           (NULL, '관리자', '공지사항입니다010', '내용00000000', '2022/01/03(14:16:38)'),
           (NULL, '관리자', '공지사항입니다011', '내용12312312', '2022/01/05(23:11:30)'),
           (NULL, '관리자', '공지사항입니다012', '내용35343567', '2022/01/06(10:23:05)'),
           (NULL, '관리자', '공지사항입니다013', '내용hellowor', '2022/02/10(11:20:31)'),
           (NULL, '관리자', '공지사항입니다014', '내용12345678', '2022/03/02(14:31:20)'),
           (NULL, '관리자', '공지사항입니다015', '내용98765443', '2022/03/27(15:52:32)'),
           (NULL, '관리자', '공지사항입니다016', '내용19284675', '2022/04/01(07:29:24)'),
           (NULL, '관리자', '공지사항입니다017', '내용50695743', '2022/04/19(19:30:26)'),
           (NULL, '관리자', '공지사항입니다018', '내용00685743', '2022/05/29(20:40:29)');
           
-- 조회
SELECT * FROM notice_tbl;
SELECT * FROM notice_tbl ORDER BY notice_no DESC;
SELECT * FROM notice_tbl WHERE notice_no = 3;

-- 수정
UPDATE notice_tbl SET notice_title = 'test11', notice_content = 'test1111' WHERE notice_no = '3';