<%@page import="utils.DateUtils"%>
<%@page import="dao.admin.BookStatusDao"%>
<%@page import="dto.admin.BookInfo"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int bookNo = Integer.parseInt(request.getParameter("bookNo"));
	Date movingDate = DateUtils.toDate(request.getParameter("movingDate"));
	int buildingTypeNo = Integer.parseInt(request.getParameter("buildingType"));
	double squareFootage = Double.parseDouble(request.getParameter("squareFootage"));
	int floor = Integer.parseInt(request.getParameter("floor"));
	int roomCnt = Integer.parseInt(request.getParameter("roomCnt"));
	String hasElevator = request.getParameter("hasElevator");
	
	BookStatusDao bookStatusDao = new BookStatusDao();
	BookInfo bookInfo = bookStatusDao.getBookInfoByNo(bookNo);
	
	bookInfo.setBookNo(bookNo);
	bookInfo.setMovingDate(movingDate);
	bookInfo.setBuildingTypeNo(buildingTypeNo);
	bookInfo.setSquareFootage(squareFootage);
	bookInfo.setFloor(floor);
	bookInfo.setRoomCnt(roomCnt);
	bookInfo.setHasElevator(hasElevator);

	bookStatusDao.updateUserEstimateByBookInfo(bookInfo);
	
	response.sendRedirect("booklist.jsp");
%>