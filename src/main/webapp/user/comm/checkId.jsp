<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="vo.Users"%>
<%@page import="dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	
	String id = request.getParameter("id");

	UsersDao userDao = new UsersDao();
	Users savedUser = userDao.getUserById(id);
	
	
	// Map 객체에 id 중복체크 결과를 저장한다
	Map<String, Object> map = new HashMap<>();
	map.put("id", id);
	
	if (savedUser != null) {
		map.put("exist", true);
	} else {
		map.put("exist", false);
	}
	
	// Gson을 이용해서 Map객체를 JSON Object 구조의 텍스트로 변환한다
	Gson gson = new Gson();
	String jsonText = gson.toJson(map);
	
	// json 텍스트를 응답으로 보낸다
	out.write(jsonText);
	
	
%>