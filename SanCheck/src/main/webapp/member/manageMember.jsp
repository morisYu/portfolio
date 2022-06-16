<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="dto.UserDTO" %>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	UserDAO dao = UserDAO.getInstance();

	List<UserDTO> userList = dao.getUserList();	
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="../assets/CSS/bootstrap.css" />
<link rel="stylesheet" href="../assets/CSS/common.css" />
	
<title>회원관리</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<h1 class="text-center">회원 관리</h1>
	
	
	
	<div class="container">
	
		<table class="table table-hover text-center">
		  <thead>
		    <tr>
		      <th scope="col">no</th>
		      <th scope="col">id</th>
		      <th scope="col">password</th>
		      <th scope="col">name</th>
		      <th scope="col">nickname</th>
		      <th scope="col">mobile</th>
		      <th scope="col">region</th>
		      <th scope="col">email</th>
		      <th scope="col">grade</th>
		      <th scope="col">join_date</th>
		      <th scope="col">other</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<%
		  		for(int i = 0; i < userList.size(); i++){
		  			UserDTO user = new UserDTO();
		  			user = userList.get(i);
		  	%>
		  		<tr>
			      <td><%= user.getUser_no() %></td>
			      <td><%= user.getUser_id() %></td>
			      <td><%= user.getUser_password() %></td>
			      <td><%= user.getUser_name() %></td>
			      <td><%= user.getUser_nickname() %></td>
			      <td><%= user.getUser_mobile() %></td>
			      <td><%= user.getUser_region() %></td>
			      <td><%= user.getUser_email() %></td>
			      <td><%= user.getUser_grade() %></td>
			      <td><%= user.getUser_join_date() %></td>
			      <td><button type="button" class="btn btn-danger">회원삭제</button></td>
		    	</tr>
		  	<%
		  		}
		  	%>
		    
		  </tbody>
		</table>
	
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>