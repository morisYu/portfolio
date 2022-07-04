<%@ page import="java.sql.*" %>
<%
	Connection conn = null;

	String url="jdbc:mysql://localhost:3306/sancheck?useSSL=false&serverTimezone=Asia/Seoul";
	String user="user";
	String password="user1234";
	String driver="com.mysql.cj.jdbc.Driver";
	
	Class.forName(driver);
	conn = DriverManager.getConnection(url, user, password);
%>