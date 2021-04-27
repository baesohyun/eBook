<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="회원가입"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/main.css"/>
<style type="text/css">
	#joinFormWrap{margin:0px auto; }
	/* 헤더 시작 */
	#header{ height: 150px; position:relative; background: #FFFFFF;}
	#hLogo_userJoin{width:225px;height: 80px; margin:10px auto; margin-top:20px; text-align: center; }
	#logo{font-size: 30px; font-weight: bold; color: #EE4137; margin: 10px}
	/* 헤더 끝 */
	/* container 시작 */
	#JoinFormContainer{position:relative; background-color: #FFC7AD; margin: 0px auto; min-height: 100vh;}
	.loginFrm{width:600px; height:400px; margin: 0px auto;}
	#login{padding-top: 50px; margin: 0px auto;}
	#login_Input{padding-left:140px;margin-top: 20px;}
	.joinFrm{width:300px; margin: 0px auto;}
	#join{padding-top: 50px; margin: 0px auto;}
	#join_Input{margin-top: 20px;}
	#inputID,#inputPW,#inputPWOk,#inputEmail,#inputPhone,#inputName,#inputBirthYear{width:300px;}
	#inputData{padding-bottom: 10px}
	#inputData2{padding-top: 20px; width:400px; height: 240px}
	#inputBirthYear{width:150px}
	#genderData{padding-right: 10px; margin-left: 10px}
	#btn{padding-top: 40px; margin: 0px auto; }
	#noAgreeBtn{width:95px; margin-right: 15px}
	#joinBtn{width:130px}
	
	#agree{margin-bottom: 5px; margin-top: 10px; padding-top: 8px}
	#agreeLabel{font-size: 14px;}
	#term1{font-size: 13px; margin-left: 103px; }
	#term2{font-size: 13px; margin-left: 40px; }
	#term3{font-size: 13px; margin-left: 33px; }
	
	/* 입력값 확인 */
	#idEmptyWarn, #idValidateWarn, #idOverlapWarn {color:#ff0000; font-size: 10px; font-weight: bold; display: none; border: 0px; background-color: #FFC7AD; background-color: rgba( 255, 255, 255, 0 ); padding-top: 0px;}
	#idOk {color:#0000ff; font-size: 10px; font-weight: bold; display: none; border: 0px; background-color: #FFC7AD; background-color: rgba( 255, 255, 255, 0 ); padding-top: 0px;}
	
	#pwEmptyWarn, #pwValidateWarn, #pwOkEmptyWarn, #pwOkWarn {color:#ff0000; font-size: 10px; font-weight: bold; display: none; border: 0px; background-color: #FFC7AD; background-color: rgba( 255, 255, 255, 0 ); padding-top: 0px;}
	#pwOk {color:#0000ff; font-size: 10px; font-weight: bold; display: none; border: 0px; background-color: #FFC7AD; background-color: rgba( 255, 255, 255, 0 ); padding-top: 0px;}
	
	#emailEmptyWarn, #emailValidateWarn, #emailOverlapWarn {color:#ff0000; font-size: 10px; font-weight: bold; display: none; border: 0px; background-color: #FFC7AD; background-color: rgba( 255, 255, 255, 0 ); padding-top: 0px;}
	#emailOk {color:#0000ff; font-size: 10px; font-weight: bold; display: none; border: 0px; background-color: #FFC7AD; background-color: rgba( 255, 255, 255, 0 ); padding-top: 0px;}
	
	#nameEmptyWarn, #nameValidateWarn {color:#ff0000; font-size: 10px; font-weight: bold; display: none; border: 0px; background-color: #FFC7AD; background-color: rgba( 255, 255, 255, 0 ); padding-top: 0px;}
	#nameOk {color:#0000ff; font-size: 10px; font-weight: bold; display: none; border: 0px; background-color: #FFC7AD; background-color: rgba( 255, 255, 255, 0 ); padding-top: 0px;}

	#birthYearValidateWarn {color:#ff0000; font-size: 10px; font-weight: bold; display: none; border: 0px; background-color: #FFC7AD; background-color: rgba( 255, 255, 255, 0 ); padding-top: 0px;}
	#birthYearOk {color:#0000ff; font-size: 10px; font-weight: bold; display: none; border: 0px; background-color: #FFC7AD; background-color: rgba( 255, 255, 255, 0 ); padding-top: 0px;}

	#agreementWarn {color:#ff0000; font-size: 10px; font-weight: bold; display: none; border: 0px; background-color: #FFC7AD; background-color: rgba( 255, 255, 255, 0 ); padding-top: 0px;}
	/* container 끝 */
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	var idChk = false;
	var pwChk = false;
	var emailChk = false;
	var nameChk = false;
	var birthYearChk = false;
	
	//입력 받은 ID확인
	var chkID = function() {
		if($("#idEmptyWarn").is(':visible') == true ){
	        $("#idEmptyWarn").hide();
	    }//end if
		if($("#idValidateWarn").is(':visible') == true ){
	        $("#idValidateWarn").hide();
	    }//end if
	    if($("#idOverlapWarn").is(':visible') == true ){
	        $("#idOverlapWarn").hide();
	    }//end if
	    if($("#idOk").is(':visible') == true ){
	        $("#idOk").hide();
	    }//end if
	    
		var inputID = $("#inputID").val().trim();
		//비어있는지 확인
	    if(inputID == ""){
	        $("#idEmptyWarn").show();
	        idChk = false;
			return;
		} else {
			//유효성 확인
	    	if (inputID.replace(/[a-z0-9]/g,"") != "" 
	    			|| !(5 <= inputID.length && inputID.length <= 20)) {
	            $("#idValidateWarn").show();
	            idChk = false;
	    		return;
	    	} else {
	    		//중복 확인
	    		var param = "inputID="+inputID;
	    		$.ajax({
	    			url:"id_chk.do",
	    			type:"post",
	    			data:param,
	    			dataType:"json",
	    			error:function(xhr){
	    				alert("서비스가 원활하지 못해 죄송합니다.");
	    				idChk = false;
	    				//console.log("에러코드: "+xhr.status);
	    				//console.log("에러메세지: "+xhr.statusText);
	    			},
	    			success:function(json_obj){
	    				var flag = json_obj.result_flag;
	    				if(flag){
	    			        $("#idOverlapWarn").show();
	    			        idChk = false;
	    				} else {
	    			        $("#idOk").show();
	    			        idChk = true;
	    				}//end if else
	    			}
	    		});//ajax
	    		
	    	}//end if else
		}//end if else
	}
			
	//비밀번호 입력 확인
	var chkPW = function() {
		if($("#pwEmptyWarn").is(':visible') == true ){
	        $("#pwEmptyWarn").hide();
	    }//end if
		if($("#pwValidateWarn").is(':visible') == true ){
	        $("#pwValidateWarn").hide();
	    }//end if
		if($("#pwOkEmptyWarn").is(':visible') == true ){
	        $("#pwOkEmptyWarn").hide();
	    }//end if
		if($("#pwOkWarn").is(':visible') == true ){
	        $("#pwOkWarn").hide();
	    }//end if
	    if($("#pwOk").is(':visible') == true ){
	        $("#pwOk").hide();
	    }//end if
	    
		var inputPW = $("#inputPW").val();
		//비어있는지 확인
	    if(inputPW == ""){
	        $("#pwEmptyWarn").show();
	        pwChk = false;
			return;
		} else {
			//유효성 확인
			/* alert("PW: "+inputPW);
			var temp = inputPW.replace(/[^a-zA-Z0-9]/g,"");
			alert("모두: "+temp.replace(/[a-zA-Z0-9]/g,""));
			alert("영어: "+inputPW.replace(/[a-zA-Z]/g,""));
			alert("숫자: "+inputPW.replace(/[0-9]/g,""));
			alert("특수: "+inputPW.replace(/[^a-zA-Z0-9]/g,"")); */
			
			var temp = inputPW.replace(/[^a-zA-Z0-9]/g,"");
			if( temp.replace(/[a-zA-Z0-9]/g,"") != "" ||
			    inputPW.replace(/[a-zA-Z]/g,"") == "" ||
			    inputPW.replace(/[0-9]/g,"") == "" || 
			    inputPW.replace(/[^a-zA-Z0-9]/g,"") == "" || 
			    inputPW.length < 8) { 
				 $("#pwValidateWarn").show();
				 pwChk = false;
				return; 
			} else { 
				var inputPWOk = $("#inputPWOk").val();
				//비밀번호 확인 유무 확인
			    if(inputPWOk == ""){
			        $("#pwOkEmptyWarn").show();
			        pwChk = false;
				    return;
				} else {
				    if (inputPWOk != inputPW) {
			            $("#pwOkWarn").show();
			            pwChk = false;
			            return;
				    } else {
				    	$("#pwOk").show();
				    	pwChk = true;
				    }//end if
			  }//end if else
		   }//end if else
		 }//end if else
	}
	
	//비밀번호 재입력 확인
	var chkPWOk = function() {
		if($("#pwEmptyWarn").is(':visible') == true ){
	        $("#pwEmptyWarn").hide();
	    }//end if
		if($("#pwValidateWarn").is(':visible') == true ){
	        $("#pwValidateWarn").hide();
	    }//end if
		if($("#pwOkEmptyWarn").is(':visible') == true ){
	        $("#pwOkEmptyWarn").hide();
	    }//end if
		if($("#pwOkWarn").is(':visible') == true ){
	        $("#pwOkWarn").hide();
	    }//end if
	    if($("#pwOk").is(':visible') == true ){
	        $("#pwOk").hide();
	    }//end if
	    
		var inputPW = $("#inputPW").val();
		//비어있는지 확인
	    if(inputPW == ""){
	        $("#pwEmptyWarn").show();
	        pwChk = false;
			return;
		} else {
			//유효성 확인
			var temp = inputPW.replace(/[^a-zA-Z0-9]/g,"");
			if( temp.replace(/[a-zA-Z0-9]/g,"") != "" ||
			    inputPW.replace(/[a-zA-Z]/g,"") == "" ||
			    inputPW.replace(/[0-9]/g,"") == "" || 
			    inputPW.replace(/[^a-zA-Z0-9]/g,"") == "" || 
			    inputPW.length < 8) { 
				 $("#pwValidateWarn").show();
				 pwChk = false;
				return; 
			} else { 
				var inputPWOk = $("#inputPWOk").val();
				//비밀번호 확인 유무 확인
			    if(inputPWOk == ""){
			        $("#pwOkEmptyWarn").show();
			        pwChk = false;
				    return;
				} else {
				    if (inputPWOk != inputPW) {
			            $("#pwOkWarn").show();
			            pwChk = false;
				    } else {
				    	$("#pwOk").show();
				    	pwChk = true;
				    }//end if
			  }//end if else
		   }//end if else
		 }//end if else
	}
			
	//이메일 유효성 검사
	var chkEmail = function() {
	    if($("#emailEmptyWarn").is(':visible') == true ){
	        $("#emailEmptyWarn").hide();
	    }//end if
	    if($("#emailValidateWarn").is(':visible') == true ){
	        $("#emailValidateWarn").hide();
	    }//end if
	    if($("#emailOverlapWarn").is(':visible') == true ){
	        $("#emailOverlapWarn").hide();
	    }//end if
	    if($("#emailOk").is(':visible') == true ){
	        $("#emailOk").hide();
	    }//end if
	    
		var inputEmail = $("#inputEmail").val().trim();
		//비어있는지 확인
	    if(inputEmail == ""){
	        $("#emailEmptyWarn").show();
	        emailChk = false;
			return;
		} else {
		    var regExp =  /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		    if (!regExp.test(inputEmail	)) {
			    $("#emailValidateWarn").show();
			    emailChk = false;
		    } else {
		    	//중복 확인
	    		var param = "inputEmail="+inputEmail;
	    		$.ajax({
	    			url:"email_chk.do",
	    			type:"post",
	    			data:param,
	    			dataType:"json",
	    			error:function(xhr){
	    				alert("서비스가 원활하지 못해 죄송합니다.");
	    				emailChk = false;
	    				//console.log("에러코드: "+xhr.status);
	    				//console.log("에러메세지: "+xhr.statusText);
	    			},
	    			success:function(json_obj){
	    				var flag = json_obj.result_flag;
	    				if(flag){
	    			        $("#emailOverlapWarn").show();
	    			        emailChk = false;
	    				} else {
	    			        $("#emailOk").show();
	    			        emailChk = true;
	    				}//end if else
	    			}
	    		});//ajax
		    	
		    }//end if else
			
		}//end if else
	}
		
	//이름 확인
	var chkName = function() {
		if($("#nameEmptyWarn").is(':visible') == true ){
	        $("#nameEmptyWarn").hide();
	    }//end if
		if($("#nameValidateWarn").is(':visible') == true ){
	        $("#nameValidateWarn").hide();
	    }//end if
	    if($("#nameOk").is(':visible') == true ){
	        $("#nameOk").hide();
	    }//end if
	    
		var inputName = $("#inputName").val().trim();
		//비어있는지 확인
	    if(inputName == ""){
	        $("#nameEmptyWarn").show();
	        nameChk = false;
			return;
		} else {
			//유효성 확인
			if( inputName.replace(/[a-zA-Zㄱ-힣]/g,"") != "" ||
			    inputName.length < 2) { 
	            $("#nameValidateWarn").show();
	            nameChk = false;
	    	} else {
	    		$("#nameOk").show();
	    		nameChk = true;
	    	}//end if else
		}//end if else
	}
	
	//출생년도 확인
	var chkBirthYear = function() {
		if($("#birthYearValidateWarn").is(':visible') == true ){
	        $("#birthYearValidateWarn").hide();
	    }//end if
	    if($("#birthYearOk").is(':visible') == true ){
	        $("#birthYearOk").hide();
	    }//end if
	    
		var inputBirthYear = $("#inputBirthYear").val().trim();
		//유효성 확인
		if(inputBirthYear != ""){
			if(inputBirthYear.replace(/[0-9]/g,"") != "") { 
	            $("#birthYearValidateWarn").show();
	            birthYearChk = false;
	    	} else {
	    		var thisYear = new Date().getFullYear();
	    		if(!((thisYear-100) < inputBirthYear && inputBirthYear < thisYear)){
		            $("#birthYearValidateWarn").show();
		            birthYearChk = false;
	    		} else {
	   	    		$("#birthYearOk").show();
	   	    		birthYearChk = true;
	    		}//end if else
	    	}//end if else
		}//end if
	
	}
	
	//약관 동의
	$("#customCheckAll").click(function() {
		var chkAll = document.joinFrm.chkAll;
		var chk = document.joinFrm.chkAgreement;
		for (i = 0; i < chk.length; i++){
			if(chkAll.checked){
				chk[i].checked = true ;
			}else{
				chk[i].checked = false ;
			}//end if else
		}//end for
	});
	
	$("#inputID").focusout(chkID);
	$("#inputPW").focusout(chkPW);
	$("#inputPWOk").focusout(chkPWOk);
	$("#inputEmail").focusout(chkEmail);
	$("#inputName").focusout(chkName);
	$("#inputBirthYear").focusout(chkBirthYear);
	
	$("#joinBtn").click(function() {
		var flag = false;
		//id 확인
		if(!idChk){
			flag = true;
			chkID();
		}//end if
		//pw 확인
		if(!pwChk){
			flag = true;
			chkPW();
			chkPWOk();
		}//end if
		//email 확인
		if(!emailChk){
			flag = true;
			chkEmail();
		}//end if
		//name 확인
		if(!nameChk){
			flag = true;
			chkName();
		}//end if
		//출생년도 확인
		if($("#inputBirthYear").val() != ""){
			if(!birthYearChk){
				flag = true;
				chkBirthYear();
			}//end if
	    }//end if
		//약관 확인
		var chk = document.joinFrm.chkAgreement;
		for (i = 0; i < chk.length; i++){
			if(!chk[i].checked){
				flag = true;
				alert("약관에 모두 동의해주세요.");
				break;
				//$("#agreementWarn").show();
			}//end if
		}//end for
		
		if(!flag){
			var params = $('#joinFrm').serialize();
			//alert(params);
			params = params.replace("&inputBirthYear=&","&inputBirthYear=0&");
			//alert(params); 
			
    		$.ajax({
    			url:"join_process.do",
    			type:"post",
    			data:params,
    			dataType:"json",
    			error:function(xhr){
    				alert("서비스가 원활하지 못해 죄송합니다.");
    				//console.log("에러코드: "+xhr.status);
    				//console.log("에러메세지: "+xhr.statusText);
    			},
    			success:function(json_obj){
    				if(json_obj.joinFlag){
    			       location.replace("join_success.do");
    				} else {
    				    alert("죄송합니다. 회원 가입 도중 문제가 발생하였습니다.");
    				}//end if 
    			}
    		});//ajax
		}//end if
	});//click

	//라디오 버튼 선택 해제
	$("input[type=radio]").each(function(){
	    var chk = $(this).is(":checked");
	    var name = $(this).attr('name');
	    if(chk == true) $("input[name='"+name+"']").data("previous",$(this).val());
	});

	$("input[type=radio]").click(function(){
	    var pre = $(this).data("previous");
	    var chk = $(this).is(":checked");
	    var name = $(this).attr('name');
	    if(chk == true && pre == $(this).val()){
	        $(this).prop('checked',false);
	        $("input[name='"+name+"']").data("previous",'');
	    }else{
	        if(chk == true) $("input[name='"+name+"']").data("previous",$(this).val());
	    }//end if else
	});
	//출처: https://landzz.com/129 [landzz's brain laundry]
	
});
</script>
</head>	
<body>
<div id="joinFormWrap">
<!-- header 시작  -->		
<div id="header" style="height: 45px;">
	<div id="hLogo_userJoin" style="height: 45px;">
   		<img src="http://localhost:8080/team1_user_prj3/common/images/header_logo.PNG" class="d-inline-block align-top" alt=""><span id="logo">JINI BOOKS</span>
	</div>
</div>
<!-- header 끝  -->
<!-- container 시작  -->	
<div id="JoinFormContainer">
<div id="join" class="joinFrm">
<form name="joinFrm" id="joinFrm" action="join_process.do" method="post">
<div id="join_Input">
  <div class="form-group row"  id="inputData">
    <div class="col-sm-12">
      <input type="text" class="form-control" id="inputID" name="inputID" placeholder="아이디"/>
      <span class="form-control" id="idEmptyWarn">아이디를 입력해주세요.</span>
      <span class="form-control" id="idValidateWarn">5~20자의 영문 소문자와 숫자로만 입력해주세요.</span>
      <span class="form-control" id="idOverlapWarn">이미 사용중인 아이디입니다.</span>
      <span class="form-control" id="idOk">사용 가능한 아이디입니다.</span>
    </div>
  </div>
  <div class="form-group row" id="inputData">
    <div class="col-sm-12">
      <input type="password" class="form-control"  id="inputPW" name="inputPW"placeholder="비밀번호"/>
      <input type="password" class="form-control"  id="inputPWOk" name="inputPWOk" placeholder="비밀번호 확인"/>
      <span class="form-control" id="pwEmptyWarn">비밀번호를 입력해주세요.</span>
      <span class="form-control" id="pwValidateWarn">8자 이상, 영문/숫자/특수문자 중 2가지 이상 입력해주세요.</span>
      <span class="form-control" id="pwOkEmptyWarn">비밀번호를 재입력해주세요.</span>
      <span class="form-control" id="pwOkWarn">비밀번호가 일치하지 않습니다.</span>
      <span class="form-control" id="pwOk">사용 가능한 비밀번호입니다.</span>
    </div>
  </div>
  <div class="form-group row" id="inputData">
    <div class="col-sm-12">
      <input type="email" class="form-control" id="inputEmail" name="inputEmail" placeholder="이메일 주소"/>
      <span class="form-control" id="emailEmptyWarn">이메일을 입력해주세요.</span>
      <span class="form-control" id="emailValidateWarn">올바른 이메일 형식이 아닙니다.</span>
      <span class="form-control" id="emailOverlapWarn">이미 사용중인 이메일입니다.</span>
      <span class="form-control" id="emailOk">사용 가능한 이메일입니다.</span>
    </div>
  </div>
<!--   <div class="form-group row" id="inputData">
    <div class="col-sm-12">
      <input type="text" class="form-control"  id="inputPhone" name="inputPhone" placeholder="핸드폰 번호"/>
    </div>
  </div> -->
  <div class="form-group row" id="inputData">
    <div class="col-sm-12">
      <input type="text" class="form-control" id="inputName" name="inputName" placeholder="이름"/>
      <span class="form-control" id="nameEmptyWarn">이름을 입력해주세요.</span>
      <span class="form-control" id="nameValidateWarn">2글자 이상의 이름을 정확히 입력해 주세요.</span>
      <span class="form-control" id="nameOk">이름이 확인 되었습니다.</span>
    </div>
  </div>
  <div class="form-group row" id="inputData">
    <div style="position: relative; width: 100%; padding-right: 15px; padding-left: 15px;">
    <!-- <div class="col-sm-10"> -->
      <label>선택입력</label>
      <div class="form-row align-items-center">
    	<div class="col-auto my-1" style="float: left;">
          <input type="text" class="form-control mr-sm-2"  id="inputBirthYear" name="inputBirthYear" placeholder="출생년도"/>
	      <!-- 
	      <select class="custom-select mr-sm-2" id="inputBirthYear">
	        <option selected>출생년도</option>
	        <option value="1">One</option>
	        <option value="2">Two</option>
	        <option value="3">Three</option>
	      </select>
	      -->
	  
   	 	</div>
   	 	<!-- 
	    <div class="custom-control custom-radio" id="genderData">
		  <input type="radio" id="gender" name="customRadio" class="custom-control-input">
		  <label class="custom-control-label" for="customRadio1">남</label>
		</div>
		<div class="custom-control custom-radio" id="genderData">
		  <input type="radio" id="gender" name="customRadio" class="custom-control-input">
		  <label class="custom-control-label" for="customRadio2">여</label>
		</div>
		-->
		<div style="width: 140px; float: left;">
		<div class="custom-control custom-radio custom-control-inline" style="margin-left: 21px; margin-right: -10px;">
          <input type="radio" id="customRadioInline1" name="gender" value="m" class="custom-control-input">
          <label class="custom-control-label" for="customRadioInline1">남</label>
        </div>
		<div class="custom-control custom-radio custom-control-inline" style="margin-left: 21px; margin-right: -10px;">
		  <input type="radio" id="customRadioInline2" name="gender" value="f" class="custom-control-input">
		  <label class="custom-control-label" for="customRadioInline2">여</label>
		</div>
		</div>
		  <span class="form-control" id="birthYearValidateWarn">정확히 입력해주세요.</span>
	      <span class="form-control" id="birthYearOk">출생년도가 확인 되었습니다.</span>
		<div>
		</div>
    </div>
  </div>
  </div>
  <div class="form-group row" id="inputData2">
    <div class="col-sm-12" style="border:1px solid #808080; flex: 0 0 83.333333%; max-width: 83.333333%;" >
    <div class="custom-control custom-checkbox" id="agree">
  		<input type="checkbox" class="custom-control-input" id="customCheckAll" name="chkAll"/>
  		<label class="custom-control-label" for="customCheckAll"><span style="font-weight: bold">전체 약관 동의</span></label>
	</div>
	<hr/>
    <div class="custom-control custom-checkbox" id="agree">
  		<input type="checkbox" class="custom-control-input" id="customCheck1" name="chkAgreement"/>
  		<label class="custom-control-label" for="customCheck1"><span id="agreeLabel">이용 약관 동의</span></label>
  		<a href="javascript:void(window.open('terms_of_use.do', '이용 약관','width=#, height=#'))">
  		    <span id="term1">약관 보기</span>
  		</a>
	</div>
    <div class="custom-control custom-checkbox" id="agree">
  		<input type="checkbox" class="custom-control-input" id="customCheck2" name="chkAgreement"/>
  		<label class="custom-control-label" for="customCheck2"><span id="agreeLabel">개인 정보 처리 방침 동의</span></label>
  		<a href="javascript:void(window.open('privacy.do', '개인 정보 처리 방침','width=#, height=#'))">
  		    <span id="term2">약관 보기</span>
  		</a>
	</div>
    <div class="custom-control custom-checkbox" id="agree">
  		<input type="checkbox" class="custom-control-input" id="customCheck3" name="chkAgreement"/>
  		<label class="custom-control-label" for="customCheck3"><span id="agreeLabel">개인 정보 제3자 제공 동의</span></label>
  		<a href="javascript:void(window.open('privacy.do', '개인 정보 처리 방침','width=#, height=#'))">
  		    <span id="term3">약관 보기</span>
  		</a>
	</div>
	<!-- 새창으로 띄우기 [출처] 새창 띄우는 방법들과 제어|작성자 곰구리 -->
    </div>
    <!-- <span class="form-control" id="agreementWarn">약관에 모두 동의해주세요.</span> -->	
  </div>
  <div class="form-group row" id="inputData">
    <div class="col-sm-12" style="flex: 0 0 83.333333%; max-width: 83.333333%; text-align: center;" id="btn">
      <!-- <input type="button" class="btn btn-outline-danger" id="noAgreeBtn" value="동의 안함"/> -->
      <input type="button" class="btn btn-danger" id="joinBtn" value="회원 가입 완료"/>
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