<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dto.NoticeDTO" %>
<%
	NoticeDTO notice = (NoticeDTO) request.getAttribute("notice");
	int num = ((Integer) request.getAttribute("num")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	String sessionGrade = (String) session.getAttribute("sessionGrade");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="./assets/CSS/bootstrap.css" />
	<link rel="stylesheet" href="./assets/CSS/common.css" />
	
	<title>상세내용</title>
</head>
<body onload="noticeViewInit()">
	<jsp:include page="../menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h6 class="display-6 fw-bold text-center my-3">공지사항 수정</h5>
		</div>
	</div>

	<div class="container" style="height: 540px">
		<form name="newUpdate" action="NoticeUpdateAction.do?num=<%= notice.getNotice_no() %>&pageNum=<%= nowpage %>"
			class="form-horizontal" method="post">
			<div class="form-group row mb-2">
				<label class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-3">
					<input name="name" id="name" class="form-control" value="<%= notice.getNotice_nickname() %>">
				</div>
			</div>
			
			<div class="form-group row mb-2">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-3">
					<input name="title" id="title" class="form-control" value="<%= notice.getNotice_title() %>">
				</div>
			</div>
			
			<div class="form-group row mb-2">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-8" style="word-break: break-all">
					<textarea name="content" id="content" rows="5" cols="50" style="resize: none;"> <%= notice.getNotice_content() %></textarea>
				</div>
			</div>
			
			<div class="form-group row mb-2">
				<div class="col-sm-offset-2 col-sm-10">
					<c:set var="grade" value="admin" />
					<c:if test="${ sessionGrade eq grade }">
						<a href="${ path }/NoticeDeleteAction.do?num=<%= notice.getNotice_no() %>&pageNum=<%= nowpage %>"
							class="btn btn-danger">삭제</a>
						<input type="submit" class="btn btn-success" value="수정">
					</c:if>
					<a href="${ path }/NoticeListAction.do?pageNum=<%= nowpage %>" class="btn btn-primary">목록</a>					
				</div>
			</div>
		</form>
	</div>
	
	<jsp:include page="../footer.jsp" />
	
	<script type="text/javascript">
		function noticeViewInit(){
			var name = document.getElementById("name");
			var title = document.getElementsByName("title")[0];
			var content = document.querySelector("#content");
			if(${ sessionGrade == 'admin'}){
				name.readOnly = false;
				title.readOnly = false;
				content.readOnly = false;
			}else{
				name.setAttribute("readonly", true);
				title.setAttribute("readonly", true);
				content.setAttribute("readonly", true);
			}
		}
	</script>
</body>
</html>