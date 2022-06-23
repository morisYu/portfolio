<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%
	request.setCharacterEncoding("UTF-8");

	String user_id = request.getParameter("user_id");
	String user_grade = request.getParameter("user_grade");
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/sancheck?useSSL=false&serverTimezone=Asia/Seoul"
	driver="com.mysql.cj.jdbc.Driver" user="root" password="1234"/>

<sql:update dataSource="${ dataSource }" var="resultSet">
	UPDATE user_tbl SET user_grade = ? WHERE user_id = ? 
	<sql:param value="<%= user_grade %>" />
	<sql:param value="<%= user_id %>" />
</sql:update>

<c:if test="${ resultSet >= 1 }">
	<c:redirect url="manageMember.jsp" />
</c:if>