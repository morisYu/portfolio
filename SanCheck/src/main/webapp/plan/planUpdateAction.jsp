<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.PlanDAO" %>
<%@ page import="dto.PlanDTO" %>
<%
	request.setCharacterEncoding("UTF-8");
	int plan_no = Integer.parseInt(request.getParameter("plan_no"));
	String plan_reg_date = request.getParameter("plan_reg_date");
	String plan_kind = request.getParameter("plan_kind");
	String plan_color = request.getParameter("plan_color");
	String plan_content = request.getParameter("plan_content");
	
	PlanDTO plan = new PlanDTO();
	plan.setPlan_no(plan_no);
	plan.setPlan_color(plan_color);
	plan.setPlan_kind(plan_kind);
	plan.setPlan_content(plan_content);
	plan.setPlan_reg_date(plan_reg_date);
	
	PlanDAO dao = PlanDAO.getInstance();
	dao.updatePlan(plan);
	
%>
<script type="text/javascript">
	alert("수정이 완료되었습니다.");
	location.href = "./planView.jsp?num=" + <%=plan_no%>;
</script>