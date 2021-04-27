<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="사용자 메인페이지"
    %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 메인 페이지</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/main.css"/>
<style type="text/css">
	/* 헤더 시작 */
	/* 헤더 끝 */
	
	/* aside시작 */
	.haside{position:fixed;  margin-top: 80px; top:170px; right: 30px; text-align: center;font-weight: normal;font-size:13px; width: 130px; } 
	/* aside끝 */
	 
	/* container 시작 */
	
	#MainContainer{ width: 1500px; min-height: 1800px; margin:0px auto; }
	#containerTop{ width: 1500px; margin:0px auto;}
	#containerBottom{ width: 1100px; min-height: 1800px; margin:0px auto;}
	#recommendBookImg{width: 100px; height:280px;}
	
	#showBook,#cashBanner,#notice{margin-bottom: 50px}
	#bookTitle1{font-size: 20px; font-weight: bold; text-align: center; color: #800000}
	#bookTitle2{font-size: 20px; font-weight: bold; font-family: RIDIBatang}
	
	#pills-home,#pills-profile1,#pills-profile2,#pills-profile3,#pills-profile4{padding: 25px}
	#trendBtn,#lifeBtn,#hllingBtn,#sosalBtn,#manhaBtn{width:80px; height:40px}
	.card{padding:0px}
	
	#notice{margin-bottom: 50px; margin-top: 70px}
	#notice1{font-size: 15px; font-weight: bold; margin-bottom: 10px}
	#notice2{border:1px solid #333; height:200px;}
	#notice3_1{margin: 10px auto; margin-left: 10px; font-size: 14px; }
	#notice3_2{ text-align: center; vertical-align: middle; margin: 40px auto; font-size: 13px; }
	#notice3_3{ text-align: center; vertical-align: middle; margin: 40px auto; font-size: 20px; }
	#notice4{font-size: 13px; text-align: center}
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

<!-- haside 시작  -->
<div class="haside">
	 	<div class="list-group" style="position: relative; z-index: 2;">
			  <a href="#" class="list-group-item list-group-item-action active" style="background-color: #EE4137; border-color: #EE4137">
			   QUICK MENU
			  </a>
			  
			  <a href="/team1_user_prj3/faq.do" class="list-group-item list-group-item-action">
			  <img src="http://localhost:8080/team1_user_prj3/common/images/images_main/aside_Q&A.png" width="30px" height="30px"/><br/> 고객센터
			  </a>
			  <a href="/team1_user_prj3/question.do" class="list-group-item list-group-item-action">
			  <img src="http://localhost:8080/team1_user_prj3/common/images/images_main/aside_inquiry.png" width="30px" height="30px"/><br/> 1:1 문의
			  </a>
			  <a href="/team1_user_prj3/notice.do" class="list-group-item list-group-item-action">
			  <img src="http://localhost:8080/team1_user_prj3/common/images/images_main/aside_notice.png" width="40px" height="40px"/><br/> 공지사항
			  </a>
			 <!--  <a href="#" class="list-group-item list-group-item-action">
			  <img src="images/aside_calendar.png" width="30px" height="30px"/><br/> 이달의 신간
			  </a>
			  <a href="#" class="list-group-item list-group-item-action " tabindex="-1" aria-disabled="true">
			  <img src="images/aside_book.png" width="45px" height="35px"/><br/> e-book사용법
			  </a> -->
		</div>
</div>

<!-- haside 끝  -->	
<!-- container 시작  -->
<div id="MainContainer" > 
<!-- containerTop 시작  -->	
	<div id="containerTop">
<!-- 추천 책 시작  -->		
	<div id="todayRecommend" style="margin-top: 0px; margin-bottom: 50px; background-color: #444448;  padding: 30px">
	<div style="text-align: center; font-weight: bold; font-size: 25px; margin: 30px; color:#f0f0f0">◎ 오늘의 추천 도서 ◎ </div>
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" >
		  <div class="carousel-inner" style="padding-left: 180px; padding-right: 100px">
		    <div class="carousel-item active" style="text-align: center; ">
		      <!--  -->
			<div class="row row-cols-1 row-cols-md-3" style="text-align: center">
				<div class="card-deck" > 
				<c:forEach var="recomend1" items="${mainRecomend1}">
				  <div class="card" style="width:200px; min-height:400px; border:1px solid #444448; background-color: #444448; padding: 10px">
				    <a href="book_detail.do?code=${recomend1.book_code}&cateCode=${recomend1.code}">
				    	<img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${recomend1.img}" class="card-img-top" alt="..." height="250px" onerror="javascript:this.src='http://localhost:8080/team1_user_prj3/common/images/images_book/noImg.jpg'">
				    </a>
				    <div class="card-body">
				      <p class="card-text" style="color: #f0f0f0">
				      	<strong><c:out value="${recomend1.title}"/></strong><br/>
				      	<small class="text-muted"><c:out value="${recomend1.author}"/></small>
				      </p>
				    </div>
				  </div>
				  </c:forEach>
				</div>
			</div>
			<!--  -->
		    </div>
		    <div class="carousel-item" style="text-align: center">
		       <div class="card-deck" > 
				<c:forEach var="recomend2" items="${mainRecomend2}">
				  <div class="card" style="width:200px; min-height:400px; border:1px solid #444448; background-color: #444448; padding: 10px">
				    <a href="book_detail.do?code=${recomend2.book_code}&cateCode=${recomend2.code}">
				    	<img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${recomend2.img}" class="card-img-top" alt="..." height="250px" onerror="javascript:this.src='http://localhost:8080/team1_user_prj3/common/images/images_book/noImg.jpg'">
				    </a>
				    <div class="card-body">
				      <p class="card-text" style="color: #f0f0f0">
				      	<strong><c:out value="${recomend2.title}"/></strong><br/>
				      	<small class="text-muted"><c:out value="${recomend2.author}"/></small>
				      </p>
				    </div>
				  </div>
				  </c:forEach>
				</div>
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div><!-- carouselExampleIndicators -->
	</div><!-- todayRecommend  -->
<!-- 추천 책 끝  -->
	</div> 
<!-- containerTop 끝  -->	

<!-- containerBottom 시작 -->
	<div id="containerBottom">
	
<!-- 종합 베스트 top5 시작 -->
	<label id="bookTitle2" >지니 베스트 TOP5</label>
	<hr color="#646464"/>
	<div class="card-deck" id="showBook">
	<c:forEach var="totalBest" items="${mainTotalBest}">
	<c:set var="i" value="${i+1}"/>
	  <div class="card" style="height:420px; border:1px solid #FFF">
	  	<p style="text-align: center"><span class="badge badge-danger">${i}</span></p>
	    <a href="book_detail.do?code=${totalBest.book_code}&cateCode=${totalBest.code}">
	    	<img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${totalBest.img}" class="card-img-top" width="100px" height="250px" onerror="javascript:this.src='http://localhost:8080/team1_user_prj3/common/images/images_book/noImg.jpg'">
	    </a>
	    <div class="card-body">
	      <p class="card-text">
	      	<strong><c:out value="${totalBest.title}"/></strong><br/>
	      	<small class="text-muted"><c:out value="${totalBest.author}"/></small><br/>
	     	   <c:choose>
	     	   <c:when test="${totalBest.rating eq 5}">
	     	   		<font color="#EE4137">★★★★★</font>
	     	   	</c:when>
	     	   <c:when test="${totalBest.rating eq 4}">
	     	   		<font color="#EE4137">★★★★☆</font>
	     	   	</c:when>
	     	   <c:when test="${totalBest.rating eq 3}">
	     	   		<font color="#EE4137">★★★☆☆</font>
	     	   	</c:when>
	     	   <c:when test="${totalBest.rating eq 2}">
	     	   		<font color="#EE4137">★★☆☆☆</font>
	     	   	</c:when>
	     	   <c:when test="${totalBest.rating eq 1}">
	     	   		<font color="#EE4137">★☆☆☆☆</font>
	     	   	</c:when>
	     	   <c:when test="${totalBest.rating eq 0}">
	     	   		<font color="#EE4137">☆☆☆☆☆</font>
	     	   	</c:when>
	     	   </c:choose>
	      </p>
	    </div>
	  </div>
	  </c:forEach>
	</div>
<!-- 종합 베스트 top5 끝 -->
	
<!-- 인기 도서 시작  -->
	<label id="bookTitle2" >오늘의 판매 도서</label>
	<hr color="#646464"/>
<div class="alert alert-success" id="showBook" role="alert" style="height: 500px">

	<!--  -->
	<div class="row row-cols-1 row-cols-md-3"  style="padding:30px">
		<div class="card-deck" id="showBook">
		<c:forEach var="popular" items="${mainPopular}">
		  <div class="card" style="min-height:400px; border:1px solid #d4edda; background-color: #d4edda;">
		    <a href="book_detail.do?code=${popular.book_code}&cateCode=${newbook.code}">
		    	<img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${popular.img}" class="card-img-top" alt="..." width="100px" height="250px" onerror="javascript:this.src='http://localhost:8080/team1_user_prj3/common/images/images_book/noImg.jpg'">
		    </a>
		    <div class="card-body">
		      <p class="card-text" >
		      	<strong><c:out value="${popular.title}"/></strong><br/>
		      	<small class="text-muted"><c:out value="${popular.author}"/></small><br/>
			      	<c:choose>
		     	   <c:when test="${popular.rating eq 5}">
		     	   		<font color="#EE4137">★★★★★</font>
		     	   	</c:when>
		     	   <c:when test="${popular.rating eq 4}">
		     	   		<font color="#EE4137">★★★★☆</font>
		     	   	</c:when>
		     	   <c:when test="${popular.rating eq 3}">
		     	   		<font color="#EE4137">★★★☆☆</font>
		     	   	</c:when>
		     	   <c:when test="${popular.rating eq 2}">
		     	   		<font color="#EE4137">★★☆☆☆</font>
		     	   	</c:when>
		     	   <c:when test="${popular.rating eq 1}">
		     	   		<font color="#EE4137">★☆☆☆☆</font>
		     	   	</c:when>
		     	   <c:when test="${popular.rating eq 0}">
		     	   		<font color="#EE4137">☆☆☆☆☆</font>
		     	   	</c:when>
		     	   </c:choose>
		      </p>
		    </div>
		  </div>
		  </c:forEach>
		</div>
	</div>
	<!--  -->
</div>
<!-- 인기 도서  끝  -->
	
<!-- 신간 도서 시작 -->
	<label id="bookTitle2" >이달의 신간</label>
	<hr color="#646464"/>
	<div class="row row-cols-1 row-cols-md-3"  id="showBook">
	<c:forEach var="newbook" items="${mainNew}">
  	<div class="col mb-4">
	  <div class="card" style="height:420px; border:1px solid #FFF">
	   <a href="book_detail.do?code=${newbook.book_code}&cateCode=${newbook.code}">
	    	<img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${newbook.img}" class="card-img-top" width="100px" height="250px" onerror="javascript:this.src='http://localhost:8080/team1_user_prj3/common/images/images_book/noImg.jpg'">
	    </a>
	    <div class="card-body">
	      <p class="card-text">
	      	<strong><c:out value="${newbook.title}"/></strong><br/>
	      	<small class="text-muted"><c:out value="${newbook.author}"/></small><br/>
      		<c:choose>
	     	   <c:when test="${newbook.rating eq 5}">
	     	   		<font color="#EE4137">★★★★★</font>
	     	   	</c:when>
	     	   <c:when test="${newbook.rating eq 4}">
	     	   		<font color="#EE4137">★★★★☆</font>
	     	   	</c:when>
	     	   <c:when test="${newbook.rating eq 3}">
	     	   		<font color="#EE4137">★★★☆☆</font>
	     	   	</c:when>
	     	   <c:when test="${newbook.rating eq 2}">
	     	   		<font color="#EE4137">★★☆☆☆</font>
	     	   	</c:when>
	     	   <c:when test="${newbook.rating eq 1}">
	     	   		<font color="#EE4137">★☆☆☆☆</font>
	     	   	</c:when>
	     	   <c:when test="${newbook.rating eq 0}">
	     	   		<font color="#EE4137">☆☆☆☆☆</font>
	     	   	</c:when>
	     	  </c:choose>
	      </p>
	    </div>
	  </div>
	</div>
	</c:forEach>
	</div>
<!-- 신간 도서 끝 -->

<!-- 책 광고 시작  -->
<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
		<div class="row" style="background-color: #f0f0f0; padding: 30px">
			<div class="col">
			<a href="book_detail.do?code=b_000001&cateCode=BC_000001">
			<img src="http://localhost:8080/team1_user_prj3/common/images/images_ad/mainAd.jpg" width="500px" height="250px">
			</a>
			</div>
			<div class="col">
			<a href="book_detail.do?code=b_000007&cateCode=BC_000001">
			<img src="http://localhost:8080/team1_user_prj3/common/images/images_ad/mainAd2.jpg" width="500px" height="250px">
			</a>
			</div>
		</div>
	</div>
	<div class="carousel-item" style="text-align: center">
		<div class="row" style="background-color: #f0f0f0; padding: 30px">
		<div class="col">
		<a href="book_detail.do?code=b_000016&cateCode=BC_000001">
			<img src="http://localhost:8080/team1_user_prj3/common/images/images_ad/mainAd3.jpg" width="500px" height="250px">
		</a>
		</div>
		<div class="col">
		<a href="book_detail.do?code=b_000020&cateCode=BC_000001">
			<img src="http://localhost:8080/team1_user_prj3/common/images/images_ad/mainAd4.jpg" width="500px" height="250px">
		</a>
		</div>
	</div>
	</div>
	</div>              
</div>
<!-- 책 광고 끝  -->
	
<!-- 공지사항, 자주묻는질문, 고객센터 시작  -->
	<div class="row" id="notice">
	<!-- 공지사항 시작  -->
	<div class="col-8">
	<div id="notice1">
		<strong>공지사항</strong>
		<a href="notice.do"><span style="font-size: 10px; color:#333; padding-left: 10px">더보기 ></span></a>
	</div>
	<div id="notice2">
		<div id="notice3_1">
		<ul type="disc">
		<c:forEach var="notice" items="${mainNotice}">
			<li style="margin-bottom: 5px">
				<a href="detail.do?num=${notice.num}"><span style="color:#333"><c:out value="${notice.subject}"/></span></a>
			</li>
			</c:forEach>
		</ul>
		</div>
	</div>
	</div>
	<!-- 공지사항 끝  -->
	<!-- 자주묻는 질문 시작  -->
<%-- 	<div class="col">
		<div id="notice1">
			<strong>자주 찾는 도움말</strong>
			<a href="faq.do"><span style="font-size: 10px; color:#333; padding-left: 10px">더보기 ></span></a>
		</div>
		<div id="notice2">
			<div id="notice3_1">
		<ul type="disc">
		<c:forEach var="question" items="${mainQuestion}">
		<li style="margin-bottom: 5px">
			<a href="detail2.do?num=${question.num}"><span style="color:#333"><c:out value="${question.subject}"></c:out></span></a>
		</li>
		</c:forEach>
		</ul>
		</div>
		</div>
	</div> --%>
	<!-- 자주묻는 질문 끝  -->
	<!-- 고객센터 시작  -->
	<div class="col-4">
		<div id="notice1">
			<strong>고객 센터</strong>
			<a href="faq.do"><span style="font-size: 10px; color:#333; padding-left: 10px">더보기 ></span></a>
		</div>
		<div id="notice2">
			<div id="notice3_3"><img src="http://localhost:8080/team1_user_prj3/common/images/images_main/main_clientCenter.png">1588-1588</div>
			<div  id="notice4"> 월~금 09:00-19:00 / 공휴일, 주말 휴무 </div>
		</div>
	</div>
	<!-- 고객센터 끝  -->
	</div>
<!-- 공지사항, 자주묻는질문, 고객센터 끝  -->
	</div><!-- containerBottom 끝 -->
</div><!-- container 끝  -->	

<hr>
<!-- footer 시작  -->	
<div id ="footer">
  <jsp:include page="../../common/jsp/jinibooks_footer.jsp"/>
</div>	
<!-- footer 끝  -->	
</div>

</body>
</html>
    
