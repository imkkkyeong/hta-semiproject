<%@page import="vo.SellerEstimate"%>
<%@page import="dao.SellerEstimateDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int sellerEstimateNo = Integer.valueOf(request.getParameter("sellerEstimateNo"));
	String amountSetting = request.getParameter("amountSetting");
	int amount = Integer.valueOf(request.getParameter("amount"));
	String content = request.getParameter("content");
	
	SellerEstimateDao sellerEstimateDao = new SellerEstimateDao();
	SellerEstimate sellerEstimate = sellerEstimateDao.getSellerEstimateByNo(sellerEstimateNo);
	sellerEstimate.setAmountSetting(amountSetting);
	sellerEstimate.setAmount(amount);
	sellerEstimate.setContent(content);
	
	sellerEstimateDao.updateSellerEstimate(sellerEstimate);
	
	response.sendRedirect("SellerEstimateStatus.jsp");

%>