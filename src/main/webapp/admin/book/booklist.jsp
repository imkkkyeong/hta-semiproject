<%@page import="dto.LoginUser"%>
<%@page import="dto.Pagination"%>
<%@page import="dto.admin.BookDto"%>
<%@page import="dao.admin.BookStatusDao"%>
<%@page import="dto.admin.SellerManagementDto"%>
<%@page import="vo.Seller"%>
<%@page import="dao.admin.SellerManagementDao"%>
<%@page import="vo.Users"%>
<%@page import="java.util.List"%>
<%@page import="dao.admin.UserManagementDao"%>
<%@page import="utils.DateUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="utils.NumberUtils"%>
<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initail-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>관리자::예약 관리</title>
</head>
<body>

	<jsp:include page="../../include/navbar.jsp">
		<jsp:param value="admin" name="bar"/>
	</jsp:include>
	
<div class="container-fluid ">
	<div class="row">
		<div class="col-2 ps-0">
				<jsp:include page="../sidebar.jsp">
					<jsp:param value="booklist" name="sidebar"/>
				</jsp:include>
			</div>
			<div class="col-9">
				<!-- 위쪽으로 사이드바 영역 -->
				
				
		<div class="row">
			<div class="col-12">
				<h1><strong>예약 리스트</strong></h1>
<%
	LoginUser loginUser = (LoginUser) session.getAttribute("LOGIN_USER");
	if (loginUser == null) {
		response.sendRedirect("/admin/login/loginform2.jsp");
		return;
	}
	
	int currentPage = NumberUtils.toInt(request.getParameter("page"), 1);
	int rows = NumberUtils.toInt(request.getParameter("rows"), 10);
	String sort = request.getParameter("sort");
	String fromDate = request.getParameter("from_date");
	String toDate = request.getParameter("to_date");
	String opt = request.getParameter("opt");
	String keyword = request.getParameter("keyword");
	String bookStatus = request.getParameter("bookstatus");
	
	Map<String, Object> param = new HashMap<>();
	
	param.put("sort", sort);
	
	if (fromDate != null && !fromDate.isBlank()) {		
		param.put("fromDate", fromDate);
	}
	
	if (toDate != null && !toDate.isBlank()) {
		param.put("toDate", toDate);
	}
	
	if (opt != null && !opt.isBlank()) {		
		param.put("opt", opt);
	}
	
	if (keyword != null && !keyword.isBlank()) {
		param.put("keyword", keyword);
	}
	
	if (bookStatus != null && !bookStatus.isBlank()) {
		param.put("bookStatus", bookStatus);
	}	
	
	BookStatusDao bookStatusDao= new BookStatusDao();
	
	int totalRows = bookStatusDao.getTotalRows(param);
	Pagination pagination = new Pagination(currentPage, totalRows, rows);
	param.put("begin", pagination.getBegin());
	param.put("end", pagination.getEnd());
	
	List<BookDto> bookList = bookStatusDao.getBooks(param);
%>
				<hr>
				<h2>기본검색</h2>
					<form name="form_search" id="form_search" method="get" action="">
						<input type="hidden" name="sort" value="no"/>
						
						<div class="">
						<table class="table table-bordered">
							<colgroup>
								<col width = "*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="">예약기간</th>
									<td>
										<label for="from_date" class="">시작일</label>
										<input type="date" name="from_date" value="<%=fromDate == null ? "" : fromDate %>" id="from_date" class="border" >
										<label for="to_date" class="">종료일</label>
										<input type="date" name="to_date" value="<%=toDate == null ? "" : toDate %>" id="to_date" class="border">
									</td>
								</tr>
								<tr>
									<th scope="row" class="">검색항목</th>
									<td>
										<select name="opt" class="border">
											<option value="" selected>선택하세요</option>
											<option value="no" <%="no".equals(opt) ? "selected" : "" %>>예약번호</option>
											<option value="name" <%="name".equals(opt) ? "selected" : "" %>>이름</option>
											<option value="id" <%="id".equals(opt) ? "selected" : "" %>>아이디</option>
										</select>
										<input type="text" name="keyword" value="<%=keyword == null ? "" : keyword %>" class="border" size="30">
									</td>
								</tr>
							</tbody>
						</table>
						</div>
						<div class="text-center">
							<input type="button" onclick="searchUsers();" value="검색" class="btn btn-dark">
							<input type="button" onclick="clearField();" value="초기화" class="btn btn-secondary">
						</div>
					</form>
					
					<hr>

				<div class="">
					총 <strong class=""><%=totalRows%></strong>건이 검색되었습니다.
				</div>
				
				<div class="">
					<table class="table table-bordered">
						<colgroup>
							<col width = "20%">
							<col width = "20%">
							<col width = "20%">
							<col width = "20%">
							<col width = "20%">
						</colgroup>
						<thead class="table-light">
							<tr>
								<th scope="col">예약번호</th>
								<th scope="col"><a onclick="changeSort('name')" href="#" class="text-dark">예약자</a></th>
								<th scope="col">휴대폰</th>
								<th scope="col"><a onclick="changeSort('date')" href="#" class="text-dark">신청날짜</a></th>
								<th scope="col">상세정보</th>
							</tr>
						</thead>
						<tbody class="">
<%
	if(bookList.isEmpty()){
%>
	<tr>
		<td colspan="5" class="text-center">예약된 정보가 없습니다.</td>
	</tr>
<%
	} else {
		for(BookDto book : bookList){		
%>
	<tr>
		<td><%=book.getBookNo() %></td>
		<td><%=book.getName() %></td>
		<td><%=book.getTell() %></td>
		<td><%=DateUtils.toText(book.getUpdateDate()) %></td>
		<td>
			<a href="modifyform.jsp?no=<%=book.getBookNo()%>" class="btn btn-outline-primary">수정</a>
			<a onclick="confirmDelete(<%=book.getBookNo()%>)" class="btn btn-outline-danger">삭제</a>
		</td>
	</tr>
<%
		}
%>

<%
	}
%>
						</tbody>
					</table>
<%
	int beginPage = pagination.getBeginPage();
	int endPage = pagination.getEndPage();
	boolean isFirst = pagination.isFirst();
	boolean isLast = pagination.isLast();
%>
		
					<nav>
						<ul class="pagination justify-content-center">
<%
	if (isFirst) {
%>
							<li class="page-item disabled">
								<a class="page-link" >이전</a>
							</li>
<%	
	} else {
%>
							<li class="page-item">
								<a class="page-link" href="booklist.jsp?page=<%=currentPage - 1 %>">
									이전
								</a>
							</li>
<%	
	}
%>
					
<%
	for (int num = beginPage; num <= endPage; num++) {
%>
							<li class="page-item <%=currentPage == num ? "active" : "" %>">
								<a class="page-link" 
									href="booklist.jsp?page=<%=num %>"><%=num %></a>
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
								<a class="page-link" href="booklist.jsp?page=<%=currentPage + 1 %>">
									다음
								</a>
							</li>
<%	
	}
%>
					
						</ul>
					</nav>
					
				</div>
			</div>
		</div>
	</div>
				
				<!-- 아래쪽으로 사이드바 영역 -->
	</div>
</div>
	

<script type="text/javascript">
	function changeSort(value) {
		// document.querySelector("input[name=page]").value = 1;
		document.querySelector("input[name=sort]").value = value;
	    document.getElementById("form_search").submit();
	}
	
	function searchUsers(){
		//document.querySelector("input[name=page]").value = 1;
		document.getElementById("form_search").submit();
	}
	
	function clearField() {
		document.querySelector("select[name=opt]").value = "";
		document.querySelector("input[name=keyword]").value = "";
		document.querySelector("input[name=from_date]").value = "";
		document.querySelector("input[name=to_date]").value = "";
		
		window.location.href = "booklist.jsp";
   // = window.location.href = "http://localhost/admin/book/booklist.jsp";
	}
	
	 function confirmDelete(bookNo) {
	        if (confirm("정말로 삭제하시겠습니까?")) {
	            window.location.href = 'delete.jsp?no=' + bookNo;
	        } else {
	            // 사용자가 취소를 클릭하면 아무런 동작이 없습니다.
	        }
	    }
</script>
</body>
</html>