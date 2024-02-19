<%@page import="vo.Distance"%>
<%@page import="vo.Seller"%>
<%@page import="vo.SellerService"%>
<%@page import="vo.Bank"%>
<%@page import="vo.Pay"%>
<%@page import="vo.SellerSupportPays"%>
<%@page import="vo.SellerSupportService"%>
<%@page import="org.eclipse.jdt.internal.compiler.parser.ParserBasicInformation"%>
<%@page import="dto.LoginUser"%>
<%@page import="vo.SellerInfo"%>
<%@page import="dao.SellerProfileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

// SellerProfileRegisterForm.jsp에서 <form>으로 넘겨받은 값 	
//	request.getParameter("infoNo");		// 시퀀스 자동 증가값 -> request X
	String nickName = request.getParameter("nickname");
	String memo = request.getParameter("memo");
	String address = request.getParameter("address");
	int distanceNo = Integer.valueOf(request.getParameter("distanceNo"));  
	int emp = Integer.valueOf(request.getParameter("hireEmployeeCnt"));
	String description = request.getParameter("description");
	String businessNo = request.getParameter("businessNo");
	int experienceYear = Integer.valueOf(request.getParameter("experienceYear"));
	int bankNo = Integer.valueOf(request.getParameter("bankNo")); 		// bankNo
	String bankAccount = request.getParameter("bankAccount");
	String img = request.getParameter("mainImgPath");
	
	// 3개는 따로 dao에 메서드를 사용하기에 한줄띄우고 작성했음
	// 선택해서 넘어오는 값이 복수 이므로 배열에 담았다
	String[] payNoArr = request.getParameterValues("payNo");
	String[] mainServiceNoArr = request.getParameterValues("mainServiceNo");
	String[] subServiceNoArr = request.getParameterValues("subServiceNo");
	
    // getParameter() 를 사용하면 문자열 반환이므로 int 에 담기위해 
	// Integer.valueOf()을 사용했다
	// 만약 전부 VarChar 타입이라면 Integer.valueOf() 사용 하지 않는다.

	// SellerInfo에 넘겨받은 요청 값을 set으로 담기
	SellerInfo info = new SellerInfo();
	SellerProfileDao sellerProfileDao = new SellerProfileDao();
		
	// 새로운 sellerInfo 번호
	int sequence = sellerProfileDao.getSellerInfoSequence();
	System.out.println("==========  Sequence ==============");
	System.out.println(sequence);
	
	// sellerInfo번호 저장
	info.setInfoNo(sequence);
	
	// 로그인 세션 정보로 seller_no 조회 
	LoginUser loginUser = (LoginUser)session.getAttribute("LOGIN_USER");
	Seller seller = new Seller();
	seller.setNo(loginUser.getNo());

	// sellerInfo 에 저장~
	info.setSeller(seller);
	
	info.setNickname(nickName);
	info.setMemo(memo);
	info.setAddress(address);
	
	Distance distance = new Distance();
	distance.setNo(distanceNo);
	info.setDistance(distance);
	
	info.setHireEmployeeCnt(emp);
	info.setDescription(description);
	info.setBusinessNo(businessNo);
	info.setExperienceYear(experienceYear);
	
	Bank bank = new Bank();
	bank.setNo(bankNo);
	info.setBank(bank);
	
	info.setBankAccount(bankAccount);
	info.setMainImgPath(img);
	
	sellerProfileDao.insertInfo(info);
	
	for(String payNo : payNoArr) {
		int pay = Integer.parseInt(payNo);
		SellerSupportPays ssp = new SellerSupportPays();
		ssp.setSellerInfo(info);
		
		Pay paypay = new Pay();
		paypay.setNo(pay);
		ssp.setPay(paypay);
		
		sellerProfileDao.insertPay(ssp);
	}
	
	for(String serviceNo : mainServiceNoArr) {
		int serNo = Integer.parseInt(serviceNo);
		
		SellerSupportService sss = new SellerSupportService();
		sss.setSellerInfo(info);
		sss.setMostSerivceYn("Y");
		
		SellerService ss = new SellerService();
		ss.setNo(serNo);
		
		sss.setService(ss);

		sellerProfileDao.insertService(sss);
	}
	
	for(String serviceNo : subServiceNoArr) {
		int serNo = Integer.parseInt(serviceNo);
		
		SellerSupportService sss = new SellerSupportService();
		sss.setSellerInfo(info);
		sss.setMostSerivceYn("N");

		SellerService ss = new SellerService();
		ss.setNo(serNo);
		
		sss.setService(ss);
		
		sellerProfileDao.insertService(sss);
	}
	
	
	response.sendRedirect("SellerProfileRegisterCompleted.jsp");
	
	
	

	
%>    
    