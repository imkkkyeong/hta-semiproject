<%@page import="utils.DateUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dto.LoginUser"%>
<%@page import="dto.SellerEstimateStatusDto"%>
<%@page import="java.util.List"%>
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
<style>
	#ul {
	  list-style-type: none;
	}
    /* 이모지를 크게 표시하기 위한 스타일 */
    .emoji-large {
      font-size: 3em; /* 원하는 크기로 조절하세요 */
    }
    .card {
      width: 500px; /* 원하는 크기로 조절하세요 */
      max-height: 450px;
    }
    
    .list-group-item.active {
	  background-color: #888; /* 회색 배경색으로 변경 */
	  border-color: #888; /* 테두리 색상을 회색으로 변경 */
	  color: #fff; /* 텍스트 색상을 검정색으로 변경 */
	}
</style>
<title>bootstrap</title>
</head>
<body>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="profileRegisterCompleted" name="bar"/>
</jsp:include>

<%
	LoginUser loginUser = (LoginUser)session.getAttribute("LOGIN_USER");
	if(loginUser == null){
		response.sendRedirect("/seller/comm/SellerLoginForm.jsp");
		return;
	} 
	
	int statusNo;
	if(request.getParameter("statusNo") == null){
		statusNo = 100000;
	}
	else{
		statusNo = Integer.valueOf(request.getParameter("statusNo"));
	}
	
	Map<String, Integer> param = new HashMap<>();
	param.put("sellerNo", loginUser.getNo());
	param.put("statusNo", statusNo);
	
	SellerEstimateDao sellerEstimateDao = new SellerEstimateDao();
	List<SellerEstimateStatusDto> sellerEstimateStatusDtoList = sellerEstimateDao.getSellerEstimatesByStatus(param);
%>
<div class="container">
	<div class="row">
		<h3 class="fw-bold mt-3 mb-5">내 견적 현황</h3><br>
	</div>
	<div class="row">
	  <div class="col-2">
	    <div id="list-example" class="list-group mt-3">
	      <a class="list-group-item list-group-item-action <%=statusNo == 100000 ? "active" : "" %>" href="SellerEstimateStatus.jsp?statusNo=100000">응찰</a>
	      <a class="list-group-item list-group-item-action <%=statusNo == 100001 ? "active" : "" %>" href="SellerEstimateStatus.jsp?statusNo=100001">낙찰</a>
	      <a class="list-group-item list-group-item-action <%=statusNo == 100002 ? "active" : "" %>" href="SellerEstimateStatus.jsp?statusNo=100002">완료</a>
	    </div>
	  </div>  
	  
	  <div class="col-10">
		<div class="row row-cols-1 row-cols-md-2 g-3 mt-3">
<%
	for(SellerEstimateStatusDto sellerEstimateStatusDto : sellerEstimateStatusDtoList){
%>
			<div class="col">
			    <div class="card p-3">
			    	<div class="row align-items-center">
				    	<div class="col-5">
							<img src="\resources\images\comm\default.jpg" class="card-img-top" alt="대표 이미지" style="widows: auto; height: auto;">
			            </div>
				     	<div class="col-7">
						      <div class="card-body">
						      	<p class="float-right" style="font-size: 12px; color: grey;">
						      	<%=statusNo == 100002 ? "이사 완료일: " + DateUtils.toText(sellerEstimateStatusDto.getUserEstimateMovingDate()) :
						      		"이사 예정일: " + DateUtils.toText(sellerEstimateStatusDto.getUserEstimateMovingDate()) %></p>
						        <h5 class="card-title fw-bold"><%=sellerEstimateStatusDto.getUserName() %></h5>
						        <p class="card-text mb-0"><%=statusNo == 100002 ? "" : "예상 금액 : " %></p>
						        <p class="card-text mb-2"><%=statusNo == 100000 ? "응찰 금액: " + sellerEstimateStatusDto.getSellerEstimateAmount() :
						        	"낙찰 금액 : " + sellerEstimateStatusDto.getSellerEstimateAmount() %></p>
						        <a href="<%=statusNo == 100000 ? "SellerEstimateModifyForm.jsp?userEstimateNo=" + sellerEstimateStatusDto.getUserEstimateNo() + "&sellerEstimateNo=" + sellerEstimateStatusDto.getSellerEstimateNo() : 
						        	"SellerEstimateDetail.jsp?userEstimateNo=" + sellerEstimateStatusDto.getUserEstimateNo() + "&sellerEstimateNo=" + sellerEstimateStatusDto.getSellerEstimateNo()%>"
						            class="btn btn-outline-secondary mt-2"><%=statusNo == 100000 ? "견적 수정하기" : "상세보기" %></a>
<%
		if(statusNo == 100002){ 
%>
						       <a href="DeleteSellerEstimate.jsp?sellerEstimateNo=<%=sellerEstimateStatusDto.getSellerEstimateNo() %>" class="btn btn-outline-danger mt-2">목록에서 삭제하기</a> 
<%
		}
%>
						      </div>
						</div>
					</div>
			   </div>
			</div>
<%
	}
%>						
		</div>
	  </div>
  </div>
</div>         
<jsp:include page="/include/footer.jsp">
	<jsp:param value="SellerRegisterFormFooter" name="footer"/>
</jsp:include>
</body>
</html>