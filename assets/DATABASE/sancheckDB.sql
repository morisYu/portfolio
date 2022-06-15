/* sancheck */

USE sancheck;

/************************* 사용자(user) 테이블 데이터 ***************************/
DESC user_tbl;
INSERT INTO user_tbl (user_no, user_id, user_password, user_name, user_nickname, 
					  user_mobile, user_region, user_email, user_grade, user_join_date)
	VALUES (NULL, 'admin',  '0000', '유성화', '관리자', '010-1234-5543', '구미', 'YSH@sancheck.com', 'admin', '2022/05/10(10:30:23)'),
		   (NULL, 'user01', '1111', '이승기', 'LSG', '010-1234-5543', '서울', 'LSG@example.com', 'user', '2022/05/11(11:21:35)'),
		   (NULL, 'user02', '2222', '성시경', 'SSG', '010-2435-1232', '대구', 'SSG@example.com', 'user', '2022/05/12(15:11:05)'),
		   (NULL, 'user03', '3333', '김경호', 'KKH', '010-6654-7768', '부산', 'KKH@example.com', 'user', '2022/05/15(09:30:23)'),
		   (NULL, 'user04', '4444', '강호동', 'KHD', '010-5543-8789', '대전', 'KHD@gooble.co.kr', 'admin', '2022/05/18(10:30:23)'),
		   (NULL, 'user05', '5555', '윤종신', 'YJS', '010-7821-0023', '구미', 'YJS@gooble.co.kr', 'user', '2022/05/20(10:30:23)'),
		   (NULL, 'user06', '6666', '조세호', 'JSH', '010-3345-3214', '경기', 'JSH@gooble.co.kr', 'user', '2022/05/21(15:55:11)'),
		   (NULL, 'user07', '7777', '박재범', 'PJB', '010-5546-7657', '서울', 'PJB@hanmaum.net', 'user', '2022/05/22(20:30:45)'),
		   (NULL, 'user08', '8888', '신성우', 'SSW', '010-3455-6789', '세종', 'SSW@hanmaum.net', 'user', '2022/06/05(21:15:18)'),
		   (NULL, 'user09', '9999', '박진영', 'PJY', '010-9876-5432', '대구', 'PJY@hanmaum.net', 'user', '2022/06/10(17:06:42)');

SELECT * FROM user_tbl;

SELECT user_grade FROM user_tbl WHERE user_id = 'YSH@sancheck.com';

UPDATE user_tbl 
	SET user_password = 'test', user_name = 'test', 
		user_nickname = 'test', user_mobile = 'test', user_region = 'test'
	WHERE user_id = 'LSG@example.com';

DELETE FROM user_tbl WHERE user_id = 'LSG@example.com';

/************************* 장소정보(place) 테이블 데이터 ***************************/
DESC place_tbl;
INSERT INTO place_tbl (place_No, place_name, place_addr, place_telephone, place_business_hours, place_other, place_photo)
	VALUES (NULL, '동락공원', '경상북도 구미시 3공단1로 191', '054-480-4612', '24 시간', '입장료: 무료', NULL),
		   (NULL, '낙동강체육공워', '경상북도 구미시 낙동제방길 200', '없음', '24 시간', '일부 시설 유료', NULL),
           (NULL, '월광수변공원', '대구광역시 달서구 월곡로 5', '053-667-2851', '24 시간', '입장료: 무료', NULL),
           (NULL, '디아크문화관', '대구 달성군 다사읍 강정본길 57', '053-585-0916', '10:00 ~ 18:00(매주 월요일 휴무)', '입장료: 일부 유료', NULL),
           (NULL, '북서울꿈의숲', '서울 강북구 월계로 173', '02-2289-4001', '24 시간', '입장료: 무료', NULL),
           (NULL, '한강공원', '서울 마포구 마포나루길 467', '02-3780-0601', '24 시간', '입장료: 무료', NULL),
           (NULL, '몽마르뜨 공원', '서울 서초구 서초동 산177-3', '02-2155-6860', '24 시간', '입장료: 무료', NULL),
           (NULL, '인천대공원', '인천 남동구 장수동 산79', '042-466-7282', '09:00 ~ 17:30(우천 시 휴관)', '입장료: 무료', NULL),
           (NULL, '유림공원', '대전 유성구 어은로 27', '042-824-4581', '24 시간', '입장료: 무료', NULL),
           (NULL, '은구비공원', '대전 유성구 노은동로 166', '042-611-2718', '24 시간', '입장료: 무료', NULL),
           (NULL, '용두산공원', '부산 중구 용두산길 37-55', '051-860-7820', '24 시간', '입장료: 무료', NULL);

/************************* 일정관리(plan) 테이블 데이터 ***************************/
DESC plan_tbl;
INSERT INTO plan_tbl (plan_No, plan_nickname, plan_kind, plan_color, plan_content, plan_DT)
	VALUES (NULL, '관리자', '기념일', '#FF0000', '세계야생동물의날', '2022-03-03'),
		   (NULL, '관리자', '기념일', '#FF0000', '국제강아지의날', '2022-03-23'),
           (NULL, '관리자', '기념일', '#FF0000', '세계실험동물의날', '2022-04-24'),
           (NULL, '관리자', '기념일', '#FF0000', '국제떠돌이동물의날', '2022-08-19'),
           (NULL, 'LSG', '병원', '#FF00DD', '건강검진', '2022-05-05'),
           (NULL, 'KKH', '모임', '#FF00DD', '강사모 모임', '2022-04-05'),
           (NULL, 'YJS', '여행', '#FF00DD', '부산 펜션', '2022-07-08'),
           (NULL, 'SSW', '산책', '#FF00DD', '동락공원산책', '2022-03-15'),
           (NULL, 'LSG', '일반', '#FF00DD', '일산펫쇼', '2022-05-28'),
           (NULL, 'PJY', '접종', '#FF00DD', '심장사상충접종', '2022-10-05'),
           (NULL, 'LSG', '일반', '#FF00DD', '목욕', '2022-07-04');

SELECT * FROM plan_tbl;

-- 일정관리 테이블 확인
SELECT ut.user_nickname, pt.plan_kind, pt.plan_content, pt.plan_DT
	FROM user_tbl AS ut
	JOIN plan_tbl AS pt
    ON ut.user_nickname = pt.plan_nickname
    ORDER BY ut.user_nickname ASC, pt.plan_DT DESC;

/************************* 산책기록(record) 테이블 데이터 ***************************/
DESC record_tbl;
INSERT INTO record_tbl (record_No, record_nickname, record_title, record_content, record_photo, record_nice, record_DT)
	VALUES (NULL, 'KHD', '부산갔다왔어요', '오늘 부산가서 좋았습니다. 날씨가 너무 좋네요', NULL, 0, NOW()),
		   (NULL, 'KKH', '서울갔다왔어요', '서울 차가 많이 막히네요', NULL, 0, NOW()),
           (NULL, 'KHD', '대구갔다왔어요', '대구 너무 덥네요', NULL, 0, NOW()),
           (NULL, 'LSG', '인천갔다왔어요', '인천 경치 좋습니다', NULL, 0, NOW()),
           (NULL, 'KHD', '강원도 날씨 좋네요', '강원도에 오랜만에 왔는데 강아지가 너무 좋아하네요', NULL, 0, NOW()),
           (NULL, 'SSW', '서해 놀러왔어요', '간만에 서해 바다에 왔습니다', NULL, 0, NOW()),
           (NULL, 'PJB', '거제도 최고입니다', '거제도에 친구가 있어서 왔는데 회가 최고에요', NULL, 0, NOW()),
           (NULL, 'LSG', '남해 왔습니다', '남해 펜션에 왔는데 강아지 동반이라 좋았어요', NULL, 0, NOW());

SELECT * FROM record_tbl;

-- 산책기록 테이블 확인
SELECT ut.user_nickname, rt.record_title, rt.record_content, rt.record_DT
	FROM user_tbl AS ut
	JOIN record_tbl AS rt
    ON ut.user_nickname = rt.record_nickname
    ORDER BY ut.user_nickname ASC, rt.record_DT DESC;

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

SELECT * FROM record_comment_tbl;

/************************* 게시판(board) 테이블 데이터***************************/
DESC board_tbl;
INSERT INTO board_tbl (board_No, board_nickname, board_title, board_content, board_nice, board_photo, board_DT)
	VALUES (NULL, 'SSG', '게시판에는 뭐 써요', '여기에는 어떤 내용을 쓰나요?', 0, NULL, DEFAULT),
		   (NULL, 'KKH', '게시판에는 뭐 써요', '여기에는 어떤 내용을 쓰나요?', 0, NULL, DEFAULT),
           (NULL, 'YJS', '게시판에는 뭐 써요', '여기에는 어떤 내용을 쓰나요?', 0, NULL, DEFAULT),
           (NULL, 'PJB', '게시판에는 뭐 써요', '여기에는 어떤 내용을 쓰나요?', 0, NULL, DEFAULT),
           (NULL, 'SSW', '게시판에는 뭐 써요', '여기에는 어떤 내용을 쓰나요?', 0, NULL, DEFAULT),
           (NULL, 'SSG', '게시판에는 뭐 써요', '여기에는 어떤 내용을 쓰나요?', 0, NULL, DEFAULT);
           
SELECT * FROM board_tbl ORDER BY board_DT DESC;

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
INSERT INTO notice_tbl (notice_No, notice_nickname, notice_title, notice_content, notice_DT)
	VALUES (NULL, '관리자', '공지사항입니다111', '내용11111111', DEFAULT),
		   (NULL, '관리자', '공지사항입니다222', '내용22222222', DEFAULT),
           (NULL, '관리자', '공지사항입니다333', '내용33333333', DEFAULT);

SELECT * FROM notice_tbl;