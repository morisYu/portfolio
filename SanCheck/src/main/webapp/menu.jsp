<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	String sessionGrade = (String) session.getAttribute("sessionGrade");
%>
<c:set var="path" value="<%= request.getContextPath() %>" scope="application"/>
<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Single+Day&display=swap');
	nav{
		font-family: 'Single Day', cursive;
	}
	.menu_text{
		color: #FFB2F5;
		font-size: 1.8rem;
	}
	.menu_text:hover{
		color: #B7F0B1;
	}
</style>
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header ms-3">
			<a class="navbar-brand" href="${ path }/index.jsp" style="font-size: 3rem">Home</a>
		</div>
		<div class="navbar-header">
			<a class="navbar-brand menu_text" href="${ path }/PlaceListAction.pc?pageNum=1">장소정보</a>
		</div>
		<div class="navbar-header">
			<a class="navbar-brand text-danger fs-4" href="${ path }/index.jsp">산책기록</a>
		</div>
		<div class="navbar-header">
			<a class="navbar-brand text-danger fs-4" href="${ path }/index.jsp">일정관리</a>
		</div>
		<div class="navbar-header">
			<a class="navbar-brand menu_text" href="${ path }/BoardListAction.bc">게시판</a>
		</div>
		<div class="navbar-header">
			<a class="navbar-brand menu_text" href="${ path }/NoticeListAction.do?pageNum=1">공지사항</a>
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
						<span class="badge fs-5 mt-2" style="background: yellow; color: black">[ ${ sessionId } ] 님</span>
					</li>
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