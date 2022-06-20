<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dto.BoardDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	BoardDTO board = (BoardDTO) request.getAttribute("board");
	int num = ((Integer) request.getAttribute("num")).intValue();
	int nowpage = ((Integer) request.getAttribute("pageNum")).intValue();
%>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="./assets/CSS/bootstrap.css" />
	<link rel="stylesheet" href="./assets/CSS/common.css" />
	<title>게시글</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시글</h1>
		</div>
	</div>
	
	<div class="container">
		<form name="newUpdate" action="${ path }/BoardUpdateAction.bc?num=<%= board.getBoard_no() %>&pageNum=<%= nowpage %>"
			class="form-horizontal" method="post">
			
			<div class="form-group row">
				<label class="col-sm-2 control-label">별명</label>
				<div class="col-sm-3">
					<input name="board_nickname" class="form-control" value="${ board['board_nickname'] }" />
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label> 
				<div class="col-sm-5">
					<input name="board_title" class="form-control" value="${ board['board_title'] }" />
				</div>
			</div>
				
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-8" style="word-break: break-all;">
					<textarea name="board_content" class="form-control" cols="50" rows="5" style="resize: none">${ board['board_content'] }</textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label">이미지</label>
				<h6 class="display-6">${ board['board_photo'] }</h6>
				<img src="/fileupload/<%= board.getBoard_photo() %>" style="width: 100%">
				
			</div>
		</form>
		
	
	</div>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>