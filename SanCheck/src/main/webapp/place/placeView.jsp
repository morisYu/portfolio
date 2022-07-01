<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dto.PlaceDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	String sessionGrade = (String) session.getAttribute("sessionGrade");
	int num = ((Integer) request.getAttribute("num")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	PlaceDTO place = (PlaceDTO) request.getAttribute("place");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="./assets/CSS/bootstrap.css" />
	<title>장소정보</title>
	<style type="text/css">
		.carousel-item{
			height: 25rem;
			background: black;
			color: white;
			position: relative;
		}
		.carousel-text{
			position: absolute;
			bottom: 0;
			left: 50px;
			right: 0;
			padding-bottom: 50px;
		}
		.overlay-img{
			position: absolute;
			top: 0;
			bottom: 0;
			left: 0px;
			right: 0;
			opacity: 1;
			background-position: center;
			background-size: cover;
		}
	</style>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h6 class="display-6 fw-bold text-center my-3">장소정보</h5>
		</div>
	</div>
	
	<div class="container mb-5">
		<div class="row">
			<div class="col-sm-6">
				<!-- carousel -->
				<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
				  <div class="carousel-inner">
				  	<!-- 등록된 사진이름을 분리해서 사진 가져오기 -->
				  	<c:set var="photos" value="${ fn:split(place.place_photo, ',') }" />
				  	<c:forEach var="photo" items="${ photos }">
				  		<div class="carousel-item active" data-bs-interval="2000" >
					    	<div class="overlay-img" style="background-image: url(./upload/${photo})"></div>
					    	<!-- 등록된 사진명 확인 
					    		<div class="carousel-text text-white fw-bold">${ photo }</div>
					    	-->
					    </div>
				  	</c:forEach>
				  	<!-- 이전 사진 버튼 -->
					  <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
					  </button>
					  <!-- 다음 사진 버튼 -->
					  <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
					  </button>
					</div>
				</div>
			</div>
			<!-- 장소 설명 -->
			<div class="col-sm-6 pt-3">
				<table class="table">
					<tr>
						<td width="25%"><p class="fs-5 fw-bold my-0">장소명: </p></td>
						<td><p class="fs-6 my-0 py-1"><c:out value="${ place.place_name }" /></p></td>
					</tr>
					<tr>
						<td><p class="fs-5 fw-bold my-0">주소: </p></td>
						<td><p class="fs-6 my-0 py-1"><c:out value="${ place.place_addr }" /></p></td>
					</tr>
					<tr>
						<td><p class="fs-5 fw-bold my-0">연락처: </p></td>
						<td><p class="fs-6 my-0 py-1"><c:out value="${ place.place_tel }" /></p></td>
					</tr>
					<tr>
						<td><p class="fs-5 fw-bold my-0">운영시간: </p></td>
						<td><p class="fs-6 my-0 py-1"><c:out value="${ place.place_business_hours }" /></p></td>
					</tr>
					<tr>
						<td><p class="fs-5 fw-bold my-0">기타: </p></td>
						<td><p class="fs-6 my-0 py-1"><c:out value="${ place.place_other }" /></p></td>
					</tr>
				</table>
				<c:if test="${ sessionGrade == 'admin' }">
					<a href="./PlaceUpdateForm.pc?num=${ place.place_no }&pageNum=${ pageNum }" class="btn btn-warning px-5 py-1 fs-5 me-3" >수정</a>
					<a href="./DeletePlaceAction.pc?num=${ place.place_no }" class="btn btn-danger px-5 py-1 fs-5" >삭제</a>
				</c:if>
			</div>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp" />
	<script type="text/javascript" src="./assets/JS/bootstrap.js"></script>
</body>
</html>