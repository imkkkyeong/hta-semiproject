<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://kit.fontawesome.com/3f84dc55d3.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,400;1,100&display=swap" rel="stylesheet">
<style>

:root {
        background-color: black;
    }


	li {
		list-style : none;
	}

  .content-list {
        list-style-type: none; /* li 태그에 대한 bullet point 제거 */
    }
    .content-list li {
        display: inline-block; /* li 태그를 가로로 배치 */
        margin-right: 20px; /* 각 항목 사이에 간격 추가 */
    }
    #categoryTitle{
    	font-size: 18px;
    	font-family: 'Roboto', sans-serif;
    	font-weight: bold;
    	color: white;
    }
    
   
    a {
    	color: gray; 
    	text-decoration: none;
    }
    
    #lastTitle{
    	font-weight: bold;
    	font-size: 16px;
    	text-align: center;    	
    	color: white;    	
    }
    #lastContent {
    	font-size: 14px;
    	font-weight: normal;
    	color: white
    }
    #app-footer{
    background-color: black;
    color : gray;
    }
    
</style>

<nav id="app-footer" class="container-fluid " data-v-46dfac82>
<hr>
<div id="footer_bar">
		<img alt="" src="/resources/images/comm/logo.png" width= "110px" height="auto">
	<div class="footer-container-row container" data-v-46dfac82>
		<div class="col-content margin-bottom" data-v-46dfac82>
			<p class="text contact" data-v-46dfac82>
				1555-1234
			</p>
			<p class="text-middle" data-v-46dfac82>
				평일 10:00 - 18:00<br data-v-46dfac82>(점심시간 13:00 - 14:00 제외 · 주말/공휴일 제외)
			</p>
		</div>
		<div class="col-content right" style="float: right;" data-v-46dfac82>
			<ul class="content-list list-group  list-group-horizontal"  data-v-46dfac82>
				<li class="open-padding" data-v-46dfac82>
				<span class="text-middle title category" data-v-46dfac82 id="categoryTitle"> 회사
					<span class="new-badge" style="display:none;" data-v-46dfac82>N</span><!---->
				</span>
					<div style="display:block;" id="innerContent" data-v-46dfac82>
						<a href="#" class="text-middle category" data-v-46dfac82> 회사소개 
							<span class="new-badge" style="display:none;" data-v-46dfac82>N</span>
						</a>
						<br>
						<a href="https://www.rocketpunch.com/jobs" target="blank" class="text-middle category" data-v-46dfac82> 채용안내 
							<span class="new-badge" style="display:none;" data-v-46dfac82>N</span>
						</a>
						<br>
					</div>
				</li>
			<li data-v-46dfac82>
				<span class="text-middle title category" data-v-46dfac82 id="categoryTitle"> 고객안내 
					<span class="new-badge" style="display:none;" data-v-46dfac82>N</span><!---->
				</span>
				<div style="display:block;"id="innerContent" data-v-46dfac82>
					<a href="" class="text-middle category" data-v-46dfac82> 이용안내 
						<span class="new-badge" style="display:none;" data-v-46dfac82>N</span>
					</a>
					<br>
					<a href="" class="text-middle category" data-v-46dfac82> 안전정책 
						<span class="new-badge" style="display:none;" data-v-46dfac82>N</span>
					</a>
					<br>
					<a href="/board/list.jsp" class="text-middle category sr-only" data-v-46dfac82> 커뮤니티
						<span class="new-badge" style="display:none;" data-v-46dfac82>N</span>
					</a>
				</div>
			</li>
			<li >
			<span class="text-middle title category"  id="categoryTitle"> 고객센터 
				<span class="new-badge" style="display:none;" >N</span><!---->
			</span>
				<div style="display:block;" id="innerContent"  >
					<a href="#" class="text-middle category" > 공지사항 
						<span class="new-badge" style="display:none;" >N</span>
					</a>
					<br>
					<a href="#" class="text-middle category" > 자주묻는질문
						<span class="new-badge" style="display:none;" >N</span>
					</a>
					<br>
				</div>
			</li>
			</ul>
		</div>
	</div>
	<div class="footer-container-row container terms" id="">
		<div class="term-container" >
			<div class="col-content term-content" >
				<ul class="col-content-guide" >
					<li class="text" > 상호명 : wouldYOU ·  주소 : 서울특별시 종로구 율곡로10길 105 디아망 4F </li>
					<li class="text" > 사업자등록번호 : 123-45-98765  </li>
					<li class="text" >고객센터  :1599-5319 · 이메일 : support@moobbmoobb.com</li>
					<li class="text" >Copyright © moobb moobb Inc. All Rights Reserved.</li>
				</ul>
			</div>
			<div class="col-content term-content">
				<a href="https://www.instagram.com/gi.dor/" target="blank" >
					<i class="fa-brands fa-square-instagram fa-2xl" style="color: #FFFFFF;"></i>
				</a>
				&nbsp;
				<a href="https://gi-dor.tistory.com/"  target="blank">
					<i class="fa-brands fa-blogger fa-2xl" style="color: #FFFFFF;"></i>
				</a> 
				&nbsp;
				<a href="https://github.com/gi-dor"  target="blank">
					<i class="fa-brands fa-github fa-2xl" style="color: #FFFFFF;"></i>
				</a>
			</div>
		</div>
	</div>
	</div>
		<div class="mb-5" >
		 			<hr>
		 			<p id="lastTitle">ⓒ HTA  &nbsp;&nbsp;&nbsp; 
			 			<a id="lastContent" href="#">Privacy</a>&nbsp;  | &nbsp;
			 			<a id="lastContent" href="#">Terms</a>&nbsp;  | &nbsp;
			 			<a id="lastContent" href="">Board</a>&nbsp;  | &nbsp;
			 			<a id="lastContent" href="">Notice</a>  
		 			</p>
		</div>
</nav>