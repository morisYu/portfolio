<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
	<link rel="stylesheet" href="../assets/CSS/bootstrap.css" />
	<link rel="stylesheet" href="../assets/CSS/common.css" />
	<title>회원 정보</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h6 class="display-6 fw-bold text-center my-3">회원 처리 결과</h5>
		</div>
	</div>

	<div class="container" align="center">
		<%
			String msg = request.getParameter("msg");

			if (msg != null) {
				if (msg.equals("0")){
					out.println(" <h2 class='alert alert-primary'>회원정보가 수정되었습니다.</h2>");
				}	else if (msg.equals("1")){
					out.println(" <h2 class='alert alert-success'>회원가입을 축하드립니다.</h2>");
				} else if (msg.equals("2")) {
					String loginId = (String) session.getAttribute("sessionId");
					out.println(" <h2 class='alert alert-danger'>" + loginId + "님 환영합니다</h2>");
				} else if (msg.equals("3")){
					out.println(" <h2 class='alert alert-danger'>아이디가 중복됩니다.</h2>");
				} else if (msg.equals("4")){
					out.println(" <h2 class='alert alert-danger'>해당 아이디가 없습니다.</h2>");
				}
			} else {
				out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
			}
		%>
	</div>	
</body>
</html>