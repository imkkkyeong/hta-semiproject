<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initail-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>대시보드</title>
</head>
<body>

<jsp:include page="../../include/navbar.jsp">
	<jsp:param value="admin" name="bar"/>
</jsp:include>

<div class="h-100 container-fluid ">
	<div class="row">
		<div class="col-2 ps-0">
			<jsp:include page="../sidebar.jsp"></jsp:include>
		</div>
		<div class="col-9">
			<!-- 위쪽으로 사이드바 영역 -->
			
			
			<h1>파이널 때 개발 예정</h1>
			
			
			<!-- 아래쪽으로 사이드바 영역 -->
		</div>
	</div>
</div>

</body>
</html>