// 입력한 비밀번호 저장
let pass = '';
function insertPasswd(){
  pass = document.getElementById('passwd').value;
  console.log(pass);
}

// 비밀번호 일치여부 확인
function passcheck(event){
  let pass2 = event.target.value;
  let spantext = document.querySelector("#text");

  if(pass == pass2){
    spantext.style.color="black";
    spantext.innerHTML= "비밀번호가 일치합니다.";
    console.log("비밀번호가 일치합니다.");
  }else{
    spantext.style.color="red";
    spantext.innerHTML = "비밀번호가 다릅니다.";
    console.log("비밀번호가 다릅니다.");
  }
}

// 아이디 앞부분 자르기(별명에 적용)
let alias_tmp = '';
function substring(event){
  alias_tmp = event.target.value;
  var index = alias_tmp.indexOf('@');
  let alias = alias_tmp.substring(0, index);
  console.log(alias);

  document.querySelector("#alias").setAttribute('placeholder', alias);
  // document.querySelector("#alias").setAttribute('value', alias);
  console.log(document.querySelector("#alias").value);
}

function form_submit(){
  const form = document.querySelector('#regist_form');
  if(confirm("입력하신 내용이 맞습니까?")){
    form.submit();
  }else{
    return;
  }
}