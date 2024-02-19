<%@page import="vo.Distance"%>
<%@page import="vo.Pay"%>
<%@page import="vo.SellerService"%>
<%@page import="java.util.List"%>
<%@page import="dao.SellerProfileDao"%>
<%@page import="dao.SellerDao"%>
<%@page import="dto.LoginUser" %>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!-- 서머노트를 위해 추가해야할 부분 -->
<script src="/resources/JS/summernote/summernote-lite.js"></script>
<script src="/resources/JS/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resources/CSS/summernote/summernote-lite.css">



<title></title>
</head>
<body>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="profileRegister" name="bar"/>
</jsp:include>
<%
	//LoginUser loginUser = (LoginUser)session.getAttribute("LOGIN_USER");	
%>
<div class="container">
		<div class="row">
   
			<div class="col-6 mx-auto">
        		<h3 class="fw-bold mt-5">프로필 작성</h3><br>
	         		<div class="card p-3">
						<div class="row align-items-center">
							<div class="col-3">
				                <img src="/resources/images/comm/default.jpg" class="card-img-top" alt="...">
				            </div>
							<div class="col-3"></div>
							  
							<div class="col-3"></div>
							   
							<div class="col-3"></div>
						</div>
	         		</div>
			         <br>
			         <br>
         <% /*-----------------------------<div class="card p-3"> ------------------------------*/ %>
         
         
  					<form class="border- bg-light p-3" method="post" action="/seller/comm/SellerProfileRegister.jsp">
        				 <div id="divNickname" class="row mt-5">
           					 <div class="d-flex justify-content-between">
            					<h5 class="fw-bold">닉네임</h5>
							</div>
           						 <input type="text" name = "nickname">
        				</div>
        				
        				
        				<div class="row mt-5">
            				<div class="d-flex justify-content-between">
            					<h5 class="fw-bold">대표 서비스</h5>
           					</div>
							<div class="form-group mb-3 mt-3">
									<select class="form-select" name="mainServiceNo">
											<option value="1">가정 이사(투룸 이상)</option>
											<option value="2">국내 이사</option>
											<option value="3">원룸 / 소형 이사</option>
											<option value="4">사무실 이사</option>
									</select>
						   	</div>
      					 </div>
        
        				<div class="row mt-5">
	           					 <div class="d-flex justify-content-between">
	            						<h5 class="fw-bold">제공 서비스</h5>
								</div>
								<div class="form-group mb-3 mt-3">
										<div class="form-check form-check-inline">
								            <input class="form-check-input" type="checkbox" name="subServiceNo" value="1">가정 이사 (투룸 이상)
								        </div>
								        <div class="form-check form-check-inline">
								            <input class="form-check-input" type="checkbox" name="subServiceNo" value="2">국내 이사
								        </div>
								        <div class="form-check form-check-inline">
								            <input class="form-check-input" type="checkbox" name="subServiceNo" value="3">원룸 / 소형이사
								        </div>
								        <div class="form-check form-check-inline">
								            <input class="form-check-input" type="checkbox" name="subServiceNo" value="4">사무실 이사
										</div>
								</div>
						</div>
        
				        <div id="divMemo" class="row mt-5">
					            <div class="d-flex justify-content-between">
					            	<h5 class="fw-bold">한줄 소개</h5> 
					           </div>
				            		<textarea class="form-control" rows="1" name="memo" id=""></textarea>
        				</div>
       
				        <div class="row mt-5">
						           <div class="d-flex justify-content-between">
						            	<h5 class="fw-bold">활동 지역</h5>
						           	</div>
						            <div>
							             <input type="text" id="sample6_postcode" placeholder="우편번호">
							             <input type="hidden" class="form-control" name="lat" />
							             <input type="hidden" class="form-control" name="lon" />
							             <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							             <input type="text" id="sample6_address" placeholder="주소" name="address"><br>
							             <input type="text" id="sample6_detailAddress" placeholder="상세주소" name="address">
							             <input type="text" id="sample6_extraAddress" placeholder="참고항목" name="address">
						            </div>
				        </div>
						<div class="row mt-5">
					            <div class="d-flex justify-content-between">
					        	    <h5 class="fw-bold">이동 가능 거리</h5>
					            </div>
		           
								<div class="form-group mb-3">            
										<div class="form-check form-check-inline">
										             <input class="form-check-input" type="radio" name="distanceNo" value="1">
										             	<label class="form-check-label" > 10 KM</label>
										</div>  
										<div class="form-check form-check-inline">
										          	<input class="form-check-input" type="radio" name="distanceNo" value="2">
										                 <label class="form-check-label" > 20 KM</label>
										</div>
										        
										<div class="form-check form-check-inline">
										          	<input class="form-check-input" type="radio" name="distanceNo" value="3">
										                 <label class="form-check-label" > 30 KM</label>
										</div>
										         	
										<div class="form-check form-check-inline">
										          	<input class="form-check-input" type="radio" name="distanceNo" value="4">
										                 <label class="form-check-label" > 40 KM</label>
										</div>
										<div class="form-check form-check-inline">
										         	     <input class="form-check-input" type="radio" name="distanceNo" value="5">
										                 <label class="form-check-label" > 50 KM</label>
										</div>
								</div>
						</div>
		       
		       
           	 			<div id="map" style="width:500px; height:400px;"></div>
             			<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f20c83b1b0fcc576f58260352ce4d1b6&libraries=services" type="text/javascript"></script>
       		
						<div class="row mt-5">
					            <div class="d-flex justify-content-between">
					            	<h5 class="fw-bold">결제 가능 수단</h5>
					            </div>
					            	<div class="form-group mb-3 mt-3">
								           <div class="form-check form-check-inline">
								                    <input class="form-check-input" type="checkbox" name="payNo" value="1">
								                    <label class="form-check-label" >현금</label>
								           </div>
								           <div class="form-check form-check-inline">
								                    <input class="form-check-input" type="checkbox" name="payNo" value="2">
								                    <label class="form-check-label" >카드</label>
								           </div>
								           <div class="form-check form-check-inline">
								                    <input class="form-check-input" type="checkbox" name="payNo" value="3">
								                    <label class="form-check-label" >계좌이체</label>
								           </div>
								           <div class="form-check form-check-inline">
								                    <input class="form-check-input" type="checkbox" name="payNo" value="4">
								                    <label class="form-check-label" >카카오페이</label>
								           </div>
	          						</div>
						</div>
        	
        				<div class="row mt-5">
					            <div class="d-flex justify-content-between">
					            	<h5 class="fw-bold">정산 은행</h5>
					            </div>
						           <div class="form-group mb-3 mt-3">
						               <select class="form-select" name="bankNo">
										  <option value="1">하나 은행</option>
										  <option value="2">국민 은행</option>
										  <option value="3">신한 은행</option>
										  <option value="4">농협</option>
										  <option value="5">우리 은행</option>
										  <option value="6">제일 은행</option>
										  <option value="7">신협</option>
										  <option value="8">새마을금고</option>
										  <option value="9">카카오뱅크</option>
						               </select>
						           </div>
       					</div>
       					
				        <div class="row mt-5">
							<div class="d-flex justify-content-between">
								<h5 class="fw-bold">정산 계좌</h5>
							</div>
							  	<input type="text" class="form-control mt-3" name="bankAccount" value="" placeholder="ex . 000-000-00000"/>
				        </div>
				        
				        
				        <div class="row mt-5">
				           <div class="d-flex justify-content-between">
								<h5 class="fw-bold">직원 수</h5>
				           </div>
				            	<input type="number" class="form-control mt-3" min="1" name="hireEmployeeCnt" value="1" onkeyup="minMaxEmp()"/>
				        </div>
				        
				        <div class="row mt-5">
							<div class="d-flex justify-content-between">
				            	<h5 class="fw-bold">사업자 등록증</h5>
				           	</div>
				           		<input type="text" class="form-control mt-3" name="businessNo" value="" placeholder="ex. 123-45-67890"/>
				         </div>
				         
				        <div id="divDescription" class="row mt-5">
					            <div class="d-flex justify-content-between">
									<h5 class="fw-bold">서비스 상세설명</h5>
					        	</div>
	             				<textarea class="form-control"  name="description" id="summernote" placeholder="상세 내용 입력"></textarea>
	        			</div>
	        			
				        <div class="row mt-5">
				            <div class="d-flex justify-content-between">
				            	<h5 class="fw-bold">경력</h5>
				            </div>
				            	<input type="number" class="form-control mt-3" min="0" max="99" name="experienceYear" value="0" onkeyup="minMaxYear()"/>
				        </div>
	        
				        <div class="row mt-5">
				            <div class="d-flex justify-content-between">
				            	<h5 class="fw-bold">사진 첨부</h5>
				           	</div>
				           		<input type="file" class="form-control" name="mainImgPath">
				        </div>
 
      <br>
      <br>
      <hr>
      <br>
			

						<div class="d-grid gap-2 col-6 mx-auto">
							  <button class="btn btn-dark" type="submit">등록</button>
							  <a href="/index.jsp"  class="btn btn-secondary">취소</a>
						</div>
   						<br><br>
   				</form>
   				<br><br>
   		</div> 
 	</div>
</div>    
<jsp:include page="/include/footer.jsp">
	<jsp:param value="SellerProfileRegisterForm" name="footer"/>
</jsp:include>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>




<script type="text/javascript">

// experienceYear 에 값입력시 발생
// 1. 0 보다 낮으면 alert 
// 2. 100 이상이면 alert

	function minMaxEmp() {
		let emp = parseInt(document.querySelector("input[name=hireEmployeeCnt]").value);
		if (emp < 1 ) {
			alert("입력할 수 없는 값입니다.");
		}
		
	}

	function minMaxYear() {
		let year = parseInt(document.querySelector("input[name=experienceYear]").value);
		if (year < 0 || year > 99) {
			alert("입력 할수 없는 값잆니다.");
		}
	}
	
	

// summernote 에디터
	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '내용을 작성해주세요 !!'	//placeholder 설정
	          
		});
	});
	


</script>

<script>
// 지도 API
      var container = document.getElementById('map');
      var options = {
         center: new kakao.maps.LatLng(33.450701, 126.570667),
         level: 3
      };

      var map = new kakao.maps.Map(container, options);
</script>

<script type="text/javascript">
// 지도 API
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
            
            const geocoder = new kakao.maps.services.Geocoder();
            geocoder.addressSearch(data.roadAddress, (result, status) => {
                if (status === kakao.maps.services.Status.OK) {
                   document.querySelector("input[name=lat]").value = result[0].y
                   document.querySelector("input[name=lon]").value = result[0].x
                   console.log('위도 : ' + result[0].y);
                   console.log('경도 : ' + result[0].x); 
                }
              });

        }
    }).open();
}

</script>
</body>
</html>