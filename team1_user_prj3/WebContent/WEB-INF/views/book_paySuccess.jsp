<%@ page language="java" contentType="text/html; charset=UTF-8"
 	pageEncoding="UTF-8"
 	info="책 구매 완료 창"
 	%>
 <%
	String id=(String)session.getAttribute("user_id");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료 페이지</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/main.css"/>
<style type="text/css">
	 
	/* container 시작 */
	#container{ width: 900px; min-height: 700px; margin:0px auto;}
	
	#orderComplete{margin-top: 100px; height: 550px; text-align: center}
	#orderMessage{font-size: 25px; font-weight: bold; font-family: san-serif; }
	#orderMessage,#orderMessage2{margin-bottom: 50px; margin-top: 30px}
	#mainBtn,#myPageBtn{margin: 0px auto; margin-left: 30px; margin-top:30px; width: 150px; height: 50px}
	/* container 끝 */
	
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	$("#mainBtn").click(function(){
		location.href="home.html";
	});//click
	$("#myPageBtn").click(function(){
		location.href="/team1_user_prj3/member/mypage/pay_book.do?id=<%=id%>";
	})

});
</script>
</head>	
<body>
<div id="books">
<!-- header 시작  -->		
<div id="header">
	<jsp:include page="../../common/jsp/jinibooks_header.jsp"/>
</div>
<!-- header 끝  -->	

<!-- container 시작  -->	
<div id="container">
	<div class="jumbotron" id="orderComplete">
		<img src="http://localhost:8080/team1_user_prj3/common/images/images_order/order_success.png">
	  <div id="orderMessage">구매가 완료되었습니다.</div>
	  <hr class="my-4">
	  <div id="orderMessage2">지금 바로 JINI BOOKS 에서 읽어보세요!</div>
		  <button type="button" class="btn btn-danger" id="mainBtn">메인으로</button>
		  <button type="button" class="btn btn-success" id="myPageBtn">마이페이지</button>
	</div>
</div>
<!-- container 끝  -->		

<hr>
<!-- footer 시작  -->	
<div id ="footer">
    <jsp:include page="../../common/jsp/jinibooks_footer.jsp"/>
</div>
<!-- footer 끝  -->	
</div>

</body>
</html>
    