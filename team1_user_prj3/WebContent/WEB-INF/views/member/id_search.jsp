<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="아이디 찾기"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/main.css"/>
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
	#idLabel{font-size: 20px; font-weight: bold; font-family:san-serif; color: #dc3545; padding-left: 120px; padding-bottom: 30px}
	#inputEmail,#inputName,#idSearchBtn{width:320px}
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
	var emailChk = false;
	//var emailExistFlag = false;
	
	//이메일 유효성 검사
	var chkEmail = function() {
	    
		var inputEmail = $("#inputEmail").val().trim();
		//비어있는지 확인
	    if(inputEmail == ""){
	    	alert("이메일을 입력해주세요.");
	        emailChk = false;
			return;
		} else {
		    var regExp =  /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		    if (!regExp.test(inputEmail	)) {
		    	alert("올바른 이메일 형식이 아닙니다.");
			    emailChk = false;
		    } else {
		    	//유무 확인
	    		var param = "inputEmail="+inputEmail;
	    		$.ajax({
	    			url:"email_chk.do",
	    			type:"post",
	    			//async:false,
	    			data:param,
	    			dataType:"json",
	    			error:function(xhr){
	    				alert("서비스가 원활하지 못해 죄송합니다.1");
	    				emailChk = false;
	    				//console.log("에러코드: "+xhr.status);
	    				//console.log("에러메세지: "+xhr.statusText);
	    			},
	    			success:function(json_obj){
	    				var flag = json_obj.result_flag;
	    				if(!flag){
	    					alert("회원정보가 없습니다.");
	    			        emailChk = false;
	    				} else {
	    					//emailExistFlag = true;
	    					$.ajax({
				    			url:"id_search_process.do",
				    			type:"post",
				    			async:false,
				    			data:param,
				    			dataType:"json",
				    			error:function(xhr){
				    				alert("서비스가 원활하지 못해 죄송합니다.2");
				    				console.log("에러코드: "+xhr.status);
				    				console.log("에러메세지: "+xhr.statusText);
		    					},
		    					success:function(json_obj){
		    						var outputID = json_obj.outputID;
		    						//alert(outputID);
				    				if(outputID == ""){
				    				    alert("죄송합니다. 이메일 확인 도중 문제가 발생하였습니다.");
					                    emailChk = false;
				    				} else {
				    					var form = $('<form></form>');
				    				    form.attr('action','id_search_success.do');
				    				    form.attr('method','post');
				    				    form.appendTo('body');
				    				    var hiddenID= $("<input type='hidden' value="+outputID+" name='outputID'/>");
				    				    var hiddenEmail= $("<input type='hidden' value="+inputEmail+" name='inputEmail'/>");
				    				    form.append(hiddenID);
				    				    form.append(hiddenEmail);
				    				    form.submit();
				    				    //출처: https://devgwangpal.tistory.com/55 [흔한 코더의 필기장입니다 :)]
				    					
				    			        //location.replace("id_search_success.do");
					                    emailChk = true;
				    				}//end if
		    					}
		    				});//ajax
	    				}//end if else
	    			}
	    		});//ajax
	    		
	    		//if(emailExistFlag){
		    	//	
	    		//}//end if
		    	
		    }//end if else
			
		}//end if else
	}
	
	$("#idSearchBtn").click(function() {
        chkEmail();
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
   		<img src="http://localhost:8080/team1_user_prj3/common/images/header_logo.PNG" class="d-inline-block align-top" alt=""><span id="logo">JINI BOOKS</span>
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
	<label class="form-check-label" for="gridCheck1" id="idLabel">아이디 찾기</label>
	</div>
  <div class="form-group row">
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputEmail" name="inputEmail" placeholder="이메일주소">
      <input type="text" style="display: none;"/>
    </div>
  </div>
<!--   <div class="form-group row">
    <div class="col-sm-10">
      <input type="text" class="form-control"  id="inputName" placeholder="이름">
    </div>
  </div> -->
  <div class="form-group row">
    <div class="col-sm-10" id="btn">
      <button type="button" class="btn btn-danger" id="idSearchBtn">찾기</button>
    </div>
  </div>
</div>
<div style="padding-top: 10px">
  <hr color="#F58E69" width="400px"/>
  <span id="coment">이메일이 기억나지 않는다면 고객센터로 문의해주세요!</span><br/>
  <span id="coment2"><img src="http://localhost:8080/team1_user_prj3/common/images/images_join/join_phone.png">&nbsp;1588-1588</span>
  
  </div>
</form>
</div>
</div>
<!-- container 끝  -->		

</div>

</body>
</html>