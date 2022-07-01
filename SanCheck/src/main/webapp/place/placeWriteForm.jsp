<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="./assets/CSS/bootstrap.css" />
	<title>장소정보 작성</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />

	<div class="jumbotron">
		<div class="container">
			<h6 class="display-6 fw-bold text-center my-3">장소정보 등록</h5>
		</div>
	</div>
	
	<div class="container col-md-4" style="height: 580px">
		<form action="./PlaceWriteAction.pc" method="post" enctype="multipart/form-data">
			<input type="hidden" name="place_write_id" value="${ sessionId }" />
			
			<div class="row mb-2">
			  <div class="col-3">
			    <label for="name" class="col-form-label">장소명</label>
			  </div>
			  <div class="col-9">
			    <input type="text" name="place_name" id="name" class="form-control">
			  </div>
			</div>
			
			<div class="row mb-2">
				<div class="col-3">
					<label for="addr" class="col-form-label">주소</label>
				</div>
				<div class="col-9">
					<input type="text" name="place_addr" id="addr" class="form-control">
				</div>
			</div>
			
			<div class="row mb-2">
				<div class="col-3">
					<label for="tel" class="col-form-label">연락처</label>
				</div>
				<div class="col-9">
					<input type="text" name="place_tel" id="tel" class="form-control">
				</div>
			</div>
			
			<div class="row mb-2">
				<div class="col-3">
					<label for="hours" class="col-form-label">운영시간</label>
				</div>
				<div class="col-9">
					<input type="text" name="place_business_hours" id="hours" class="form-control">
				</div>
			</div>
			
			<div class="row mb-2">
				<div class="col-3">
					<label for="other" class="col-form-label">기타사항</label>
				</div>
				<div class="col-9">
					<input type="text" name="place_other" id="other" class="form-control">
				</div>
			</div>
			
			<div class="row mb-2">
				<div class="col-3">
					<label for="photo" class="col-form-label">사진등록</label>
				</div>
				<div class="col-9 text-center">
					<button class="btn btn-success me-3" onclick="addPhoto(); return false;" >사진추가</button>
					<button class="btn btn-danger" onclick="deletePhoto(); return false;" >항목삭제</button>
				</div>
			</div>
			
			<div class="container p-0 mb-2 w-100 d-flex justify-content-end">
				<table style="width: 310px">
					<tbody id="addPhoto"></tbody>
				</table>
			</div>
			
			<div class="container text-center mb-3">
				<input type="submit" class="btn btn-primary px-3" value="등록" />
				<input type="reset" class="btn btn-secondary px-3" value="취소"	/>
			</div>
		</form>
	</div>
	
	<jsp:include page="../footer.jsp"/>
	<script type="text/javascript">
		var rowCount = 1;
		// 사진 항목 추가
		function addPhoto()	{
			if(rowCount > 5){
				return false;
			}
			rowCount = rowCount + 1;
			var photo = document.getElementById('addPhoto');
			const newRow = photo.insertRow();
			const newCell = newRow.insertCell(0);
			var inputText = '<input type="file" name="place_photo" id="photo" class="form-control mb-2">';
			newCell.innerHTML = inputText;
			
			return false;
		}
		// 사진 항목 삭제
		function deletePhoto(){
			var photo = document.getElementById('addPhoto');
			rowCount = rowCount - 1;
			photo.deleteRow(-1);
			if(rowCount < 1){
				rowCount = 1;
			}
		}
	</script>
</body>
</html>