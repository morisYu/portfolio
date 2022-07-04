<%@ page language="java" contentType="text/html; charser=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="../assets/CSS/bootstrap.css" />
<link rel="stylesheet" href="../assets/CSS/common.css" />
<title>회원가입</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	
	<div class="container" style="margin: 20px auto;">
		<div class="container text-center">
			<h1 class="display-3">회원 가입</h1>
		</div>
		
		<div class="container col-sm-6 mt-5 mb-5">
			<form name="newMember" method="post" action="processAddMember.jsp" class="form-horizontal"
				onsubmit="return checkForm()">
				
				<div class="form-group row justify-content-center my-2">
					<label class="col-sm-3"><span class="fs-5">아이디</span></label>
					<div class="col-sm-5">
						<input type="text" name="id" class="form-control" placeholder="id" style="width: 200px" /> 
					</div>
				</div>
				
				<div class="form-group row justify-content-center my-2">
					<label class="col-sm-3"><span class="fs-5">비밀번호</span></label>
					<div class="col-sm-5">
						<input type="password" name="password" class="form-control" placeholder="password" style="width: 200px"/> 
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
						<input type="text" name="name" class="form-control" style="width: 200px" autocomplete="off"/> 
					</div>
				</div>
				
				<div class="form-group row justify-content-center my-2">
					<label class="col-sm-3"><span class="fs-5">별명</span></label>
					<div class="col-sm-5">
						<input type="text" name="nickname" class="form-control" style="width: 200px"/> 
					</div>
				</div>
				
				<div class="form-group row justify-content-center my-2">
					<label class="col-sm-3"><span class="fs-5">전화번호</span></label>
					<div class="col-sm-5">
						<input type="text" name="mobile1" maxlength="4" size="4" /> -
						<input type="text" name="mobile2" maxlength="4" size="4" /> -
						<input type="text" name="mobile3" maxlength="4" size="4" />
					</div>
				</div>
				
				<div class="form-group row justify-content-center my-2">
					<label class="col-sm-3"><span class="fs-5">지역</span></label>
					<div class="col-sm-5">
						<select name="region" class="form-select form-select-sm" style="width: 100px">
							<option value="광주">광주</option>
							<option value="대구">대구</option>
							<option value="대전">대전</option>
							<option value="부산">부산</option>
							<option value="서울">서울</option>
							<option value="울산">울산</option>
							<option value="인천">인천</option>
							<option value="제주도">제주도</option>
							<option value="기타" selected>기타</option>
						</select>
					</div>
				</div>
				
				<div class="form-group row justify-content-center my-2">
					<label class="col-sm-3"><span class="fs-5">이메일</span></label>
					<div class="col-sm-5">
						<input type="text" name="email1" size="10"/> @ 
						<input type="text" name="email2" id="email2" size="8"/>
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
					<input type="submit" class="btn btn-primary mx-1 px-4" value="등록" />
					<input type="button" class="btn btn-danger mx-1 px-4" value="취소" />
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/footer.jsp" />
	
	<script type="text/javascript">
		var member = document.newMember;
		function checkForm(){
			if(!member.id.value){
				alert("아이디를 입력하세요");
				member.id.focus();
				return false;
			}
			
			if(!member.password.value){
				alert("비밀번호를 입력하세요");
				member.password.focus();
				return false;
			}
			
			if(member.password.value != member.password_confirm.value){
				alert("비밀번호를 동일하게 입력하세요.");
				member.password_confirm.focus();
				return false;
			}
			
			if(!member.name.value){
				alert("이름을 입력하세요.");
				member.name.focus();
				return false;
			}
			
			if(!member.mobile1.value | !member.mobile2.value | !member.mobile3.value){
				alert("전화번호를 입력하세요.");
				member.mobile1.focus();
				return false;
			}
			
			if(!member.email1.value){
				alert("이메일을 입력하세요.");
				member.email1.focus();
				return false;
			}
			
			if(!member.email2.value){
				alert("이메일을 입력하세요.");
				member.email2.focus();
				return false;
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
	</script>
	
</body>
</html>