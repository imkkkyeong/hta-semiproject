<%@page import="vo.BoardImage"%>
<%@page import="dao.BoardImageDao"%>
<%@page import="java.util.List"%>
<%@page import="dao.ReplyDao"%>
<%@page import="vo.Reply"%>
<%@page import="vo.BoardReply"%>
<%@page import="utils.DateUtils"%>
<%@page import="dto.LoginUser"%>
<%@page import="utils.NumberUtils"%>
<%@page import="utils.StringUtils"%>
<%@page import="dto.Pagination"%>
<%@page import="vo.Location"%>
<%@page import="vo.SellerService"%>
<%@page import="vo.BoardCategory"%>
<%@page import="vo.Users"%>
<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
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
<script src="https://kit.fontawesome.com/3dd102f0de.js"crossorigin="anonymous"></script>
<title>글 상세페이지</title>
</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>

	<div class= "container mb-3">
		<div class="rom mb-3">
			<div class="col-12">
	 <%
               
                // 1. 요청 파라미터 조회
                int no = NumberUtils.toInt(request.getParameter("no"),1);
	 			int currentPage = NumberUtils.toInt(request.getParameter("page"), 1);

                // 2. mapper 작성 ,DAO 작성
                // 3. BOARD 테이블에 대한 CRUD 기능을 제공하는 BoardDao 객체 생성
                BoardDao boardDao = new BoardDao();
                BoardImageDao boardImageDao = new BoardImageDao();

                // BoardDao 객체의 getBoardByNo(int no) 를 실행해서 게시글 상세정보를 조회한다
                Board board = boardDao.getBoardByNo(no);
                
                
                // ReplyDao 의 getRepliesByBoardNo() 메서드를 실행해서 해당 게시글의 댓글을 전부조회하기
                ReplyDao replyDao = new ReplyDao();
				List<Reply> replyList = replyDao.getRepliesByBoardNo(no);
                
                // HttpSession 객체에 "LOGIN_USER" 라는 속성명으로 저장된 인증이 완료된 사용자 정보 조회
                LoginUser loginUser = (LoginUser) session.getAttribute("LOGIN_USER");
                
                // 이미지 파일 조회하기
                List<String> imageList =  boardImageDao.getBoardImages(no);
                
      %>
            
            
				<table class="table mt-3">
			   		<colgroup>
			   			<col width="15%">
			   			<col width="35%">
			   			<col width="15%">
			   			<col width="35%">
			   		</colgroup>
		        	<tbody>
		            	<tr> 
		                	<th>구분</th>
		                	<td colspan="3"><%=board.getBoardCategory().getName() %></td>
		            	</tr>
			            <tr>
		                	<th>서비스 종류</th>
			                <td><%=board.getSellerService().getName() %></td>
		                	<th>지역(시도)</th>
			                <td><%=board.getLocation().getSidoName() %></td>   
			            </tr>
			            <tr>
		                	<th>제목</th>
			                <td colspan="3"><%=board.getTitle() %></td> 
			            </tr>
			            <tr>
		                	<th>작성자</th>
			                <td><%=board.getUsers().getId()%></td> 
		                	<th>작성일자</th>
			                <td><%=DateUtils.toText(board.getRegDate())%></td> 
			            </tr>   
			            <tr>
		                	<th>본문내용</th>
			                <td colspan="3"><%=board.getContent()%></td> 
			            </tr>
			            <tr>
<%
      	for(String filename : imageList ) {
%>
			            
			                <td>첨부파일</td> 
			                <td colspan="3">
			                 <img class="img-thumbnail" src="/resources/images/board/<%=filename%>">
			                </td> 
			            </tr>
<%
       	}
%>
				        <tr>
			            	<td colspan="4" class="text-start">
			                    <i class="far fa-thumbs-up"></i> 좋아요 0
			                    <span>&nbsp;</span> <!-- 공백 추가 -->
			                    <i class="far fa-comment-dots"></i> 댓글 0
			                    <span>&nbsp;</span> <!-- 공백 추가 -->
			                    <i class="fa-regular fa-eye"> 조회수 0</i>
			                </td>
			        </tbody>
			    </table>
			</div>
		</div>
   		<div class="row mb-5">
	        <div class="col-12">
 <%
           if (loginUser == null || loginUser.getNo() != board.getUsers().getNo()) {
 %>
 			<div>
 				<a href="" class = "btn btn-warning disabled">수정</a>
 				<a href="" class = "btn danger disabled">삭제</a>
 			</div>
<%
      }
%>
<%
 			if (loginUser != null && loginUser.getNo() == board.getUsers().getNo()) {
%>
			<div>
	        	<a href="modifyform.jsp?no=<%=no%>&page=<%=currentPage%>" class="btn btn-btn-warning">수정</a>
	          	<a href="delete.jsp?no=<%=no%>&page=<%=currentPage%>" class="btn btn-danger">삭제</a>
	         </div>
<%
 	}
%>
	        	<a href="list.jsp?page=<%=currentPage%>" class="btn btn-dark float-end">목록</a>
	        </div>
        </div>
        

                <!---- 댓글 ----> 
    
	     <div class="row">
	        <div class="col-12">
	            <form class="border bg-light p-3 mb-3" method="post" action="insertReply.jsp">
	            	<input type="hidden" name="boardNo" value="<%=board.getNo() %>">
	                <div class="row mb-3">
	                    <div class="col-11">
	                        <textarea name="content" rows="3" class="form-control"></textarea>
	                    </div>
	                   
	
	                    <div class="col-sm-1">
	
	                        <button type="submit" class="btn btn-outline-primary"<%=loginUser == null? "disabled" : "" %>>등록
	                        </button>
	                    </div>
	
	                </div>
	            </form>
	
<%
   			if (replyList.isEmpty()) {
%>
	         <div class="card mb-3">
	             <div class="card-body">댓글이 없습니다</div>
	         </div>
<%
       		 } else {
            for (Reply reply : replyList) {
%>
	            <div class="card mb-3">
	                <div class="card-header py-1">
	                    <span><%=reply.getUsers().getId()%></span>
	                    <small><%=DateUtils.toText(reply.getRegDate())%></small>
	                </div>
	
	                <div class="card-body py-1">
	                    <p class="card-text"><%=reply.getContent()%></p>
	                </div>
	            </div>
            <%
                    }
                }
            %>	
	
	        </div>
	    </div>
	    
	</div>

 	
</body>
</html>