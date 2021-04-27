<%@page import="kr.co.jinibooks.domain.newBookDomain"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="이달의 시간 캘린더"
 %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
 	request.setCharacterEncoding("UTF-8");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이달의 신간 페이지</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/main.css"/>
<style type="text/css">
	
	/* aside시작 */
	.haside{position:fixed;  margin-top: 80px; top:170px; right: 30px; text-align: center;font-weight: normal;font-size:13px; width: 130px; } 
	/* aside끝 */
	 
	/* container 시작 */
	#container{ width: 900px; min-height: 1000px; margin:0px auto; margin-top: 80px; margin-bottom: 70px}
	
	#newBookLabel{margin-bottom: 10px; font-size: 22px; font-weight: bold;}
	#bookCard{max-width: 400px; min-height: 200px; padding: 10px;}
	#card{margin-top: 50px; margin-bottom: 80px}
	#bookImg{margin-top: 10px;}
	#bookintro{font-size: 13px}
	/* container 끝 */

	
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

<!-- container 시작  -->	
<div id="container" >
    <div class="alert alert-danger" role="alert" style="text-align: center; border:1px solid #e16f68">
 		<label class="form-check-label" for="gridCheck1" id="newBookLabel">이달의 신간 도서</label>
	</div>
    <hr/>
	
<c:forEach var="newData" items="${newbookData}">
    	<div class="card mb-3"  id="bookCard" style="max-width: 900px; ">
		  <div class="row no-gutters">
		    <div class="col-md-4" id="bookImg" >
		    	<div style="width:250px; padding-left: 30px">
		  	<a href="book_detail.do?code=${newData.book_code}&cateCode=${newData.code}">
		      	<img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${newData.img}" class="card-img"  height="300px" onerror="javascript:this.src='http://localhost:8080/team1_user_prj3/common/images/images_book/noImg.jpg'">
		    	</a>
		    	</div>
		    </div>
		    <div class="col-md-8" >
		      <div class="card-body" id="bookintro">
		        	<h5 class="card-title"><strong><c:out value="${newData.title}"/></strong></h5>
		        	[<c:out value="${newData.name}"/>]
		        	<hr/>
		        	<p class="card-text">
		        		<c:out value="${newData.intro}"/>
		        	</p>
		        	<p class="card-text">
			        	<small class="text-muted">
			        		저자 : <c:out value="${newData.author}"/>  | 출판사 : <c:out value="${newData.company}"/> | 
						</small>
			        		<c:if test="${newData.sale_state eq 'y'}">
						        <c:choose>
						        <c:when test="${newData.sale_class eq 'p' }">
							        <small class="text-muted">구매 : <c:out value="${newData.sale_price}"/>원 | </small>
						        </c:when>
						        <c:when test="${bestData.sale_class eq 'r' }">
							        <small class="text-muted">대여 : <c:out value="${newData.rental_price}"/>원| </small>
						        </c:when>
						        <c:otherwise>
							        <small class="text-muted">구매 : <c:out value="${newData.sale_price}"/>원 | 대여 : <c:out value="${newData.rental_price}"/>원 | </small>
						        </c:otherwise>
						        </c:choose>
							</c:if>
				     	   <small class="text-muted">
				     	   평점 : 
				     	   <c:choose>
				     	   <c:when test="${newData.rating eq 5}">
				     	   		<font color="#EE4137">★★★★★</font>
				     	   	</c:when>
				     	   <c:when test="${newData.rating eq 4}">
				     	   		<font color="#EE4137">★★★★☆</font>
				     	   	</c:when>
				     	   <c:when test="${newData.rating eq 3}">
				     	   		<font color="#EE4137">★★★☆☆</font>
				     	   	</c:when>
				     	   <c:when test="${newData.rating eq 2}">
				     	   		<font color="#EE4137">★★☆☆☆</font>
				     	   	</c:when>
				     	   <c:when test="${newData.rating eq 1}">
				     	   		<font color="#EE4137">★☆☆☆☆</font>
				     	   	</c:when>
				     	   <c:when test="${newData.rating eq 0}">
				     	   		<font color="#EE4137">☆☆☆☆☆</font>
				     	   	</c:when>
				     	   </c:choose>
				     	   </small>
		        	</p>
		        <!-- <h5 class="card-title"><font size="4px">결심만 하는 당신에게</font></h5>
		        <p class="card-text">
		        	[책소개]
		        	기쁨도 슬픔도 반짝반짝, 이토록 산뜻한 이야기의 등장우리 문학이 기다려온 대형 신인! 모두가 기억하게 될 이름
		        </p>
		        <p class="card-text"><small class="text-muted">저자 | 카테고리 | 평점</small></p> -->
		      </div>
		    </div>
		  </div>
		</div>
</c:forEach>
<c:if test="${empty newbookData }">
	<div style="text-align: center; border:1px solid #EE4137">
	<strong>신간 도서가 존재하지 않습니다.</strong>
	</div>
</c:if>
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
    
