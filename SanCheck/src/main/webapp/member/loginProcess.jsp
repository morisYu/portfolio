<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
%>

회원 관련 db 연동은 JSP 스크립틀릿 태그로 처리하고, 
게시판 관련 db 연동은 가능한 mvc 패턴 적용(스크립틀릿 태그 최소화)


<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/sancheck?useSSL=false&serverTimezone=Asia/Seoul"
	driver="com.mysql.cj.jdbc.Driver" user="root" password="1111" />

<sql:query dataSource="${dataSource}" var="resultSet">
 	SELECT * FROM user_tbl WHERE user_id = ? AND user_password = ?
 	<sql:param value="${ param.id }" />
 	<sql:param value="${ param.password }" />
</sql:query>

<c:forEach var="row" items="${resultSet.rows}" varStatus="row12">
	<c:out value="${ row['user_grade'] }" /><br>
		
		<%
			String grade01 = "${ row['user_grade']}";
			session.setAttribute("sessionId", id);
			session.setAttribute("grade", grade01);
		%>
		
		
		
</c:forEach>



<html>
<head>
<title>test</title>
</head>
<body>
	<%= id %><br>
	<%= password %><br>
	<%= session.getAttribute("sessionId") %><br>
	<%= session.getAttribute("grade") %>
	<!-- 세션값 가지고오기 -->
	session is : ${ sessionScope.grade }
</body>
</html>



