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
	
	<div class="jumbotron">
		<div class="container">
			<h6 class="display-6 fw-bold text-center my-3">일정 내용</h5>
		</div>
	</div>
	
	<div class="container d-flex justify-content-center" style="height: 520px">
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
					<input type="radio" name="plan_kind" id="plan_kind" value="병원"><span class="fs-6">&nbsp;병원</span>
					<input type="radio" name="plan_kind" id="plan_kind" value="미용"><span class="fs-6">&nbsp;미용</span>
					<input type="radio" name="plan_kind" id="plan_kind" value="산책"><span class="fs-6">&nbsp;산책</span><br>
					<input type="radio" name="plan_kind" id="plan_kind" value="여행"><span class="fs-6">&nbsp;여행</span>
					<input type="radio" name="plan_kind" id="plan_kind" value="모임"><span class="fs-6">&nbsp;모임</span>
					<input type="radio" name="plan_kind" id="plan_kind" value="기타"><span class="fs-6">&nbsp;기타</span>
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
					if(plan.getPlan_id().equals(sessionId)){
				%>
				<input type="submit" class="btn btn-success" value="수정" />
				<a href="./planDeleteAction.jsp?num=<%= plan.getPlan_no() %>" class="btn btn-danger">삭제</a>
				<%
					}
				%>
			</div>
			
		</form>
	</div>
	
	<jsp:include page="../footer.jsp" />
	<script type="text/javascript">
		const colorText = document.querySelector("#plan_color");
		var color = document.querySelector("#color");
		// 선택한 색상 코드를 표시
		colorText.addEventListener('change', () => {
			color.innerHTML = colorText.value;
		});
		
		const checkedKind = document.getElementsByName('plan_kind');
		var count = checkedKind.length;
		var kind = '<%= plan.getPlan_kind() %>';
		console.log('라디오버튼 갯수 ', count);
		console.log('종류: ', kind);
		for(var i=0; i < count; i++) {
			console.log(checkedKind[i].value);
			if(checkedKind[i].value == kind){
				checkedKind[i].checked = true;
			}
		}
	</script>
</body>
</html>