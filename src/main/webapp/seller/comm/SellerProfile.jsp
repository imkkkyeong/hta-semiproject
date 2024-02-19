<%@page import="org.apache.catalina.ha.backend.Sender"%>
<%@page import="java.util.List"%>
<%@page import="dto.LoginUser"%>
<%@page import="vo.SellerSupportPays"%>
<%@page import="vo.SellerSupportService"%>
<%@page import="vo.SellerInfo"%>
<%@page import="vo.Seller"%>
<%@page import="vo.Distance"%>
<%@page import="vo.Pay"%>
<%@page import="vo.SellerService"%>
<%@page import="dao.SellerProfileDao"%>
<%@page import="dao.SellerDao"%>
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

<!-- 아이콘 스크립트 -->
<script src="https://kit.fontawesome.com/3f84dc55d3.js" crossorigin="anonymous"></script>

<title></title>
</head>
<body>
<jsp:include page="../../include/navbar.jsp">
	<jsp:param value="profile" name="bar"/>
</jsp:include>
<%
	LoginUser loginUser = (LoginUser)session.getAttribute("LOGIN_USER");


	SellerProfileDao sellerProfileDao = new SellerProfileDao();
	SellerInfo sellerInfo = sellerProfileDao.getSellerProfileBySellerNo(loginUser.getNo());
	
	if(sellerInfo == null) {
		response.sendRedirect("/SellerProfileForm.jsp");
		return;
	} 
		
		List<SellerSupportService> services = sellerProfileDao.getSellerServiceByInfoNo(sellerInfo.getInfoNo());	
		List<Pay> payList = sellerProfileDao.getSellerPayByInfoNo(sellerInfo.getInfoNo());
	
	
%>

<div class="container">
   <div class="row">
      <div class="col-6 mx-auto">
         <h3 class="fw-bold mt-5" id="topButton">프로필 관리</h3><br>
         <div class="card p-3">
            <div class="row align-items-center">
	                <div class="col-3">
							<img src="\resources\images\comm\default.jpg" class="card-img-top" alt="대표 이미지" style="widows: auto; height: auto;">
	                </div>
	                
					<div class="col-3">
						<div>
							<div>
								<h5 class="card-title"> 리뷰 평점</h5>
									<p class="card-text"> 0 </p>
							</div>
						</div>
					</div>
			        <div class="col-3">
						<div>
							<div>
								<h5 class="card-title"> 리뷰 갯수</h5>
									<p class="card-text"> 0 </p>
				            </div>
						</div>
			        </div>
	               	<div class="col-3">
	                	<div>
		            		<div>
		                    	<h5 class="card-title"> 고용 횟수</h5>
		                      	<p class="card-text"> 0 </p>
		                    </div>
	                    </div>
	               	</div>
            </div>
         </div>
         <br>
         <div>
         	<a href="/seller/comm/SellerProfileModifyForm.jsp?infoNo=<%=sellerInfo.getInfoNo() %>" class="btn btn-dark" style="float: right"> 프로필 수정</a>
         </div>
         
		
			<div id="divNickname" class="row mt-5">
	         	 <div class="d-flex justify-content-between">
		        	 <h5 id="nickname"class="fw-bold">닉네임</h5>
		         </div>
		         <div class="form-group mb-3 mt-3">
		        	<span class="border p-2 me-3"><%=sellerInfo.getNickname() %></span>
		         </div>
     		</div>
     		
	     <br><hr>
	     
	    	<div class="row mt-5">
	       		<div class="d-flex justify-content-between">
		        	<h5 class="fw-bold">대표 서비스</h5>
	        	</div>
	        
	        	<div class="form-group mb-3 mt-3">
<%
	for (SellerSupportService service : services) {
		if ("Y".equals(service.getMostSerivceYn())) {
%>
					<span class="border p-2 me-3"><%=service.getService().getName() %></span>
<%
		}
	}
%>
				</div>
	    	</div>
	    	
	     <br><hr>
	     
	     		<div class="row mt-5">
	        		<div class="d-flex justify-content-between">
	         			<h5 class="fw-bold">제공 서비스</h5>
					</div>
	        
	        		<div class="form-group mb-3 mt-3">

<%
	for (SellerSupportService service : services) {
		if ("N".equals(service.getMostSerivceYn())) {
%> 
						<span class="border p-2 me-3"><%=service.getService().getName() %></span>
<%
		}
	}
%>
					</div>
	     		</div>
	     		
	     <br><hr>
	     
	     		<div id="divMemo" class="row mt-5">
	         		<div class="d-flex justify-content-between">
	         			<h5 class="fw-bold">한줄 소개</h5> 
	        		</div>
           			<div class="form-group mb-3 mt-3">
	         			<span class="border p-2 me-3"><%=sellerInfo.getMemo() %></span>
	     			</div>
	     		</div>
		<br><hr>
		
	     			<div class="row mt-5">
	         			<div class="d-flex justify-content-between">
	        				 <h5 class="fw-bold">활동 지역</h5>
	        			</div>
	       				<div class="form-group mb-3 mt-3">
        	  				<pre class="border p-2 me-3"> <%=sellerInfo.getAddress() %> </pre>
	        			</div>
	        
	     			</div>
	     			
	     <br><hr>
	     
	     		<div class="row mt-5">
		        	<div class="d-flex justify-content-between">
		         		<h5 class="fw-bold">이동 가능 거리</h5> 
		        	</div>
		        	<div class="form-group mb-3 mt-3">				
						<div class="form-check form-check-inline">
		  					<span class="border p-2 me-3"><%=sellerInfo.getDistance().getName() %> KM</span>
						</div>
					</div>
	     		</div>
	     		
	     <br><hr>
	     
	     		<div class="row mt-5">
	       			<div class="d-flex justify-content-between">
	         			<h5 class="fw-bold">결제 가능 수단</h5>
        			</div>
	        		<div class="form-group mb-3 mt-3">
						<div class="form-check form-check-inline">
<%
	for(Pay pay : payList) {
%>
  					  		<span class="border p-2 me-3"><%=pay.getName() %></span>
<%
	}
%>  					</div>
				 	</div>
	     		</div><br><hr>
		     	<div class="row mt-5">
		        	<div class="d-flex justify-content-between">
		        		<h5 class="fw-bold">정산 계좌</h5>
		        	</div>
		            <div class="form-group mb-3 mt-3">
		            	<span class="border p-2 me-3"><%=sellerInfo.getBankAccount() %></span>
		             </div>
		     	 </div><br><hr>
		     	
			     <div class="row mt-5">
			     		<div class="d-flex justify-content-between">
							<h5 class="fw-bold">직원 수</h5>
			        	</div>
			        	<div class="form-group mb-3 mt-3">
							<span class="border p-2 me-3"> <%=sellerInfo.getHireEmployeeCnt() %> 명 (본인 포함) </span>
						</div>
			     </div><br><hr>
			     <div class="row mt-5">
				         <div class="d-flex justify-content-between">
				         	<h5 class="fw-bold">사업자 등록증</h5>
				         </div>
				         <div class="form-group mb-3 mt-3">
							<span class="border p-2 me-3"> <%=sellerInfo.getBusinessNo() %> </span>
						 </div>
			     </div><br><hr>
		     	 <div id="divDescription" class="row mt-5">
			         <div class="d-flex justify-content-between">
			         	<h5 class="fw-bold">서비스 상세설명</h5>
			         </div>
			         <div class="form-group mb-3 mt-3">
						<pre class="border p-2 me-3"><%=sellerInfo.getDescription() %> </pre>
					 </div>  
		     	</div><br><hr>
		     	<div class="row mt-5">
		        	<div class="d-flex justify-content-between">
		         		<h5 class="fw-bold">경력</h5>
		         	</div>
	     	     	<div class="form-group mb-3 mt-3">
	     	     		<span class="border p-2 me-3"> &ensp; <%=sellerInfo.getExperienceYear() %> &ensp; 년  &ensp;</span> 
	   	     		</div>
	          	</div><br><hr>
	          	
		     	<div class="row mt-5">
		        	<div class="d-flex justify-content-between">
		         		<h5 class="fw-bold">사진 및 동영상</h5>
		        	</div>
			        <div class="form-group mb-3 mt-3">
			        	<img src="" style = "height:200px;" >
			        </div>
		     	</div>
		     	
      		
<!-- 
      		<a href="#topButton" id="scrollButton" style="text-align: right; position: fixed; bottom: 20px; right: 20px;">
			  	<i class="fa-solid fa-caret-up fa-xl" style="color: #000000; text-align: right;">TOP</i>
			</a>
 -->
      		</div>
		     	<a href="#topButton" style="text-align: right;">
		     		<i class="fa-solid fa-caret-up fa-xl" style="color: #000000;">TOP</i>
		     	</a>
      		<br><br>
   		</div>
	</div>
  

<script>
/*
window.addEventListener('scroll', function() {
    var scrollButton = document.getElementById('scrollButton');
    var currentPosition = window.pageYOffset;

    // 스크롤 위치에 따라 동적으로 이동
    if (currentPosition > 0) {
      scrollButton.style.transform = 'translateY(' + currentPosition + 'px)';
    } else {
      scrollButton.style.transform = 'none';
    }
  });
 */
</script>


<%// 지도 API %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
          
	});
});

function updateNickname(){
	let divNickname = document.getElementById("divNickname");
	
	let textAreaNickname = document.createElement("textArea");
	
	let buttonNickname = document.createElement("button");
	buttonNickname.classList.add("btn", "btn-outline-primary", "btn-sm");
	buttonNickname.textContent = "확인";
	
	divNickname.appendChild(textAreaNickname);
	divNickname.appendChild(buttonNickname);
}

function updateMemo(){
	let divMemo = document.getElementById("divMemo");
	
	let textAreaMemo = document.createElement("textArea");
	
	let buttonMemo = document.createElement("button");
	buttonMemo.classList.add("btn", "btn-outline-primary", "btn-sm");
	buttonMemo.textContent = "확인";
	
	divMemo.appendChild(textAreaMemo);
	divMemo.appendChild(buttonMemo);
}

function updateDescription(){
	let divDescription = document.getElementById("divDescription");
	
	let textAreaDescription = document.createElement("textArea");
	
	let buttonDescription = document.createElement("button");
	buttonDescription.classList.add("btn", "btn-outline-primary", "btn-sm");
	buttonDescription.textContent = "확인";
	
	divDescription.appendChild(textAreaDescription);
	divDescription.appendChild(buttonDescription);
}

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>
<%@include file = "/include/footer.jsp" %>
</body>
</html>