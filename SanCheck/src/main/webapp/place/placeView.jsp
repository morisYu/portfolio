<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dto.PlaceDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	int num = ((Integer) request.getAttribute("num")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	PlaceDTO place = (PlaceDTO) request.getAttribute("place");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="./assets/CSS/bootstrap.css" />
	<title>장소정보</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	
	<div class="container-fluid text-center my-3">
		<h1 class="display-3">장소정보</h1>
	</div>
	
	<div class="container mb-5">
		<div class="row">
			<div class="col-sm-5">
				<img src="/fileupload/${ place.place_photo }" class="w-100" height="350px" />
			</div>
			
			<div class="col-sm-6">
				<table class="table">
					<tr>
						<td scope="col"><h4 class="fs-4">장소명: </h4></td>
						<td scope="col"><h6 class="fs-5"><c:out value="${ place.place_name }" /></h6></td>
					</tr>
					<tr>
						<td scope="col"><h4 class="fs-4">주소: </h4></td>
						<td scope="col"><h6 class="fs-5"><c:out value="${ place.place_addr }" /></h6></td>
					</tr>
					<tr>
						<td scope="col"><h4 class="fs-4">연락처: </h4></td>
						<td scope="col"><h6 class="fs-5"><c:out value="${ place.place_tel }" /></h6></td>
					</tr>
					<tr>
						<td scope="col"><h4 class="fs-4">운영시간: </h4></td>
						<td scope="col"><h6 class="fs-5"><c:out value="${ place.place_business_hours }" /></h6></td>
					</tr>
					<tr>
						<td scope="col"><h4 class="fs-4">기타: </h4></td>
						<td scope="col"><h6 class="fs-5"><c:out value="${ place.place_other }" /></h6></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	<!-- carousel -->
	<!-- https://nowonbun.tistory.com/707 참고해서 시간 조절 및 버튼으로 조작 설정할 것 -->
	<div id="carouselExampleControls" class="container" style="width: 50%; height: auto">
		<div class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="https://cdn.pixabay.com/photo/2022/06/12/22/35/village-7258991__340.jpg" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="https://cdn.pixabay.com/photo/2022/03/09/07/12/nature-7057191__340.jpg" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="https://cdn.pixabay.com/photo/2022/05/12/10/02/mountains-7191235__340.jpg" class="d-block w-100" alt="...">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
	</div>
	
	
	<jsp:include page="../footer.jsp" />
	<script type="text/javascript" src="./assets/JS/bootstrap.js"></script>
	<script type="text/javascript">
			$('#carouselExampleControls').carousel({
	      interval: 1000
	    });
	</script>
</body>
</html>