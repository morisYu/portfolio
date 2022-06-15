// 아이디 입력창 실시간 변화 확인
function log(event){
  var text = event.target.value;
  console.log(text);
}

// 아이디와 비밀번호 확인

function check(){
  var sub = document.querySelector('form');
  var text = '';
  var i;
  for(i=0;i<sub.length;i++){
    if(sub.elements[i].name == ''){
      break;
    }
    text += sub.elements[i].name + '=' + sub.elements[i].value + '\n';
  }
  console.log(text);
  // sub.submit();
}
