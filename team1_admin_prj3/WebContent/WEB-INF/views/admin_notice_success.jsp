<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    session="true"
    isELIgnored="false"
    %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
 	request.setCharacterEncoding("UTF-8");  //request.setCharacterEncoding ->POST 방식에서만 적용된다.
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/jsp_prj/common/css/main.css"/>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_admin_prj3/common/css/admin_main_design.css"/>
<style type="text/css">
   #books{ width: 1200px; height: 1150px; margin: 0px auto;}
   /* 헤더 시작 */   
   #header{ width: 1200px; height: 200px; position: relative; background: #F58E69}
   /* #hLogo{ width: 84px; height: 84px; position: absolute; top:10px; left: 50px; } */
   #hContent{ width: 1100px; height: 90px; padding-top:10px; position: absolute;  top:20px; left: 50px; }
   #naviBar{ height: 80px; top: 120px;/* position: absolute;  top: 100px; */}
   
   #hTitle{ font-family: '고딕'; font-size: 30px; font-weight: bold; color: #FFFFFF}
   /* 헤더 끝 */
   
   /* 컨테이너 시작 */
   #container{ height: 800px; }
   
   #snb{ float: left; width: 200px; height: 800px; background: #F08060; }
   #snb-header{ width: 200px; height: 200px; }
   #snb-header-img{ width: 200px; height: 170px; }
   #snb-header-txt{ width: 200px; height: 30px; text-align: center; }
   #snb-menu{ width: 200px; height: 585px; margin-top: 15px; text-align: center; }
   
   #content{ float: right; width:1000px; height: 800px; padding: 20px; overflow: scroll}

   /* 컨테이너 끝 */
   
   /* 푸터 시작 */
   #footer {height: 150px;background-color: #FFEBE3;}
/* #fLogo{ width: 180px; height: 130px; padding-top: 20px; padding-left: 20px; float: left;}	 */
	#fContent {width: 670px; height: 110px; padding-top: 40px; padding-left: 30px; float: center;}
	#fContentInfo{ height: 150px; font-size: 13px;padding-left:80px ;/*margin-top:15px;*/  }
   
   /* 푸터 끝 */
   
   	#notice{ font-size: 30px; font-weight: bold;}
   
   
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="text/javascript">
$(function() {
    $("#btn2").click(function () {
    	location.href="notice.do"
	})//click
});//ready
</script>
</head>
<body>
<div id="books">

<div id="header">

<%@ include file="../../common/jsp/admin_include_header.jsp" %>
   
</div>

<div id="container">

<div id="snb">

 <%@ include file="../../common/jsp/admin_include_snb_ebook_wc.jsp" %>
 
</div>  <!-- snb 끝  위에 ● 부분에 목록 넣으세요-->

<div id="content">

<div id="Wrap" style="width: 660px;  float: left; ">

<div id="notice" style="text-align: center; margin-left: 110px; margin-top: 180px; ">작업이 성공했습니다.</div><br>
<button type="button" id="btn2" class="btn btn-outline-primary btn-sm" style="width: 80px; margin-left: 320px;">목록</button>
  </div>
</div><!-- Wrap끝 -->

</div><!-- content 끝 -->





</div> <!-- container 끝 -->


<div id="footer">

		 <%@ include file="../../common/jsp/admin_include_footer.jsp" %>

</div>
</div>
</body>
</html>