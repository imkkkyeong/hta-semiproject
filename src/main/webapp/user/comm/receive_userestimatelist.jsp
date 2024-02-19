<%@page import="java.util.List"%>
<%@page import="vo.SellerEstimate"%>
<%@page import="dao.SellerEstimateDao"%>
<%@page import="dto.LoginUser"%>
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
<title>받은 견적 요청</title>
</head>
<body>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="receive_estimatelist" name="bar"/>
</jsp:include>
	<!-- 요청 URL 
			localhost/user/comm/receive_userestimatelist.jsp -->
	<%
		LoginUser loginUser = (LoginUser)session.getAttribute("LOGIN_USER");
	
		if(loginUser == null){
			response.sendRedirect("/user/comm/loginform.jsp?error=deny");
			return ;
		}
		
		int userNo = loginUser.getNo();
			
		SellerEstimateDao sellerEstimateDao = new SellerEstimateDao();
		List<SellerEstimate> sellerEstimates= sellerEstimateDao.getSellerEstimateList(userNo);
	%>
	
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h1 class="mb-3">받은 견적 요청 리스트</h1>
				 <div class="bd-example-snippet bd-code-snippet"><div class="bd-example m-0 border-0">
        			<table class="table table-hover">
        			
         				 <thead>
				          <tr>
				            <th scope="col" class="col-1">내가 신청한 견적번호</th>
				            <th scope="col" class="col-1">총 비용</th>
				            <th scope="col" class="col-8">메모</th>
				            <th scope="col" class="col-2">견적 보낸 날짜</th>
				          </tr>
				          </thead>
				          
				          <tbody>
				          <%
				          	for(SellerEstimate s : sellerEstimates){
				          %>
				          <tr>
				          	<th scope="row"><%=s.getUserEstimate().getNo() %></th>
				            <td><%=s.getAmount() %></td>
				            <td><%=s.getContent() %></td>
				            <td><%=s.getRegDate() %></td>
				          </tr>
						<%
				          	}
						%>				          		
				           
				          </tbody>
				        </table>
				        </div></div>
			</div><!-- col -->
		</div>
	</div>
<%@include file = "/include/footer.jsp" %>  

</body>
</html>