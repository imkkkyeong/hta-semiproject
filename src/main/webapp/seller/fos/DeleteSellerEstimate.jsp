<%@page import="dao.SellerEstimateDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int sellerEstimateNo = Integer.valueOf(request.getParameter("sellerEstimateNo"));

	SellerEstimateDao sellerEstimateDao = new SellerEstimateDao();
	sellerEstimateDao.deleteSellerEstimate(sellerEstimateNo);
	
	response.sendRedirect("SellerEstimateStatus.jsp?statusNo=100002");
%>