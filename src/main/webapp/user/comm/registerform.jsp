<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang ="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width, initail-scale=1">
<title></title>
<!-- CDN으로 포함시키기 -->
<!-- 부트스트랩 CSS와 JavaScript 라이브러리  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

</head>
<body> 
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="register" name="bar"/>
</jsp:include>
<div class="container">
	<div class="row">
		<div class="offset-3 col-6">
			<h1 class="text-center my-3">회원가입 폼</h1>

<%
	String error = request.getParameter("fail");
%>
	
<%
	if ("id".equals(error)) {
%>		
	<div class="alert alert-secondary">
		<strong>회원가입 오류</strong> 이미 사용중인 아이디입니다.
	</div>
<%
	}
%>
		<form class="row border bg-white p-3 g-2" method="post" action="register.jsp">
			<div class="form-group mb-3">
				<label for="id" class="form-label">아이디</label>
					<input type="text" id="id" class="form-control" name="id" placeholder="아이디" onkeyup="checkId()"/>
					<div id="id-feedback"></div>
			</div>
			<div class="form-group mb-3">
			     <label for="password" >비밀번호</label>
					<input type="password" id="password" class="form-control" name="password" placeholder="비밀번호" onkeyup="checkPassword()"/>
					<div id="password-valid-feedback" class="form-text text-success d-none">
						사용가능
					</div>
					<div id="password-invalid-feedback" class="form-text text-danger d-none">
						6글자이상, 영어대/소문자, 숫자, 특수문자 등을 사용할 수 있습니다
					</div>
           	</div>
			<div class="form-group mb-3">
			     <label for="name">이름</label>
					<input type="text" id="name" class="form-control" name="name" placeholder="이름"/>
			</div>
			<div class="form-group mb-3">
			     <label for="email">이메일</label>
			           <input type="email" id="email" class="form-control" name="email" placeholder="이메일"/>
			</div>
			<div class="form-group mb-3">
				<label class="form-label" for="tel" >전화번호</label>
					<input type="tel" id="tel" class="form-control" name="tel" placeholder="전화번호"/>
			</div>
			<div class="form-group mb-3">
					<!-- 카카오톡 주소검색 api를 이용한 주소 검색 -->
				  	<input type="text" id="sample6_postcode" name="zipcode" placeholder="우편번호">
					<input class="col-1" type="button" onclick="sample6_execDaumPostcode()" value="검색"><br>
					<input	class="col-6" type="text" name="address" id="sample6_address" placeholder="주소"><br>
					<input type="text" id="sample6_extraAddress" name="bname" placeholder="참고항목">
					<input type="text" id="sample6_detailAddress" name="detailed" placeholder="상세주소">
					
				
			</div>
			 <div class="form-group mb-3">
					<label>프로필 사진</label>
						<input type="file" class="form-control" name="imagepath">
			 </div>
			<div class="btn-gruop form-group text-end">
				<button type="submit" class="btn btn-primary">회원가입</button>
				<a href="/index.jsp" class="btn btn-secondary">홈</a>
			</div>
		</form>
      </div>
   </div>
</div>
<script>
	function checkId() {
		let idRegExp = /^[a-zA-Z0-9]{6,}$/;
			
		let feedbackDiv = document.getElementById("id-feedback");
		let idInput = document.querySelector("input[name=id]");
		let id = idInput.value
		
		if (!idRegExp.test(id)) {
			feedbackDiv.textContent = "아이디는 6글자이상";
			feedbackDiv.classList.remove('text-success');
			feedbackDiv.classList.add('text-danger');
			
			return;
		}
		
		let xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				
				let jsontext = xhr.responseText;
				
				let result = JSON.parse(jsontext);
				
				if (result.exist) {
					feedbackDiv.textContent = "이미 사용중인 아이디";
					feedbackDiv.classList.remove('text-success');
					feedbackDiv.classList.add('text-danger');
					
				} else {
					feedbackDiv.textContent = "사용 가능";
					feedbackDiv.classList.remove('text-danger');
					feedbackDiv.classList.add('text-success');					
				}
			}
		}
		xhr.open('GET', 'checkId.jsp?id=' + id);
		xhr.send();
	}
	
	function checkPassword() {
		let passwordRegExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,15}$/
		
		let passwordInput = document.querySelector("input[name=password]");
		let validFeedbackDiv = document.getElementById("password-valid-feedback");
		let invalidFeedbackDiv = document.getElementById("password-invalid-feedback");
		
		// 피드백 클래스의 값이 유효한지 유효하지 않은지 조회한다
		let validClassList = validFeedbackDiv.classList
		let invalidClassList = invalidFeedbackDiv.classList
		let password = passwordInput.value;
		
		if (passwordRegExp.test(password)) {
			validClassList.remove('d-none')
			invalidClassList.add('d-none')
		} else {
			validClassList.add('d-none')
			invalidClassList.remove('d-none')
		}
	}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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