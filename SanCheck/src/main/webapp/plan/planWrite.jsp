<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="../assets/CSS/bootstrap.css" />
<title>일정 등록</title>
</head>
<body>
	
	<div class="jumbotron">
		<div class="container">
			<h6 class="display-6 fw-bold text-center my-3">일정 등록</h5>
		</div>
	</div>
	
	<div class="container my-5">
		<form class="form" action="./planWriteAction.jsp" method="post">
		
			<div class="container row m-auto mb-2">
				<div class="col-sm-3 text-center">
					<label for="plan_reg_date" class="col-form-label">날짜</label>
				</div>
				<div class="col-sm-6">
					<input type="date" name="plan_reg_date" id="plan_reg_date" class="form-control">
				</div>
			</div>
		
			<div class="container row m-auto mb-2">
				<div class="col-sm-3 text-center">
					<label for="plan_kind" class="col-form-label">종류</label>
				</div>
				<div class="col-sm-6">
					<input type="radio" name="plan_kind" id="plan_kind" value="병원"><span class="fs-6">&nbsp;병원</span>
					<input type="radio" name="plan_kind" id="plan_kind" value="미용"><span class="fs-6">&nbsp;미용</span>
					<input type="radio" name="plan_kind" id="plan_kind" value="산책"><span class="fs-6">&nbsp;산책</span><br>
					<input type="radio" name="plan_kind" id="plan_kind" value="여행"><span class="fs-6">&nbsp;여행</span>
					<input type="radio" name="plan_kind" id="plan_kind" value="모임"><span class="fs-6">&nbsp;모임</span>
					<input type="radio" name="plan_kind" id="plan_kind" value="기타"><span class="fs-6">&nbsp;기타</span>
				</div>
			</div>
		
			<div class="container row m-auto mb-2">
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