<%@page import="vo.SellerEstimateStatus"%>
<%@page import="vo.UserEstimate"%>
<%@page import="vo.Seller"%>
<%@page import="dao.SellerDao"%>
<%@page import="vo.SellerEstimate"%>
<%@page import="dto.LoginUser"%>
<%@page import="dao.SellerEstimateDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int userEstimateNo = Integer.valueOf(request.getParameter("userEstimateNo"));
	String amountSetting = request.getParameter("amountSetting");
	int amount = Integer.valueOf(request.getParameter("amount"));
	String content = request.getParameter("content");
	
	SellerDao sellerDao = new SellerDao();
	
	LoginUser loginUser = (LoginUser)session.getAttribute("LOGIN_USER");
	Seller seller = sellerDao.getSellerById(loginUser.getId());
	
	UserEstimate userEstimate = new UserEstimate();
	userEstimate.setNo(userEstimateNo);
	
	SellerEstimateStatus sellerEstimateStatus =  new SellerEstimateStatus();
	sellerEstimateStatus.setNo(100000);
	
	SellerEstimate sellerEstimate = new SellerEstimate();
	sellerEstimate.setSeller(seller);
	sellerEstimate.setUserEstimate(userEstimate);
	sellerEstimate.setAmountSetting(amountSetting);
	sellerEstimate.setAmount(amount);
	sellerEstimate.setContent(content);
	sellerEstimate.setStatus(sellerEstimateStatus);
	
	SellerEstimateDao sellerEstimateDao = new SellerEstimateDao();
	sellerEstimateDao.insertSellerEstimate(sellerEstimate);
	
	response.sendRedirect("SellerInsertEstimateCompleted.jsp");
%>