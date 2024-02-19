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
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="profileRegisterCompleted" name="bar"/>
</jsp:include>

    <div class="container">
    	<div class="row">
    		<div class="offset-3 col-6">
    			<div class="border bg-white p-3 g-2">
    				<h1>프로필 작성완료</h1>
    				<p>뭅뭅의 판매자 프로필 작성을 완성하셨습니다.</p>
    			</div>
    			<div>
    				<a href="/index.jsp" class="btn btn-primary offset-4 col-4">메인</a>
    			</div>
    		</div>
    	</div>
    </div>
     
<%@include file = "/include/footer.jsp" %>
</body>
</html>