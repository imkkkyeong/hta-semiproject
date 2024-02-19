<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dto.Pagination"%>
<%@page import="utils.NumberUtils"%>
<%@page import="vo.MovingType"%>
<%@page import="utils.DateUtils"%>
<%@page import="java.util.List"%>
<%@page import="dao.UserEstimateDao"%>
<%@page import="vo.UserEstimate"%>
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
<%@include file ="/include/navbar.jsp" %>
    <div class="container">
     	<div class="row mb-3">
     		<div class="col-12">
     			<h1 class="mb-3">견적 요청 리스트</h1>
<%
	LoginUser loginUsers = (LoginUser) session.getAttribute("LOGIN_USER");
	
	int userNo = loginUser.getNo();
	
	UsersDao userDao = new UsersDao();	
	Users savedUser = userDao.getUserByNo(userNo);
	
	UserEstimateDao userEstimateDao = new UserEstimateDao();
	
	int currentPage = NumberUtils.toInt(request.getParameter("page"), 1);
	
	Map<String, Object> param = new HashMap<>();
	param.put("userNo", userNo);
	
	int totalRows = userEstimateDao.getTotalRows(param);
	
	
	Pagination pagination = new Pagination(currentPage, totalRows, 5);
	
	int begin = pagination.getBegin();
	int end = pagination.getEnd();
	
	param.put("begin", begin);
	param.put("end", end);
	
	List<UserEstimate> estimateList = userEstimateDao.getUserEstimates(param);
%>

<%
	if (estimateList.isEmpty()) {
%>
			<div class="border bg-white p-3 g-2 mb-3">
				<table class="table">
     				<thead>
     					<tr>
     						<th>견적번호<th>
     						<th>이사일<th>
     						<th>이사종류<th>
     						<th>출발지주소<th>
     						<th>도착지주소<th>
     						<th>등록일<th>
     					</tr>
     				</thead>
     				<tbody>
      				</tbody>
     			</table>
     			<p class="text-center">요청견적 내역이 존재하지 않습니다</p>
			</div>


<%
	} else {	
%>
			<div class="border bg-white p-3 g-2">			
     			<table class="table">
     				<thead>
     					<tr>
     						<th>견적번호<th>
     						<th>이사일<th>
     						<th>이사종류<th>
     						<th>출발지주소<th>
     						<th>도착지주소<th>
     						<th>등록일<th>
     					</tr>
     				</thead>
<%
		for (UserEstimate u : estimateList) {
%>  
     				<tbody class="table-group-divider">
     					<tr>
     						<td><%=u.getNo() %><td>
     						<td><%=DateUtils.toText(u.getMovingDate())%><td>
     						<td><%=u.getMovingType().getName() %><td>
     						<td><%=u.getMovingFromAddress() %><td>
     						<td><%=u.getMovingToAddress() %><td>
     						<td><%=DateUtils.toText(u.getRegDate())%><td>
     						
     					</tr>
     				</tbody>
<%
		}
	}
%>
     			</table>
     		
     		</div>
     		</div>
     	</div>
     </div>

<%
	int beginPage = pagination.getBeginPage();
	int endPage = pagination.getEndPage();
	
	boolean isFirst = pagination.isFirst();
	boolean isLast = pagination.isLast();
%>
	<div class="row">
		<div class="col-12">
			<nav aria-label="page navigation example">
				<ul class="pagination justify-content-center">
<%
	if (isFirst) {	
%>					
					<li class="page-item disabled"><a class="page-link">이전</a></li>
<%
	} else {
%>
					<li class="page-item">
						<a class="page-link"
						   href="userestimaterequestlistform.jsp?page=<%=currentPage -1 %>" >이전</a>
					</li>


<%
	}	
%>	

<% 
	for (int num = beginPage; num <= endPage; num++) { 
%>				
					<li class="page-item <%=currentPage == num ? "active" : "" %>">
						<a class="page-link"
						   href="userestimaterequestlistform.jsp?page=<%=num %>" ><%=num %></a>
					</li>
<%
	}
%>

<% 
	if (isLast) {
%>
					<li class="page-item disabled">
						<a class="page-link">다음</a>
					</li>
<%
	} else {
%>
					<li class="page-item">
						<a class="page-link"
						   href="userestimaterequestlistform.jsp?page=<%=currentPage + 1 %>">다음</a>
					</li>
<%
	}
%>
				</ul>
			</nav>
		
		</div>
	</div>

<%@include file = "/include/footer.jsp" %> 

</body>
</html>