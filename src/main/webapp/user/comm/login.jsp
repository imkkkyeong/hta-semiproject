<%@page import="dto.LoginUser"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="vo.Users"%>
<%@page import="dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- 
		해당 URL : localhost/user/comm/login.jsp
		
		요청파라미터
			loginform.jsp에서 post방식
			name="id"와 name="pw"로 값을 받아온다
 -->
 
<%
	// loginform.jsp에서 보낸 값들을 변수에 저장
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	
	
	// UsersDao 생성
	UsersDao userDao = new UsersDao();
	
	// getUserById로 id받아서 Users객체에 저장
	Users users = userDao.getUserById(id);
	
	
	// 해당 유저가 없는지 확인
	if(users==null){
		response.sendRedirect("loginform.jsp?error=fail");
		return;
	}
	
	// 비밀번호가 맞는지 확인
 	String Expw = DigestUtils.sha256Hex(pw);
	// DB에서 갖고온 pw를 암호화한 값과 getParameter로 갖고온 pw를 암호화한 Expw를 비교하는 식
	if(!users.getPwd().equals(Expw)){
		response.sendRedirect("loginform.jsp?error=fail");
		return;
	}
	
	// 해당 유저가 탈퇴한 유저인지 확인
	if("Y".equals(users.getDelYn())){
		response.sendRedirect("loginform.jsp?error=del");
		return;
	}
	
	// 세션객체에 저장할 LoginUser객체 생성
	LoginUser loginUser = new LoginUser();
	
	loginUser.setId(users.getId());
	loginUser.setNo(users.getNo());
	loginUser.setName(users.getName());
    loginUser.setType("user");
	
	session.setAttribute("LOGIN_USER", loginUser);

	response.sendRedirect("/index.jsp");
	
%>