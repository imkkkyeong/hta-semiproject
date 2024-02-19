<%@page import="dto.LoginUser"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="vo.Seller"%>
<%@page import="dao.SellerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
    	/*
    		로그인 요청 URL
    			localhost/SellerLogin.jsp
    		로그인 실패 redirecet URL
    			localhost/SellerLogin.jsp?error=xxxx
    	*/
    	
    	 /*
	        로그인 처리
		       1. 요청 파라미터로 전달받은 id와 password 조회
		       2. id로 사용자 정보 조회
		           2-1. 사용자 정보가 존재하지 않는다 - > 회원가입 하지 않음 loginform.jsp?error=fail
		           2-2. 사용자 정보가 존재하지만 탈퇴한 사원이다  - loginform.jsp?error=deleted
		           2-3. 사용자 정보는 존재하지만 비밀번호가 일치하지 않는다 - loginform.jsp?error=fail
		       3. 사용자 정보가 존재하고 비밀번호도 일치하기 때문에 로그인 처리한다
        */
   
        // 요청 파라미터 전달받은 값 
       String id = request.getParameter("id");
	   String password = request.getParameter("password");
	   
	   // CRUD기능 있는 DAO 생성
	   SellerDao sellerDao = new SellerDao();
	   
	   //  DAO의 getSellerById를 실행해서 해당하는 아이디에 정보 조회
	   Seller savedSeller = sellerDao.getSellerById(id);
       
	   
	   //  아이디에 해당하는 Seller 정보가 존재하는지 체크
	   if(savedSeller == null ) {
	      response.sendRedirect("SellerLoginForm.jsp?error=fail");
	      return;	
	   }
	   
	   // 사용자가 탈퇴했는지 체크
	   if("Y".equals(savedSeller.getDelYn())) {
		   response.sendRedirect("SellerLoginForm.jsp?error=deleted");
		   return;
	   }
	   
	   // 사용자 정보는 존재 하고 비밀번호가 일치하는지 체크
	   String shaPassword = DigestUtils.sha256Hex(password);

	   if(!savedSeller.getPassword().equals(shaPassword)) {
		   response.sendRedirect("SellerLoginForm.jsp?error=fail");
		   return;
	   }
	   
	   // Session 객체에 담기
	   // 기존에는 세션을 2개로 나눠서 판매자 , 구매자 2개의 세션으로 다뤘는데 감도 안잡히고 힘들어서
	   // 로그인 세션을 1개로 통합해서 관리하려고 한다.
	   LoginUser loginUser = new LoginUser();
	   
	   loginUser.setNo(savedSeller.getNo());
	   loginUser.setName(savedSeller.getName());
	   loginUser.setId(savedSeller.getId());
	   loginUser.setType("seller");
	   
	   session.setAttribute("LOGIN_USER", loginUser);
	   
	   response.sendRedirect("/index.jsp");
       
       %>
    
    