<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="비밀번호 재설정 성공"
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
	#login{padding-top: 80px;}
	#pwOkLabel{font-size: 20px; font-weight: bold; font-family:san-serif; color: #dc3545; padding-left: 60px; padding-bottom: 30px}
	#pwMessage{padding-left: 20px}
	#mainBtn{width:320px}
	#btn{padding-top: 20px}
	#coment,#coment2{padding-left:120px; font-size: 14px;}
	
	/* container 끝 */
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	$("#mainBtn").click(function() {
		location.href = "/team1_user_prj3/home.do";
	});//click
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
		<label class="form-check-label" for="gridCheck1" id="pwOkLabel">이메일이 전송되었습니다!</label>
	</div>
  <div class="form-group row">
    <div class="col-sm-10">
    	<label class="form-check-label" for="gridCheck1" id="pwMessage"><c:out value="${inputEmail}"/> 로 <br/>비밀번호 안내 메일을 보내드렸습니다.</label>
    </div>
  </div>
  <div class="form-group row">
    <div class="col-sm-10" id="btn">
      <button type="button" class="btn btn-danger" id="mainBtn">메인으로</button>
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