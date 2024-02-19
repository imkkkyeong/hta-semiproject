<%@page import="java.util.Date"%>
<%@page import="utils.DateUtils"%>
<%@page import="vo.Users"%>
<%@page import="dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang ="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width, initail-scale=1">
<title>마이 페이지</title>
<!-- CDN으로 포함시키기 -->
<!-- 부트스트랩 CSS와 JavaScript 라이브러리  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
<%@include file ="/include/navbar.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-12">
			<h1 class= mb-5><strong>마이 페이지</strong></h1>
		</div>
	</div>
<%
	
	LoginUser loginUsers = (LoginUser) session.getAttribute("LOGIN_USER");
	if(loginUsers == null){
		response.sendRedirect("/user/comm/loginform.jsp?error=deny");
		return ;
	}

	String userId = loginUsers.getId();
	
	UsersDao userDao = new UsersDao();
	
	Users savedUser = userDao.getUserById(userId);
	
%>
		<div class="row">
			<div class="col-2">
				<form method="post">
					<div class="myprofile-info card mb-3" style="width: 150px;" >
					    <img src="\resources\images\comm\default.jpg" class="card-img" alt="...">
					    <div class="card-body text-center">
					    	<button type="button" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">사진변경</button>
	                    </div>
					</div>
				</form>			
			</div>
			<div class="col-9">
				<table class="table">
					<tbody>
						<tr>
							<th>아이디</th><td><%=savedUser.getId()%></td>
							<th>이름</th><td><%=savedUser.getName()%></td>
						</tr>
						<tr>
							<th>이메일</th><td><%=savedUser.getEmail()%></td>
							<th>전화번호</th><td><%=savedUser.getTel()%></td>
						</tr>
						<tr>
							<th>주소</th><td><%=savedUser.getAddress()%></td> 
							<th>가입일자</th><td><%=DateUtils.toText(savedUser.getRegDate())%></td>
						</tr>
					</tbody>
				</table>
				<div class="text-end">
					<a href="userupdatedinfoform.jsp" class="btn btn-outline-secondary">회원정보수정</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="border bg-white p-3 g-2" >
					<h3><strong>주문</strong></h3><hr>
					<div class="myprofile-category">
						<ul >

							<li><a href="/user/comm/userestimaterequestlistform.jsp">견적요청리스트</a></li>
							<li><a href="/user/comm/receive_userestimatelist.jsp">받은견적리스트</a></li>
							<li><a href="">결제대기</a></li>
							<li><a href="">결제완료</a></li>
						</ul>
					<div>
					<h3><strong>커뮤니티</strong></h3><hr>
					<div class="myprofile-category">
						<ul >
							<li><a href="">커뮤니티 내가 쓴 글</a></li>
							<li><a href="">커뮤니티 내가 쓴 댓글</a></li>
							<li><a href="">셀러 1:1 문의</a></li>
							<li><a href="">쪽지함</a></li>
						</ul>
					</div>
					<h3><strong>고객센터</strong></h3><hr>
					<div class="myprofile-category">
						<ul >
							<li><a href="">알림</a></li>
							<li><a href="">설정</a></li>
							<li><a href="">공지사항</a></li>
							<li><a href="">고객센터</a></li>
						</ul>
					</div>
				</div>
			
			</div>
		</div>
	</div>
</div>
<div class="modal" tabindex="-1" id="exampleModal">
	<div class="modal-dialog">
		<form method="post" action="uploadProfile.jsp" enctype="multipart/form-data">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">프로필 사진 변경</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
	      				<div class="form-group">
	      					<label class="form-label">프로필 사진</label>
	      					<input type="file" class="form-control" name="upfile" />
	      				</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button type="submit" class="btn btn-primary">변경</button>
	 			</div>
			</div>
		</form>
	</div>
</div>
</div>
<%@include file = "/include/footer.jsp" %>
</body>
</html>