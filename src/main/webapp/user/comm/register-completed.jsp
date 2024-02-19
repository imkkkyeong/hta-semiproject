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
</head>
<body>
<%@include file ="/include/navbar.jsp" %>

    <div class="container">
    	<div class="row">
    		<div class="offset-3 col-6">
    			<div class="border bg-white p-3 g-2">
    				<h1>회원가입 완료</h1><br>
    				<p>뭅뭅 회원이 되신걸 축하드립니다</p>
    			</div><br>
    			<div>
    				<a href="login.jsp" class="btn btn-primary offset-4 col-4">로그인</a>
    			</div>
    		</div>
    	</div>
    </div>
     
<%@include file = "/include/footer.jsp" %>
</body>
</html>