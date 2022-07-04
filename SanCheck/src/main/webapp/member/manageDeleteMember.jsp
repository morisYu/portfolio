<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%
	request.setCharacterEncoding("UTF-8");

	String user_no = request.getParameter("no");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/sancheck?useSSL=false&serverTimezone=Asia/Seoul"
	driver="com.mysql.cj.jdbc.Driver" user="user" password="user1234"/>

<sql:update dataSource="${ dataSource }" var="resultSet">
	DELETE FROM user_tbl WHERE user_no = ? 
	<sql:param value="<%= user_no %>" />
</sql:update>

<c:if test="${ resultSet >= 1 }">
	<c:redirect url="manageMember.jsp" />
</c:if>