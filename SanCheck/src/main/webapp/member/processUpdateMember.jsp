<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%
	request.setCharacterEncoding("UTF-8");

	int no = 0;
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String nickname = request.getParameter("nickname");
	String mobile1 = request.getParameter("mobile1");
	String mobile2 = request.getParameter("mobile2");
	String mobile3 = request.getParameter("mobile3");
	String mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
	String region = request.getParameter("region");
	String email1 = request.getParameter("email1");
	String email2	= request.getParameter("email2");
	String email = email1 + "@" + email2;
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/sancheck?useSSL=false&serverTimezone=Asia/Seoul"
	driver="com.mysql.cj.jdbc.Driver" user="root" password="1234"/>

<sql:update dataSource="${ dataSource }" var="resultSet">
	UPDATE user_tbl SET user_password = ?, user_name = ?, user_nickname = ?, user_mobile = ?, 
		user_region = ?, user_email = ? WHERE user_id = ? 
	<sql:param value="<%= password %>" />
	<sql:param value="<%= name %>" />
	<sql:param value="<%= nickname %>" />
	<sql:param value="<%= mobile %>" />
	<sql:param value="<%= region %>" />
	<sql:param value="<%= email %>" />
	<sql:param value="<%= id %>" />
</sql:update>

<c:if test="${ resultSet >= 1 }">
	<c:redirect url="resultMember.jsp?msg=0" />
</c:if>