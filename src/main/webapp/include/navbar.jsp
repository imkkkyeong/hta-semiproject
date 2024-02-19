<%@page import="dao.SellerProfileDao"%>
<%@page import="vo.SellerInfo"%>
<%@page import="vo.Users"%>
<%@page import="dao.UsersDao"%>
<%@page import="vo.Seller"%>
<%@page import="dao.SellerDao"%>
<%@page import="dto.LoginUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

  
<%
	// jsp:param을 통해서 보낸 값을 확인
	String menu = request.getParameter("bar");
	
	// 세션객체를 통해서 LoginUser 받아오기
	LoginUser loginUser = (LoginUser)session.getAttribute("LOGIN_USER");
	
	
	// 로그인을해 세션에 있는 id 로 인해 
	// sellerDao에 있는 getSellerById를 사용해 매개변수로 로그인 id 로 seller에 대한 정보를 조회해
	// Seller seller에 담는다
//	Seller seller = sellerDao.getSellerById(loginUser.getId());
%>
  
<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<div class="container-fluid" style="background-color: #0000">
			<a class="navbar-brand" href="/index.jsp">
	          <img alt="logo" src="\resources\images\comm\logo.png" width="50px" height="auto" class="d-inline-block align-text-mid" />
	          wouldYou
	        </a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
	    		<li class="nav-item">
	      			<a class="nav-link active" aria-current="page" href="/index.jsp">홈</a>
	    		</li>
	    		<li class="nav-item">
	     			<a class="nav-link" href="/board/list.jsp">커뮤니티</a>
	    		</li>
<%
 	if(loginUser != null && "user".equals(loginUser.getType())){
%>	    		
	   			<li class="nav-item">
	     		 	<a class="nav-link" href="/user/fos/estimateform.jsp">견적요청</a>
	    		</li>
<%
	}
%>
	 		 </ul>


     
	<div class="right-section">
		<ul class="navbar-nav me-auto mb-2 mb-lg-0">            

<%
	if(loginUser != null){ 
%>	
			<li style="margin-top:8px">
				<span>
					<strong class="text-black"><%=loginUser.getName() %></strong>
					님 환영합니다  &nbsp; &nbsp;
				</span>
			</li>
<!--  
			<li class="nav-item dropdown">
			    <a  class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			      INFO
			    </a>
			     <ul class="dropdown-menu">
					<li><a class="dropdown-item" href="/user/comm/userinfoform.jsp">내 정보</a></li>
					<li><a class="dropdown-item" href="#">123</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="#">44444</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="#">Another action</a></li>
			    </ul>
			</li>
-->			
<%
	}
%>	
            
<%
// 세션 loginUser 에 담겨 있는게  null 이라면 로그인 드롭바 보이게 설정
	if(loginUser == null) {
%>
			<li class="nav-item dropdown">
			   <a class="nav-link dropdown-toggle" href="#"  role="button" data-bs-toggle="dropdown" aria-expanded="false">
			     로그인
			   </a>
				<ul class="dropdown-menu">
				      <li><a class="dropdown-item" href="/user/comm/loginform.jsp">로그인</a></li>
				         <li><hr class="dropdown-divider" /></li>
				      <li><a class="dropdown-item" href="/seller/comm/SellerLoginForm.jsp">판매자 로그인</a></li>
				         <li><hr class="dropdown-divider" /></li>
				      <li><a class="dropdown-item" href="/admin/login/loginform2.jsp">관리자 로그인</a></li>
				</ul> 
			</li>
<%
	} else {
// null 이 아니라면 로그인 되었다 판단해 로그아웃한다.
%>		
			<li class="nav-item">
		      <a class="nav-link" href="/user/comm/logout.jsp">로그아웃</a>
		    </li>
<%
	}
%>


<% 
	if(loginUser == null){	
%>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			       	회원가입
				</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="/user/comm/registerform.jsp">회원가입</a></li>
					<li><hr class="dropdown-divider" /></li>
			        <li><a class="dropdown-item" href="/seller/comm/SellerRegisterForm.jsp">판매자 회원가입</a></li>
			   	</ul>
			</li>
			<li class="nav-item">
	                <a class="nav-link" href="#"></a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="#"></a>
            </li>
            <li class="nav-item">
	                <a class="nav-link" href="#"></a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="#"></a>
            </li>
<%
	} else {		
%>
			    
<%
	// 로그인한 사용자에 따라 프로필 or 내정보 보여주기
%>
<%
	// sellerDao에 있는 getSellerById를 사용해 매개변수로 로그인 id 로 seller에 대한 정보를 조회
	
	String userType = loginUser.getType();
	if("user".equals(userType)) {
%>
				 <li class="nav-item">
					<a class="nav-link" href="/user/comm/userinfoform.jsp">내 정보</a>
				 </li>
<%
	} else if ("seller".equals(userType)) {
		SellerProfileDao sellerProfileDao = new SellerProfileDao();
		SellerInfo sellerInfo = sellerProfileDao.getSellerProfileBySellerNo(loginUser.getNo());
%>
			<li class="nav-item">
		        <a class="nav-link" href="/seller/fos/SellerUserEstimateList.jsp">받은 요청</a>
			</li>
			<li class="nav-item">
		        <a class="nav-link" href="/seller/fos/SellerEstimateStatus.jsp">견적 현황</a>
			</li>
			<li class="nav-item">
		        <a class="nav-link" href="/seller/fos/SellerDeposit.jsp">정산 내역</a>
			</li>
<% 
			if(sellerInfo != null) {
%>			
				 <li class="nav-item">
		        	<a class="nav-link" href="/seller/comm/SellerProfile.jsp?infoNo=<%=sellerInfo.getInfoNo() %>">내 프로필</a>
				 </li>
<%
		} else {
%>
				 <li class="nav-item">
				 	<a class="nav-link" href="/seller/comm/SellerProfileRegisterForm.jsp">프로필 작성</a>
		 		 </li>
<% 			 			
		}
	}
%>
			
				  <li class="nav-item">
	                <a class="nav-link" href="#"></a>
	              </li>
	              
	              <li class="nav-item">
	                <a class="nav-link" href="#"></a>
	              </li>
              
	              <li class="nav-item">
	                <a class="nav-link" href="#"></a>
	              </li>
              
	              <li class="nav-item">
	                <a class="nav-link" href="#"></a>
	              </li>
<% 
	}
%>
            </ul>
          </div>
        </div>
      </div>
    </nav>

