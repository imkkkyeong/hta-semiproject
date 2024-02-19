<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.LoginUser"%>
<%@page import="utils.DateUtils"%>
<%@page import="java.util.List"%>
<%@page import="dao.SellerEstimateDao"%>
<%@page import="vo.UserEstimate"%>
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
</head>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="" name="menu"/>
</jsp:include>
<body>
<%
	LoginUser loginUser = (LoginUser)session.getAttribute("LOGIN_USER");
	if(loginUser == null){
		response.sendRedirect("/seller/comm/SellerLoginForm.jsp");
		return;
	}
	
	String isRead = request.getParameter("isRead");
	String isEnded = request.getParameter("isEnded");
	int sellerNo = loginUser.getNo();
	
	Map<String, Object> param = new HashMap<>();
	
	if(isRead == null){
		isRead = "all";
	}
	param.put("isRead", isRead);
	
	if(isEnded == null){
		isEnded = "all";
	}
	param.put("isEnded", isEnded);
	param.put("sellerNo", sellerNo);
	
	SellerEstimateDao sellerEstimateDao = new SellerEstimateDao();
	
	int totalRows = sellerEstimateDao.getTotalUserEstimatesRows(param);
	//int totalRows = 30;
	
	List<UserEstimate> userEstimateList = sellerEstimateDao.getUserEstimates(param);
	
%>
<div class="container">
	<div class="row mt-3 mb-3">
		<h3 class="fw-bold">받은 요청</h3><br>
	</div>
	<form id="form-filter" method="post" action="SellerUserEstimateList.jsp">
		<div class="row mb-3">
			<div class="col-12">
				<div class="d-flex justify-content-start">
					<select class="form-select me-3" name="isRead" onchange="changeRead()" style="width: 150px;">
						<option value="all" <%="all".equals(isRead) ? "selected" : "" %>> 전체 요청</option>
						<option value="read" <%="read".equals(isRead) ? "selected" : "" %>> 읽은 요청</option>
						<option value="notRead" <%="notRead".equals(isRead) ? "selected" : "" %>> 안 읽은 요청</option>
					</select>
				
					<select class="form-select" name="isEnded" onchange="changeEnded()" style="width: 150px;">
						<option value="all" <%="all".equals(isEnded) ? "selected" : "" %>> 전체 요청</option>
						<option value="ended" <%="ended".equals(isEnded) ? "selected" : "" %>> 마감된 요청</option>
						<option value="notEnded" <%="notEnded".equals(isEnded) ? "selected" : "" %>> 마감 전 요청</option>
					</select>
				</div>
			</div>
		</div>
	</form>

	<div class="row mb-3">
		<div class="col-12">
			<div class="mt-3 mb-3"><%=totalRows %>개 받은 요청</div>
				<div class="row">
<% 
	for(UserEstimate userEstimate : userEstimateList){
%>	
					<div class="col-6">
						<a href="SellerEstimateForm.jsp?userEstimateNo=<%=userEstimate.getNo() %>" style="text-decoration: none;">
							<div class="card mb-3" style="border:none;">
					            <div class="row align-items-center">
					                <div class="col-2">
					                    <img src="\resources\images\comm\default.jpg" class="card-img-top" alt="...">
					                 </div>
					                 <div class="col-10">
					                 	<div>
						                    <div>
						                      <h5 class="card-title fw-bold"><%=userEstimate.getUsers().getName()%></h5>
						                      <p class="card-text mb-0"><%=userEstimate.getBuildingType().getName()%></p>
						                      <p class="card-text"><%=userEstimate.getUsers().getAddress()%></p>
						                      <p class="card-text fs-6" style="color: grey;"><%=userEstimate.getMovingType().getName()  + ", " + DateUtils.toText(userEstimate.getMovingDate()) + ", " 
						                      + userEstimate.getFloors() + "층, 방 " + userEstimate.getRooms() + "개"%></p>
						                    </div>
					                    </div>
					               	</div>
					            </div>
					            <hr>
					        </div>
					    </a>
					</div>
<%
	}
%>
			    </div>
			<div class="col-2"></div>
		</div>
	</div>
</div>
<script>
	function changeRead(){
		let isRead = document.querySelector("select[name=isRead]").value;
		console.log(isRead);
		document.getElementById("form-filter").submit();
	}
	
	function changeEnded(){
		let isEnded = document.querySelector("select[name=isEnded]").value;
		document.getElementById("form-filter").submit();
	}
</script>
<jsp:include page="/include/footer.jsp">
	<jsp:param value="SellerRegisterFormFooter" name="footer"/>
</jsp:include>
</body>
</html>