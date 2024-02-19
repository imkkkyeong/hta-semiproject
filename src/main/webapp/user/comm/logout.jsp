<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/*
     session : 내장객체
     invalidate() : 세션객체를 무효화하는 메소드
	*/    
    
	session.invalidate();
    // logout 처리가 되면 index로 돌아가게 한다
    response.sendRedirect("/index.jsp");
    
%>