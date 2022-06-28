<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.PlanDAO" %>
<%
	int plan_no = Integer.parseInt(request.getParameter("num"));
	out.println(plan_no);
	PlanDAO dao = PlanDAO.getInstance();
	
	dao.deletePlan(plan_no);
	response.sendRedirect("./planList.jsp");
%>