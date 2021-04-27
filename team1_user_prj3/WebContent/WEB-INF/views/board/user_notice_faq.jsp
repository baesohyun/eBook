<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="고객센터 (자주찾는질문)"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 (자주찾는질문)</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/main.css"/>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/noticeMenu.css"/>
<style type="text/css">
	 
	#container{margin-top: 80px}
	/* container 시작 */
	/* #container{ width: 1600px; min-height: 1000px; margin:0px auto; margin-top: 80px}
	
	#carouselExampleControls,#showBook,#cashBanner,#notice{margin-bottom: 50px}
	#bookTitle1{font-size: 20px; font-weight: bold; text-align: center; color: #800000}
	#bookTitle2{font-size: 20px; font-weight: bold;}
	
	#cashBanner{height:125px; background-color:#fff3cd}
	#cashText1{padding-left: 20px; padding-top: 10px;}
	#cashText2{font-size: 20px;}
	#cashText3{color:#bc79ff; font-weight: bold; font-size: 28px;}
	#cashText4{color:#787878; font-size: 15px;}
	
	#notice{margin-bottom: 50px}
	#notice1{font-size: 15px; font-weight: bold; margin-bottom: 10px}
	#notice2{border:1px solid #333; height:120px;}
	#notice3_1{margin: 10px auto; margin-left: 10px; font-size: 13px; }
	#notice3_2{ text-align: center; vertical-align: middle; margin: 20px auto; font-size: 13px; }
	#notice3_3{ text-align: center; vertical-align: middle; margin: 20px auto; font-size: 20px; }
	#notice4{font-size: 13px; text-align: center} */
	/* container 끝 */
	
	#ff{ font-size: 20px; font-weight: bold;}
	#f2{ font-weight: bold;}
	
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	
 $("#btn1").click(function(){
	 var txt=$("#btn1").text();
	 var setText="▲";
	 if( txt=="▼"){
		 setText="▲";
	 }else{
		 setText="▼";
	 }
	 
	 if( txt=="▲"){
		 setText="▼";
	 }else{
		 setText="▲";
	 }
	 
	 $("#btn1").text(setText);
 });//click
 
 $("#btn2").click(function(){
	 var txt=$("#btn2").text();
	 var setText="▼";
	 if( txt=="▼"){
		 setText="▲";
	 }else{
		 setText="▼";
	 }
	 
	 if( txt=="▲"){
		 setText="▼";
	 }else{
		 setText="▲";
	 }
	 
	 
	 $("#btn2").text(setText);
 });//click
 
 $("#btn3").click(function(){
	 var txt=$("#btn3").text();
	 var setText="▼";
	 if( txt=="▼"){
		 setText="▲";
	 }else{
		 setText="▼";
	 }
	 if( txt=="▲"){
		 setText="▼";
	 }else{
		 setText="▲";
	 }
	 $("#btn3").text(setText);
 });//click
 
 
 $("#btn4").click(function(){
	 var txt=$("#btn4").text();
	 var setText="▼";
	 if( txt=="▼"){
		 setText="▲";
	 }else{
		 setText="▼";
	 }
	 if( txt=="▲"){
		 setText="▼";
	 }else{
		 setText="▲";
	 }
	 $("#btn4").text(setText);
 });//click
 
 
 $("#btn5").click(function(){
	 var txt=$("#btn5").text();
	 var setText="▼";
	 if( txt=="▼"){
		 setText="▲";
	 }else{
		 setText="▼";
	 }
	 if( txt=="▲"){
		 setText="▼";
	 }else{
		 setText="▲";
	 }
	 $("#btn5").text(setText);
 });//click
 
});//ready
</script>
</head>	
<body>
<div id="books">
<!-- header 시작  -->		
<div id="header">
	<jsp:include page="../../../common/jsp/jinibooks_header.jsp"/>		
</div>
<!-- header 끝  -->	
<div id="booksContent" class="row" style="margin-top: 80px; min-height: 800px;">
<!-- container 시작  -->

<!-- 사이드메뉴바  -->
<jsp:include page="../../../common/jsp/jinibooks_noticeMenu.jsp"/>

<br/>
<div id="MainContainer" class="col-8">
<div id="Cwrap">
<div style="font-size: 30px; font-weight: bold; margin-left: 330px">고객센터</div>
<br/>
<div style="margin-left: 80px">
<div style="border-bottom: 1px solid #333;height: 30px; width: 600px;" id="ff">
무엇을 도와드릴까요?
</div>

<div style="clear:both;  width: 600px; height: 70px; border-bottom: 1px solid #333" id="f1">

<br>
자주 찾는 도움말
</div>

<div style="clear:both;  width: 600px; height: 200px; border-bottom: 1px solid #333" id="f2">

<div class="accordion" id="accordionExample" style="margin-top: 20px; font-size: 15">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h2 class="mb-0">
         <span style="font-size: 15px"> 1:1 문의전 꼭 확인해 주세요!</span>
        <button class="btn btn-link"  type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" id="btn1" style="float: right; color: black;">
        ▼
        </button>
      </h2>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample" style="margin-top: 20px; font-size: 15">
      <div class="card-body">
		탈퇴에 대해서는 답변이 어려우니 고객센터로 직접 연락주세요 <br>
		전화번호는 02-2582-3349 입니다.
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h2 class="mb-0">
         <span style="font-size: 15px"> 충전이 안됩니다.</span>
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" id="btn2" style="float: right; color: black;">
      	▼
        </button>
      </h2>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
      <div class="card-body">
      충전이 안되면 고객센터로 연락 부탁드립니다. <br>
      02-2582-3349으로 연락주세요.
      </div>
    </div>
  </div>
  
  <div class="card">
    <div class="card-header" id="headingThree">
      <h2 class="mb-0">
      <span style="font-size: 15px"> 찾는 책이 없어요!</span>
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree" id="btn3" style="float: right; color: black;">
      	▼
        </button>
      </h2>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
      <div class="card-body">
      문의사항에 책제목과 출판사를 기재하시면 빠른 시일 내 조치 해 드리겠습니다.
      </div>
    </div>
  </div>
  
  
  <div class="card">
    <div class="card-header" id="headingFour">
      <h2 class="mb-0">
      <span style="font-size: 15px"> 결제 방식이 틀리다고 나와요</span>
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour" id="btn4" style="float: right; color: black;">
      	▼
        </button>
      </h2>
    </div>
    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample" ">
      <div class="card-body">
      고객센터로 연락 부탁드립니다.<br>
      연락처는 02-2582-3349 입니다.
      </div>
    </div>
  </div>
  
  
  <div class="card">
    <div class="card-header" id="headingFive">
      <h2 class="mb-0">
      <span style="font-size: 15px"> 아이디를 바꾸고 싶어요</span>
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive" id="btn5" style="float: right; color: black;">
      	▼
        </button>
      </h2>
    </div>
    <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
      <div class="card-body">
      아이디는 변경하실 수 없습니다.
      </div>
    </div>
  </div>
  
  
</div><!-- 아코디언방식 끝 -->


</div>


</div>
</div><!-- Wrap끝 -->
</div><!-- MainContainer 끝  -->
</div><!-- bookContent 끝  -->
<!-- container 끝  -->		

<!-- footer 시작  -->	
<div id ="footer" style="clear: both;">
    <jsp:include page="../../../common/jsp/jinibooks_footer.jsp"/>
</div>
<!-- footer 끝  -->	
</div>

</body>
</html>