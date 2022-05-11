<h2> 🎨 ER Diagram 작성을 위한 데이터 정리 </h2>  

<h3> Entity List</h3>  

- 사용자(user)  
- 장소정보(place)  
- 일정관리(plan)  
- 산책기록(record)  
- 산책기록 댓글(record_comment)
- 게시판(board)  
- 게시판 댓글(board_comment)  
- 공지사항(notice)  

<br>  

<h3> Attribute List </h3>  

> 사용자(user)  

- 사용자 정보는 관리자만 볼 수 있고 별명, 거주지역만 사이트에 노출   
- 사용자는 게시글, 댓글, 산책기록, 일정관리 작성 가능  

| 속성명 | 조건 | 비고 |  
| -- | -- | :--: |  
| 번호(num) | INT AUTO_INCREMENT PRIMARY KEY | 기본키 |  
| 사용자아이디(userID) | VARCHAR(15) | 이메일 형식 |  
| 비밀번호(userPass) | VARCHAR(15) NOT NULL | 영문, 숫자, 특수문자 |  
| 별명(nickname) | VARCHAR(10) | 입력 없을 시 사용자아이디(@ 앞부부)로 대체 |  
| 연락처(mobile) | VARCHAR(15) NOT NULL | 연락처 노출 시 중간번호 별표(*) 처리 |  
| 거주지역(site) | VARCHAR(10) | 드롭다운 메뉴에서 선택 |  
| 가입일자(joindate) | DATE | 아이디 생성 일자 |  

<br>  

> 장소정보(place)  

- 장소정보에는 관리자가 등록한 장소정보가 나옴  
- 값이 없는 경우 하이픈(-) 으로 표시  

| 속성명 | 조건 | 비고 |  
| -- | -- | :--: |  
| 번호(num) | INT AUTO_INCREMENT PRIMARY KEY | 기본키 |  
| 장소정보 사진(picture) | BLOB | 물리저장소에 저장된 경로 |   
| 주소(addr) | VARCHAR(20) NOT NULL | - |  
| 연락처(call) | VARCHAR(15) | - |  
| 영업시간(business_hours) | VARCHAR(15) | - |  
| 기타(other) | VARCHAR(15) | - |  

<br>  

> 일정관리(schedule)  

- 일정관리에는 사용자가 등록한 일정이 달력에 표시됨  
- 비로그인 사용자의 경우 관리자가 등록한 일정만 달력에 표시됨  
- 달력에서 일정내용을 선택하면 작성페이지로 이동(저장된 내용 그대로 표시)  

| 속성명 | 조건 | 비고 |  
| -- | -- | :--: |  
| 일정번호(scheduleNum) | INT AUTO_INCREMENT PRIMARY KEY | 기본키 |  
| 날짜(scheduleDate) | DATE | - |  
| 종류(kind) | VARCHAR(10) | 지정된 종류 선택 |  
| 색상(color) | VARCHAR(10) | 지정된 종류 선택 |  
| 일정내용(scheduleContent) | VARCHAR(15) | - |  

<br>  

> 산책기록(record)  

- 산책기록 메인에는 공개로 작성된 산책기록들이 표시되고, 사용자가 최근 작성한 산책기록 목록이 표시됨  

| 속성명 | 조건 | 비고 |  
| -- | -- | :--: |  
| 산책기록번호(recordNum) | INT AUTO_INCREMENT PRIMARY KEY | 기본키 |  
| 산책기록사진(record_picture) | BLOB | 사진파일 경로 |  
| 내용(record_content) | TEXT | - |  
| 좋아요(like) | INT | 좋아요 버튼 한 번 누르면 1 증가(로그인 회원만 가능) |  

<br>  

> 산책기록 댓글(record_comment)  

- 산책기록에 작성되는 댓글에 관한 정보  

| 속성명 | 조건 | 비고 |  
| -- | -- | :--: |  
| 산책기록댓글번호(record_comment_Num) | INT AUTO_INCREMENT PRIMARY KEY | 기본키 |  
| 별명(nickname) | VARCHAR(10) | - |  
| 작성일(record_comment_date) | DATE | - |  
| 댓글내용(reply) | VARCHAR(20) | - |  

<br>  

> 게시판(board)  

- 게시판 메인 화면에는 제목, 별명, 작성일, 좋아요, 사진 노출   

| 속성명 | 조건 | 비고 |  
| -- | -- | :--: |   
| 게시판 번호(board_Number) | INT AUTO_INCREMENT PRIMARY KEY | 기본키 |  
| 별명(nickname) | VARCHAR(10) | - |  
| 작성일(board_date) | DATE | - |  
| 제목(board_title) | VARCHAR(20) | - |  
| 내용(board_content) | TEXT | - |  
| 사진(board_picture) | BLOB | 사진 및 GIF 업로드 가능 |  
| 좋아요(board_like) | INT | 좋아요 버튼 한 번 누르면 1 증가 |  

<br>  

> 게시판 댓글(board_comment)  

- 산책기록에 있는 댓글과 같은 기능 수행  

| 속성명 | 조건 | 비고 |  
| -- | -- | :--: |  
| 게시판댓글번호(record_comment_Num) | INT AUTO_INCREMENT PRIMARY KEY | 기본키 |  
| 별명(nickname) | VARCHAR(10) | - |  
| 작성일(board_comment_date) | DATE | - |  
| 댓글내용(board_reply) | VARCHAR(20) | - |  
| 게시판사진(board_picture) | BLOB | - |  

<br>  

> 공지사항(announcement)  

- 공지사항 메인에는 번호, 제목, 작성일, 작성자 만 노출  

| 속성명 | 조건 | 비고 |  
| -- | -- | :--: |  
| 공지사항번호(announcement_Num) | INT AUTO_INCREMENT PRIMARY KEY | 기본키 |   
| 제목(announcement_title) | VARCHAR(20) | - |  
| 공지사항 내용(announcement_content) | TEXT | - |  
| 작성일(cnnouncement_date) | DATE | - |  

<br><br><br>

> ERD 작성 사이트  

https://dbdiagram.io/home 