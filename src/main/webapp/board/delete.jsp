<%@page import="dto.LoginUser"%>
<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initail-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>bootstrap</title>
</head>
<body>
<%

	LoginUser loginUser = (LoginUser) session.getAttribute("LOGIN_USER");

    // 1. 요청파라미터값 조회하기
    int no = Integer.valueOf(request.getParameter("no"));
    int currentPage = Integer.valueOf(request.getParameter("page"));

    // 2. COMM_BOARDS에 대한 CRUD 기능이 구현된 BoardDao 객체 생성하기
    BoardDao boardDao = new BoardDao();

    // 3. 삭제할 게시글 상세정보 조회하기
    Board savedBoard = boardDao.getBoardByNo(no);

    // 4. 게시글의 삭제여부를 "Y"로 변경하기
    savedBoard.setDelYn("Y");

    // 5. 변경된 내용이 포함된 Board객체를 전달해서 updateBoard(Board board) 메소드를
    //    실행시켜서 테이블에 변경된 내용이 반영되게 하기
    boardDao.updateBoard(savedBoard);

    // 6. 게시글 목록을 재요청하는 URL을 응답으로 보내기
    response.sendRedirect("list.jsp?page=" + currentPage);

%>
</body>
</html>