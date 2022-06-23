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
		  			<form action="./manageUpdateMember.jsp" method="post">
				      <td><%= user.getUser_no() %></td>
				      <td><%= user.getUser_id() %></td>
				      <td><%= user.getUser_password() %></td>
				      <td><%= user.getUser_name() %></td>
				      <td><%= user.getUser_nickname() %></td>
				      <td><%= user.getUser_mobile() %></td>
				      <td><%= user.getUser_region() %></td>
				      <td><%= user.getUser_email() %></td>
				      <td>
			      		<input type="hidden" name="user_id" id="user_id" value="<%= user.getUser_id() %>" >
			      		<%
				      		String grade = user.getUser_grade();
				      		if( grade.equals("admin")){
				      			
				      	%>
				      	<select name="user_grade" class="form-control text-center">
				      		<option value="admin" selected>admin</option>
				      		<option value="user">user</option>
				      	</select>
				      	<%
				      		} else {
				      	%>
				      	<select name="user_grade" class="form-control text-center">
				      		<option value="admin">admin</option>
				      		<option value="user" selected>user</option>
				      	</select>
				      	<%
					      	}
				      	%>
				      </td>
				      <td><%= user.getUser_join_date() %></td>
				      <td>
				      	<input type="submit"  href="#" class="btn btn-info mb-2 fs-6" value="등급수정">
				      	<button class="btn btn-danger mb-2 fs-6" id="<%= user.getUser_no() %>" onClick="checkDelete(this.id); return false;">회원삭제</a>
				      </td>
			      </form>
		    	</tr>
		  	<%
		  		}
		  	%>
		    
		  </tbody>
		</table>
	
	</div>
	<jsp:include page="../footer.jsp" />
	
	<script type="text/javascript">
		function checkDelete(check_no){
			var user_no = check_no;
			if(confirm(user_no + " 번 사용자 계정을 삭제하시겠습니까?")){
				location.href = "manageDeleteMember.jsp?no=" +  user_no ;
			}
			return false;
		}
	</script>
</body>
</html>