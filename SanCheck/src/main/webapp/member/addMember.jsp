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
	
	<div class="container" style="margin: 20px auto; border: 1px solid;">
		<div class="container text-center">
			<h1 class="display-3">회원 가입</h1>
		</div>
		
		<div class="container col-sm-6 mt-5 mb-5" style="border: 1px solid">
			<form name="newMember" method="post" action="processAddMember.jsp" class="form-horizontal"
				onsubmit="return checkForm()">
				
				<div class="form-group row">
					<label class="col-sm-4">아이디</label>
					<div class="col-sm-3">
						<input type="text" name="id" class="form-control" placeholder="id">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-3">
						<input type="password" name="password" class="form-control" placeholder="password">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-4">비밀번호 확인</label>
					<div class="col-sm-3">
						<input type="password" name="password_confirm" class="form-control" placeholder="password confirm">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">성명</label>
					<div class="col-sm-3">
						<input type="text" name="name" class="form-control" placeholder="name">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">성별</label>
					<div class="col-sm-10">
						<input type="radio" name="gender" value="남" />남 &nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="gender" value="여" />여
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">생일</label>
					<div class="col-sm-4">
						<input type="text" name="birthyy" maxlength="4" placeholder="년(4 자)" size="6">
						<select name="birthmm">
							<option value="">월</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
						<input type="text" name="birthdd" maxlength="2" placeholder="일" size=4>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">이메일</label>
					<div class="col-sm-10">
						<input type="text" name="mail1" maxlength="50">@
						<select name="mail2">
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
						</select>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">전화번호</label>
					<div class="col-sm-10">
						<input type="text" name="phone1" size="6" /> -
						<input type="text" name="phone2" size="6" /> -
						<input type="text" name="phone3" size="6" />
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">주소</label>
					<div class="col-sm-5">
						<input type="text" name="address" class="form-control" placeholder="address">
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-primary" value="등록">
						<input type="reset" class="btn btn-primary" value="취소">
					</div>
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
		}
	</script>
	
</body>
</html>