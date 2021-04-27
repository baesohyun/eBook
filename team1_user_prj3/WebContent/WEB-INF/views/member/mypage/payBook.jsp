<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="마이페이지 구매/대여"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 구매/대여</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/main.css">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/mypageMenu.css">
<style type="text/css">

	/* container 시작 */
	#MainContainer{ width: 900px; min-height: 1800px; margin:0px auto; text-align: center;}
	#nav_Content{border-bottom: 1px solid #333; width: 980px;margin-left: 30px; margin-top: 30px; margin-bottom: 30px;}
	.container1{ max-width: 700px;width: 100%; padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;}
	.row1{display: flex;flex-wrap: wrap;}
	.navbar-brand{font-weight: bold;}
	.lately_td{ width : 160px}
	/* container 끝 */
	
	.clickColor a:hover{text-decoration: none;}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){

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
  내 서재
  </span>
</nav>
<!-- 검색부트스트립 시작 -->


<!-- 검색부트스트립 끝 -->

<div>
<div class="alert alert-success" role="alert" style="margin-top:30px;">
 대여 리스트
</div>
<c:if test="${empty selectRantal}">
	대여목록이 없습니다.
</c:if>
<div class="row row-cols-1 row-cols-md-4" >
 <c:forEach var="Rental" items="${selectRantal}">
  <div class="col mb-3" style="text-align: center">
	<c:set var ="i" value="${i+1}" />
    
    <div class="card-header" style="background-color: white; padding: 0px">
    <p><span class="badge badge-primary">대여 ${i}</span></p>
	 </div>
      <div class="card-body">
      
      <img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${Rental.img}" width="150px;" height="200px;"/>
		
        <small class="card-text">
        <br/>
		    <c:out value="${Rental.title}"/><br/>
			<c:out value="${Rental.author}"/><br/>
			<c:out value="${Rental.rental_start}"/>~<c:out value="${Rental.rental_end}"/><br/>
      </small>
      </div>

  </div>
 	</c:forEach>
</div><!--row row-cols-1 row-cols-md-3  -->
</div>
<div class="alert alert-success" role="alert" style="margin-top:30px; ">
	구매리스트
</div>
<c:if test="${empty selectPay}">
	구매목록이 없습니다.
</c:if>
<div class="row row-cols-1 row-cols-md-4" >
 <c:forEach var="Pay" items="${selectPay}">
  <div class="col mb-3" style="text-align: center;">
	<c:set var ="j" value="${j+1}" />
    <div class="card-header" style="background-color: white; padding: 0px">
    <p><span class="badge badge-primary">구매 ${j}</span></p>
	 </div>
      <div class="card-body">
      <img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${Pay.img}" width="150px;" height="200px;"/>
		
        <small class="card-text">
        <br/>
		    <c:out value="${Pay.title}"/><br/>
			<c:out value="${Pay.author}"/><br/>
      </small>
      </div>

  </div>
 	</c:forEach>
</div><!--row row-cols-1 row-cols-md-3  -->
</div>
</div>

<!-- 페이지 끝 -->
<!-- container 끝  -->			
</div>
<!-- footer 시작  -->	
<hr>
<div id ="footer">
  <jsp:include page="../../../../common/jsp/jinibooks_footer.jsp"/>
</div>
<!-- footer 끝  -->	
</div>

</body>
</html>
