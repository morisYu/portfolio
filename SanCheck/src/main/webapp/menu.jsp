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
	.login_text{
		text-decoration: none;
		color: #D1B2FF;
		font-size: 1.3rem;
	}
	.navbar_toggleBtn{
		display: none;
		position: absolute;
		top: 20px;
		right: 20px;
		color: #d49466;
		font-size: 2rem;
		background: none;
	}
	@media screen and (max-width: 1024px){
		.navbar-nav{
			display: none;
		}
		
		.navbar-nav.active{
			position: absolute;
			width: 200px;
			display: flex;
			flex-direction: column;
			text-align: center;
		}
		
		.navbar_toggleBtn{
			display: flex;
		}
		
		.navbar-nav{
			position: absolute;
			top: 80px;
			right: 0px;
		}
	}
</style>

<script type="text/javascript" src="https://kit.fontawesome.com/3b5371a0e4.js" crossorigin="anonymous"></script>

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
	
	<div class="container justify-content-end hamburger">
		<ul class="navbar-nav bg-dark">
			<c:choose>
				<c:when test="${ empty sessionId }">
					<li class="nav-item">
						<a class="nav-link login_text" href="<c:url value="/member/login.jsp" />">로그인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link login_text" href="<c:url value="/member/addMember.jsp" />">회원가입</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="nav-item">
						<span class="badge fs-5 mt-2" style="background: yellow; color: black">[ ${ sessionId } ] 님</span>
					</li>
					<li class="nav-item">
						<a class="nav-link login_text" href="<c:url value="/member/logout.jsp" />">로그아웃</a>
					</li>
					<li class="nav-item">
						<a class="nav-link login_text" href="<c:url value="/member/updateMember.jsp" />">회원정보수정</a>
					</li>
					<c:if test="${ sessionGrade eq 'admin' }">
						<li class="nav-item">
							<a class="nav-link login_text" href="<c:url value="/member/manageMember.jsp"/>">회원관리</a>
						</li>
					</c:if>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	
	<button class="navbar_toggleBtn">
    <i class="fa-solid fa-burger"></i>
  </button>
</nav>
<script type="text/javascript">
  const toggleBtn = document.querySelector(".navbar_toggleBtn");
  const hamburger = document.querySelector(".navbar-nav");

  toggleBtn.addEventListener('click', () => {
    console.log('test');
    hamburger.classList.toggle('active');
  })
</script>