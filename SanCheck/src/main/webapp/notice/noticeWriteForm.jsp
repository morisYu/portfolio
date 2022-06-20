<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String nickname = (String) request.getAttribute("nickname");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="./assets/CSS/bootstrap.css" />
	<link rel="stylesheet" href="./assets/CSS/common.css" />
	<title>공지사항 작성</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />

	<h1 class="display-3 text-center">공지사항 작성</h1>
	
	<div class="container col-sm-4">
		<form class="form" action="${ path }/NoticeWriteAction.do" method="post">
			<div class="mb-3">
			  <label for="nicknameInput" class="form-label">별명</label>
			  <input type="text" class="form-control" name="nickname" id="nicknameInput" value="${ nickname }" readonly size="10"/>
			</div>
			
			<div class="mb-3">
			  <label for="titleInput" class="form-label">제목</label>
			  <input type="text" class="form-control" name="title" id="titleInput" />
			</div>
			
			<div class="mb-3">
			  <label for="contentInput" class="form-label">내용</label>
			  <textarea class="form-control" name="content" id="contentInput" rows="6" style="resize: none"></textarea>
			</div>
			
			<div class="container text-center mb-3">
				<input type="submit" class="btn btn-primary" value="전송" />
				<input type="reset" class="btn btn-secondary" value="취소" /> 
			</div>
		</form>	
	</div>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>