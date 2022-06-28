<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dto.PlanDTO" %>
<%@ page import="dao.PlanDAO" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	int plan_no = Integer.parseInt(request.getParameter("num"));
	PlanDAO dao = PlanDAO.getInstance();
	PlanDTO plan = dao.getPlan(plan_no);
	String newPlan_reg_date = plan.getPlan_reg_date().replace("/", "-");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="../assets/CSS/bootstrap.css" />
<title>일정보기</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	
	<h3 class="display-5 my-3 text-center">일정 보기</h3>
	<div class="container d-flex justify-content-center">
		<form action="./planUpdateAction.jsp" method="post" class="form">
		
			<input type="hidden" name="plan_no" value="<%= plan.getPlan_no() %>" />
			<div class="row mb-1">
				<div class="col-sm-4">
					<label for="plan_id">작성자</label>
				</div>
				<div class="col-sm-8">
					<input type="text" name="plan_id" id="plan_id" class="form-control w-100" value="<%= plan.getPlan_id() %>" readonly>
				</div>
			</div>
			
			<div class="row mb-1">
				<div class="col-sm-4">
					<label for="plan_reg_date">작성일자</label>
				</div>
				<div class="col-sm-8">
					<input type="date" name="plan_reg_date" id="plan_reg_date" class="form-control w-100" value="<%= newPlan_reg_date %>">
				</div>
			</div>
			
			<div class="row mb-1">
				<div class="col-sm-4">
					<label for="plan_kind">종류</label>
				</div>
				<div class="col-sm-8">
					<input type="text" name="plan_kind" id="plan_kind" class="form-control w-100" value="<%= plan.getPlan_kind() %>" >
				</div>
			</div>
			
			<div class="row mb-1">
				<div class="col-sm-4">
					<label for="plan_color">색상</label>
				</div>
				<div class="col-sm-8">
					<input type="color" name="plan_color" id="plan_color" value="<%= plan.getPlan_color() %>" >
					<span id="color" class="fs-5"><%= plan.getPlan_color() %></span>
				</div>
			</div>
			
			<div class="row mb-1">
				<div class="col-sm-4">
					<label for="plan_content">내용</label>
				</div>
				<div class="col-sm-8">
					<textarea name="plan_content" id="plan_content" class="form-control w-100" style="resize: none"><%= plan.getPlan_content() %></textarea>
				</div>
			</div>
			
			<div class="container text-center">
				<a href="./planList.jsp" class="btn btn-primary" >목록</a>
				<%
					if(sessionId.equals(plan.getPlan_id())){
				%>
				<input type="submit" class="btn btn-success" value="수정" />
				<%
					}
				%>
				
				<a href="./planDeleteAction.jsp?num=<%= plan.getPlan_no() %>" class="btn btn-danger">삭제</a> 
			</div>
			
		</form>
	</div>
	
	<jsp:include page="../footer.jsp" />
	<script type="text/javascript">
		const colorText = document.querySelector("#plan_color");
		var color = document.querySelector("#color");
		          
		colorText.addEventListener('change', () => {
			color.innerHTML = colorText.value;
		});
	
	</script>
</body>
</html>