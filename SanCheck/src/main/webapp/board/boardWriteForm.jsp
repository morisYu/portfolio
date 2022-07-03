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
	<title>게시글 작성</title>
</head>
<body>
	
	<jsp:include page="../menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h6 class="display-6 fw-bold text-center my-3">게시글 작성</h5>
		</div>
	</div>
	
	<div class="container text-center" style="height: 580px">
		<form name="newWrite" action="${ path }/BoardWriteAction.bc" class="form-horizontal"
			method="post" onsubmit="return checkForm()" enctype="multipart/form-data">
			<input name="id" type="hidden" class="form-control" value="${ sessionSciosessionId }" />
			
			<div class="form-group row mb-2">
				<label class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-3">
					<input name="board_nickname" type="text" class="form-control" value="<%= nickname %>" readonly/>
				</div>
			</div>
			
			<div class="form-group row mb-2">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-5">
					<input name="board_title" type="text" class="form-control" placeholder="title" />
				</div>
			</div>
			
			<div class="form-group row mb-2">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-5">
					<textarea name="board_content" rows="5" class="form-control" style="resize: none" ></textarea>
				</div>
			</div>
			
			<div class="form-group row mb-2">
				<label class="col-sm-2">사진 등록</label>
				<div class="col-sm-5">
					<input name="board_photo" type="file" class="form-control" />
				</div>
			</div>
		
			<div class="form-group row mb-2">
				<div class="col-sm-offset-2 col-sm-6">
					<input type="submit" class="btn btn-primary" value="등록" />
					<input type="reset" class="btn btn-secondary" value="취소" />
				</div>
			</div>
		</form>
	</div>
	
	<jsp:include page="../footer.jsp" />
	
	<script type="text/javascript">
		function checkForm() {
			if (!document.newWrite.board_nickname.value) {
				alert("성명을 입력하세요.");
				return false;
			}
			if (!document.newWrite.subject.value) {
				alert("제목을 입력하세요.");
				return false;
			}
			if (!document.newWrite.content.value) {
				alert("내용을 입력하세요.");
				return false;
			}		
		}
	</script>
</body>
</html>