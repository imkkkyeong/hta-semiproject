<%@page import="dao.UsersDao"%>
<%@page import="vo.Users"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String zipcode = request.getParameter("zipcode");
	String address = request.getParameter("address");
	String bname = request.getParameter("bname");
	String detailed = request.getParameter("detailed");
	String userImagePath = request.getParameter("imagepath");
	
	UsersDao userDao = new UsersDao();
	
	// 회원가입하는 유저의 아이디 중복여부 체크
	Users savedUser = userDao.getUserById(id);
	if (savedUser != null) {
		response.sendRedirect("registerform.jsp?fail=id");
		return;
	}
	
	// 비밀번호 암호화
	String sha1Password = DigestUtils.sha256Hex(password);
	
	// User 객체를 생성하여조회된 값 저장
	Users users = new Users();
	users.setId(id);
	users.setPwd(sha1Password);
	users.setName(name);
	users.setEmail(email);
	users.setTel(tel);
	users.setZipcode(zipcode);
	users.setAddress(address);
	users.setBname(bname);
	users.setDetailed(detailed);
	users.setUserImgPath(userImagePath);
	
	// insertUsers 메소드를 실행
	userDao.insertUsers(users);
	
	response.sendRedirect("/user/comm/register-completed.jsp");
%>