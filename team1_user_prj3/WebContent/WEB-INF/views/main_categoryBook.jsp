<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="카테고리검색 페이지"
    %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 카테고리검색</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/main.css">
<style type="text/css">

	/* container 시작 */
	#nav_Content{border-bottom: 1px solid #333; width: 700px;margin-left: 30px; margin-top: 10px}
	.container1{ max-width: 700px;width: 100%; padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;}
	#searchContentHeader{border-bottom:2px solid #EE4137; height: 40px; padding-top:5px; margin-top: 30px}
	#bestbook_header{border-bottom: 3px solid #004080; margin-left: 15px; margin-top: 30px}
	#newbook_header{border-bottom: 3px solid #004080; margin-left: 15px; margin-top: 30px}
	#best_book_img{width:170px; height:200px; }
	#new_book_img{width:170px; height:200px;}
	
	#cateNew{margin-top: 40px; margin-bottom: 80px;}
	#cateBest{margin-top: 40px; margin-bottom: 80px;}
	#myTab{margin-top:30px}
	
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
	<jsp:include page="../../common/jsp/jinibooks_header.jsp"/>
</div>
<!-- header 끝  -->	
<div id="booksContent" class="row">

<!-- haside 시작  -->	
<div class="haside" class="col-4">
</div>
<!-- haside 끝  -->

<!-- container 시작  -->	
<div id="MainContainer" class="col-8">
<div id="searchContentHeader">
	<span style="margin-left: 30px;font-weight: bold; ">Home > <c:out value="${param.cate}"/></span>
</div>

<ul class="nav nav-tabs" id="myTab" role="tablist" >
  <li class="nav-item">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">베스트</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">신간도서</a>
  </li>
</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
  
<!-- 베스트셀러 시작 -->
<div id="bestbookTop" >
<div id="bestbook_header">
<font style="font-family: Sans-Serif; font-weight: bold; font-size: 27px; color: #004080">베스트셀러</font>
<span class="badge badge-info">베스트</span>
</div>
<div>
<div class="row row-cols-1 row-cols-md-4" id="cateBest">
  <c:forEach var="cateBest" items="${cateBestList}">
  <div class="col mb-3" style="text-align: center">
	<c:set var ="i" value="${i+1}" />
 	<c:if test='${cateBest.name.equals(param.cate)}'>
    
    <div class="card-header" style="background-color: white; padding: 0px">
    <p><span class="badge badge-danger">${i}</span></p>
	 </div>
      <div class="card-body">
      <a href="book_detail.do?code=${cateBest.bookCode}&cateCode=${cateBest.code}">
	      <img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${cateBest.img}" 
	      id="best_book_img" class="card-img-top" onerror="javascript:this.src='http://localhost:8080/team1_user_prj3/common/images/images_book/noImg.jpg'">
	   </a>
        <p class="card-title"><strong><c:out value="${cateBest.title}"/></strong></p>
        <small class="card-text">
		      <c:out value="${cateBest.author}"/><br/>
		      <hr/>
		       <c:choose>
		       <c:when test="${cateBest.saleClass eq 'p'}">
		         <p>판매 : <c:out value="${cateBest.salePrice}"/> 원</p>
		       </c:when>
		       <c:when test="${cateBest.saleClass eq 'r'}">
		         <p>대여 : <c:out value="${cateBest.rentalPrice}"/> 원</p>
		       </c:when>
		       <c:otherwise>
		        <p>판매 : <c:out value="${cateBest.salePrice}"/> 원<br/>
		        	대여 : <c:out value="${cateBest.rentalPrice}"/> 원</p>
		       </c:otherwise>
		      </c:choose>
      </small>
      </div>
    </c:if>
  </div>
 	</c:forEach>
</div><!--row row-cols-1 row-cols-md-3  -->
</div>
</div><!-- bestbookTop10 끝 -->
<!-- 베스트셀러 끝 -->
</div><!--전체-->
 <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
 
<!-- 신간도서 시작 -->
<div id="newbookTop" >
<div id="newbook_header">
<font style="font-family: Sans-Serif; font-weight: bold; font-size: 27px; color: #004080">신간도서</font>
<span class="badge badge-info">신간도서</span>
</div>
<div>
<div class="row row-cols-1 row-cols-md-4" id="cateNew">
  <c:forEach var="cateNew" items="${cateNewList}">
  <div class="col mb-3" style="text-align: center">
	<c:set var ="j" value="${j+1}" />
 	<c:if test='${cateNew.name.equals(param.cate)}'>
    <div class="card-header" style="background-color: white; padding: 0px">
    <p><span class="badge badge-danger">${j}</span></p>
	 </div>
      <div class="card-body">
      <a href="book_detail.do?code=${cateNew.bookCode}&cateCode=${cateNew.code}">
	      <img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${cateNew.img}" 
	      id="new_book_img" class="card-img-top" onerror="javascript:this.src='http://localhost:8080/team1_user_prj3/common/images/images_book/noImg.jpg'">
	   </a>
        <p class="card-title"><strong><c:out value="${cateNew.title}"/></strong></p>
       <small class="card-text">
		      <c:out value="${cateNew.author}"/><br/>
		      <hr/>
		       <c:choose>
		       <c:when test="${cateNew.saleClass eq 'p'}">
		         <p>판매 : <c:out value="${cateNew.salePrice}"/> 원</p>
		       </c:when>
		       <c:when test="${cateNew.saleClass eq 'r'}">
		         <p>대여 : <c:out value="${cateNew.rentalPrice}"/> 원</p>
		       </c:when>
		       <c:otherwise>
		        <p>판매 : <c:out value="${cateNew.salePrice}"/> 원<br/>
		        	대여 : <c:out value="${cateNew.rentalPrice}"/> 원</p>
		       </c:otherwise>
		      </c:choose>
      </small>
      </div>
    </c:if>
  </div>
 	</c:forEach>
</div><!--row row-cols-1 row-cols-md-3  -->
</div>

</div><!-- bestbookTop10 끝 -->
<!-- 주간 신간도서 끝 -->
 </div>
</div>
</div>
<!-- container 끝  -->		
</div>  <!-- booksContent -->
<!-- footer 시작  -->	
<hr>
<div id ="footer">
  <jsp:include page="../../common/jsp/jinibooks_footer.jsp"/>
</div>
<!-- footer 끝  -->	
</div>

</body>
</html>
