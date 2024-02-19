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
<link rel="stylesheet" href="/resources/CSS/comm/SellerRegisterForm.css">
</head>

<body>
<%
	String error = request.getParameter("error");
	if("fail".equals(error)){
%>
		<div class="alert alert-danger">
				<strong>회원가입 오류</strong> 이미 사용중인 아이디입니다.
		</div>
<%
	}
%>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="SellerRegisterFormNav" name="footer"/>
</jsp:include>

<div class="container">
	<div class="row">
 		<div class="col-12 mx-auto">
 			<h2 id="registerBoxTitle">
 				<a href="SellerRegisterForm.jsp" id="RegiLink">Seller Register</a>
			</h2>
 			<hr>
			<form id="formTag" class="border bg-light p-3 mx-auto" method="post" action="SellerRegister.jsp">
 				<div class="form-group mb-3">
					<label class="form-label">ID</label> <input type="text" class="form-control" name="sellerId">
					<div id="id-feedback" class="form-text"></div>
				</div>
				<div class="form-group mb-3">
					<label class="form-label">PW</label> <input type="password" class="form-control" name="sellerPw" />
					<div id="password-valid-feedback" class="form-text text-sucess d-none">
						유효한 비밀번호 입니다
					</div>
					<div id="password-invalid-feedback" class="form-text-danger d-none">
						비밀번호는 8글자 이상 , 영어 대소문자+ 숫자 + 특수문자 조합입니다.
					</div>
				</div>
				<div class="form-group mb-3">
					<label class="form-label">Name</label> 
					<input type="text"class="form-control" name="sellerName" />	
				</div>
				<div class="form-group mb-3">
					<label class="form-label">Email</label> 
					<input type="text" class="form-control" name="sellerEmail" />		
				</div>
				<div class="form-group mb-3">
					<label class="form-label">Phone_Number</label> 
					<input type="text"class="form-control" name="sellerTel">
				</div>
				<div class="text-end">
					<button type="submit" class="btn btn-secondary">가입</button>
					<a href="/index.jsp" class="btn btn-secondary">취소</a>
				</div>
 			</form>
 		</div>	
	</div>
</div>
<br><br><br>

<jsp:include page="/include/footer.jsp">
	<jsp:param value="SellerRegisterFormFooter" name="footer"/>
</jsp:include>
     
     
</body>
</html>