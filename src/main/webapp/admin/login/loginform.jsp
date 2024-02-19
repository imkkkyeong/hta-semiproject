<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initail-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
	<title>관리자::로그인</title>
	<link rel="stylesheet" href="../../resources/CSS/bos/login.css">
</head>
<body>
	<jsp:include page ="/include/navbar.jsp">
		<jsp:param value="home" name="bar"/>
	</jsp:include>
	
    <div class="login-wrapper">
		<h2>관리자</h2>
        <form onsubmit="checkForm(event)" method="post" action="login.jsp" id="login-form">
        	<input type="text" name="id" placeholder="아이디를 입력하세요">
        	<input type="password" name="pw" placeholder="비밀번호를 입력하세요">
        	<input type="submit" value="Login">
        </form>
    </div>
    
		<%
		  	String error = request.getParameter("error");
		
    		if ("fail".equals(error)) {
		%>
		 		<script>alert('아이디 혹은 비밀번호가 올바르지 않습니다.');</script>
		<%
		 	}
    	%>
    	<%
    		if ("deleted".equals(error)) {
		%>
				<script>alert('삭제된 관리자 계정입니다.');</script>
		<%
		 	}
		%>

<!-- 간단한 유효성 검사 수행 -->
<script type="text/javascript">
	function checkForm(event) {
		// 1. 아이디, 비밀번호 입력필드 엘리먼트를 조회한다.
		let idInput = document.querySelector("input[name=id]");
		let pwInput = document.querySelector("input[name=pw]");
		
		// 2. 아이디, 비밀번호 입력필드의 값을 조회한다.
		let id = idInput.value.trim();
		let pw = pwInput.value.trim();
		
		// 3. 아이디, 비밀번호 값을 체크한다.
		if (id === "") {
			alert("아이디를 입력하세요");
			event.preventDefault();
			return;
		}
		
		if (pw === "") {
			alert("비밀번호를 입력하세요");
			event.preventDefault();
			return;
		}
	}
</script>
</body>
</html>