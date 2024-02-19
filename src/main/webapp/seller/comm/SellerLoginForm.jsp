
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang ="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width, initail-scale=1">
<title></title>
<!-- CDN으로 포함시키기 -->
<!-- 부트스트랩 CSS와 JavaScript 라이브러리  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,400;1,100&display=swap" rel="stylesheet">
<link rel=stylesheet href="/resources/CSS/comm/SellerLoginForm.css">
</head>
<body>
<jsp:include page ="/include/navbar.jsp">
	<jsp:param name="bar" value="login"/> 
</jsp:include>

        <div class="container">
        <div class="row mt-5">
                <div class="col-12 mx-auto">

		<%
		/*
    		로그인 요청 URL
    				localhost/SellerLogin.jsp
    		로그인 실패 redirecet URL
    				localhost/SellerLogin.jsp?error=xxxx
		*/
			String error = request.getParameter("error");
		%>
		
		<%
			if ("fail".equals(error)) {
		%>
			<div class="alert alert-danger">
               	<strong>로그인 실패</strong> , 아이디 혹은 비밀번호가 일치 하지 않습니다.
         	</div>
        <%
			} else if ("deleted".equals(error)) {
		%>
			<div class="alert alert-danger">
                <strong>로그인 실패</strong> , 탈퇴 처리된 사용자 아이디 입니다.
            </div>		
		<% 	
			}
		%>
             <h2 id="loginBoxTitle">
             	<a href="SellerLoginForm.jsp" id="TitleLink">Seller Login</a>
             </h2>
             	<hr>
             	
             <form class="border bg-light p-3 mx-auto" method="post" action="SellerLogin.jsp" onsubmit="checkForm(event)">
             
                 <div id="welcomeBox">
                    <h2 id="welcomeTitle">would YOU</h2> 
                    <h3 id="welcomeContent"> 판매자 로그인 페이지에 오신걸 환영합니다 </h3>
                 </div>
                 
                 <div class="form-group mb-3">
                     <label class="form-label">ID</label>
                     <input type="text" class="form-control" name="id" id="inputId">
                 </div>
                 
                 <div class="form-group mb-3">
                     <label class="form-label">PassWord</label>
                     <input type="password" class="form-control" name="password" id="inputPassword">
                 </div>
                 
                 <div class="text-end d-grid gap-2 col-6 mx-auto">
                     <button type="submit" class="btn btn-dark">Login</button>
                 </div>
                	<hr>
                 
                 <div id="homreRegiDiv"> 
                     <a id="goHome" href="/index.jsp">Home</a>
                    &nbsp;&nbsp;       <span>|</span> &nbsp;&nbsp;    
                     <a id="goRegi" href="/seller/comm/SellerRegisterForm.jsp">Register</a>
                 </div>
             </form>
         </div>
   </div>
</div>
<br><br>
<jsp:include page="/include/footer.jsp">
	<jsp:param value="SellerloginForm" name="footer"/>
</jsp:include>
<script type="text/javascript">
	
	function checkForm(event) {
		// 아이디와 비밀번호 엘리먼트 조회하기
		// 1. document.getElementById();
		// 2. document.querySelector ("input[name=password]");
		
		let idInput =  document.getElementById("inputId");
		let passwordInput = document.getElementById("inputPassword");
		
		// 입력한 엘리민트를 값으로 조회
		let id = idInput.value;
		let password = passwordInput.value;
		
		// 조건문으로 비어있으면 alert 창뜨게
		// event.preventDefault() 를 사용해 제출되지 않게 
		
		if(id == "") {
			alert("아이디를 입력하세요");
			event.preventDefault();
			return;
		}
		
		if(password === "") {
			alert("비밀번호를 입력하세요");
			event.preventDefault();
			return;
		}
	}
</script>

</body>
</html>