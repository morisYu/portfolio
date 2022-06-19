<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String login_id = request.getParameter("login_id");
	String login_password = request.getParameter("login_password");
	
	ResultSet rs = null;
	Statement stmt = null;
	
	String user_id = null;
	
	try{
		String sql = "SELECT * FROM user_tbl WHERE user_id = '" + login_id + "' AND user_password = '" + login_password + "'";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		rs.next();
		user_id = rs.getString("user_id");
		String user_grade = rs.getString("user_grade");
		
		session.setAttribute("sessionId", user_id);
		session.setAttribute("sessionGrade", user_grade);
		
	} catch (Exception e){
		e.printStackTrace();
	} finally {
		try{
			if(rs != null){
				rs.close();
			}
			if(stmt != null){
				stmt.close();
			}
			if(conn != null){
				conn.close();
			}
		} catch(Exception e){
			throw new RuntimeException();
		}
	}
	
	if(user_id == null){
		response.sendRedirect("/SanCheck/member/resultMember.jsp?msg=3");
	}else{
		response.sendRedirect("/SanCheck/index.jsp");
	}
%>