<%@page import="vo.MainObjectCategory"%>
<%@page import="java.util.List"%>
<%@page import="dto.LoginUser"%>
<%@page import="vo.Users"%>
<%@page import="java.util.Date"%>
<%@page import="vo.UserEstimateObject"%>
<%@page import="utils.DateUtils"%>
<%@page import="vo.Building"%>
<%@page import="vo.MovingType"%>
<%@page import="vo.UserEstimate"%>
<%@page import="dao.UserEstimateDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  
  <%
  
  	LoginUser loginUser = (LoginUser) session.getAttribute("LOGIN_USER");
  	if (loginUser == null) {
  		response.sendRedirect("/comm/loginform.jsp?error=deny");
  		return;
  	}
  		
  
  	// estimateform.jsp에서 넘어온 파라미터 값들을 저장하는 변수
  	int movingTypeNo = Integer.parseInt(request.getParameter("moveType"));
  	int buildTypeNo = Integer.parseInt(request.getParameter("buildType"));
  	int roomType = Integer.parseInt(request.getParameter("roomType"));
  	int roomCount = Integer.parseInt(request.getParameter("roomCount"));
  	int floorCount = Integer.parseInt(request.getParameter("floorCount"));
  	String elevatorYn = request.getParameter("elevatorYn");
  	
  	/*
   	String mainObjectBed = request.getParameter("mainObjectBed");
   	String mainObjectCloset = request.getParameter("mainObjectCloset");
   	String mainObjectCabinet = request.getParameter("mainObjectCabinet");
   	String mainObjectHanger = request.getParameter("mainObjectHanger");
   	String mainObjectTable = request.getParameter("mainObjectTable");
   	String mainObjectSofa = request.getParameter("mainObjectSofa");
   	String mainObjectVanity = request.getParameter("mainObjectVanity");
   	String mainObjectCurtain = request.getParameter("mainObjectCurtain");
  	*/
  	
  	String[] objNoArr = request.getParameterValues("objNo");
  	String[] objAmountArr = request.getParameterValues("objAmount");
  	
  	String memo = request.getParameter("memo");
  	
  	Date movingDate = DateUtils.toDate(request.getParameter("movingDate"));
  	
  	String fromZipCode = request.getParameter("fromZipCode");
  	String fromAddress = request.getParameter("fromAddress");
  	String fromDetailed = request.getParameter("fromDetailed");
  	String fromBname = request.getParameter("fromBname");
  	
  	String toZipCode = request.getParameter("toZipCode");
  	String toAddress = request.getParameter("toAddress");
  	String toDetailed = request.getParameter("toDetailed");
  	String toBname = request.getParameter("toBname");
  	
  	
  	// sql쿼리문을 실행하는 메소드를 불러오기 위한 UserEstimateDao객체 생성
  	UserEstimateDao userEstimateDao = new UserEstimateDao();
  	
  	// 시퀀스를 하나 늘리고 그 값을 변수 no에 저장
  	int no = userEstimateDao.getSequence();
  	
  	UserEstimate userEstimate = new UserEstimate();
  	
  	// 유저견적 객체에 시퀀스값을 받아옴
  	userEstimate.setNo(no);
  	
  	Users users = new Users();
  	users.setNo(loginUser.getNo());
  	userEstimate.setUsers(users);
  	
  	// movingType객체에 no를 넣기위한 과정
  	MovingType movingType = new MovingType();
  	movingType.setNo(movingTypeNo);
  	userEstimate.setMovingType(movingType);
  	
  	// Building객체에 no를 넣기위한 과정
  	Building building = new Building();
  	building.setNo(buildTypeNo);
  	userEstimate.setBuildingType(building);
  	
  	// 아래는 객체가 아니기 때문에 바로 담을수 있다
  	userEstimate.setSquareFootage(roomType);
  	userEstimate.setRooms(roomCount);
  	userEstimate.setFloors(floorCount);
  	userEstimate.setElevatorYn(elevatorYn);
  	userEstimate.setContent(memo);
  	
  	userEstimate.setMovingDate(movingDate);
  	
  	userEstimate.setMovingFromAddress(fromAddress);
  	userEstimate.setFromZipCode(fromZipCode);
  	userEstimate.setFromDetailed(fromDetailed);
  	userEstimate.setFromBname(fromBname);
  	
  	userEstimate.setToZipCode(toZipCode);
  	userEstimate.setMovingToAddress(toAddress);
  	userEstimate.setToDetailed(toDetailed);
  	userEstimate.setToBname(toBname);
  	
  	userEstimateDao.insertUserEstimates(userEstimate);
  	
  	for(int index=0; index<objNoArr.length; index++) {
  		
  		int objno = Integer.parseInt(objNoArr[index]);
  		int amount = Integer.parseInt(objAmountArr[index]);
  		
  		MainObjectCategory obj = new MainObjectCategory();
  		obj.setNo(objno);
  		
  		UserEstimateObject mainObject = new UserEstimateObject();
  		mainObject.setUserEstimate(userEstimate);
  		mainObject.setObject(obj);
  		mainObject.setObjectAmount(amount);
  		
  		userEstimateDao.insertUserEstimatesObject(mainObject);
  	}
  	
  	
  	response.sendRedirect("/user/comm/userinfoform.jsp");
 %>
     