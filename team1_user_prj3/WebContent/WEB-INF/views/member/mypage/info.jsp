<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="MypageMember"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 회원정보수정</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/main.css">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/mypageMenu.css">
<style type="text/css">

	/* container 시작 */
	#MainContainer{ width: 900px; min-height: 1800px; margin:0px auto; text-align: center;}
	#nav_Content{border-bottom: 1px solid #333; width: 700px;margin-left: 30px; margin-top: 10px}
	.container1{ max-width: 700px;width: 100%; padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;}
	.row1{display: flex;flex-wrap: wrap;}
	.navbar-brand{font-weight: bold;}
	.lately_td{ width : 160px}
	/* container 끝 */
	
	.clickColor a:hover{text-decoration: none;}
	
	/* 입력값 확인 */
	#pwEmptyWarn, #pwValidateWarn, #pwOkEmptyWarn, #pwOkWarn {color:#ff0000; font-size: 10px; font-weight: bold; display: none; border: 0px; background-color: #FFC7AD; background-color: rgba( 255, 255, 255, 0 ); padding-top: 0px;}
	#pwOk {color:#0000ff; font-size: 10px; font-weight: bold; display: none; border: 0px; background-color: #FFC7AD; background-color: rgba( 255, 255, 255, 0 ); padding-top: 0px;}
	
	#emailEmptyWarn, #emailValidateWarn, #emailOverlapWarn {color:#ff0000; font-size: 10px; font-weight: bold; display: none; border: 0px; background-color: #FFC7AD; background-color: rgba( 255, 255, 255, 0 ); padding-top: 0px;}
	#emailOk {color:#0000ff; font-size: 10px; font-weight: bold; display: none; border: 0px; background-color: #FFC7AD; background-color: rgba( 255, 255, 255, 0 ); padding-top: 0px;}
	
	#nameEmptyWarn, #nameValidateWarn {color:#ff0000; font-size: 10px; font-weight: bold; display: none; border: 0px; background-color: #FFC7AD; background-color: rgba( 255, 255, 255, 0 ); padding-top: 0px;}
	#nameOk {color:#0000ff; font-size: 10px; font-weight: bold; display: none; border: 0px; background-color: #FFC7AD; background-color: rgba( 255, 255, 255, 0 ); padding-top: 0px;}

</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	//var originPW = $("#inputPW").val();
	var originEmail = $("#inputEmail").val();
	var originName = $("#inputName").val();
	
	var pwChk = false;
	var emailChk = false;
	var nameChk = false;
			
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
	    if(inputPW != ""){
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
				 //$("#pwValidateWarn").show();
				 alert("8자 이상, 영문/숫자/특수문자 중 2가지 이상 입력해주세요.");
				 pwChk = false;
				return; 
			} else { 
				var inputPWOk = $("#inputPWOk").val();
				//비밀번호 확인 유무 확인
			    if(inputPWOk == ""){
			        //$("#pwOkEmptyWarn").show();
			        alert("비밀번호  확인도 입력 해주세요.");
			        pwChk = false;
				    return;
				} else {
				    if (inputPWOk != inputPW) {
			            alert("비밀번호  확인이 일치하지 않습니다.");
			            //$("#pwOkWarn").show();
			            pwChk = false;
			            return;
				    } else {
				    	//$("#pwOk").show();
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
	    if(inputPW != ""){
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
				 //$("#pwValidateWarn").show();
				 alert("8자 이상, 영문/숫자/특수문자 중 2가지 이상 입력해주세요.");
				 pwChk = false;
				return; 
			} else { 
				var inputPWOk = $("#inputPWOk").val();
				//비밀번호 확인 유무 확인
			    if(inputPWOk == ""){
			        //$("#pwOkEmptyWarn").show();
			        alert("비밀번호  확인도 입력 해주세요.");
			        pwChk = false;
				    return;
				} else {
				    if (inputPWOk != inputPW) {
			            alert("비밀번호  확인이 일치하지 않습니다.");
			            //$("#pwOkWarn").show();
			            pwChk = false;
			            return;
				    } else {
				    	//$("#pwOk").show();
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
	    if(inputEmail != ""){
		    var regExp =  /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		    if (!regExp.test(inputEmail)) {
			    //$("#emailValidateWarn").show();
			    alert("올바른 이메일 형식이 아닙니다.");
			    emailChk = false;
		    } else {
		    	//중복 확인
	    		var param = "inputEmail="+inputEmail;
		    	//alert(param);
	    		$.ajax({
	    			url:"/team1_user_prj3/member/email_chk.do",
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
	    			        //$("#emailOverlapWarn").show();
	    			        alert("이미 사용중인 이메일입니다.");
	    			        emailChk = false;
	    				} else {
	    			        //$("#emailOk").show();
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
	    if(inputName != ""){
			//유효성 확인
			if( inputName.replace(/[a-zA-Zㄱ-힣]/g,"") != "" ||
			    inputName.length < 2) { 
	            //$("#nameValidateWarn").show();
	            alert("2글자 이상의 이름을 정확히 입력해 주세요.");
	            nameChk = false;
	    	} else {
	    		//$("#nameOk").show();
	    		nameChk = true;
	    	}//end if else
		}//end if else
	}
	
	//$("#inputPW").focusout(chkPW);
	//$("#inputPWOk").focusout(chkPWOk);
	//$("#inputEmail").focusout(chkEmail);
	//$("#inputName").focusout(chkName);
	
	//수정 버튼 클릭
	$("#modifyBtn").click(function() {
		
		//alert(originPW);
		//alert(originEmail);
		//alert(originName);
		
		var flag = false;
		//pw 확인
	    alert("!!!1");
		if(!pwChk){
			//flag = true;
			chkPW();
			chkPWOk();
		}//end if
		//email 확인
		if(!emailChk){
			//flag = true;
			chkEmail();
		}//end if
		//name 확인
		if(!nameChk){
			//flag = true;
			chkName();
		}//end if
		alert("!!!2");
		
		alert(flag)
		if(!flag){
			alert("!!!");
			var params = $('#modifyFrm').serialize();
			alert(params); 
			
    		$.ajax({
    			url:"modify_process.do",
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
    				    alert("변경에 성공하였습니다.");
    				} else {
    				    alert("죄송합니다. 회원 가입 도중 문제가 발생하였습니다.");
    				}//end if 
    			}
    		});//ajax
		}//end if
	});//click
	
});
</script>
</head>	
<body>
<div id="books">
<!-- header 시작  -->		
<div id="header">
	<jsp:include page="../../../../common/jsp/jinibooks_header.jsp"/>
</div>
<!-- header 끝  -->	
<div id="booksContent" class="row" style="margin-top: 80px">

<!-- haside 시작  -->	
<div class="haside" class="col-4">
	<jsp:include page="../../../../common/jsp/jinibooks_mypageMenu.jsp"/>
</div>
<!-- haside 끝  -->

<!-- container 시작  -->	

<div id="MainContainer" class="col-8">

<nav class="navbar navbar-light" id="nav_Content">
  <span class="navbar-brand">
    <img src="http://localhost:8080/team1_user_prj3/common/images/images_mypage/mypage_person_icon.png" width="50" height="50" class="d-inline-block">
   회원정보 수정
  </span>
</nav>

<%-- <c:if test="${!result_flag}">
  <div>
  <form action="info.do" method="post">
  <div class="form-group row" style="margin-top: 30px; margin-left: 50px;">
    <input type="password" class="form-control" id="inputPW" name="inputPW" placeholder="비밀번호" style="width:300px;">
    <button type="button" class="btn btn-danger" id="loginBtn" style="margin-left: 10px;" onclick="submit()">확인</button>
  </div>
  </form>
  </div>
</c:if> --%>

<%-- <c:if test="${result_flag}"> --%>
<div id="login" style="width: 800px"><!-- 회원정보 수정 테이블 시작 -->
	<form class="loginFrm" id="modifyFrm">
		<table class="table table-bordered">
		    <tr>
		      <th width="200px">아이디</th>
		      <td width="500px"><input type="text" class="form-control" value="${memberInfo.id}" readonly="readonly" id="inputId" placeholder="아이디"></td>
		    </tr>
		    <tr>
		      <th>회원이름</th>
		      <td height=30px>
			    <div class="input-group mb-2" >
			      <input type="text" class="form-control" value="${memberInfo.name}" id="inputName" name="inputName" placeholder="이름" style="margin-right: 40px">
			      <button type="button" class="btn btn-outline-secondary btn-sm mb-2">회원탈퇴</button>
			    </div>
      <span class="form-control" id="nameEmptyWarn">이름을 입력해주세요.</span>
      <span class="form-control" id="nameValidateWarn">2글자 이상의 이름을 정확히 입력해 주세요.</span>
      <span class="form-control" id="nameOk">이름이 확인 되었습니다.</span>			    
		      </td>
		    </tr>
<!-- 		    <tr>
		      <th>전화번호</th>
		      <td><input type="text" class="form-control"  id="inputPhone" placeholder="전화번호"></td>
		    </tr> -->
		    <tr>
		      <th>이메일</th>
		      <td>
		        <input type="text" class="form-control" value="${memberInfo.email}" id="inputEmail" name="inputEmail" placeholder="이메일 주소">
		      </td>
      <span class="form-control" id="emailEmptyWarn">이메일을 입력해주세요.</span>
      <span class="form-control" id="emailValidateWarn">올바른 이메일 형식이 아닙니다.</span>
      <span class="form-control" id="emailOverlapWarn">이미 사용중인 이메일입니다.</span>
      <span class="form-control" id="emailOk">사용 가능한 이메일입니다.</span>		      
		    </tr>
		    <tr>
		      <th>비밀번호 변경</th>
		      <td>
		        <input type="password" class="form-control" id="inputPW" name="inputPW" placeholder="변경할 비밀번호">
		      </td>
      <span class="form-control" id="pwEmptyWarn">비밀번호를 입력해주세요.</span>
      <span class="form-control" id="pwValidateWarn">8자 이상, 영문/숫자/특수문자 중 2가지 이상 입력해주세요.</span>
      <span class="form-control" id="pwOkEmptyWarn">비밀번호를 재입력해주세요.</span>
      <span class="form-control" id="pwOkWarn">비밀번호가 일치하지 않습니다.</span>
      <span class="form-control" id="pwOk">사용 가능한 비밀번호입니다.</span>		      
		    </tr>
		    <tr>
		      <th>변경할 비밀번호 확인</th>
		      <td>
		        <input type="password" class="form-control" id="inputPWOk" name="inputPWOk" placeholder="변경할 비밀번호 확인">
		      </td>
		    </tr>
		    <tr>
		      <td colspan="2"><button type="button" class="btn btn-danger" id="modifyBtn">회원정보 수정</button></td>
		    </tr>
		</table>
	</form>
</div> <!-- 회원정보 수정 테이블 끝  -->
<%-- </c:if> --%>

</div>

<!-- container 끝  -->		
</div>  <!-- booksContent -->
<!-- footer 시작  -->	
<hr>
<div id ="footer">
  <jsp:include page="../../../../common/jsp/jinibooks_footer.jsp"/>
</div>
<!-- footer 끝  -->	
</div>

</body>
</html>
