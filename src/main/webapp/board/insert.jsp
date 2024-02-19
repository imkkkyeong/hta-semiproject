<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="dao.BoardImageDao"%>
<%@page import="vo.BoardImage"%>
<%@page import="dto.LoginUser"%>
<%@page import="vo.Location"%>
<%@page import="vo.SellerService"%>
<%@page import="vo.BoardCategory"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.commons.fileupload2.core.DiskFileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload2.jakarta.JakartaServletDiskFileUpload"%>
<%@page import="org.apache.commons.fileupload2.core.DiskFileItemFactory"%>
<%@page import="dao.BoardDao"%>
<%@page import="vo.Users"%>
<%@page import="vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	String directory = "C:\\semi-workspace\\moobb\\src\\main\\webapp\\resources\\images\\board";

	Users user = new Users();
	LoginUser loginUser = (LoginUser) session.getAttribute("LOGIN_USER");



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

    // 2. 게시글 정보를 저장할 Board 객체를 생성
    Board board = new Board();

    // 3.생성된 Board 객체에 조회된 요청 파라미터 값 저장
    board.setTitle(title);
    board.setContent(content);
    board.setBoardCategory(boardCategory);
	board.setSellerService(sellerservice);
	board.setLocation(location);
    board.setUsers(user);
    
    // 4. 작성자 정보를 조회해서 Board객체에 저장한다
    Users users = new Users();
    user.setNo(loginUser.getNo());

    
    // 5. 테이블에 대한 CRUD 작업이 구현된 BoardDao 객체 생성
    BoardDao boardDao = new BoardDao();
    int boardNo = boardDao.getBoardNo();    

    // 6. BoardDao 객체의 insertBoard(Board board) 메서드를 실행시켜 테이블에 저장
    board.setNo(boardNo);
    boardDao.insertBoard(board);
    
    
    BoardImage boardImage = new BoardImage();
    boardImage.setBoard(board);
    boardImage.setDelYn("N");
    boardImage.setFileName(fileName);
    boardImage.setUsers(users);
    
    BoardImageDao boardImageDao = new BoardImageDao();
    boardImageDao.insertBoardImage(boardImage);
    
    // 7. 게시글을 확인할 수 있는 list.jsp를 재요청하는 응답을 보낸다.
    response.sendRedirect("list.jsp");
%>
