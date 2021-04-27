<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="도서베스트 페이지"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
 	request.setCharacterEncoding("UTF-8");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 베스트</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/main.css">
<style type="text/css">

	/* container 시작 */
	#nav_Content{border-bottom: 1px solid #333; width: 700px;margin-left: 30px; margin-top: 10px}
	.container1{ max-width: 700px;width: 100%; padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;}
	#searchContentHeader{border-bottom:2px solid #EE4137; height: 40px; padding-top:5px; margin-top: 50px}
	#bestCate{margin-top: 10px;}
	#best_book_img{width: 150px;}
	#best_week_table{text-align: center; margin: 3px;}
	#best_week_List{margin-top: 20px}
	#best_month_table{text-align: center; margin: 3px;}
	#best_month_List{margin-top: 20px}
	/* container 끝 */
	
	.clickColor a:hover{text-decoration: none;}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	var param="best="+encodeURI($(""))
	$("#pills-home-tab").click(function(){
		
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
<div id="booksContent" class="row">

<!-- haside 시작  -->	
<div class="haside" class="col-4">
</div>
<!-- haside 끝  -->

<!-- container 시작  -->	
<div id="MainContainer" class="col-8">
<!--검색순서 시작-->
	<div id="searchContentHeader">
		<span style="margin-left: 30px;font-weight: bold; font-size: 23px">베스트셀러 </span><span class="badge badge-danger">best</span>
	</div>
<!--검색순서 끝-->
	
<div id="bestCate">
<ul class="nav" id="pills-tab" role="tablist">
  <li class="nav-item">
     <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">
     	<font color="#333"><strong>· 주간베스트</strong></font>
     </a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">
    	<font color="#333"><strong>· 월간베스트</strong></font>
    </a>
  </li>
</ul>

<div class="tab-content" id="pills-tabContent">
  <div  class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">

<!--주간베스트 시작  -->
<div class="row row-cols-1 row-cols-md-3" id="best_week_List">
<c:forEach var="bestWeekData" items="${bestWeekbookData}">
	<c:set var="i" value="${i+1}"/>
  <div class="col mb-4">
        <p><span class="badge badge-dark">${i}</span></p>
    <div class="card" style="width:220px; min-height:420px">
  <a href="book_detail.do?code=${bestWeekData.book_code}&cateCode=${bestWeekData.code}">
      <img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${bestWeekData.img}" class="card-img-top"  width="200px" height="250px" onerror="javascript:this.src='http://localhost:8080/team1_user_prj3/common/images/images_book/noImg.jpg'">
  </a>
      <div class="card-body">
        <p class="card-title"><c:out value="${bestWeekData.title }"/></p>
        <small class="card-text"><c:out value="${bestWeekData.author}"/></small>
        <hr/>
        <c:if test="${bestWeekData.sale_state eq 'y'}">
        <c:choose>
        <c:when test="${bestWeekData.sale_class eq 'p' }">
	        <small class="card-text">구매 : <c:out value="${bestWeekData.sale_price}"/>원</small><br/>
    	    <small class="card-text">대여 없음</small>
        </c:when>
        <c:when test="${bestWeekData.sale_class eq 'r' }">
    	    <small class="card-text">구매 없음</small><br/>
	        <small class="card-text">대여 : <c:out value="${bestWeekData.rental_price}"/>원</small>
        </c:when>
        <c:otherwise>
	        <small class="card-text">구매 : <c:out value="${bestWeekData.sale_price}"/>원</small><br/>
	        <small class="card-text">대여 : <c:out value="${bestWeekData.rental_price}"/>원</small>
        </c:otherwise>
        </c:choose>
		</c:if>
      </div>
    </div>
  </div>
</c:forEach>
</div>
<c:if test="${empty bestWeekbookData }">
	<div style="text-align: center; border:1px solid #EE4137 ">
	<strong>주간 베스트 도서가 존재하지 않습니다.</strong>
	</div>
</c:if>
<!-- 주간베스트 -->
</div>

  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
  	<!--월간베스트 시작  -->
	<div class="row row-cols-1 row-cols-md-3" id="best_month_List">
	<c:forEach var="bestMonthData" items="${bestMonthbookData}">
	<c:set var="j" value="${j+1}"/>
  <div class="col mb-4">
        <p><span class="badge badge-dark">${j}</span></p>
    <div class="card" style="width:220px; min-height:420px">
  <a href="book_detail.do?code=${bestMonthData.book_code }&cateCode=${bestMonthData.code}">
      <img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${bestMonthData.img}" class="card-img-top" alt="..." width="200px" height="250px" onerror="javascript:this.src='http://localhost:8080/team1_user_prj3/common/images/images_book/noImg.jpg'">
  </a>
      <div class="card-body">
        <p class="card-title"><c:out value="${bestMonthData.title }"/></p>
        <small class="card-text"><c:out value="${bestMonthData.author}"/></small>
        <hr/>
        <c:choose>
        <c:when test="${bestMonthData.rental_price==0}">
	        <small class="card-text">구매 : <c:out value="${bestMonthData.sale_price}"/>원</small><br/>
    	    <small class="card-text">대여 없음</small>
        </c:when>
        <c:when test="${bestMonthData.sale_price==0}">
    	    <small class="card-text">구매 없음</small><br/>
	        <small class="card-text">대여 : <c:out value="${bestMonthData.rental_price}"/>원</small>
        </c:when>
        <c:otherwise>
	        <small class="card-text">구매 : <c:out value="${bestMonthData.sale_price}"/>원</small><br/>
	        <small class="card-text">대여 : <c:out value="${bestMonthData.rental_price}"/>원</small>
        </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
</c:forEach>
	</div><!-- best_book_List -->
  </div>
<c:if test="${empty bestMonthbookData }">
	<div style="text-align: center; border:1px solid #EE4137">
	<strong>월간 베스트 도서가 존재하지 않습니다.</strong>
	</div>
</c:if>
  <!--book_month_best  -->
</div><!-- pills-tabContent -->

</div><!-- bestCate -->	

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
