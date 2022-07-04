<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dto.BoardDTO" %>
<%@ page import="dao.BoardDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	BoardDTO board = (BoardDTO) request.getAttribute("board");
	int num = ((Integer) request.getAttribute("num")).intValue();
	int nowpage = ((Integer) request.getAttribute("pageNum")).intValue();
	BoardDAO dao = BoardDAO.getInstance();
	String nickname = dao.getLoginNameById(sessionId);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="./assets/CSS/bootstrap.css" />
	<link rel="stylesheet" href="./assets/CSS/common.css" />
	<title>게시글</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h6 class="display-6 fw-bold text-center my-3">게시글 보기</h5>
		</div>
	</div>
	<!-- 게시글 보기 페이지에서 바로 수정 가능 -->
	<div class="container mb-2" style="height: 610px">
		<form name="newUpdate" action="${ path }/BoardUpdateAction.bc?num=<%= board.getBoard_no() %>&pageNum=<%= nowpage %>"
			class="form-horizontal" method="post" enctype="multipart/form-data">
		
			<div class="form-group row mb-2">
				<label class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-3">
					<input name="board_nickname" class="form-control" value="${ board['board_nickname'] }" readonly />
				</div>
			</div>
			
			<div class="form-group row mb-2">
				<label class="col-sm-2 control-label">제목</label> 
				<div class="col-sm-5">
					<input name="board_title" class="form-control" value="${ board['board_title'] }" />
				</div>
			</div>
				
			<div class="form-group row mb-2">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-5" style="word-break: break-all;">
					<textarea name="board_content" class="form-control" rows="5" style="resize: none">${ board['board_content'] }</textarea>
				</div>
			</div>
			
			<div class="form-group row mb-2">
				<label class="col-sm-2 control-label">사진</label>
				<div class="col-sm-5" style="word-break: break-all;">
					<input name="old_board_photo" type="hidden" value="${ board['board_photo'] }" />
					<!-- 게시글 작성자와 현재 로그인 별명 비교해서 수정/삭제 버튼 활성화 -->
					<c:set var="user_nickname" value="<%= nickname %>" />
					<c:set var="board_nickname" value="<%= board.getBoard_nickname() %>" />
					<c:if test="${ user_nickname == board_nickname }" >
						<input name="new_board_photo" type="file" class="form-control" />
					</c:if>
					<!-- 게시글에 있는 사진을 다운로드 가능하도록 함 -->
					<a download href="./upload/${ board['board_photo'] }">${ board['board_photo'] }</a>
					<img src="./upload/${ board['board_photo'] }" class="w-100" style="height: 270px"/>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-7 text-center">
					<a href="./BoardListAction.bc?pageNum=<%= nowpage %>" class="btn btn-primary" >목록</a>
					<!-- 게시글 작성자와 현재 로그인 별명 비교해서 수정/삭제 버튼 활성화 -->
					<c:set var="user_nickname" value="<%= nickname %>" />
					<c:set var="board_nickname" value="<%= board.getBoard_nickname() %>" />
					<c:if test="${ user_nickname == board_nickname }" >
						<input type="submit" class="btn btn-success" value="수정" />
						<a href="./BoardDeleteAction.bc?num=${ num }&pageNum=<%= nowpage %>&oldphoto=${ board['board_photo'] }" class="btn btn-danger">삭제</a>
					</c:if>
				</div>
			</div>
		</form>
	</div>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>