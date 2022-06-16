<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="../assets/CSS/bootstrap.css" />
	<link rel="stylesheet" href="../assets/CSS/common.css" />
	<title>login</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	
	<main class="container text-center" style="padding: 100px; width: 500px; margin: 20px auto">
	
		<form method="post" action="loginProcess.jsp">
	    <img class="mb-4 rounded-circle" src="../assets/img/loginDog.jpg" alt="" width="120" height="120">
	    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
	
	    <div class="form-floating">
	      <input type="text" class="form-control" name="login_id" placeholder="name@example.com" autocomplete="off">
	      <label>ID</label>
	    </div>
	    
	    <div class="form-floating mt-2 mb-2">
	      <input type="password" class="form-control" id="login_password" name="login_password" placeholder="Password">
	      <label for="password">Password</label>
	    </div>
	
			<div class="container">
				<button class="btn btn-lg btn-primary" type="submit">로그인</button>
		    <button class="btn btn-lg btn-danger" type="reset">취소</button>
			</div>
	  </form>
	  
	</main>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>
