<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="./assets/CSS/bootstrap.css" />
<title>sancheck</title>
<style type="text/css">
.carousel-item {
	height: 25rem;
	background: black;
	color: white;
	position: relative;
}

.carousel-text {
	position: absolute;
	bottom: 0;
	left: 50px;
	right: 0;
	padding-bottom: 50px;
}

.overlay-img {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	opacity: 0.8;
	background-position: center;
	background-size: cover;
}
</style>
</head>
<body>
	<jsp:include page="./menu.jsp" />
	<%
		String realPath = request.getServletContext().getRealPath("/upload");
	%>
	<!-- carousel -->
	<div class="container-fluid bg-secondary px-0" >
		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
			
				<div class="carousel-item active" data-bs-interval="2000">
					<div class="overlay-img"
						style="background-image: url(./upload/island.png);"></div>
					<div class="carousel-text">
						<div class="carousel-caption d-none d-md-block">
			        <h6 class="display-6 fw-bold">안녕하세요</h6>
			        <p>hello.</p>
			      </div>
					</div>
				</div>

				<div class="carousel-item" data-bs-interval="2000">
					<div class="overlay-img"
						style="background-image: url(./upload/lin-zhi.jpg);"></div>
					<div class="carousel-text">
						<div class="carousel-caption d-none d-md-block">
			        <h6 class="display-6 fw-bold">저는 유성화입니다.</h6>
			        <p>My name is Moris Yu.</p>
			      </div>
					</div>
				</div>

				<div class="carousel-item" data-bs-interval="2000">
					<div class="overlay-img"
						style="background-image: url(./upload/skyline.jpg);"></div>
					<div class="carousel-text">
						<div class="carousel-caption d-none d-md-block">
			        <h6 class="display-6 fw-bold">반갑습니다.</h6>
			        <p>Nice to meet you.</p>
			      </div>
					</div>
				</div>
				
				<!-- 이전/다음 버튼 -->
				<button class="carousel-control-prev" type="button"
					data-bs-target="#myCarousel" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true" ></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#myCarousel" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	</div>
	
	<!-- 메인 페이지라서 색다른 디자인 필요함 -->
	<div class="container">
		
	</div>

	<jsp:include page="./footer.jsp" />
	<script type="text/javascript" src="./assets/JS/bootstrap.js"></script>
</body>
</html>