<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="dao.PlanDAO" %>
<%@ page import="dto.PlanDTO" %>
<%@ page import="java.util.List" %>

<%
	String yy = request.getParameter("year");
	String mm = request.getParameter("month");
	
	Calendar cal = Calendar.getInstance();
	
	int y = cal.get(Calendar.YEAR);
	int m = cal.get(Calendar.MONDAY);
	
	if(yy != null && mm != null && !yy.equals("") && !mm.equals("")){
		y = Integer.parseInt(yy);
		m = Integer.parseInt(mm);
	}
	if(m < 1){
		m = 0;
	} else if(m > 11){
		m = 11;
	}
	
	int M = m + 1;
	String year = Integer.toString(y);
	String month;
	if(M < 10){
		month = "0" + M;
	} else {
		month = Integer.toString(M);
	}
	
	cal.set(y, m, 1);
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	int lastday = cal.getActualMaximum(Calendar.DATE);
	String sessionId = (String) session.getAttribute("sessionId");
	String year_month =  year + "/" + month;
	
	PlanDAO dao = PlanDAO.getInstance();
	List<PlanDTO> planList = dao.getPlanList(sessionId, year_month);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="../assets/CSS/bootstrap.css" />
<title>일정관리</title>
<style type="text/css">
	.planbtn{
		font-size: 0.8rem;
		width: 100%;
		padding: 0;
		color: white
	}
</style>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	
	<div class="container col-md-8">
		<div class="row">
			<div class="col-sm-10 text-center">
				<a href="./planList.jsp?year=<%= y %>&month=<%= m - 1 %>" class="btn btn-secondary">&laquo;</a>
				<span class="display-6 align-middle px-3"><%= y %> 년 <%= m + 1 %> 월</span>
				<a href="./planList.jsp?year=<%= y %>&month=<%= m + 1 %>" class="btn btn-secondary">&raquo;</a>
			</div>
			<div class="col-sm-2 text-end">
				<input type="button" id="planWrite" class="btn btn-primary mt-1" value="일정등록" >	
			</div>
		</div>
		<table class="table text-center" height="300px">
			<tr>
				<th>일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
			</tr>
			<tr>
				<%
					int count = 0;
				
					for(int s = 1; s < dayOfWeek; s++){
						out.print("<td></td>");
						count++;
					}
					
					for(int d=1; d<=lastday; d++){
						count++;
						String day;
						if(d < 10){
							day = "0" + d;
						} else {
							day = Integer.toString(d);
						}
						String date = year + "/" + month + "/" + day;
						
						String color = "#555555";
						if(count == 7){
							color = "blue";
						} else if(count == 1){
							color = "red";
						}
				%>
				<td style="color: <%= color %>; height: 120px; width: 100px">
					<p class="fw-bold fs-5 text-end mb-1"><%= d %></p>
					<%
						for(int i=0; i<planList.size(); i++){
							if(planList.get(i).getPlan_reg_date().equals(date)){
					%>
						<p class="mb-1">
							<a href="./planView.jsp?num=<%= planList.get(i).getPlan_no() %>" class="btn planbtn" style="background: <%= planList.get(i).getPlan_color()%>">
								<%= planList.get(i).getPlan_kind() %>
							</a>
						</p>
					<%
							}
						}
					%>
				</td>
				<%
						if(count == 7){
							out.print("</tr><tr>");
							count = 0;
						}
					}
					while(count < 7){
						out.print("<td></td");
						count++;
					}
				%>
			
			</tr>
		
		</table>
	</div>
	
	<jsp:include page="../footer.jsp" />
	<script type="text/javascript">
		var wrt = document.querySelector("#planWrite");
		wrt.addEventListener('click', () => {
			
			<%
				if(sessionId == null){
			%>
				alert("로그인이 필요합니다.");
				location.href = "../member/login.jsp";
			<%
				} else {
			%>
			var dualmonitorWidth = 1920;
			var w = (window.screen.width/2) + dualmonitorWidth - 300;
			var h = (window.screen.height/2) + - 300;
			var url = "planWrite.jsp";
			window.open(url, "planWrite", "width=600, height=400, left=" + w +", top=" + h);
			<%
				}
			%>
			
		});
	</script>
</body>
</html>