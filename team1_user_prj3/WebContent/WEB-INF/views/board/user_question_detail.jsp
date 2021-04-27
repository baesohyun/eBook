<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="문의사항 상세"
    %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 상세</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/main.css"/>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/noticeMenu.css"/>
<style type="text/css">

	 #container{ margin-top: 80px}
	/* container 시작 */
	/* #container{ width: 1600px; min-height: 1000px; margin:0px auto; margin-top: 20px}
	
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
	
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
    $("#btn2").click(function () {
    	location.href="question.do"
	})//click
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
<div id="booksContent" class="row" style="margin-top: 80px">
<!-- container 시작  -->


<!-- 사이드메뉴바  -->
<jsp:include page="../../../common/jsp/jinibooks_noticeMenu.jsp"/>

<br/>
<div id="MainContainer" class="col-8">
<div id="Cwrap" >
<div style="font-size: 30px; font-weight: bold; margin-left: 250px; ">문의사항</div>
<br>
<div style="margin-left: 0px">
<div style="border-bottom: 1px solid #333;height: 30px; width: 600px;">
	<div style="float: left;width: 400px ">${ question_detail.subject }</div>
	<div style="float: left;width: 100px ;">${ fn:substring(question_detail.num,2,8) }번</div>
	<div style="float: left; width: 100px  ">${ question_detail.w_day }</div>
</div>
<div style="clear:both;  width: 600px; height: 200px; border-bottom: 1px solid #333" id="content">
${ question_detail.content }
</div>
<div style="clear:both;  width: 600px; height: 200px; border-bottom: 1px solid #333" id="content2">
${ question_detail.answer }
</div>
<br>
<div style="clear: both;">
<div style="margin-left: 280px">
<button type="button" id="btn2" class="btn btn-outline-primary btn-sm" style="width: 80px">목록</button>
</div>
<br>
</div>
<br>

</div>
</div><!-- Wrap끝 -->
</div><!-- MainContainer 끝  -->
</div><!-- bookContent 끝  -->

<!-- container 끝  -->		

<!-- footer 시작  -->	
<div id ="footer">
      <jsp:include page="../../../common/jsp/jinibooks_footer.jsp"/>
</div>
<!-- footer 끝  -->	
</div>

</body>
</html>