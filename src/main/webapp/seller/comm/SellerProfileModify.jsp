<%@page import="vo.SellerService"%>
<%@page import="vo.SellerSupportService"%>
<%@page import="vo.Pay"%>
<%@page import="vo.SellerSupportPays"%>
<%@page import="dto.LoginUser"%>
<%@page import="vo.Bank"%>
<%@page import="vo.Distance"%>
<%@page import="vo.SellerInfo"%>
<%@page import="dao.SellerProfileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang ="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width, initail-scale=1">

<%

	String nickName = request.getParameter("nickname");
	int mainServiceNo = Integer.parseInt(request.getParameter("mainServiceNo"));
	String[] subServiceNoArr =  request.getParameterValues("subServiceNo");
	String memo = request.getParameter("memo");
	String address = request.getParameter("sellerAddress");
	int distanceNo = Integer.valueOf(request.getParameter("distanceNo"));
	String[] payNoArr = request.getParameterValues("payNo");
	int bankNo = Integer.valueOf(request.getParameter("bankNo"));
	String bankAccount = request.getParameter("bankAccount");
	int hireEmployeeCnt = Integer.valueOf(request.getParameter("hireEmployeeCnt"));
	String businessNo =  request.getParameter("businessNo");
	String description =  request.getParameter("description");
	int experienceYear = Integer.valueOf(request.getParameter("experienceYear"));
	String mainImgPath = request.getParameter("mainImgPath");

	// Distance , Bank 테이블
	// input 태그내에 value 가 int 타입

	/*
	String[] subServiceNoArr =  request.getParameterValues("subServiceNo");
	
	subServiceNoArr[0] = "1"
	subServiceNoArr[1] = "2"
	subServiceNoArr[2] = "3"
	subServiceNoArr[3] = "4"
	subServiceNoArr[4] = "5"
	*/
	
	
	// SellerInfo 정보 조회
	SellerInfo sellerInfo = new SellerInfo();
	SellerProfileDao sellerProfileDao = new SellerProfileDao();
	
	// 로그인 세션 정보
	LoginUser loginUser = (LoginUser)session.getAttribute("LOGIN_USER");
	
	// 조회한 로그인세션에 sellerNo를 사용해 sellerInfo 정보조회
	sellerInfo = sellerProfileDao.getSellerProfileBySellerNo(loginUser.getNo());
	
	// set을 사용해 sellerInfo 에 저장하기
	sellerInfo.setNickname(nickName);
	sellerInfo.setMemo(memo);
	sellerInfo.setAddress(address);
	sellerInfo.setBankAccount(bankAccount);
	sellerInfo.setHireEmployeeCnt(hireEmployeeCnt);
	sellerInfo.setBusinessNo(businessNo);
	sellerInfo.setDescription(description);
	sellerInfo.setExperienceYear(experienceYear);
	sellerInfo.setMainImgPath(mainImgPath);
	

	// Distance , Bank 객체 생성해서 파라미터값 저장 한뒤에 sellerInfo에 변환해 저장
	Distance distance = new Distance();
	distance.setNo(distanceNo);
	sellerInfo.setDistance(distance);
	
	Bank bank = new Bank();
	bank.setNo(bankNo);
	sellerInfo.setBank(bank);
	/* sellerInfo.setBank(bankNo); */
	// set 메서드 변수가 int 타입으로 들어왔음
	// setBank() 메서드는 Bank타입이다
	
	// set 으로 저장한 값으로 update
	System.out.println("nickname: " + sellerInfo.getNickname());
	System.out.println("memo: " + sellerInfo.getMemo());
	System.out.println("address: " + sellerInfo.getAddress());
	System.out.println("distance: " + sellerInfo.getDistance().getNo());
	System.out.println("hireEmployeeCnt: " + sellerInfo.getHireEmployeeCnt());
	System.out.println("description: " + sellerInfo.getDescription());
	System.out.println("businessNo: " + sellerInfo.getBusinessNo());
	System.out.println("experienceYear: " + sellerInfo.getExperienceYear());
	System.out.println("bankAccount: " + sellerInfo.getBankAccount());
	System.out.println("bank.no: " + sellerInfo.getBank().getNo());
	System.out.println("mainImgPath: " + sellerInfo.getMainImgPath());
	
	sellerProfileDao.updateSellerInfo(sellerInfo);
	
	
	//============ Pay , Service 는 따로  =============
	// update를 하게되면 해당 sellerInfo 인 service와 pay가 모두 값이 같아지므로
	// 전부 삭제하고 insert로 새로 입력
	
	// Pay
	sellerProfileDao.deletePayBySellerInfo(sellerInfo.getInfoNo());
	 
	for(String payNo : payNoArr) {
		// 태그내 value 값을 int pay에 담음
		int pay = Integer.parseInt(payNo); 
		
		// 최종 적으로 SellerSupooryPay 에 값을 변경해야하니 일단 SellerSupportPay 객체만듬 ㅎ;
		SellerSupportPays supportPay = new SellerSupportPays();
		
		// SellerSupportPay 내에 Pay pay
		Pay ppay = new Pay();
		ppay.setNo(pay); // Pay pay -> pay.no
		supportPay.setPay(ppay);

		// SellerSupportPay 내에 sellerInfo 
		supportPay.setSellerInfo(sellerInfo);
		
		
		sellerProfileDao.insertPay(supportPay);
		
	}
	
	// 1. MostService
	
	sellerProfileDao.deleteServiceBySellerInfo(sellerInfo.getInfoNo());
	
	SellerSupportService mostService = new SellerSupportService();
	SellerService service = new SellerService();
	service.setNo(mainServiceNo);
	mostService.setService(service);
	mostService.setMostSerivceYn("Y");
	mostService.setSellerInfo(sellerInfo);
	
	sellerProfileDao.insertService(mostService);
	
	// 2. SubService
	for(String subSerNo : subServiceNoArr) {
		int serNo = Integer.parseInt(subSerNo);
		
		SellerSupportService subService = new SellerSupportService();
				
		SellerService sellerService = new SellerService();
		sellerService.setNo(serNo);
		subService.setService(sellerService);
		subService.setMostSerivceYn("N");
		subService.setSellerInfo(sellerInfo);
		
		sellerProfileDao.insertService(subService);
		
	}
	
	response.sendRedirect("/index.jsp");
	
	%>

