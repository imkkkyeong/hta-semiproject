<%@page import="vo.SellerReadEstimate"%>
<%@page import="dto.LoginUser"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="vo.UserEstimateObject"%>
<%@page import="java.util.List"%>
<%@page import="utils.DateUtils"%>
<%@page import="vo.UserEstimate"%>
<%@page import="dao.SellerEstimateDao"%>
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
<title>bootstrap</title>
<style>
    /* 부트스트랩의 컬럼을 감싸는 커스텀 클래스 생성 */
    .scrollable-column {
      /* 스크롤 적용을 위한 높이 지정 */
      height: 100vh;
      /* 필요한 경우, 추가적인 스타일링을 수행할 수 있습니다. */
      overflow-y: auto;
    }
</style>
</head>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="" name="menu"/>
</jsp:include>
<body>
<%
	LoginUser loginUser = (LoginUser)session.getAttribute("LOGIN_USER");
	
	int userEstimateNo = Integer.valueOf(request.getParameter("userEstimateNo"));	

	SellerEstimateDao sellerEstimateDao = new SellerEstimateDao();
	
	//SellerUserEstimate.jsp에서 읽은 유저 견적폼을 읽은 상태로 insert
	SellerReadEstimate sellerReadEstimate = sellerEstimateDao.getSellerNoByUserEstimateNo(userEstimateNo);
	if(sellerReadEstimate == null){
		Map<String, Integer> param = new HashMap<>();
		param.put("userEstimateNo", userEstimateNo);
		param.put("sellerNo", loginUser.getNo());
		System.out.println(param);
		sellerEstimateDao.insertSellerReadEstimate(param);
	}
	
	//유저 견적폼 불러오기
	UserEstimate userEstimate = sellerEstimateDao.getUserEstimateByNo(userEstimateNo);
	List<UserEstimateObject> objectList = sellerEstimateDao.getObjectsByNo(userEstimateNo);
%>
<div class="container-fluid">
	<div class="row">
		<div class="col-1"></div>
		
		<div class="col-3 scrollable-column">
			<div class="card p-3 mt-5">
	            <div class="row align-items-center">
	                <div class="col-4">
	                    <img src="\resources\images\comm\default.jpg" class="card-img-top" alt="...">
	                 </div>
	                 <div class="col-8">
	                 	<div>
		                    <div>
		                      <h5 class="card-title"><%=userEstimate.getUsers().getName() %></h5>
		                      <p class="card-text mb-0"><%=userEstimate.getBuildingType().getName() %></p>
		                      <p class="card-text"><%=userEstimate.getUsers().getAddress() %></p>
		                    </div>
	                    </div>
	               	</div>
	            </div>
         	</div>
         	
         	<div class="mt-5">
         		<div class="mt-5">
         			<div>건물 종류를 선택해주세요</div>
         			<div class="fw-bold"><%=userEstimate.getBuildingType().getName() %></div>
         		</div>
         		<div class="mt-5">
         			<div>어떤 서비스를 원하시나요?</div>
         			<div class="fw-bold"><%=userEstimate.getMovingType().getName() %></div>
         		</div>
         		<div class="mt-5">
         			<div>이사 예정일을 선택해주세요</div>
         			<div class="fw-bold"><%=DateUtils.toText(userEstimate.getMovingDate()) %></div>
         		</div>
         		<div class="mt-5">
         			<div>옮길 가전을 선택해주세요</div>
<%
	for(UserEstimateObject object : objectList){
%>
				<span class="fw-bold"><%=object.getObject().getName() %></span>
				<span class="fw-bold"><%=object.getObjectAmount() %>개</span><br>
<%
	}
%>
         		</div>
         		<div class="mt-5">
         			<div>출발지를 선택해주세요</div>
         			<div class="fw-bold"><%=userEstimate.getMovingFromAddress() %></div>
         		</div>
         		<div class="mt-5">
         			<div>출발지 층수를 선택해주세요</div>
         			<div class="fw-bold"><%=userEstimate.getFloors() %>층</div>
         		</div>
         		<div class="mt-5">
         			<div>방 개수를 선택해주세요</div>
         			<div class="fw-bold"><%=userEstimate.getRooms() %>개</div>
         		</div>
         		<div class="mt-5">
         			<div>방 크기를 선택해주세요</div>
         			<div class="fw-bold"><%=userEstimate.getSquareFootage() %>평</div>
         		</div>
         		<div class="mt-5">
         			<div>도착지를 선택해주세요</div>
         			<div class="fw-bold"><%=userEstimate.getMovingToAddress() %></div>
         		</div>
         		<div class="mt-5">
         			<div>엘리베이터 유무를 선택해주세요</div>
         			<div class="fw-bold"><%=userEstimate.getElevatorYn() %></div>
         		</div>
         	</div>
         	
		</div>
		
		<div class="col-1"></div>
		
		<div class="col-6">
			<h3 class="fw-bold mt-5">판매자 견적 보내기</h3>
			
			<form method="post" action="InsertSellerEstimate" onsubmit="checkEstimateForm(event)" enctype="multipart/form-data">
				<input type="hidden" name="userEstimateNo" value=<%=userEstimateNo %>>
				<div class="row mt-5">
		         	<h5 class="fw-bold">금액 설정</h5>
		        	<div class="form-group mb-3">				
	
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="amountSetting" id="total" value="총비용"checked>
						  <label class="form-check-label" for="total">
						    총 비용
						  </label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="amountSetting" id="forTime" value="시간당">
						  <label class="form-check-label" for="forTime">
						    시간 당
						  </label>
						</div>
					</div>
		    	 </div>
		    	 
		    	 <div class="row mt-5">
		         	<h5 class="fw-bold">금액</h5>
		         	<div class="input-group mb-3">
					  <span class="input-group-text">금액</span>
					  <input type="text" class="form-control" name="amount" onkeyup="checkAmount(event)" aria-label="Amount (to the nearest dollar)">
					  <span class="input-group-text">원</span>
					</div>
					<div id="amount-feedback" class="form-text"></div>
		         </div>
		         
		         <div class="row mt-5">
		         	<h5 class="fw-bold">견적 설명</h5>
					<input type="text" class="form-control" name="content" />
		         </div>
		         
		         <div class="row mt-5">
		         	<h5 class="fw-bold">파일 첨부</h5>
		         		<input type="file" class="form-control" name="upfile"><br>
		         		<input type="file" class="form-control" name="upfile"><br>
		         		<input type="file" class="form-control" name="upfile"><br>
		         </div>
		         
		         <div class="row mt-5">
		         	<button class="btn btn-secondary" type="submit" style="height: 50px;">견적 보내기</button>
		         </div>
	         </form>
		</div>
		
		<div class="col-1"></div>
		
	</div>
</div>
<script>
	function checkAmount(event){
		let amountRegExp = /^[0-9]+$/;
		
		let feedbackDiv = document.getElementById("amount-feedback")
		let amountInput = document.querySelector("input[name=amount]");
		let amount = amountInput.value;
		
		if (!amountRegExp.test(amount)){ 
			feedbackDiv.textContent = "금액은 숫자여야합니다";
			feedbackDiv.classList.remove('text-success');
			feedbackDiv.classList.add('text-danger');
			return;
		}
		else if (amountRegExp.test(amount)){ 
			feedbackDiv.textContent = "";
			feedbackDiv.classList.remove('text-danger');
			return;
		}
		
	}
	
	function checkEstimateForm(event){
		let amountRegExp = /^[0-9]+$/;
		
		let amountInput = document.querySelector("input[name=amount]");
		let amount = amountInput.value;
		
		if(amount === "") {
			event.preventDefault();
			alert("금액은 필수입력값입니다");
			amountInput.focus();
			
			return;
		}
		
		if (!amountRegExp.test(amount)){
			event.preventDefault();
			alert("금액은 숫자여야합니다");
			amountInput.focus();
			
			return;
		}
	}
</script>
</body>
</html>