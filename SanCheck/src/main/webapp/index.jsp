<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	left: 0px;
	right: 0;
	opacity: 1;
	background-position: center;
	background-size: cover;
}
</style>

</head>
<body>
	<jsp:include page="./menu.jsp" />
	
	<!-- carousel -->
	<div class="container-fluid bg-secondary px-0" >
		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
			
				<div class="carousel-item active" data-bs-interval="2000">
					<div class="overlay-img"
						style="background-image: url(https://cdn.pixabay.com/photo/2022/06/15/11/07/konigssee-7263638__340.jpg)"></div>
					<div class="carousel-text">
						<div class="carousel-caption d-none d-md-block">
			        <h5>First slide label</h5>
			        <p>Some representative placeholder content for the first slide.</p>
			      </div>
					</div>
				</div>

				<div class="carousel-item" data-bs-interval="2000">
					<div class="overlay-img"
						style="background-image: url(https://cdn.pixabay.com/photo/2022/06/14/17/30/beach-7262492__340.jpg)"></div>
					<div class="carousel-text"></div>
				</div>

				<div class="carousel-item" data-bs-interval="2000">
					<div class="overlay-img"
						style="background-image: url(https://cdn.pixabay.com/photo/2022/05/12/10/02/mountains-7191235__340.jpg)"></div>
					<div class="carousel-text"></div>
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
	
	<div class="container my-3 bg-primary">
		<h1>test</h1>
	</div>



	<jsp:include page="./footer.jsp" />
	<script type="text/javascript" src="./assets/JS/bootstrap.js"></script>
</body>
</html>