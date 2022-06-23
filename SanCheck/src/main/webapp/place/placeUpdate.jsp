<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dto.PlaceDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	int num = ((Integer) request.getAttribute("num")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum"));
	PlaceDTO place = (PlaceDTO) request.getAttribute("place");
	int place_no = place.getPlace_no();
	String place_name = place.getPlace_name();
	String place_addr = place.getPlace_addr();
	String place_tel = place.getPlace_tel();
	String place_business_hours = place.getPlace_business_hours();
	String place_other = place.getPlace_other();
	String[] place_photos;
	if(place.getPlace_photo() != null){
		place_photos = place.getPlace_photo().split(",");
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="./assets/CSS/bootstrap.css" />
	<title>장소정보 수정</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />

	<div class="container-fluid">
		<h3 class="display-3 my-3 text-center">장소정보 수정</h3>
	</div>
	
	<div class="container col-md-4">
		<form action="./PlaceUpdateAction.pc?num=${ num }&pageNum=${ pageNum }" method="post" enctype="multipart/form-data">
			<input type="hidden" name="place_no" value="${ place.place_no }"/>
			<input type="hidden" name="place_write_id" value="${ sessionId }" />
			
			<div class="row mb-2">
			  <div class="col-3">
			    <label for="name" class="col-form-label">장소명</label>
			  </div>
			  <div class="col-auto">
			    <input type="text" name="place_name" id="name" class="form-control" value="${ place.place_name }">
			  </div>
			</div>
			
			<div class="row mb-2">
				<div class="col-3">
					<label for="addr" class="col-form-label">주소</label>
				</div>
				<div class="col-auto">
					<input type="text" name="place_addr" id="addr" class="form-control" value="${ place.place_addr }">
				</div>
			</div>
			
			<div class="row mb-2">
				<div class="col-3">
					<label for="tel" class="col-form-label">연락처</label>
				</div>
				<div class="col-auto">
					<input type="text" name="place_tel" id="tel" class="form-control" value="${ place.place_tel }">
				</div>
			</div>
			
			<div class="row mb-2">
				<div class="col-3">
					<label for="hours" class="col-form-label">운영시간</label>
				</div>
				<div class="col-auto">
					<input type="text" name="place_business_hours" id="hours" class="form-control" value="${ place.place_business_hours }">
				</div>
			</div>
			
			<div class="row mb-2">
				<div class="col-3">
					<label for="other" class="col-form-label">기타사항</label>
				</div>
				<div class="col-auto">
					<input type="text" name="place_other" id="other" class="form-control" value="${ place.place_other }">
				</div>
			</div>
			
			<div class="row mb-2">
				<div class="col-3">
					<label for="photo" class="col-form-label">사진등록</label>
				</div>
				<div class="col-auto text-center">
					<button class="btn btn-success me-3" onclick="addPhoto(); return false;" >사진추가</button>
					<button class="btn btn-danger" onclick="deletePhoto(); return false;" >항목삭제</button>
				</div>
			</div>
			
			<div class="row mb-2">
				<table style="width: 80%;">
					<tbody id="addPhoto"></tbody>
				</table>
			</div>
			
			<div class="container text-center mb-3">
				<input type="submit" class="btn btn-primary px-3" value="수정" />
				<a href="./PlaceViewAction.pc?num=${ num }&pageNum=${ pageNum }" class="btn btn-secondary px-3" >취소</a>
			</div>
		</form>
	</div>
	
	<jsp:include page="../footer.jsp"/>
	<script type="text/javascript">
		var rowCount = 1;
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