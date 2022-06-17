<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page import="java.util.*" %>
<%@ page import="dto.NoticeDTO" %>
<%@ page import="dao.NoticeDAO" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	List noticeList = (List) request.getAttribute("noticeList");
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="./assets/CSS/bootstrap.css" />
	<link rel="stylesheet" href="./assets/CSS/common.css" />
	
	<title>공지사항</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">공지사항</h1>
			</div>
		</div>

		<div class="container">
			<div>
				<div class="text-right">
					<span class="badge bg-success">전체 ${ total_record } 건</span>
				</div>
			</div>
		
			<!-- table -->
			<p class="display-6 text-center"> 테이블 목록 </p>
			<div class="pt-5 text-center">
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>작성자</th>
					</tr>
					
					<%
						for(int i = 0; i < noticeList.size(); i++){
							NoticeDTO notice = (NoticeDTO) noticeList.get(i);
					%>
					
					<tr>
						<td><%= notice.getNotice_no() %></td>
						<td><a href="./NoticeViewAction.do?num=<%=notice.getNotice_no() %>&pageNum=<%= pageNum %>"><%= notice.getNotice_title() %></a></td>
						<td><%= notice.getNotice_reg_date() %></td>
						<td><%= notice.getNotice_nickname() %></td>
					</tr>
					
					<%
						}
					%>
				</table>
			</div>
			
			<hr>
				<p class="display-6 text-center"> 아코디언 목록 </p>
			<hr>
			
			<!-- accordion -->
			<div class="accordion" id="accordionExample">
				<%
					for(int i = 0; i < noticeList.size(); i++){
						NoticeDTO notice = (NoticeDTO) noticeList.get(i);
				%>
				  
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="heading<%= i %>">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<%= i %>" aria-expanded="false" aria-controls="collapse<%= i %>">
				        <div class="col-sm-1 text-center"><%= notice.getNotice_no() %></div>
				        <div class="col-sm-5 text-center"><%= notice.getNotice_title() %></div>
				        <div class="col-sm-3 text-center"><%= notice.getNotice_reg_date() %></div>
				        <div class="col-sm-2 text-end"><%= notice.getNotice_nickname() %></div>
				      </button>
				    </h2>
				    <div id="collapse<%= i %>" class="accordion-collapse collapse" aria-labelledby="heading<%= i %>" data-bs-parent="#accordionExample">
				      <div class="accordion-body px-5 py-5">
				      	<span class="fs-6"><%= notice.getNotice_content() %></span>
				      </div>
				    </div>
				  </div>
				
				<%
					}
				%>  
			</div>
			
			<!-- Pagination -->

			<ul class="pagination pagination-sm justify-content-center mt-3">
				<c:set var="pageNum" value="<%= pageNum %>" />
				<li class="page-item"><a class="page-link px-3" href="./Preview.do?pageNum=${ pageNum }">&laquo;</a></li>
				<c:forEach var="i" begin="1" end="<%= total_page %>">
					<li class="page-item">
						<c:choose>
							<c:when test="${ pageNum == i }">
								<a class="page-link active" href="<c:url value="./NoticeListAction.do?pageNum=${ i }" />">${ i }</a>
							</c:when>
							<c:otherwise>
								<a class="page-link" href="<c:url value="./NoticeListAction.do?pageNum=${ i }" />">${ i }</a>
							</c:otherwise>
						</c:choose>
					</li>
				</c:forEach>
				<li class="page-item"><a class="page-link px-3" href="./Nextview.do?pageNum=${ pageNum }">&raquo;</a></li>
		  </ul>
		  
		  
		  
		</div>
	<jsp:include page="../footer.jsp" />
	
	<script type="text/javascript" src="./assets/JS/bootstrap.js"></script>
	<script type="text/javascript">
		function checkForm() {	
			if (${sessionId==null}) {
				alert("로그인 해주세요.");
				return false;
			}
	
			location.href = "./BoardWriteForm.do?id=<%=sessionId%>";
		}
	</script>
</body>
</html>