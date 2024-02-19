<%@page import="utils.DateUtils"%>
<%@page import="dto.admin.BookInfo"%>
<%@page import="vo.admin.BookStatus"%>
<%@page import="vo.admin.BuildingType"%>
<%@page import="java.util.List"%>
<%@page import="dao.admin.BookStatusDao"%>
<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initail-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>관리자::예약 수정</title>
</head>
<body>
<%
	int sellerNo = Integer.parseInt(request.getParameter("no"));
%>

<div class="container">
	<div class="row">
		<div class="col-12">
			<h1>예약정보</h1>
			
<%
	BookStatusDao bookStatusDao = new BookStatusDao();

	List<BuildingType> buildingTypeList = bookStatusDao.getAllBuildingTypes();

	int bookNo = Integer.valueOf(request.getParameter("no"));
	
	BookInfo bookInfo= bookStatusDao.getBookInfoByNo(bookNo);
%>

			<form method="post" action="modify.jsp" class="border bg-light p-3">
				<div class="">
					<table class="table table-bordered">
						<colgroup>
							<col width = "*">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" class="">예약번호</th>
								<td> 
									<input type="hidden" name="bookNo" value="<%=bookInfo.getBookNo() %>" />
									<%=bookInfo.getBookNo() %> 
								</td>
							</tr>
							<tr>
								<th scope="row" class="">예약자명</th>
								<td> <%=bookInfo.getUserName() %> </td>
							</tr>
							<tr>
								<th scope="row" class="">예약자 아이디</th>
								<td> <%=bookInfo.getUserId() %> </td>
							</tr>
							<tr>
								<th scope="row" class="">예약자 전화번호</th>
								<td> <%=bookInfo.getUserTel() %> </td>
							</tr>							
							<tr>
								<th scope="row" class="">이사 예정일</th>
								<td>
									<input type="date" class="form-control"	name="movingDate" value="<%=DateUtils.toText(bookInfo.getMovingDate(), "yyyy-MM-dd") %>"/>
								</td>
							</tr>
							<tr>
								<th scope="row" class="">빌딩타입</th>
								<td>
									<select name="buildingType" class="border">
<%
									for (BuildingType buildingType : buildingTypeList) {
%>
										<option value="<%=buildingType.getNo() %>" <%=buildingType.getNo() == bookInfo.getBuildingTypeNo() ? "selected" : "" %>><%=buildingType.getName() %></option>
<%
									}
%>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row" class="">면적</th>
								<td>
									<input type="text" class="form-control"	name="squareFootage" value="<%=bookInfo.getSquareFootage() %>"/>
								</td>
							</tr>
							<tr>
								<th scope="row" class="">해당 층</th>
								<td>
									<input type="text" class="form-control"	name="floor" value="<%=bookInfo.getFloor() %>"/>
								</td>
							</tr>
							<tr>
								<th scope="row" class="">방 개수</th>
								<td>
									<input type="text" class="form-control"	name="roomCnt" value="<%=bookInfo.getRoomCnt() %>"/>
								</td>
							</tr>
							<tr>
								<th scope="row" class="">엘리베이터 유무</th>
								<td>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  									<input type="radio" name="hasElevator" value="Y" <%= "Y".equals(bookInfo.getHasElevator()) ? "checked" : ""  %>/> Y
									<input type="radio" name="hasElevator" value="N"  <%="N".equals(bookInfo.getHasElevator()) ? "checked" : ""  %>/> N
								</td>
							</tr>
							<tr>
								<th scope="row" class="">상품설명</th>
								<td>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
									<textarea rows="3" class="form-control"	name="content"><%=bookInfo.getContent()%></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-secondary" onclick="redirectToBookList()">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
    function redirectToBookList() {
        window.location.href = 'http://localhost/admin/book/booklist.jsp';
    }
</script>
</body>
</html>