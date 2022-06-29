<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dto.RecordDTO" %>
<%@ page import="dao.RecordDAO" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<RecordDTO> recordListAll = (List<RecordDTO>) request.getAttribute("recordListAll");
	List<RecordDTO> recordListByNickname = (List<RecordDTO>) request.getAttribute("recordListByNickname");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="./assets/CSS/bootstrap.css" />
<title>산책기록</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	
	<div class="container" style="height: 700px">
		<h1>test</h1>
		<div class="row">
			<!-- 조회수 높은 산책기록 사진 -->
			<div class="col-6" style="border: 1px solid">
				<c:forEach var="record" items="<%= recordListAll %>">
					<p> ${ record.getRecord_no() }. ${ record.getRecord_nickname() } </p>
				</c:forEach>
			</div>
			<!-- 산책기록 작성 버튼 -->
			<div class="col-3">
				<div class="h-100 w-100 text-center" style="border: 1px solid">
					산책기록 작성
				</div>
			</div>
			<!-- 사용자 산책기록 목록 -->
			<div class="col-3">
				<div class="h-100 w-100 text-center" style="border: 1px solid">
					<c:forEach var="userRecord" items="${ recordListByNickname }">
						<p>
							<a href="./recordView.rc?num=${ userRecord.getRecord_no() }"> ${ userRecord.getRecord_no() }. ${ userRecord.getRecord_nickname() } </a>
						</p>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>









