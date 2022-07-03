<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<footer class="bg-dark text-secondary px-5 py-4 text-center mt-auto">
    <div class="py-2">
      <h1 class="fw-bold mb-3" style="font-size: 3rem">Contact Moris</h1>
      <p class="my-2">
      	<a href="https://github.com/morisYu/portfolio/tree/master/SanCheck" style="text-decoration: none;" class="mx-1"><i class="fa-brands fa-github text-white fs-3"></i></a>
      	<span id="phone" class="mx-1"><i class="fa-solid fa-square-phone text-white fs-3"></i></span>
      	<span id="email" class="mx-1"><i class="fa-solid fa-envelope text-white fs-3"></i></span>
      </p>
      <p id="phoneNumber"></p>
      <div class="col-lg-6 mx-auto">
        <p class="fs-5 mb-4">안녕하세요. 신입 개발자 유성화입니다.</p>
        <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
        </div>
      </div>
    </div>
</footer>

<script src="https://kit.fontawesome.com/3b5371a0e4.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	var btn = document.querySelector("#phone");
	var text = document.querySelector("#phoneNumber");
	var mail = document.querySelector("#email");
	var sw = 0;
	
	btn.addEventListener('click', () => {
		if(sw == 1){
			sw = 0;
			text.innerHTML = "";
		} else {
			sw = 1;
			text.innerHTML = "<h5 class='text-warning'>010-5219-7105</h5>";
		}
	});
	
	mail.addEventListener('click', () => {
		if(sw == 2){
			sw = 0;
			text.innerHTML = "";
		} else {
			sw = 2;
			text.innerHTML = "<h5 class='text-warning'>morisyu50@gmail.com</h5>";
		}
	});
</script>