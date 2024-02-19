<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="vo.Seller"%>
<%@page import="dao.SellerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("sellerId");
	String rawPassword = request.getParameter("sellerPw");
	String name = request.getParameter("sellerName");
	String email = request.getParameter("sellerEmail");
	String tel = request.getParameter("sellerTel");
	
	SellerDao sellerDao = new SellerDao();
	
	Seller savedSeller = sellerDao.getSellerById(id);
	if(savedSeller != null){
		response.sendRedirect("SellerRegisterForm.jsp?error=fail");
		return;
	}
	
	String sha1Password = DigestUtils.sha256Hex(rawPassword);
	
	Seller seller = new Seller();
	seller.setId(id);
	seller.setPassword(sha1Password);
	seller.setName(name);
	seller.setEmail(email);
	seller.setTel(tel);
	
	sellerDao.insertSeller(seller);
	
	response.sendRedirect("SellerRegisterCompleted.jsp");
%>