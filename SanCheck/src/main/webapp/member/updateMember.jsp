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
	
	String mobile1 = dto.getUser_mobile().split("-")[0];
	String mobile2 = dto.getUser_mobile().split("-")[1];
	String mobile3 = dto.getUser_mobile().split("-")[2];
	
	String email1 = dto.getUser_email().split("@")[0];
	String email2 = dto.getUser_email().split("@")[1];
	
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
					<label class="col-sm-3"><span class="fs-5">아이디</span></label>
					<div class="col-sm-5">
						<input type="text" name="id" class="form-control" 
							placeholder="id" style="width: 200px" value="<%= dto.getUser_id() %>" readonly/> 
					</div>
				</div>
				
				<div class="form-group row justify-content-center my-2">
					<label class="col-sm-3"><span class="fs-5">비밀번호</span></label>
					<div class="col-sm-5">
						<input type="password" name="password" class="form-control" style="width: 200px"/> 
					</div>
				</div>
				
				<div class="form-group row justify-content-center my-2">
					<label class="col-sm-3"><span class="fs-5">비밀번호 확인</span></label>
					<div class="col-sm-5">
						<input type="password" name="password_confirm" class="form-control" style="width: 200px"/> 
					</div>
				</div>
				
				<div class="form-group row justify-content-center my-2">
					<label class="col-sm-3"><span class="fs-5">이름</span></label>
					<div class="col-sm-5">
						<input type="text" name="name" class="form-control" value="<%= dto.getUser_name() %>" style="width: 200px" autocomplete="off"/> 
					</div>
				</div>
				
				<div class="form-group row justify-content-center my-2">
					<label class="col-sm-3"><span class="fs-5">별명</span></label>
					<div class="col-sm-5">
						<input type="text" name="nickname" class="form-control" value="<%= dto.getUser_nickname() %>" style="width: 200px"/> 
					</div>
				</div>
				
				<div class="form-group row justify-content-center my-2">
					<label class="col-sm-3"><span class="fs-5">전화번호</span></label>
					<div class="col-sm-5">
						<input type="text" name="mobile1" maxlength="4" size="4" value="<%= mobile1 %>"/> -
						<input type="text" name="mobile2" maxlength="4" size="4" value="<%= mobile2 %>" /> -
						<input type="text" name="mobile3" maxlength="4" size="4" value="<%= mobile3 %>"/>
					</div>
				</div>
				
				<div class="form-group row justify-content-center my-2">
					<label class="col-sm-3"><span class="fs-5">지역</span></label>
					<div class="col-sm-5">
						<select name="region" id="region" class="form-select form-select-sm" style="width: 100px">
							<option value="광주">광주</option>
							<option value="대구">대구</option>
							<option value="대전">대전</option>
							<option value="부산">부산</option>
							<option value="서울">서울</option>
							<option value="울산">울산</option>
							<option value="인천">인천</option>
							<option value="제주도">제주도</option>
							<option value="기타">기타</option>
						</select>
					</div>
				</div>
				
				<div class="form-group row justify-content-center my-2">
					<label class="col-sm-3"><span class="fs-5">이메일</span></label>
					<div class="col-sm-5">
						<input type="text" name="email1" size="10" value="<%= email1 %>"/> @ 
						<input type="text" name="email2" id="email2" size="8" value="<%= email2 %>"/>
						<select name="email3" id="email3" class="form-select form-select-sm my-2" style="width: 150px" onchange="emailSetting()">
							<option value="navar.com">naver.com</option>
							<option value="google.com">google.com</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
							<option value="" selected>직접입력</option>
						</select>
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
		
		function emailSetting(){
			var email = document.querySelector("#email2");
			var tmp = document.querySelector("#email3");
			
			for(i = 0;tmp.options.length; i++){
				if(tmp.options[i].selected == true){
					email.value = tmp.options[i].value;
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
