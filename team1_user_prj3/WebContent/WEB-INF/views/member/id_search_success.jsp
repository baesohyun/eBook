<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="아이디 찾기 성공 페이지"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/servlet_prj/common/css/main.css"/>
<style type="text/css">
	#class4Wrap{height: 750px; margin:0px auto; }
	/* 헤더 시작 */
	#header{ height: 150px; position:relative; background: #FFFFFF;}
	#hLogo{width:900px;height: 80px; margin:10px auto; margin-top:20px; text-align: center;}
	#logo{font-size: 30px; font-weight: bold; color: #EE4137; margin: 10px}
	/* 헤더 끝 */
	/* container 시작 */
	#container{ height: 750px; background-color: #FFC7AD}
	.loginFrm{width:600px; height:400px; margin: 0px auto;}
	#login_Input{padding-left:140px;margin-top: 20px}
	#login{padding-top: 80px}
	#idOkLabel{font-size: 20px; font-weight: bold; font-family:san-serif; color: #dc3545; padding-left: 20px; padding-bottom: 20px}
	#userId{font-size: 25px; font-weight: bold; font-family:san-serif; color: #646464;}
	#id{width:320px; height:80px; text-align: center; padding-top: 10px}
	#idMessage{font-size: 13px; font-family:san-serif; padding-bottom: 10px; padding-top: 10px}
	#loginBtn,#pwBtn{width:320px}
	#pwBtn{font-size: 13px;}
	#btn{padding-top: 10px}
	#coment,#coment2{padding-left:120px; font-size: 14px;}
	 
	/* container 끝 */
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	$("#loginBtn").click(function() {
		location.replace("login.do");
	});
	$("#pwBtn").click(function() {
		location.replace("pw_search.do");
	});
});
</script>
</head>	
<body>
<div id="class4Wrap">
<!-- header 시작  -->		
<div id="header">
	<hr color="#EE4137"/>
	<div id="hLogo">
	<nav>
 		<a class="navbar-brand" href="#">
   		<img src="http://localhost:8080/Team1_prj3/user_book/images/header_logo.PNG"  class="d-inline-block align-top" alt=""><span id="logo">JINI BOOKS</span>
		</a>
	</nav>
	</div>
	<hr color="#EE4137"/>
</div>
<!-- header 끝  -->
<!-- container 시작  -->	
<div id="container">
<div id="login">
<form class="loginFrm">
<div id="login_Input">
	<div class="form-group row">
		<label class="form-check-label" for="gridCheck1" id="idOkLabel">회원님의 아이디는 다음과 같습니다.</label>
	</div>
  <div class="form-group row">
    <div class="col-sm-10" >
    	<div id="id">
    	<label class="form-check-label" for="gridCheck1" id="userId"><c:out value="${coveredID}"></c:out></label>
    	</div>
    </div>
  </div>
  <div class="form-group row">
    <div class="col-sm-10">
    	<label class="form-check-label" for="gridCheck1" id="idMessage">
    	<span style="padding-left: 10px">개인 정보 보호를 위해 앞의 두글자만 보여드립니다.</span><br/>
    	전체 아이디는 입력하신 메일 주소로 안내해드렸습니다.
    	</label>
    </div>
  </div>
  <div class="form-group row">
    <div class="col-sm-10" id="btn">
      <button type="button" class="btn btn-danger" id="loginBtn">로그인</button>
    </div>
    <div class="col-sm-10" id="btn">
      <button type="button" class="btn btn-secondary" id="pwBtn">비밀번호를 잃어버리셨나요? 비밀번호 재설정&nbsp;<img src="http://localhost:8080/team1_user_prj3/common/images/images_join/join_clickBtn.png"></button>
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