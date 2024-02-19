<%@page import="dao.admin.BookStatusDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bookNo = Integer.valueOf(request.getParameter("no"));
	BookStatusDao bookStatusDao = new BookStatusDao();
	bookStatusDao.updateUserEstimateDelYNByBookNo(bookNo);
	response.sendRedirect("booklist.jsp");
%>