<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dto.UserDTO" %>
<%@ page import="java.sql.*" %>
<%@ include file="DBConn.jsp" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	if(sessionId == null){
		sessionId = "guest";
	}
	
	String sql = "SELECT * FROM user_tbl WHERE user_id = ?";

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, sessionId);
	rs = pstmt.executeQuery();
	
	rs.next();
	
	UserDTO dto = new UserDTO();
	
	dto.setUser_id(rs.getString("user_id"));
	dto.setUser_password(rs.getString("user_password"));
	dto.setUser_name(rs.getString("user_name"));
	dto.setUser_nickname(rs.getString("user_nickname"));
	dto.setUser_mobile(rs.getString("user_mobile"));
	dto.setUser_region(rs.getString("user_region"));
	dto.setUser_email(rs.getString("user_email"));
	dto.setUser_join_date(rs.getString("user_join_date"));
	
	try{
		if(rs != null){
			rs.close();
		}
		if(pstmt != null){
			pstmt.close();
		}
		if(conn != null){
			conn.close();
		}
	} catch (Exception e){
		e.printStackTrace();
	}
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="../assets/CSS/bootstrap.css" />
	<link rel="stylesheet" href="../assets/CSS/common.css" />

	<title>회원 수정</title>
</head>
<body onload="init()">
	<jsp:include page="/menu.jsp" />
	
	<div class="container">
		<h1 class="text-center my-3">회원 정보 수정</h1>
		<form name="newMember" class="form-horizontal" action="processUpdateMember.jsp" 
			method="post" onsubmit="return checkForm()">
			
			<div class="form-group row justify-content-center my-2">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" name="id" class="form-control" value="<%= dto.getUser_id()%>" readonly /> 
				</div>
			</div>
			
			<div class="form-group row justify-content-center my-2">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" name="password" class="form-control" value="<%= dto.getUser_password()%>" /> 
				</div>
			</div>
			
			<div class="form-group row justify-content-center my-2">
				<label class="col-sm-2">비밀번호 확인</label>
				<div class="col-sm-3">
					<input type="password" name="password_confirm" class="form-control" /> 
				</div>
			</div>
			
			<div class="form-group row justify-content-center my-2">
				<label class="col-sm-2">별명</label>
				<div class="col-sm-3">
					<input type="text" name="nickname" class="form-control" value="<%= dto.getUser_nickname()%>" /> 
				</div>
			</div>
			
			<div class="form-group row justify-content-center my-2">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input type="text" name="nickname" class="form-control" value="<%= dto.getUser_mobile()%>" /> 
				</div>
			</div>
			
			<div class="form-group row justify-content-center my-2">
				<label class="col-sm-2">지역</label>
				<div class="col-sm-3">
					<select name="region" id="region" class="form-control">
						<option value="서울">서울</option>
						<option value="대전">대전</option>
						<option value="대구">대구</option>
						<option value="부산">부산</option>
						<option value="제주">제주</option>
						<option value="경상북도">경상북도</option>
						<option value="전라남도">전라남도</option>
						<option value="기타">기타</option>
					</select>
				</div>
			</div>
			
			<div class="form-group row justify-content-center my-2">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input type="text" name="email" class="form-control" value="<%= dto.getUser_email()%>" /> 
				</div>
			</div>
			
			<div class="text-center my-2">
				<input type="submit" class="btn btn-primary" value="회원수정" />
				<input type="button" class="btn btn-danger" value="회원탈퇴" onclick="deleteCheck()"/>
			</div>
			
			
		</form>
	</div>
	<jsp:include page="/footer.jsp" />
	
	
	<!-- modal -->
	
	<div id="_modal" class="modal" tabindex="-1" style="background-color: rgba(0,0,0,0.5);">
	  <div class="modal-dialog modal-dialog-centered" style="bckground-color: green; width: 300px; height: 300px">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">회원 탈퇴</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="_close()"></button>
	      </div>
	      <div class="modal-body">
	        <p>정말 탈퇴하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" onclick="_close2()">취소</button>
	        <button type="button" class="btn btn-primary" onclick="deleteUser()">탈퇴</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script type="text/javascript">
		function checkForm() {
			if (!document.newMember.password.value) {
				alert("비밀번호를 입력하세요.");
				document.newMember.password.focus();
				return false;
			}
			if (document.newMember.password.value != document.newMember.password_confirm.value) {
				alert("비밀번호를 동일하게 입력하세요.");
				document.newMember.password_confirm.focus();
				return false;
			}
		}
		
		function init(){
			  const el = document.getElementById("region");
			  const len = el.options.length;
			  const str = "<%= dto.getUser_region() %>";
			  for (let i=0; i<len; i++){  
			  	//select box의 option value가 입력 받은 value의 값과 일치할 경우 selected
			    if(el.options[i].value == str){
			    	el.options[i].selected = true;
			    }
			  }  
			}
		
		function _close(){
			var popup = document.querySelector("#_modal");
			popup.style.display = "none";
		}
		
		function _close2(){
			location.href = "./updateMember.jsp";
		}
		
		function deleteCheck(){
			var popup = document.querySelector("#_modal");
			popup.style.display = "flex";
		}
		
		function deleteUser(){
			location.href = "./deleteMember.jsp";
		}
	</script>
</body>
</html>
