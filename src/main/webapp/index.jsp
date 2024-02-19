<%@page import="java.util.Date"%>
<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@page import="utils.DateUtils"%>
<%@page import="vo.UserEstimate"%>
<%@page import="dao.UserEstimateDao"%>
<%@page import="java.util.List"%>
<%@page import="dao.SellerProfileDao"%>
<%@page import="vo.SellerInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initail-scale=1">
<title>index</title>
<!-- CDN으로 포함시키기 -->
<!-- 부트스트랩 CSS와 JavaScript 라이브러리  -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link href="/resources/CSS/index.css" rel="stylesheet">
<link href="/resources/CSS/carousel.css" rel="stylesheet">
<link href="/resources/CSS/grid.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="home" name="bar" />
	</jsp:include>



	<div id="myCarousel" class="carousel slide mb-6"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#myCarousel"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#myCarousel"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#myCarousel"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<svg class="bd-placeholder-img" width="100%" height="100%"
					xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
					preserveAspectRatio="xMidYMid slice" focusable="false">
					<rect width="100%" height="100%" fill="var(--bs-secondary-color)" /></svg>
				<div class="container">
					<div class="carousel-caption text-start">
						<img src="/resources/images/comm/resize1.jpg" width="100%">
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<svg class="bd-placeholder-img" width="100%" height="100%"
					xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
					preserveAspectRatio="xMidYMid slice" focusable="false">
					<rect width="100%" height="100%" fill="var(--bs-secondary-color)" /></svg>
				<div class="container">
					<div class="carousel-caption">
						<img src="/resources/images/comm/resize2.jpg" width="100%">
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<svg class="bd-placeholder-img" width="100%" height="100%"
					xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
					preserveAspectRatio="xMidYMid slice" focusable="false">
					<rect width="100%" height="100%" fill="var(--bs-secondary-color)" /></svg>
				<div class="container">
					<div class="carousel-caption text-end">
						<img src="/resources/images/comm/resize3.jpg" width="100%">
					</div>
				</div>
			</div>
		</div>

		<button class="carousel-control-prev" type="button"
			data-bs-target="#myCarousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#myCarousel" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<!-- 사진 슬라이드 영역 -->

	<div class="row mb-3 text-center">
		<div class="col-md-1"></div> 
<%
	BoardDao boardDao = new BoardDao();
	List<Board> board = boardDao.getRandomBoard();
%>
		<div class="col-md-3 themed-grid-col">
			<strong>커뮤니티</strong>
<%
	for(Board boardList : board) {
%>
			<div class="list-group">
				<a href="#"
					class="list-group-item list-group-item-action d-flex gap-3 py-3"
					aria-current="true">
					<div class="d-flex gap-2 w-100 justify-content-between">
						<div style="text-align: left">
							<h6 class="mb-0">제목 : <%=boardList.getTitle().length() > 25 ? boardList.getTitle().substring(0, 20) + "...." : boardList.getTitle()%> </h6>
							<p class="mb-0 opacity-75"><%=boardList.getContent().length() > 25  ? boardList.getContent().substring(0,20) + "...." : boardList.getContent() %></p>
							<p class="mb-0 opacity-75">작성자 : <%=boardList.getUsers().getName() %></p>
						</div>
						<small class="opacity-50 text-nowrap"><%=DateUtils.toText(boardList.getRegDate(), "yyyy-MM-dd") %></small>
					</div>
				</a>
				<br>
			</div>
<%
	}
%>			
		</div>
		<!-- 커뮤니티 -->
<%
	UserEstimateDao userEstimateDao = new UserEstimateDao();
	List<UserEstimate> userEstimate = userEstimateDao.getIndexEsti();
%>
		<div class="col-md-4 themed-grid-col">
			<strong>요청 게시판</strong>
<%
	for(UserEstimate estimate : userEstimate) {
%>
			<div class="list-group">
				<a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
					<div class="d-flex gap-2 w-100 justify-content-between">
						<div style="text-align: left">
							<h6 class="mb-0"><%=estimate.getUsers().getName() %></h6>
							<p class="mb-0 opacity-75">이사 종류 : <%=estimate.getBuildingType().getName() %> </p>
							<p class="mb-0 opacity-75">출발지 : <%=estimate.getMovingFromAddress() %> </p>
							<p class="mb-0 opacity-75">도착지 : <%=estimate.getMovingToAddress() %></p>
						</div>
						<small class="opacity-50 text-nowrap"><%=DateUtils.toText(estimate.getRegDate(), "yyyy-MM-dd") %></small>
					</div>
				</a>
			<br>
			</div>
<%
	}
%>
		</div>
		<!-- 가운데 공백을 위한 공간 -->
<%
	SellerProfileDao sellerProfileDao = new SellerProfileDao();
	List<SellerInfo> sellerInfoList = sellerProfileDao.getSellerInfoAll();
%>

		<div class="col-md-3 themed-grid-col">
			<strong>판매업자 소개 프로필</strong>
<%
	for (SellerInfo info : sellerInfoList) {
%>
			<div class="list-group">
				<a href="#"
					class="list-group-item list-group-item-action d-flex gap-3 py-3"
					aria-current="true">
					<div class="d-flex gap-2 w-100 justify-content-between">
						<div style="text-align: left">
							<h6 class="mb-0"><%=info.getNickname()%></h6>
							<p class="mb-0 opacity-75">
								소개 :<%=info.getMemo().length() > 20 ? info.getMemo().substring(0, 19) + "..." : info.getMemo()%></p>
							<p class="mb-0 opacity-75">
								근무 직원 :
								<%=info.getHireEmployeeCnt()%>
								명
							</p>
						</div>
					</div>
				</a>
			<br>
			</div>
<%
	}
%>
		</div>
		<!-- 판매업자 소개 프로필 -->
	 <div class="col-md-1"></div>
	</div>



	<%@include file="/include/footer.jsp"%>
</body>
</html>