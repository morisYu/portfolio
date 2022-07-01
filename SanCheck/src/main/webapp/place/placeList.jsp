<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dto.PlaceDTO" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	String sessionGrade = (String) session.getAttribute("sessionGreade");
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	int total_count = ((Integer) request.getAttribute("total_count")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
	List<PlaceDTO> placeList = (List) request.getAttribute("placeList");
	int startPageIndex = ((Integer) request.getAttribute("startPageIndex"));
	int endPageIndex = ((Integer) request.getAttribute("endPageIndex"));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="./assets/CSS/bootstrap.css" />
	<title>장소목록</title>
	<style type="text/css">
		@font-face {
	    font-family: 'ImcreSoojin';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.3/ImcreSoojin.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
		}
		.font-soojin{
			font-family: 'ImcreSoojin';
		}
	</style>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h6 class="display-6 fw-bold text-center my-3">장소목록</h5>
		</div>
	</div>
	<!-- 장소/주소 검색 -->
	<form action="./PlaceListAction.pc" method="post">
		<div class="container text-center">
			<div class="row" style="margin: auto;">
			
				<div class="col-auto ps-0 pe-2">
					<select name="items" class="form-select">
						<option value="place_name">장소명</option>
						<option value="place_addr">주소</option>
						<option value="place_other">기타</option>
					</select>
				</div>
				
				<div class="col-auto ps-0 pe-2">
					<input name="text" type="text" class="form-control"/>
				</div>
				
				<div class="col-auto ps-0 pe-2 mx-0">
					<input type="submit" class="btn btn-primary px-3" value="검색"/>
				</div>
				
				<c:if test="${ sessionGrade == 'admin' }">
					<div class="col-auto ps-0 pe-2 mx-0">
						<a href="./PlaceWriteForm.pc?id=${ sessionId }" class="btn btn-secondary">글쓰기&raquo;</a>
					</div>
				</c:if>
			</div>
			
		</div>
	</form>
	<hr>
	<div class="container">
		<div class="row">
			<c:forEach var="place" items="${ placeList }">
				<div class="col-md-6 col-lg-3 mb-3">
			    <div class="card" style="width: 18rem;">
			    	<!-- 카드 이미지 -->
			    	<div class="bd-placeholder-img card-img-top">
			    		<!-- 사진이 여러개 등록된 경우 fn 태그로 사진이름을 분리 -->
			    		<c:set var="photos" value="${ fn:split(place.place_photo, ',') }" />
			    		<!-- 분리된 사진 중 첫 번째 사진을 표시 -->
			    		<img src="./upload/${ photos[0] }" class="w-100" style="height: 150px">
			    	</div>
			    	<!-- 카드 내용 -->
			      <div class="card-body">
			        <h4 class="card-title mb-3 font-soojin">${ place.place_name }</h4>
			        <p class="fs-6 mb-3">${ place.place_addr }</p>
			        <div class="text-center">
			        	<a href="./PlaceViewAction.pc?num=${ place.place_no }&pageNum=${ pageNum }" class="btn btn-primary">상세보기</a>
			      	</div>
			      </div>
			    </div>
			  </div>
			</c:forEach>
		</div>
	</div>
	
	<ul class="pagination pagination-md justify-content-center mt-3">
		<c:set var="pageNum" value="<%= pageNum %>" />
		<li class="page-item"><button class="page-link px-3" onclick="prePage()">&laquo;</button></li>
		<c:forEach var="i" begin="${ startPageIndex }" end="${ endPageIndex }">
			<li class="page-item">
				<c:choose>
					<c:when test="${ pageNum == i }">
						<a class="page-link active" href="<c:url value="./PlaceListAction.pc?pageNum=${ i }" />">${ i }</a>
					</c:when>
					<c:otherwise>
						<a class="page-link" href="<c:url value="./PlaceListAction.pc?pageNum=${ i }" />">${ i }</a>
					</c:otherwise>
				</c:choose>
			</li>
		</c:forEach>
		<li class="page-item"><button class="page-link px-3" onclick="nextPage()">&raquo;</button></li>
	</ul>
	
	<jsp:include page="../footer.jsp" />
	<script type="text/javascript">
		// 이전페이지 이동
		function prePage(){
			var num = ${ pageNum } - 1;
			location.href = "./PlaceListAction.pc?pageNum=" + num;
		}
		// 다음페이지 이동
		function nextPage(){
			var num = ${ pageNum} + 1;
			location.href = "./PlaceListAction.pc?pageNum=" + num;
		}
	</script>
</body>
</html>