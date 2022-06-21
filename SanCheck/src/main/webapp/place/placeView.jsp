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
			<div class="col-sm-6">
				<img src="/fileupload/P1234" class="w-100" height="350px" />
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
	
	<jsp:include page="../footer.jsp" />
</body>
</html>