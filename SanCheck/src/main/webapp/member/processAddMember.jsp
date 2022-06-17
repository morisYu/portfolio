<%@ page laguage="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
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
	Strign region = request.getParameter("region");
	String email1 = request.getParameter("email1");
	String email2	= request.getParameter("email2");
	String email = email1 + "@" + email2;
	String grade = "user";
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
	String date = formatter.format(new Date());
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/sancheck?useSSL=false&serverTimezone=Asia/Seoul"
	driver="com.mysql.cj.jdbc.Driver" user="root" password="1234"/>

<sql:query var="rs" dataSource="${ dataSource }">
	SELECT id FROM user_tbl
</sql:query>

<c:set var="run" value="true" />
<c:forEach var="row" items="${ rs.rowsByIndex }">
	<c:forEach var="column" items="${ row }">
		<c:set var="paramId" value="${ param.id }" />
		<c:set var="columnId" value="${ column }" />
		<c:if test="${ paramId eq columnId }">
			<c:set var="run" value="false" />
			<c:redirect url="resultMember.jsp?msg=3" />
		</c:if>
	</c:forEach>
</c:forEach>

<%
	작성중입니다.
%>













