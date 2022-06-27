<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.PlanDAO" %>
<%@ page import="dto.PlanDTO" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="../assets/CSS/bootstrap.css" />
<title>일정등록</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		PlanDTO plan = new PlanDTO();
		int plan_no = 0;
		String plan_id = (String) session.getAttribute("sessionId");
		if(plan_id == null){
			plan_id = "guest";
		}
		String plan_kind = request.getParameter("plan_kind");
		String plan_color = request.getParameter("plan_color");
		String plan_content = request.getParameter("plan_content");
		String plan_reg_date = request.getParameter("plan_reg_date");
		
		plan.setPlan_no(plan_no);
		plan.setPlan_id(plan_id);
		plan.setPlan_kind(plan_kind);
		plan.setPlan_color(plan_color);
		plan.setPlan_content(plan_content);
		plan.setPlan_reg_date(plan_reg_date);
		
		PlanDAO dao = PlanDAO.getInstance();
		dao.setPlan(plan);
	%>
	
	<button style="background: <%= plan_color %>; font-size: 2rem;"><%= plan_kind %></button>
	<%= plan_kind %><br>
	<%= plan_color %><br>
	<%= plan_content %><br>
	<%= plan_reg_date %><br>
	
</body>
</html>
