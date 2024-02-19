<%@page import="dto.LoginUser"%>
<%@page import="dao.UserEstimateDao"%>
<%@page import="vo.UserEstimate"%>
<%@page import="java.util.List"%>
<%@page import="vo.MainObjectCategory"%>
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
<link href="/resources/CSS/fos/list-groups.css" rel="stylesheet">
<style>

      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        width: 100%;
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }

      .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: var(--bd-violet-bg);
        --bs-btn-border-color: var(--bd-violet-bg);
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-hover-border-color: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
        --bs-btn-active-border-color: #5a23c8;
      }
      .bd-mode-toggle {
        z-index: 1500;
      }
</style>

<title>유저 견적신청</title>
</head>
<body>
<!-- 요청 URL : localhost/user/fos/estimateform.jsp  -->

<jsp:include page="/include/navbar.jsp">
	<jsp:param value="estimate" name="menu"/>
</jsp:include>


<%
	// 세션에 있는 로그인 유저 정보값을 갖고와서 정보값이 없으면 다시 로그인 페이지로 이동시킨다
	LoginUser loginUser = (LoginUser)session.getAttribute("LOGIN_USER");
	if(loginUser == null){
		response.sendRedirect("/user/comm/loginform.jsp?error=deny");
		return;
	}
%>
<div class="container bg-secondary-subtle">
	<div class="row">
		<div class="col-12">
		
		<form method="post" action="estimate.jsp" onsubmit="successEstimate()">
		
		<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-5 align-items-center justify-content-center">
			  <div class="list-group list-group-radio d-grid gap-2 border-0 bg-body p-3">
			  
			  <!-- 어떤 종류의 이사 -->
			  
			  <div class="position-relative">
			  	<span><label class="mb-2"><strong>어떤 종류의 이사인가요</strong></label></span><br />
			  </div>
			  
			  <div class="position-relative">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="moveType" id="moveType1" value="1">
			      <label class="list-group-item py-2 pe-5" for="moveType1">
			        <strong class="fw-semibold">포장 이사</strong>
			        <span class="d-block small opacity-75">모든 짐 포장, 운반, 정리를 도와드리는 서비스</span>
			      </label>
			    </div>
				
				<div class="position-relative">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="moveType" id="moveType2" value="2">
			      <label class="list-group-item py-2 pe-5" for="moveType2">
			        <strong class="fw-semibold">반포장 이사</strong>
			        <span class="d-block small opacity-75">큰 짐 포장, 운반, 배치를 도와드리는 서비스</span>
			      </label>
			    </div>
			    
			    
			    <div class="position-relative mb-4">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="moveType" id="moveType3" value="3">
			      <label class="list-group-item py-2 pe-5" for="moveType3">
			        <strong class="fw-semibold small">일반 이사</strong>
			        <span class="d-block small opacity-75">짐 운송만 도와드리는 서비스</span>
			      </label>
			    </div>
			    <!-- 어떤 종류의 이사 -->
			    
			    <!-- 빌딩종류(건물종류) -->
			    <div class="position-relative">
			  		<span><label class="mb-2"><strong>이사가는 건물의 종류는 무엇인가요</strong></label></span><br />
			  	</div>
			  	
			  	<div class="position-relative">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="buildType" id="buildType1" value="1">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="buildType1">
			        <strong class="fw-semibold">아파트</strong>
			      </label>
			    </div>
			    
			    <div class="position-relative">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="buildType" id="buildType2" value="2">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="buildType2">
			        <strong class="fw-semibold">오피스텔</strong>
			      </label>
			    </div>
			    
			    <div class="position-relative">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="buildType" id="buildType3" value="3">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="buildType3">
			        <strong class="fw-semibold">빌라/연립</strong>
			      </label>
			    </div>
			    
			    <div class="position-relative">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="buildType" id="buildType4" value="4">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="buildType4">
			        <strong class="fw-semibold">주택</strong>
			      </label>
			    </div>
			    
			    <div class="position-relative mb-4">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="buildType" id="buildType5" value="5">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="buildType5">
			        <strong class="fw-semibold">상가/사무실</strong>
			      </label>
			    </div>
			    <!-- 빌딩종류(건물종류) -->
			    
			    <!-- 방 평수 -->
					<div class="position-relative">
			  			<span><label class="mb-2"><strong>이사가는 건물의 방 평수는 무엇인가요</strong></label></span><br />
			  		</div>
			  		
			  		<div class="position-relative">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="roomType" id="roomType1" value="1">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="roomType1">
			        <strong class="fw-semibold">10평이하</strong>
			      </label>
			    </div>
			    
			    <div class="position-relative">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="roomType" id="roomType2" value="2">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="roomType2">
			        <strong class="fw-semibold">10~15</strong>
			      </label>
			    </div>
			    
			    <div class="position-relative">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="roomType" id="roomType3" value="3">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="roomType3">
			        <strong class="fw-semibold">15~20</strong>
			      </label>
			    </div>
			    
			    <div class="position-relative">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="roomType" id="roomType4" value="4">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="roomType4">
			        <strong class="fw-semibold">20~25</strong>
			      </label>
			    </div>
			    
			     <div class="position-relative">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="roomType" id="roomType5" value="5">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="roomType5">
			        <strong class="fw-semibold">25~30</strong>
			      </label>
			    </div>
			    
			     <div class="position-relative">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="roomType" id="roomType6" value="6">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="roomType6">
			        <strong class="fw-semibold">30~40</strong>
			      </label>
			    </div>
			    
			     <div class="position-relative">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="roomType" id="roomType7" value="7">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="roomType7">
			        <strong class="fw-semibold">40~50</strong>
			      </label>
			    </div>
			    
			    <div class="position-relative mb-4">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="roomType" id="roomType8" value="8">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="roomType8">
			        <strong class="fw-semibold">50평 이상</strong>
			      </label>
			    </div>
			    <!-- 방 평수 -->
			    
			    <!-- 방 개수 -->
					<div class="position-relative">
			  			<span><label class="mb-2"><strong>이사가는 건물의 방 개수는 무엇인가요</strong></label></span><br />
			  		</div>
			  		
			  	<div class="position-relative">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="roomCount" id="roomCount1" value="1">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="roomCount1">
			        <strong class="fw-semibold">원룸</strong>
			      </label>
			    </div>
			    
			    <div class="position-relative">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="roomCount" id="roomCount2" value="2">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="roomCount2">
			        <strong class="fw-semibold">1.5룸</strong>
			      </label>
			    </div>
			    
			    <div class="position-relative">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="roomCount" id="roomCount3" value="3">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="roomCount3">
			        <strong class="fw-semibold">2룸</strong>
			      </label>
			    </div>
			    
			    <div class="position-relative">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="roomCount" id="roomCount4" value="4">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="roomCount4">
			        <strong class="fw-semibold">3룸</strong>
			      </label>
			    </div>
			    
			     <div class="position-relative">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="roomCount" id="roomCount5" value="5">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="roomCount5">
			        <strong class="fw-semibold">4룸</strong>
			      </label>
			    </div>

			    <div class="position-relative mb-4">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="roomCount" id="roomCount6" value="6">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="roomCount6">
			        <strong class="fw-semibold">5룸 이상</strong>
			      </label>
			    </div>
			    <!-- 방 개수 -->
			    
			    
			    <!-- 층 수 -->
			    <div class="position-relative">
			  		<span><label class="mb-2"><strong>이사가는 건물의 층 수는 무엇인가요</strong></label></span><br />
			  	</div>
			  
			  <div class="position-relative">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="floorCount" id="floorCount1" value="1">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="floorCount1">
			        <strong class="fw-semibold">반지하</strong>
			      </label>
			    </div>
			    
			     <div class="position-relative">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="floorCount" id="floorCount2" value="2">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="floorCount2">
			        <strong class="fw-semibold">1층</strong>
			      </label>
			    </div>

			    <div class="position-relative mb-4">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="floorCount" id="floorCount3" value="3">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="floorCount3">
			        <strong class="fw-semibold">2층 이상</strong>
			      </label>
			    </div>
			  <!-- 층 수 -->
			  
			  <!-- 엘리베이터 유무 -->
			    <div class="position-relative">
			  		<span><label class="mb-2"><strong>이사가는 건물의 엘리베이터가 있나요</strong></label></span><br />
			  	</div>
			  	
			  	<div class="position-relative">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="elevatorYn" id="elevatorYn1" value="Y">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="elevatorYn1">
			        <strong class="fw-semibold">있음</strong>
			      </label>
			    </div>

			    <div class="position-relative mb-4">
			      <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="elevatorYn" id="elevatorYn2" value="N">
			      <label class="list-group-item py-2 pe-5 form-check-label" for="elevatorYn2">
			        <strong class="fw-semibold">없음</strong>
			      </label>
			    </div>
			  	<!-- 엘리베이터 유무 -->
			  
			  <!-- 주요 물품 -->
				<div class="position-relative">
			  		<span><label class="mb-2"><strong>주요 물품</strong></label></span><br />
			  	</div>
			  	<%	
			  		UserEstimateDao userEstimateDao = new UserEstimateDao();
			    	List<MainObjectCategory> mainObject = userEstimateDao.getMainObjectCategories();
			  		
			  	%>
			    		
			    
			  	 <div class="position-relative list-group-item">
			      <span><%=mainObject.get(0).getName() %></span>
			      <span class="count">
			      	<button onclick="minus_bed()" type="button" class="btn btn-outline-secondary">-</button>
			      	<input type="hidden" name="objNo" value="1" class="col-sm-1"/>
			      	<input type="number" id="result_bed" name="objAmount" value="0" class="col-sm-1"/>
			      	<button onclick="plus_bed()" type="button" class="btn btn-outline-secondary">+</button>
			      </span>
			    </div>
			    
			    <div class="position-relative list-group-item">
			      <span><%=mainObject.get(1).getName() %></span>
			      <span class="count">
			      <button onclick="minus_tv()" type="button" class="btn btn-outline-secondary">-</button>
			      	<input type="hidden" name="objNo" value="2" class="col-sm-1"/>
			      	<input type="number" id="result_tv" name="objAmount" value="0" class="col-sm-1"/>
			      	<button onclick="plus_tv()" type="button" class="btn btn-outline-secondary">+</button>
			      </span>
			    </div>
			    
			    <div class="position-relative list-group-item">
			      <span><%=mainObject.get(2).getName() %></span>
			      <span class="count">
			      <button onclick="minus_sofa()" type="button" class="btn btn-outline-secondary">-</button>
			      	<input type="hidden" name="objNo" value="3" class="col-sm-1"/>
			      <input type="number" id="result_sofa" name="objAmount" value="0" class="col-sm-1"/>
			      	<button onclick="plus_sofa()" type="button" class="btn btn-outline-secondary">+</button>
			      </span>
			    </div>
			    
			    <div class="position-relative list-group-item">
			      <span><%=mainObject.get(3).getName() %></span>
			      <span class="count">
			      <button onclick="minus_stoneBed()" type="button" class="btn btn-outline-secondary">-</button>
			      	<input type="hidden" name="objNo" value="4" class="col-sm-1"/>
			      	<input type="number" id="result_stoneBed" name="objAmount" value="0" class="col-sm-1" />
			      	<button onclick="plus_stoneBed()" type="button" class="btn btn-outline-secondary">+</button>
			      </span>
			    </div>
			    
			    <div class="position-relative list-group-item">
			      <span><%=mainObject.get(4).getName() %></span>
			      <span class="count">
			      <button onclick="minus_computer()" type="button" class="btn btn-outline-secondary">-</button>
			      	<input type="hidden" name="objNo" value="5" class="col-sm-1"/>
			      	<input type="number" id="result_computer" name="objAmount" value="0" class="col-sm-1" />
			      	<button onclick="plus_computer()" type="button" class="btn btn-outline-secondary">+</button>
			      </span>
			    </div>
			    
			    <div class="position-relative list-group-item">
			      <span><%=mainObject.get(5).getName() %></span>
			      <span class="count">
			      <button onclick="minus_stylier()" type="button" class="btn btn-outline-secondary">-</button>
			      	<input type="hidden" name="objNo" value="6" class="col-sm-1"/>
			      	<input type="number" id="result_stylier" name="objAmount" value="0" class="col-sm-1" />
			      	<button onclick="plus_stylier()" type="button" class="btn btn-outline-secondary">+</button>
			      </span>
			    </div>
			    
			    <div class="position-relative list-group-item">
			      <span><%=mainObject.get(6).getName() %></span>
			      <span class="count">
			      <button onclick="minus_aircon()" type="button" class="btn btn-outline-secondary">-</button>
			      	<input type="hidden" name="objNo" value="7" class="col-sm-1"/>
			      	<input type="number" id="result_aircon" name="objAmount" value="0" class="col-sm-1" />
			      	<button onclick="plus_aircon()" type="button" class="btn btn-outline-secondary">+</button>
			      </span>
			    </div>
			    
			    <div class="position-relative list-group-item mb-4">
			      <span><%=mainObject.get(7).getName() %></span>
			      <span class="count">
			      <button onclick="minus_closet()" type="button" class="btn btn-outline-secondary">-</button>
			      	<input type="hidden" name="objNo" value="8" class="col-sm-1"/>
			      	<input type="number" id="result_closet" name="objAmount" value="0" class="col-sm-1" />
			      	<button onclick="plus_closet()" type="button" class="btn btn-outline-secondary">+</button>
			      </span>
			    </div>
			    
			    <div class="position-relative list-group-item mb-4">
			      <span><%=mainObject.get(8).getName() %></span>
			      <span class="count">
			      <button onclick="minus_masage()" type="button" class="btn btn-outline-secondary">-</button>
			      	<input type="hidden" name="objNo" value="9" class="col-sm-1"/>
			      	<input type="number" id="result_masage" name="objAmount" value="0" class="col-sm-1" />
			      	<button onclick="plus_masage()" type="button" class="btn btn-outline-secondary">+</button>
			      </span>
			    </div>
			    
			    <div class="position-relative list-group-item mb-4">
			      <span><%=mainObject.get(9).getName() %></span>
			      <span class="count">
			      <button onclick="minus_homeTheather()" type="button" class="btn btn-outline-secondary">-</button>
			      	<input type="hidden" name="objNo" value="10" class="col-sm-1"/>
			      	<input type="number" id="result_homeTheather" name="objAmount" value="0" class="col-sm-1" />
			      	<button onclick="plus_homeTheather()" type="button" class="btn btn-outline-secondary">+</button>
			      </span>
			    </div>
  
			  <!-- 주요 물품 -->
			  
			  <!-- 특이 사항 -->
				<div class="position-relative">
			  		<span><label class="mb-2"><strong>특이사항</strong></label></span><br />
			  	</div>
			  	
			  	<textarea name="memo" cols="10" rows="5"></textarea>
			  <!-- 특이 사항 -->
			  
			  
			  <!-- 이사예정일 -->
			    <div class="position-relative mb-4">
			    	<span><label class="mb-2"><strong>이사예정일</strong></label></span><br />
					<input type="date" name="movingDate">
				</div>
				
				<div class="position-relative mb-4">
					<span><label class="mb-2"><strong>출발지주소</strong></label></span><br />
			    	<input type="text" id="sample6_postcode" placeholder="우편번호" name="fromZipCode">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-outline-primary"><br>
					<input type="text" id="sample6_address" placeholder="주소" name="fromAddress"><br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="fromDetailed">
					<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="fromBname">

					<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

				</div>
				
				
				<div class="position-relative mb-4">
					<span><label class="mb-2"><strong>도착지주소</strong></label></span><br />
			    	<input type="text" id="sample7_postcode" placeholder="우편번호" name="toZipCode">
					<input type="button" onclick="sample7_execDaumPostcode()" value="우편번호 찾기" class="btn btn-outline-primary"><br>
					<input type="text" id="sample7_address" placeholder="주소" name="toAddress"><br>
					<input type="text" id="sample7_detailAddress" placeholder="상세주소" name="toDetailed">
					<input type="text" id="sample7_extraAddress" placeholder="참고항목" name="toBname">

					<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

				</div>
				
		        
		        <!-- 제출 버튼 -->
				<div class="position-relative mb-4">
			    	<button type="submit" class="btn btn-primary">제출</button>
			    	<a href="/index.jsp">
			    		<button type="button" class="btn btn-secondary">취소</button>
			    	</a>
				</div>
			  
			</div>
			</div>
		</form>
		
		</div><!-- col-12 -->
	</div>
</div>

<script type="text/javascript">
	let result_bed = document.getElementById("result_bed");
	let result_tv = document.getElementById("result_tv");
	let result_sofa = document.getElementById("result_sofa");
	let result_stoneBed = document.getElementById("result_stoneBed");
	let result_computer = document.getElementById("result_computer");
	let result_stylier = document.getElementById("result_stylier");
	let result_aircon = document.getElementById("result_aircon");
	let result_closet = document.getElementById("result_closet");
	let result_masage = document.getElementById("result_masage");
	let result_homeTheather = document.getElementById("result_homeTheather");
	
	let bed = 0;
	let tv = 0;
	let sofa = 0;
	let stoneBed = 0;
	let computer = 0;
	let stylier = 0;
	let aircon = 0;
	let closet = 0;
	let masage = 0;
	let homeTheather = 0;
	
	function plus_bed() {
		event.preventDefault();
		bed++;
		result_bed.value = bed;
	}
	
	function minus_bed() {
		event.preventDefault();
		if(bed===0){
			result_bed.value = 0;
		} else {
			bed--;
			result_bed.value = bed;
		}
	}
	
	function plus_tv() {
		event.preventDefault();
		tv++;
		result_tv.value = tv;
	}
	
	function minus_tv() {
		event.preventDefault();
		if(tv===0){
			result_tv.value = 0;
		} else {
			tv--;
			result_tv.value = tv;
		}
	}
	
	
	function plus_sofa() {
		event.preventDefault();
		sofa++;
		result_sofa.value = sofa;
	}
	
	function minus_sofa() {
		event.preventDefault();
		if(sofa===0){
			result_sofa.value = 0;
		} else {
			sofa--;
			result_sofa.value = sofa;
		}
	}
	
	function plus_stoneBed() {
		event.preventDefault();
		stoneBed++;
		result_stoneBed.value = stoneBed;
	}
	
	function minus_stoneBed() {
		event.preventDefault();
		if(stoneBed===0){
			result_stoneBed.value = 0;
		} else {
			stoneBed--;
			result_stoneBed.value = stoneBed;
		}
	}
	
	function plus_computer() {
		event.preventDefault();
		computer++;
		result_computer.value = computer;
	}
	
	function minus_computer() {
		event.preventDefault();
		if(computer===0){
			result_computer.value = 0;
		} else {
			computer--;
			result_computer.value = computer;
		}
	}
		
		function plus_stylier() {
			event.preventDefault();
			stylier++;
			result_stylier.value = stylier;
		}
		
		function minus_stylier() {
			event.preventDefault();
			if(stylier===0){
				result_stylier.value = 0;
			} else {
				stylier--;
				result_stylier.value = stylier;
			}
		}
		
		function plus_aircon() {
			event.preventDefault();
			aircon++;
			result_aircon.value = aircon;
		}
		
		function minus_aircon() {
			event.preventDefault();
			if(aircon===0){
				result_aircon.value = 0;
			} else {
				aircon--;
				result_aircon.value = aircon;
			}
		}
		
		function plus_closet() {
			event.preventDefault();
			closet++;
			result_closet.value = closet;
		}
		
		function minus_closet() {
			event.preventDefault();
			if(closet===0){
				result_closet.value = 0;
			} else {
				closet--;
				result_closet.value = closet;
			}
		}
		
		function plus_masage() {
			event.preventDefault();
			masage++;
			result_masage.value = masage;
		}
		
		function minus_masage() {
			event.preventDefault();
			if(masage===0){
				result_masage.value = 0;
			} else {
				masage--;
				result_masage.value = masage;
			}
		}
		
		function plus_homeTheather() {
			event.preventDefault();
			homeTheather++;
			result_homeTheather.value = homeTheather;
		}
		
		function minus_homeTheather() {
			event.preventDefault();
			if(homeTheather===0){
				result_homeTheather.value = 0;
			} else {
				homeTheather--;
				result_homeTheather.value = homeTheather;
			}
		}
		
	
	/*
			다음 주소 API
	*/
	 function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	
	
	 function sample7_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample7_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample7_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample7_postcode').value = data.zonecode;
	                document.getElementById("sample7_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample7_detailAddress").focus();
	            }
	        }).open();
	    }
	 function successEstimate() {
		 alert('견적이 성공적으로 제출되었습니다');
	 }
</script>
</body>
</html>