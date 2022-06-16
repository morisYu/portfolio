<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	String sessionGrade = (String) session.getAttribute("sessionGrade");
%>

<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand  fs-1" href="/SanCheck/index.jsp">Home</a>
		</div>
		<div class="navbar-header">
			<a class="navbar-brand  fs-4" href="/SanCheck/index.jsp">장소정보</a>
		</div>
		<div class="navbar-header">
			<a class="navbar-brand  fs-4" href="/SanCheck/index.jsp">산책기록</a>
		</div>
		<div class="navbar-header">
			<a class="navbar-brand  fs-4" href="/SanCheck/index.jsp">일정관리</a>
		</div>
		<div class="navbar-header">
			<a class="navbar-brand  fs-4" href="/SanCheck/index.jsp">게시판</a>
		</div>
		<div class="navbar-header">
			<a class="navbar-brand  fs-4" href="/SanCheck/notice/notice.jsp">공지사항</a>
		</div>
	</div>
	
	<div class="container justify-content-end">
		<ul class="navbar-nav">
			<c:choose>
				<c:when test="${ empty sessionId }">
					<li class="nav-item">
						<a class="nav-link  fs-4" href="<c:url value="/member/login.jsp" />">로그인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link  fs-4" href="<c:url value="/member/addMember.jsp" />">회원가입</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="nav-item">
						<a class="nav-link  fs-4" href="<c:url value="/member/logout.jsp" />">로그아웃</a>
					</li>
					<li class="nav-item">
						<a class="nav-link  fs-4" href="<c:url value="/member/updateMember.jsp" />">회원정보수정</a>
					</li>
					<c:if test="${ sessionGrade eq 'admin' }">
						<li class="nav-item">
							<a class="nav-link  fs-4" href="<c:url value="/member/manageMember.jsp"/>">회원관리</a>
						</li>
					</c:if>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</nav>