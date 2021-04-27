<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="회원가입 성공 페이지"
    %>
    <% %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/main.css"/>
<style type="text/css">
	#class4Wrap{height: 900px; margin:0px auto; }
	/* 헤더 시작 */
	#header{ height: 150px; position:relative; background: #FFFFFF;}
	#hLogo{margin:50px auto; margin-top:20px; text-align: center; width: 600px; text-align: center; padding-left: 0px;}
	#logo{font-size: 30px; font-weight: bold; color: #EE4137; margin: 10px}
	/* 헤더 끝 */
	/* container 시작 */
	#container{ height: 900px; background-color: #FFC7AD;}
	.loginFrm{width:600px; height:400px; margin: 0px auto; }
	#login_Input{padding-top: 20px}
	#login{padding-top: 100px; }
	#joinSuccess{font-size: 18px; font-weight: bold; font-family:san-serif; color:#dc3545}
	#joinMessage{font-size: 15px;font-weight: bold; font-family:san-serif; color:#474747; padding-top: 10px; padding-bottom: 20px; padding-left: 20px}
	#message{padding-top: 30px}
	#joindiv{padding-left: 20px}
	#jini{font-size: 16px; font-weight: bold; color:#dc3545}
	#mainBtn,#loginBtn{width:120px; margin: 10px}
	#btn{padding-top: 100px; padding-left: 150px;}
	
	/* container 끝 */
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	$("#mainBtn").click(function(){
		location.href="/team1_user_prj3/home.do";
	})//click
	$("#loginBtn").click(function(){
		location.href="login.do";
	})//click
});//ready

</script>
</head>	
<body>
<div id="class4Wrap">
<!-- header 시작  -->		
<!-- header 끝  -->
<!-- container 시작  -->	
<div id="container">
<div id="login">
<form class="loginFrm">
	<div id="hLogo">
 	    <a class="navbar-brand" style="margin-right: 0px; "href="/team1_user_prj3/home.do">
   		    <img src="http://localhost:8080/team1_user_prj3/common/images/images_join/join_logo1.png"  class="d-inline-block align-top" alt=""><span id="logo">JINI BOOKS</span>
		</a>
	</div>
<div id="login_Input">
	<div class="form-group row" id="joindiv">
		<label class="form-check-label" for="gridCheck1" id="joinSuccess">회원가입 완료!</label>
	</div>
		<hr color="#dc3545"/>
  <div class="form-group row" id="message">
		<img src="http://localhost:8080/team1_user_prj3/common/images/images_join/join_success.png">
    <div class="col-sm-10" >
    	<label class="form-check-label" for="gridCheck1" id="joinMessage"><span id="jini">JINI BOOKS</span> 회원이 되신 것을 환영합니다!</label>
    	<label class="form-check-label" for="gridCheck1" id="joinMessage">이제,<span id="jini">&nbsp;JINI BOOKS&nbsp;</span>에서 보고 싶은 전자책을 다운받으세요!</label>
    </div>
  </div>
  <div class="form-group row">
    <div class="col-sm-10" id="btn"> 
      <input type="button" class="btn btn-danger"  id="mainBtn" value="메인으로" />
      <input type="button" class="btn btn-outline-danger"  id="loginBtn" value="로그인"/>
    </div>
  </div>
</div>
</form>
</div>
</div>
<!-- container 끝  -->		

</div>

</body>
</html>