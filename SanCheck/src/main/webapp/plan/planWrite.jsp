<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="../assets/CSS/bootstrap.css" />
<title>일정 등록</title>
</head>
<body>
	<h1 class="display-3 text-center">일정 등록</h1>
	<div class="container my-5">
		<form class="form" action="./planWriteAction.jsp" method="post">
		
			<div class="container row m-auto">
				<div class="col-sm-3 text-center">
					<label for="plan_reg_date" class="col-form-label">날짜</label>
				</div>
				<div class="col-sm-6">
					<input type="date" name="plan_reg_date" id="plan_reg_date" class="form-control">
				</div>
			</div>
		
			<div class="container row m-auto">
				<div class="col-sm-3 text-center">
					<label for="plan_kind" class="col-form-label">종류</label>
				</div>
				<div class="col-sm-6">
					<input type="text" name="plan_kind" id="plan_kind" class="form-control">
				</div>
			</div>
		
			<div class="container row m-auto">
				<div class="col-sm-3 text-center">
					<label for="plan_content" class="col-form-label">내용</label>
				</div>
				<div class="col-sm-6">
					<input type="text" name="plan_content" id="plan_content" class="form-control">
				</div>
			</div>
			
			<div class="container row m-auto">
				<div class="col-sm-3 text-center">
					<label for="plan_color" class="col-form-label">색상</label>
				</div>
				<div class="col-sm-6">
					<input type="color" name="plan_color" id="plan_color">
				</div>
			</div>
			
			<div class="container text-center mt-3">
				<input type="submit" class="btn btn-success" value="전송">
				<input type="button" class="btn btn-secondary" onclick="self.close()" value="닫기" >
			</div>
		</form>
	</div>
</body>
</html>