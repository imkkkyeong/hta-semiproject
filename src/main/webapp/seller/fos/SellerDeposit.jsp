
<%@page import="dto.Pagination"%>
<%@page import="utils.NumberUtils"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="utils.DateUtils"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="dto.SellerDepositDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.LoginUser"%>
<%@page import="java.util.Map"%>
<%@page import="dao.SellerDepositDao"%>
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
	
	//날짜로 조회
	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
	
	if(startDate == null || startDate == ""){
		startDate = "2000-01-01";
	}
	if(endDate == null){
		LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        endDate = currentDate.format(formatter);
	}
	
	//페이지네이션
	Map<String, Object> param1 = new HashMap<>();
	param1.put("sellerNo", loginUser.getNo());
	param1.put("startDate", startDate);
	param1.put("endDate", endDate);
	
	int currentPage = NumberUtils.toInt(request.getParameter("page"), 1);
	int rows = 10;
	SellerDepositDao sellerDepositDao = new SellerDepositDao();
	int totalRows = sellerDepositDao.getSellerDepositsRows(param1);
	
	Pagination pagination = new Pagination(currentPage, totalRows, rows);
	
	Map<String, Object> param2 = new HashMap<>();
	param2.put("sellerNo", loginUser.getNo());
	param2.put("startDate", startDate);
	param2.put("endDate", endDate);
	param2.put("begin", pagination.getBegin());
	param2.put("end", pagination.getEnd());
	
	//총 금액
	List<SellerDepositDto> sellerDepositList = sellerDepositDao.getSellerDeposits(param2);
	int totalAmount = 0;
	for(SellerDepositDto sellerDeposit : sellerDepositList){
		totalAmount += sellerDeposit.getSellerEstimateAmount();
	}
	

%>
<div class="container">
	<div class="row">
		<div class="col-12">
			<h3 class="fw-bold mt-3">정산 내역</h3><br>
			<div class="alert alert-secondary d-flex justify-content-between" role="alert">
				 <div class="mb-2 ms-3">이사날짜 : <span class="fw-bold"><%="2000-01-01".equals(startDate) ? "" : startDate %> ~ <%=endDate %></span></div>
				 <div class="me-3">총 정산 금액 : <span class="fw-bold"><%=totalAmount %></span>원</div>
			</div>
			<div>
				<div class="ms-3 mb-5">
					<form method="post" action="SellerDeposit.jsp" onsubmit="checkDate(event)">
						<span>조회기간</span>
						<input type="date" name="startDate" value=<%="2000-01-01".equals(startDate) ? "" : startDate %>><span>&nbsp;~</span>
						<input type="date" name="endDate" value=<%=endDate %>>
						<button type="submit" class="btn btn-outline-secondary" style="height: 30px; font-size: 12px;">조회</button>
					</form>
				</div>
			</div>
			<div class="d-flex justify-content-between">
				<h5 class="mb-4">총 <%=totalRows %>개</h5>
			</div>
			<table class="table">
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="15%">
					<col width="15%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>견적 번호</th>
						<th>고객 이름</th>
						<th>결제 금액</th>
						<th>수수료</th>
						<th>공제 금액</th>
						<th>실 지급액</th>
						<th>이사 날짜</th>
						<th>정산 예정일</th>
						<th>정산 완료일</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
<%
	for(SellerDepositDto sellerDeposit : sellerDepositList){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(sellerDeposit.getUserEstimateMovingDate());
        calendar.add(Calendar.DATE, 7);
        Date expectedDate = calendar.getTime();
%>
					<tr>
						<td><%=sellerDeposit.getSellerEstimateNo() %></td>
						<td><%=sellerDeposit.getUserName() %></td>
						<td><%=sellerDeposit.getSellerEstimateAmount() %>원</td>
						<td><%=sellerDeposit.getSellerEstimateAmount() * 0.06 %>원</td>
						<td><%=sellerDeposit.getSellerEstimateAmount() * 0.05 %>원</td>
						<td><%=sellerDeposit.getSellerEstimateAmount() * 0.89 %>원</td>
						<td><%=DateUtils.toText(sellerDeposit.getUserEstimateMovingDate()) %></td>
						<td><%=DateUtils.toText(expectedDate) %></td>
						<td>...</td>
					</tr>
<%
	}
%>
				</tbody>
			</table>

<%
	if (pagination.getTotalRows() > 0) {
		int beginPage = pagination.getBeginPage();
		int endPage = pagination.getEndPage();
		
		boolean isFirst = pagination.isFirst();
		boolean isLast = pagination.isLast();
%>
			<nav>
			  <ul class="pagination justify-content-center">
<%
		if(isFirst){
%>
			    <li class="page-item"><a class="page-link disabled">이전</a></li>
<%
		} else {
%>
				<li class="page-item"><a class="page-link" href="SellerDeposit.jsp?page=<%=currentPage - 1 %>">이전</a></li>
<%
		}
%>

<%
		for (int num = beginPage; num <= endPage; num++) {
%>
			    <li class="page-item <%=currentPage == num ? "active" : ""%>">
			    	<a class="page-link" href="SellerDeposit.jsp?page=<%=num%>"><%=num %></a>
			    </li>
<%
	}
%>

<%
		if (isLast) {
%>			    
			    <li class="page-item"><a class="page-link disabled">다음</a></li>
<%
		} else {
%>
				 <li class="page-item"><a class="page-link" href="SellerDeposit.jsp?page=<%=currentPage + 1 %>">다음</a></li>
<%
		}
	}
%>
			  </ul>
			</nav>
		</div>
	</div>
</div>
<script>
	function checkDate(event){
		if(startDate == null || endDate == null){
			event.preventDefault();
			alert("날짜는 필수입력값입니다");
			
			return;
		}
	}
</script>
<jsp:include page="/include/footer.jsp">
	<jsp:param value="SellerRegisterFormFooter" name="footer"/>
</jsp:include>
</body>
</html>