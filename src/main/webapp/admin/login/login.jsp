<%@page import="dto.LoginUser"%>
<%@page import="dto.admin.AdminDto"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="vo.admin.Admin"%>
<%@page import="dao.admin.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String rawPw = request.getParameter("pw");
	
	AdminDao adminDao = new AdminDao();
	
	Admin savedAdmin = adminDao.getAdminById(id);
	
	if(savedAdmin == null){
		response.sendRedirect("loginform2.jsp?error=fail");
		return;
	}
	
	if ("Y".equals(savedAdmin.getDeleted())) {	
		response.sendRedirect("loginform2.jsp?error=deleted");
		return;
	}
	
	String shaPassword = DigestUtils.sha256Hex(rawPw);
	if (!savedAdmin.getPw().equals(shaPassword)) {
		response.sendRedirect("loginform2.jsp?error=fail");
		return;
	}
	
	LoginUser loginUser = new LoginUser();
	loginUser.setNo(savedAdmin.getNo());
	loginUser.setId(savedAdmin.getId());
	loginUser.setName(savedAdmin.getName());
	
	session.setAttribute("LOGIN_USER", loginUser);

	 response.sendRedirect("/admin/manage/user.jsp");
	//response.sendRedirect("C:\\semi-workspace\\moobb\\src\\main\\webapp\\admin\\dash\\dashboard.jsp");
%>

