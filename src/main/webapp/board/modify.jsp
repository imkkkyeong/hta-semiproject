<%@page import="vo.Location"%>
<%@page import="vo.SellerService"%>
<%@page import="vo.BoardCategory"%>
<%@page import="dao.BoardImageDao"%>
<%@page import="vo.BoardImage"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.apache.commons.fileupload2.core.DiskFileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload2.jakarta.JakartaServletDiskFileUpload"%>
<%@page import="org.apache.commons.fileupload2.core.DiskFileItemFactory"%>
<%@page import="dto.LoginUser"%>
<%@page import="vo.Users"%>
<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body>
<%
String directory = "C:\\semi-workspace\\moobb\\src\\main\\webapp\\resources\\images\\board";

Users user = new Users();
LoginUser loginUser = (LoginUser) session.getAttribute("LOGIN_USER");


// 이미지 업로드.
DiskFileItemFactory factory = DiskFileItemFactory.builder().setCharset("utf-8").get();
JakartaServletDiskFileUpload upload = new JakartaServletDiskFileUpload(factory);
List<DiskFileItem> items = upload.parseRequest(request);

Map<String, String> parameter = new HashMap<>();
String fileName = null;
for (DiskFileItem item : items) {
	if (item.isFormField()) {	// true인 경우, 일반 입력필드다.
		String name = item.getFieldName();	// 입력필드의 이름을 조회한다.
		String value = item.getString();	// 입력필드의 값을 조회한다.
		parameter.put(name, value);
	} else {					// false인 경우, 첨부파일 입력필드다.
		if (item.getSize() > 0) {
			fileName = item.getName();
			
			FileOutputStream fos = new FileOutputStream(new File(directory, fileName));
			IOUtils.copy(item.getInputStream(), fos);
		}
	} 
}


    // 1. 요청파라미터 조회하기
    int no = Integer.valueOf(parameter.get("no"));
    int currentPage = Integer.valueOf(parameter.get("page"));
    
    
    String title = parameter.get("title");
    String content = parameter.get("content");
    
    int catNo = Integer.parseInt( parameter.get("catNo") );
    BoardCategory boardCategory = new BoardCategory();
    boardCategory.setNo(catNo);
    
    int serviceNo = Integer.parseInt(parameter.get("serviceNo"));
    SellerService sellerservice = new SellerService();
    sellerservice.setNo(serviceNo);
    
    int locationNo = Integer.parseInt( parameter.get("locationNo"));
    Location location = new Location();
    location.setNo(locationNo);


    // 2. BoardDao 객체 생성
    BoardDao boardDao = new BoardDao();

    // 3. 수정할 게시글 상세정보 조회
    Board board = boardDao.getBoardByNo(no);

    // 4. 수정 될 게시글 정보 
    board.setTitle(title);
    board.setContent(content);
    board.setBoardCategory(boardCategory);
	board.setSellerService(sellerservice);
	board.setLocation(location);
    
	boardDao.updateBoard(board);  
	 Users users = new Users();
    
	if (fileName != null) {
		
	    BoardImageDao boardImageDao = new BoardImageDao();
	   // boardImageDao.deleteBoardImage(boardNo)
		
	    BoardImage boardImage = new BoardImage();
	    boardImage.setBoard(board);
	    boardImage.setDelYn("N");
	    boardImage.setFileName(fileName);
	    boardImage.setUsers(users);
	    
	    boardImageDao.insertBoardImage(boardImage);
	}


    // 6. 수정된 게시글을 확인할 수 있는 detail.jsp를 재요청하는 응답을 보낸다.
    response.sendRedirect("detail.jsp?no=" + no + "&page=" + currentPage);
%>

