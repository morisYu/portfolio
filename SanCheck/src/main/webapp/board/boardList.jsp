<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.websocket.SendResult" %>
<%@ page import="java.util.*" %>
<%@ page import="dto.BoardDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="<c:url value="/assets/CSS/bootstrap.css"/>" />
	<title>게시판</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h6 class="display-6 fw-bold text-center my-3">게시판</h5>
		</div>
	</div>
	
	<div class="container">
		<form action="<c:url value="./BoardListAction.bc"/>" method="post">
			<div class="row">
				<div class="col-10">
					<div class="container">
						<select name="items" class="txt">
							<option value="board_title">제목</option>
							<option value="board_content">내용</option>
							<option value="board_nickname">작성자</option>
						</select>
						<input name="text" type="text" />
						<input type="submit" class="btn btn-primary" value="검색"/>
						<button onclick="checkForm(); return false;" class="btn btn-secondary">글쓰기&raquo;</button>
					</div>
				</div>
				<div class="col-2 text-end">
					<span class="badge bg-success fs-6">전체 ${ total_board } 건</span>
				</div>
			</div>
			
			
			<div style="padding-top: 10px">
				<table class="table table-hover text-center">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회</th>
						<th>작성자</th>
					</tr>
					<c:forEach var="board" items="${ boardList }">
						<tr>
							<td>${ board['board_no'] }</td>
							<td>
								<a class="fw-bold text-decoration-none" 
									href="${ path }/BoardViewAction.bc?num=${ board['board_no'] }&pageNum=${ pageNum }"> ${ board['board_title'] } </a>	
							</td>
							<td>${ board['board_reg_date'] }</td>
							<td>${ board['board_nice'] }</td>
							<td>${ board['board_nickname'] }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			
			<div class="text-center mb-3">
				<c:set var="pageNum" value="${ pageNum }" />
				<c:forEach var="i" begin="1" end="${ total_page }" >
					<a href="<c:url value="./BoardListAction.bc?pageNum=${ i }" />">
						<c:choose>
							<c:when test="${ pageNum == i }">
								<font color="4C5317"><b>[${ i }]</b></font>
							</c:when>
							<c:otherwise>
								<font color="4C5317">[${ i }]</font>
							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
			</div>
			
		</form>
	</div>
	<jsp:include page="../footer.jsp" />
	<script type="text/javascript">
		function checkForm(){
			var id = "<c:out value="${ sessionId }"/>";
			if(id == ""){
				alert("로그인이 필요합니다.");
				location.href="./member/login.jsp";
				return false;
			}
			location.href="./BoardWriteForm.bc?user_id=<c:out value="${ sessionId }"/>";
		}
	
	</script>
</body>
</html>