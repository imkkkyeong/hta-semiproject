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
<link rel="stylesheet" href="/resources/CSS/comm/LoginForm.css">
<title></title>
</head>

<body>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="login" name="bar"/>
</jsp:include>
<!-- 
		해당 URL : localhost/user/comm/loginform.jsp
 -->

<%
	String error = request.getParameter("error");
%>

<div class="container">
	<div class="row">
		<div class="col-4"></div>
		<div class="col-4">
<main class="form-signin w-100 m-auto">
  <form method="post" action="login.jsp">
    <h1 class="h3 mb-6 fw-normal mb-3" style="margin-top : 150px"><strong>로그인</strong></h1>
	
<%
	if("fail".equals(error)){
%>
	<div class="alert alert-danger">
		<strong>로그인 실패</strong> 아이디 혹은 비밀번호가 올바르지 않습니다
	</div>	
<%
	} else if("del".equals(error)){
%>		
	<div class="alert alert-danger">
		<strong>로그인 실패</strong> 탈퇴 처리된 아이디입니다
	</div>	
<%
	} else if ("deny".equals(error)) {
%>
	<div class="alert alert-danger">
		<strong>요청 거부</strong> 로그인이 필요한 서비스를 요청하였습니다.
	</div>
<%
	}
%>	
	

    <div class="form-floating mb-3">
      <input name="id" type="text" class="form-control" id="floatingInput" placeholder="exampleId" >
      <label for="floatingInput">아이디</label>
    </div>
    <div class="form-floating">
      <input name="pw" type="password" class="form-control" id="floatingPassword" placeholder="Password" >
      <label for="floatingPassword">비밀번호</label>
    </div>

    <div class="form-check text-start my-3">
      <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
      <label class="form-check-label" for="flexCheckDefault">
        Id 저장 기능구현 아직
      </label>
      
    </div>
    <button class="btn btn-success col-6" type="submit" style="margin-left : 75px">로그인</button>
  </form>
</main>
		</div>
		<div class="col-4"></div>
	</div>
</div>

</body>
</html>