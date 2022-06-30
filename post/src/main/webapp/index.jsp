<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="post.DBConn" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.*" %>
<%@ page import="post.Post" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM post");
		ResultSet rs = pstmt.executeQuery();
		List<Post> posts = new ArrayList<Post>();
		while(rs.next()){
			Post post = new Post(
				rs.getInt("id"),
				rs.getString("title"),
				rs.getString("content")
			);
			
			posts.add(post);
		}
	%>
	<h1>JSP 프로젝트 AWS 배포하기</h1>
	
	<table>
		<tr>
			<th>id</th>
			<th>title</th>
			<th>content</th>
		</tr>
			<%
				for(Post post: posts){
			%>
				<tr>
					<td><%= post.getId() %></td>
					<td><%= post.getTitle() %></td>
					<td><%= post.getContent() %></td>
				</tr>
			<%		
				}
			%>
	</table>
</body>
</html>