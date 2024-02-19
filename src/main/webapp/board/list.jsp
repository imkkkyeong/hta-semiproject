
<%@page import="dto.LoginUser"%>
<%@page import="dao.SellerProfileDao"%>
<%@page import="vo.Location"%>
<%@page import="vo.SellerService"%>
<%@page import="dto.Pagination"%>
<%@page import="vo.Users"%>
<%@page import="utils.DateUtils"%>
<%@page import="vo.BoardLikeUser"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>
<%@page import="org.apache.tomcat.jakartaee.commons.lang3.math.NumberUtils"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initail-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/3dd102f0de.js"></script>
<title>bootstrap</title>
</head>
<body>
<jsp:include page="/include/navbar.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
	<div class="container my-3">
		<div class="row">
			<div class="col-12">

<%

	// 요청한 페이지번호 조회
	int currentPage = NumberUtils.toInt(request.getParameter("page"), 1);
	int serviceNo = NumberUtils.toInt(request.getParameter("serviceNo"), 0);
	int locationNo = NumberUtils.toInt(request.getParameter("locationNo"), 0);
	String opt = request.getParameter("opt"); //옵션
	String keyword = request.getParameter("keyword"); //검색
	int rows = NumberUtils.toInt(request.getParameter("rows"), 5);
	
	// sql 실행에 필요한 값을 map에 저장.
	Map<String, Object> param = new HashMap<>();
	param.put("serviceNo", serviceNo); // 서비스 번호 저장
	param.put("locationNo", locationNo); // 지역 번호 저장
	
	if (opt != null && !opt.isBlank()) { // 검색옵션을 Map에 저장한다.
		param.put("opt", opt);
	}
	if (keyword != null && !keyword.isBlank()) {// 검색어를 Map에 저장한다.
		param.put("keyword", keyword);
	}
	
	// Board 테이블에 대한 CRUD 기능이 구현된 BoardDao 생성
	BoardDao boardDao = new BoardDao();
	
	// 전체 게시글 개수 조회
	int totalRows = boardDao.getTotalRows(param);
	
	// 페이징처리를 지원하는 pagination객체 생성
	Pagination pagination = new Pagination(currentPage, totalRows, 5);
	
	// 시작 위치와 끝 위치를 조회한다.
	int begin = pagination.getBegin();
	int end = pagination.getEnd();
	
	// sql의 실행에 필요한 값을 Map에 저장한다.
	param.put("begin", begin);
	param.put("end", end);
	
	// 게시글 조회하기
	List<Board> boardList = boardDao.getBoards(param);
	
	// 지역, 서비스 선택
	SellerProfileDao sellerProfileDao = new SellerProfileDao();
	List<SellerService> serviceList = sellerProfileDao.getAllServices();
	List<Location> locationList = boardDao.getSidoLocations();
	
	// 로그인 
	LoginUser loginUser = (LoginUser) session.getAttribute("LOGIN_USER");
	
	
%>

				<!-- 글쓰기버튼(회원일때/아닐때) -->
				 <div class="row justify-content-end">
				 	<div class="col-auto">
				 		<div class="d-grid gap-1">
<%
	if(loginUser != null) {
%>
					<a class="btn btn btn-primary btn-lg mb-4" href="insertform.jsp">글쓰기</a>
<%
	} else {
%>
					<a class="btn btn btn-primary btn-lg mb-4 disabled aria-disabled="true">글쓰기</a>
<%
	}
%>
						</div>
					</div>
				</div>
				
				<form id="form-search"
					class="d-flex justify-content-between align-items-center"
					method="get" action="list.jsp">
					<div class="d-flex justify-content-start">
						<!-- 서비스 선택 -->
						<div class="form-group mb-3">
							<select class="form-select me-5" name="serviceNo"
								style="width: 200px;" id="category1" onchange="changeService()">
								<option value="">서비스</option>
<%
	for (SellerService service : serviceList) {
%>
								<option value="<%=service.getNo()%>"
									<%=serviceNo == service.getNo() ? "selected" : ""%>><%=service.getName()%></option>
<%
	}
%>
							</select>
						</div>
						<!-- 지역 선택 -->
						<div class="form-group mb-3 ">
							<select class="form-select me-5" name="locationNo" style="width: 150px;" 
								id="category1" onchange="changeLocation()">
								<option value="">지역</option>
<%
	for (Location loc : locationList) {
%>
								<option value="<%=loc.getNo()%>"
									<%=locationNo == loc.getNo() ? "selected" : ""%>><%=loc.getSidoName()%></option>
<%
	}
%>
							</select>
						</div>
					</div>
					<!-- 검색기능 -->
					<div class="row">
						<div class="col-3">
							<input type="hidden" name="page" value="<%=currentPage%>" /> 
							<input type="hidden" name="rows" value="<%=rows%>" /> 
							<select class="form-select" name="opt">
								<option value="">선택</option>
								<option value="title" <%="title".equals(opt) ? "selected" : ""%>>제목</option>
								<option value="writer" <%="writer".equals(opt) ? "selected" : ""%>>작성자</option>
								<option value="content" <%="content".equals(opt) ? "selected" : ""%>>내용</option>
							</select>
						</div>
						<div class="col-6">
							<input type="text" class="form-control" name="keyword"
								value="<%=keyword != null ? keyword : ""%>" />
						</div>
						<div class="col-3">
							<button type="button" class="btn btn-outline-primary"
								onclick="searchBoards();">검색</button>
						</div>
					</div>
				</form>
	

<%
	if (boardList.isEmpty()) {
%>
				<div class="card">
					<div class="card-body">
						<p class="card-text">게시글이 없습니다.</p>
					</div>
				</div>
<%
	} else {
		for (Board board : boardList) {
%>
				<div class="list-group">
					<a href="detail.jsp?no=<%=board.getNo()%>"
						class="list-group-item list-group-item-action mb-2"
						aria-current="true">
						<div class="my-2 d-flex w-100 justify-content-between">
							<div>
								<span class="border border-2 rounded-pill p-1 ms-3 "><%=board.getBoardCategory().getName()%></span>
								<span class="border border-2  rounded-pill p-1 ms-3"><%=board.getSellerService().getName()%></span>
								<span class="border border-2  rounded-pill py-1 px-2  ms-3"><%=board.getLocation().getSidoName()%></span>
							</div>
							<small><%=DateUtils.toText(board.getRegDate())%></small>
						</div>

						<div class="d-flex w-100 justify-content-between mb-3 ">
							<h3 class="mb-1"><%=board.getTitle()%></h3>
							<span><%=board.getUsers().getId()%></span>
						</div>
						<p><%=board.getContent()%></p>
						<div class="text-end">
							<span class=" ms-3"><i class="bi bi-hand-thumbs-up"></i> <%=board.getLikeCnt()%></span>
							<span class="ms-3"><i class="bi bi-chat-left-text"></i> <%=board.getReplyCnt()%></span>
							<span class="ms-3"><i class="bi bi-eye"></i> <%=board.getViewCnt()%></span>
						</div>

					</a>
				</div>
<%
		}
	}
%>
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
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<%
						if (isFirst) {
						%>
						<li class="page-item"><a class="page-link">이전</a></li>
						<%
						} else {
						%>
						<li class="page-item"><a class="page-link"
							href="list.jsp?page=<%=currentPage - 1%>"
							onclick="goPage(<%=currentPage - 1%>, event)"> <!-- page클릭할대마다 어느 페이지를 클릭했는지 알수있다. 이벤트객체 같이전달한 이유: 클릭이벤트에 대한 기본동작이 일어나지 않도록 하기위해 event.preventDefault()메서드 실행하려면 event객체가 필요해서. -->
								이전
						</a></li>

						<%
						}
						%>


						<%
						for (int num = beginPage; num <= endPage; num++) {
						%>
						<li class="page-item <%=currentPage == num ? "active" : ""%>">
							<a class="page-link" href="list.jsp?page=<%=num%>"
							onclick="goPage(<%=num%>, event)"><%=num%></a>
						</li>
						<%
						}
						%>

						<%
						if (isLast) {
						%>
						<li class="page-item disabled"><a class="page-link">다음</a></li>
						<%
						} else {
						%>
						<li class="page-item">
						<a class="page-link" href="list.jsp?page=<%=currentPage + 1%>"onclick="goPage(<%=currentPage + 1%>, event)"> 다음 </a>
						</li>
				       <%
				       } 
				       %>
					</ul>
				</nav>
				
			</div>
		</div>
	</div>
	<script type="text/javascript">
function changeService() {
	
	document.getElementById("form-search").submit();
}

function changeLocation() {
	
	document.getElementById("form-search").submit();
	
}

function searchBoards() {
	document.querySelector("input[name=page]").value = 1;
	document.getElementById("form-search").submit();		
}

function goPage(page, event) {
	event.preventDefault();
	
	document.querySelector("input[name=page]").value = page;
	document.getElementById("form-search").submit();
}

function changeRows() {
	
	document.querySelector("input[name=page]").value = 1;
	let rows = document.querySelector("select[name=rows]").value;
	document.querySelector("input[name=rows]").value = rows;
	document.getElementById("form-search").submit();
}

</script>
</body>
</html>