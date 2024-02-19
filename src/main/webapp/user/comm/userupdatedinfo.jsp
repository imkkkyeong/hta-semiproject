<%@page import="dto.LoginUser"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="vo.Users"%>
<%@page import="dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	// 회원정보 수정은 아이디와 이름을 변경할 수 없기때문에 로그인 유저의 정보를 받아 반환한다
	LoginUser loginUsers = (LoginUser) session.getAttribute("LOGIN_USER");
	String userId = loginUsers.getId();
	String userName = loginUsers.getName();
	
	
	String password = request.getParameter("pwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
	String zipcode = request.getParameter("zipcode");
	String bname = request.getParameter("bname");
	String detailed = request.getParameter("detailed");
	
	
	UsersDao userDao = new UsersDao();
	
	String sha1Password = DigestUtils.sha256Hex(password);
	
	// User 객체를 생성하여조회된 값 저장
	Users users = userDao.getUserById(userId);
	
	// set을 이용하여 전달받은 값을 users 객체에 저장한다
	users.setPwd(sha1Password);
	users.setName(userName);
	users.setEmail(email);
	users.setTel(tel);
	users.setAddress(address);
	users.setZipcode(zipcode);
	users.setBname(bname);
	users.setDetailed(detailed);
	
	// 저장한 값을 테이블에 업데이트 시켜주는 메소드를 실행한다
	userDao.updatedUsers(users);
	
	response.sendRedirect("/user/comm/userinfoform.jsp");
%>

