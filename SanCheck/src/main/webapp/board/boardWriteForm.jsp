<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String nickname = (String) request.getAttribute("nickname");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="${ path }/assets/CSS/bootstrap.css" />
	<link rel="stylesheet" href="${ path }/assets/CSS/common.css" />
	<title>게시글 작성</title>
</head>
<body>
	
	<jsp:include page="../menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시글 작성</h1>
		</div>
	</div>
	
	<div class="container">
		
		<form name="newWrite" action="${ path }/BoardWriteAction.bc" class="form-horizontal"
			method="post" oncubmit="return checkForm()" enctype="multipart/form-data">
			<input name="id" type="hidden" class="form-control" value="${ sessionSciosessionId }" />
			
			<div class="form-group row">
				<label class="col-sm-2 control-label">별명</label>
				<div class="col-sm-3">
					<input name="board_nickname" type="text" class="form-control" value="<%= nickname %>" readonly/>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-5">
					<input name="board_title" type="text" class="form-control" placeholder="title" />
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-8">
					<textarea name="board_content" rows="5" class="form-control" style="resize: none" ></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">사진 등록</label>
				<div class="col-sm-5">
					<input name="board_photo" type="file" class="form-control" />
				</div>
			</div>
		
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록" />
					<input type="reset" class="btn btn-secondary" value="취소" />
				</div>
			</div>
		</form>
	</div>
	
	<jsp:include page="../footer.jsp" />
	
	<script type="text/javascript">
		function checkForm() {
			if (!document.newWrite.name.value) {
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