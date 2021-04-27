<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="로그인 페이지"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/main.css"/>
<style type="text/css">
	#class4Wrap{margin:0px auto; }
	/* 헤더 시작 */
	#header{ height: 150px; position:relative; background: #FFFFFF;}
	#hLogo{width:900px;height: 80px; margin:10px auto; margin-top:20px; text-align: center;}
	#logo{font-size: 30px; font-weight: bold; color: #EE4137; margin: 10px}
	/* 헤더 끝 */
	/* container 시작 */
	#container{ height: 750px; background-color: #FFC7AD}
	.loginFrm{width:600px; height:400px; margin: 0px auto;}
	#login_Input{padding-left:140px; padding-top: 10px; margin-top: 35px}
	#login{padding-top: 80px}
	#loginBtn,#joinBtn{width:320px}
	#inputID,#inputPW{width:300px}
	#loginCheckLabel,#idSearch,#pwSearch{font-size: 13px;}
	#loginCheckLabel{margin-right: 30px}
	#btn{padding-top: 20px}
	
	#idEmptyWarn, #pwEmptyWarn, #idpwValidateWarn {color:#ff0000; font-size: 10px; font-weight: bold; display: none; border: 0px; background-color: #FFC7AD; background-color: rgba( 255, 255, 255, 0 ); padding-top: 0px;}
	
	/* container 끝 */
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	
	var chkID = function() {
		if($("#idEmptyWarn").is(':visible') == true ){
	        $("#idEmptyWarn").hide();
	    }//end if
		if($("#idpwValidateWarn").is(':visible') == true ){
	        $("#idpwValidateWarn").hide();
	    }//end if
	    
		var inputID = $("#inputID").val().trim();
		//비어있는지 확인
	    if(inputID == ""){
	        $("#idEmptyWarn").show();
			return false;
		} else {
			return true;
		}//end if else
	};//chkID
	
	var chkPW = function() {
		if($("#pwEmptyWarn").is(':visible') == true ){
	        $("#pwEmptyWarn").hide();
	    }//end if
		if($("#idpwValidateWarn").is(':visible') == true ){
	        $("#idpwValidateWarn").hide();
	    }//end if
	    
		var inputPW = $("#inputPW").val().trim();
		//비어있는지 확인
	    if(inputPW == ""){
	    	$("#pwEmptyWarn").show();
			return false;
		} else {
			return true;
		}//end if else
	};//chkPW
	
	var login = function() {
		if(chkID()){
		    if(chkPW()){
		    	var inputID = $("#inputID").val().trim();
		    	var inputPW = $("#inputPW").val().trim();
		    	var param = "inputID="+inputID+"&inputPW="+inputPW;
	    		$.ajax({
	    			url:"login_process.do",
	    			type:"post",
	    			data:param,
	    			dataType:"json",
	    			error:function(xhr){
	    				alert("서비스가 원활하지 못해 죄송합니다.");
	    				//console.log("에러코드: "+xhr.status);
	    				//console.log("에러메세지: "+xhr.statusText);
	    			},
	    			success:function(json_obj){
	    				if(json_obj.result_flag){
	    					location.replace("/team1_user_prj3/home.do");
	    				} else {
	    			        $("#idpwValidateWarn").show();
	    				}//end if else
	    			}
	    		});//ajax
		    }//end if
		}//end if
	};//login
	
	
	$("#inputPW").keydown(function(e) {
		var code = e.keyCode || e.which;
		 if(code == 13) { //Enter keycode
		   //Do something
		   login();
		 }//end if
	});//keydown
	
	$("#loginBtn").click(login);//click
	
	$("#joinBtn").click(function(){
		location.href="join.do";
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
 		<a class="navbar-brand" href="/team1_user_prj3/home.do">
   		<img src="http://localhost:8080/team1_user_prj3/common/images/header_logo.PNG" class="d-inline-block align-top" alt=""/><span id="logo">JINI BOOKS</span>
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
  <span style="width:20px; height:20px"><img src="http://localhost:8080/team1_user_prj3/common/images/images_join/join_userid.png"></span>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputID" name="inputID" placeholder="아이디">
    </div>
  </div>
  <div class="form-group row">
  	<span style="width:20px; height:20px"><img src="http://localhost:8080/team1_user_prj3/common/images/images_join/join_password.png"></span>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPW" placeholder="비밀번호">
    </div>
  </div>
  <div class="form-group row">
    <div class="col-sm-10">
      <div class="form-check">
        <input class="form-check-input" type="checkbox" id="loginCheck">
        <label class="form-check-label" for="gridCheck1" id="loginCheckLabel">
          로그인 상태 유지
        </label>
        <a href="id_search.do" id="idSearch">아이디 찾기</a>
        <a href="pw_search.do" id="pwSearch">비밀번호 재설정</a>
      </div>
    </div>
  </div>
  <div>
    <span class="form-control" id="idEmptyWarn">아이디를 입력해주세요.</span>
    <span class="form-control" id="pwEmptyWarn">비밀번호를 입력해주세요.</span>
    <span class="form-control" id="idpwValidateWarn">아이디오 비밀번호를 확인해주세요</span>
  </div>
  <div class="form-group row" id="btn">
    <div class="col-sm-10">
      <button type="button" class="btn btn-danger"  id="loginBtn">로그인</button>
    </div>
  </div>
    <div class="form-group row">
    <div class="col-sm-10">
      <button type="button" class="btn btn-light"  id="joinBtn">회원가입</button>
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