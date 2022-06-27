<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Calendar" %>

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
	
	
	cal.set(y, m, 1);
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	int lastday = cal.getActualMaximum(Calendar.DATE);
	String sessionId = (String) session.getAttribute("sessionId");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="../assets/CSS/bootstrap.css" />
<title>일정관리</title>
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
						
						String color = "#555555";
						if(count == 7){
							color = "blue";
						} else if(count == 1){
							color = "red";
						}
				%>
				<td style="color: <%= color %>">
					<%= d %>
					<p style="font-size: 0.8rem">일정입니다요..</p>
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