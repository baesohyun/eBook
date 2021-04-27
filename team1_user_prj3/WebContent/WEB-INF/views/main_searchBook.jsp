<%@page import="kr.co.jinibooks.domain.SearchBookListDomain"%>
<%@page import="kr.co.jinibooks.domain.SelectDetailBookDomain"%>
<%@page import="kr.co.jinibooks.dao.UserBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="도서검색 페이지1"
    trimDirectiveWhitespaces="true"
    %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 검색</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/main.css">
<style type="text/css">

	/* container 시작 */
	#nav_Content{border-bottom: 1px solid #333; width: 700px;margin-left: 30px; margin-top: 10px}
	.container1{ max-width: 700px;width: 100%; padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;}
	.row1{display: flex;flex-wrap: wrap;}
	#cateNameList{margin: 10px; width: 150px; height: 80px}
	#cateList{margin: 20px; margin-left:140px; margin-top:50px}
	#searchContentHeader{border-bottom:2px solid #EE4137; height: 40px; padding-top:5px; margin-top: 30px}
	/* bookList 책 조회 시작 */
	#bookList{border-bottom: 1px solid #C0C0C0 ; margin:20px;min-height: 230px; width: 860px; position:relative;top: 10px; left: 30px;}
	#bookImg{margin: 20px; width: 130px;}
	#bookContent{margin: 20px;}
	/* bookList 책 조회 끝 */
	/* container 끝 */
	
	a :hover {
	color:gray;
	text-decoration: underline;
	}
	 a:link { color: gray; text-decoration: none;}
	 a:visited { color: gray; text-decoration: none;}

	
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){

	
	$("#pageView").val("home");
	/* $("#pills-home").click(function(){ $("#pageView").val("home");});
	$("#pills-popular").click(function(){ $("#pageView").val("popular");});
	$("#pills-new").click(function(){ $("#pageView").val("new");});
	$("#pills-rating").click(function(){ $("#pageView").val("rating");}); */
	
	
});
//ilVO.getUrl()+"','"+ilVO.getKeyword()+"','"+ilVO.getPageView()+"',"+curpage+
function pageMove(url,keyword,pageView,currentPage){
		var name="";
		
		if($("#pills-home-tab").attr("aria-selected")=="true"){
			name="home";
		}
		if($("#pills-popular-tab").attr("aria-selected")=="true"){
			name="popular";
		}
		if($("#pills-new-tab").attr("aria-selected")=="true"){
			name="new"
		}
		if($("#pills-rating-tab").attr("aria-selected")=="true"){
			name="rating"
		}
		
		
	$("#pageView").val(name);
		
	
	$("#keyword").val(keyword);
	$("#currentPage").val(currentPage);
	$("#pageViewFrm").submit();
}
<%

%>
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
		<span style="margin-left: 30px;font-weight: bold; ">Home > 검색결과</span>
	</div>
<!--검색순서 끝-->
	<!-- 카테고리분류 목록시작 -->
		<ul class="list-group list-group-horizontal" id="cateList">
			<li class="list-group-item">
				<ul id="cateNameList">
					<li><a href="#">소설</a></li>
					<li><a href="#">건강/다이어트</a></li>
					<li><a href="#">여행</a></li>
				</ul>
			</li>
			<li class="list-group-item">
			  	<ul id="cateNameList">
				  	<li><a href="#">자기계발</a></li>
					<li><a href="#">에세이/시</a></li>
					<li><a href="#">만화</a></li>
			  	</ul>
			  </li>
			  <li class="list-group-item">
			  	<ul id="cateNameList">
			  		<li><a href="#">컴퓨터/과학</a></li>
					<li><a href="#">경영/경제</a></li>
					<li><a href="#">인문/사회/역사</a></li>
				</ul>
			  </li>
		</ul>
	<!-- 카테고리분류 목록끝 -->

	<!-- 정렬 시작(이름순, 최신순, 평점순) -->
<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
  <li class="nav-item">
    <a class="nav-link${empty param.pageView or param.pageView=='home'?' active':'' }" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="${empty param.pageView or param.pageView=='home' }">전체</a>
  </li>
  <li class="nav-item">
    <a class="nav-link${param.pageView=='popular'?' active':'' }" id="pills-popular-tab"  data-toggle="pill" href="#pills-popular" role="tab" aria-controls="pills-popular" aria-selected="${ param.pageView=='popular' }">이름순</a>
  </li>
  <li class="nav-item">
    <a class="nav-link${param.pageView=='new'?' active':'' }" id="pills-new-tab" data-toggle="pill" href="#pills-new" role="tab" aria-controls="pills-new" aria-selected="${ param.pageView=='new' }">최신순</a>
  </li>
  <li class="nav-item">
    <a class="nav-link${param.pageView=='rating'?' active':'' }" id="pills-rating-tab" data-toggle="pill" href="#pills-rating" role="tab" aria-controls="pills-rating" aria-selected="${ param.pageView=='rating' }">평점순</a>
  </li>
</ul>
<div class="tab-content" id="pills-tabContent">
  <div class="tab-pane fade ${empty param.pageView or param.pageView=='home'?'show active':'' }" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
  <!-- 전체 조회 -->
  <!-- 도서 조회 리스트 시작  -->
	<c:forEach var="book" items="${searchBookList}"><!-- newRangeBook -->
		<div id="bookList" class="row">
		 	 <div id="bookImg"><a href="book_detail.do?code=${book.book_code}&cateCode=${book.code}"> <!-- 북코드 넘겨주기 --> 
		 	 	<img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${book.img}" 
		 	 	style="width: 130px; height: 190px;" onerror="javascript:this.src='http://localhost:8080/team1_user_prj3/common/images/images_book/noImg.jpg'"/></a>
		 	 </div>  
		 	 <div id="bookContent" class="col-8" >
		 	  <a href="book_detail.do?code=${book.book_code}&cateCode=${book.code}">
		 	 	<h5><strong><c:out value="${book.title}"/></strong></h5> 
		 	 	</a>
		 	 	<p><c:out value="${book.author}"/> | <c:out value="${book.company}"/> | 
		 	 
		 	 	<c:forEach var="i" begin="1"  end="5" step="1">
				  	<c:choose>
					  	<c:when test="${book.rating ge i }">
					 	 <font color="#EE4139"><c:out value="★"/></font>			  	
					  	</c:when>
					  	<c:otherwise>
					 	<font color="#EE4139"> <c:out value="☆"/></font>				  	
					  	</c:otherwise>
				  	</c:choose>
			  	</c:forEach>
		 	 	</p>
		 	 	<a href="book_detail.do?code=${book.book_code}&cateCode=${book.code}">
		 	 	<p>&nbsp;<c:out value="${book.intro}"/> </p></a>
		 	 	<c:choose>
		       <c:when test="${book.sale_class eq 'p'}">
		         <p>판매 : <font color="#0000a0"><c:out value="${book.sale_price}"/>원</font></p>
		       </c:when>
		       <c:when test="${book.sale_class eq 'r'}">
		         <p>대여 : <font color="#0000a0"><c:out value="${book.rental_price}"/>원</font></p>
		       </c:when>
		       <c:otherwise>
		        <p>판매 : <font color="#0000a0"><c:out value="${book.sale_price}"/>원</font><br/>
		        	대여 :<font color="#0000a0"> <c:out value="${book.rental_price}"/>원</font></p>
		       </c:otherwise>
		      </c:choose>
		 	 </div> 
	 	</div>
		</c:forEach>
		<c:if test="${empty searchBookList}">
		<div style="height: 1000px;text-align: center; margin-top: 100px">
		<span><strong>'${param.keyword}' 에 대한 검색결과가 존재하지 않습니다.</strong></span>
		</div>
		</c:if>
	<!-- 도서 조회 리스트 끝  -->
  <!-- 전체 조회끝 -->
  </div>
  <div class="tab-pane fade${param.pageView=='popular'?' show active':'' }" id="pills-popular" role="tabpanel" aria-labelledby="pills-popular-tab">
  <!--이름순-->
<!-- 도서 조회 리스트 시작  -->
	<c:forEach var="book" items="${nameRangeList}"><!-- newRangeBook -->
		<div id="bookList" class="row">
		 	 <div id="bookImg"><a href="book_detail.do?code=${book.book_code}"> <!-- 북코드 넘겨주기 --> 
		 	 	<img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${book.img}"
		 	 	 style="width: 130px; height: 190px;" onerror="javascript:this.src='http://localhost:8080/team1_user_prj3/common/images/images_book/noImg.jpg'"/></a>
		 	 </div>  
		 	 <div id="bookContent" class="col-8" >
		 	 <a href="book_detail.do?code=${book.book_code}&cateCode=${book.code}">
		 	 	<h5><strong><c:out value="${book.title}"/></strong></h5> 
		 	 	</a>
		 	 	<p><c:out value="${book.author}"/> | <c:out value="${book.company}"/> | 
		 	 
		 	 	<c:forEach var="i" begin="1"  end="5" step="1">
				  	<c:choose>
					  	<c:when test="${book.rating ge i }">
					 	 <font color="#EE4139"><c:out value="★"/></font>			  	
					  	</c:when>
					  	<c:otherwise>
					 	<font color="#EE4139"> <c:out value="☆"/></font>				  	
					  	</c:otherwise>
				  	</c:choose>
			  	</c:forEach>
		 	 	</p>
		 	 	<a href="book_detail.do?code=${book.book_code}&cateCode=${book.code}">
		 	 	<p>&nbsp;<c:out value="${book.intro}"/> </p></a>
		 	 	<c:choose>
		       <c:when test="${book.sale_class eq 'p'}">
		         <p>판매 : <font color="#0000a0"><c:out value="${book.sale_price}"/>원</font></p>
		       </c:when>
		       <c:when test="${book.sale_class eq 'r'}">
		         <p>대여 : <font color="#0000a0"><c:out value="${book.rental_price}"/>원</font></p>
		       </c:when>
		       <c:otherwise>
		        <p>판매 : <font color="#0000a0"><c:out value="${book.sale_price}"/>원</font><br/>
		        	대여 :<font color="#0000a0"> <c:out value="${book.rental_price}"/>원</font></p>
		       </c:otherwise>
		      </c:choose>
		 	 </div> 
	 	</div>
		</c:forEach>
		<c:if test="${empty searchBookList}">
		<div style="height: 1000px;text-align: center; margin-top: 100px">
		<span><strong>'${param.keyword}' 에 대한 검색결과가 존재하지 않습니다.</strong></span>
		</div>
		</c:if>
	<!-- 도서 조회 리스트 끝  -->
  <!--이름순끝-->
  </div>
  <div class="tab-pane fade${param.pageView=='new'?' show active':'' }" id="pills-new" role="tabpanel" aria-labelledby="pills-new-tab">
  <!--최신순-->
 <!-- 도서 조회 리스트 시작  -->
	<c:forEach var="book" items="${newRangeList}"><!-- newRangeBook -->
		<div id="bookList" class="row">
		 	 <div id="bookImg"><a href="book_detail.do?code=${book.book_code}"> <!-- 북코드 넘겨주기 --> 
		 	 	<img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${book.img}"
		 	 	 style="width: 130px; height: 190px;" onerror="javascript:this.src='http://localhost:8080/team1_user_prj3/common/images/images_book/noImg.jpg'"/></a>
		 	 </div>  
		 	 <div id="bookContent" class="col-8" >
		 	 <a href="book_detail.do?code=${book.book_code}&cateCode=${book.code}">
		 	 	<h5><strong><c:out value="${book.title}"/></strong></h5> 
		 	 	</a>
		 	 	<p><c:out value="${book.author}"/> | <c:out value="${book.company}"/> | 
		 	 
		 	 	<c:forEach var="i" begin="1"  end="5" step="1">
				  	<c:choose>
					  	<c:when test="${book.rating ge i }">
					 	 <font color="#EE4139"><c:out value="★"/></font>			  	
					  	</c:when>
					  	<c:otherwise>
					 	<font color="#EE4139"> <c:out value="☆"/></font>				  	
					  	</c:otherwise>
				  	</c:choose>
			  	</c:forEach>
		 	 	</p>
		 	 	<a href="book_detail.do?code=${book.book_code}&cateCode=${book.code}">
		 	 	<p>&nbsp;<c:out value="${book.intro}"/> </p></a>
		 	 	<c:choose>
		       <c:when test="${book.sale_class eq 'p'}">
		         <p>판매 : <font color="#0000a0"><c:out value="${book.sale_price}"/>원</font></p>
		       </c:when>
		       <c:when test="${book.sale_class eq 'r'}">
		         <p>대여 : <font color="#0000a0"><c:out value="${book.rental_price}"/>원</font></p>
		       </c:when>
		       <c:otherwise>
		        <p>판매 : <font color="#0000a0"><c:out value="${book.sale_price}"/>원</font><br/>
		        	대여 :<font color="#0000a0"> <c:out value="${book.rental_price}"/>원</font></p>
		       </c:otherwise>
		      </c:choose>
		 	 </div> 
	 	</div>
		</c:forEach>
		<c:if test="${empty searchBookList}">
		<div style="height: 1000px;text-align: center; margin-top: 100px">
		<span><strong>'${param.keyword}' 에 대한 검색결과가 존재하지 않습니다.</strong></span>
		</div>
		</c:if>
	<!-- 도서 조회 리스트 끝  -->
  <!--최신순끝-->
  </div>
  <div class="tab-pane fade${param.pageView=='rating'?' show active':'' }" id="pills-rating" role="tabpanel" aria-labelledby="pills-rating-tab">
	<!--평점순-->
<!-- 도서 조회 리스트 시작  -->
	<c:forEach var="book" items="${ratingRangeList}"><!-- newRangeBook -->
		<div id="bookList" class="row">
		 	 <div id="bookImg"><a href="book_detail.do?code=${book.book_code}"> <!-- 북코드 넘겨주기 --> 
		 	 	<img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${book.img}" 
		 	 	onerror="javascript:this.src='http://localhost:8080/team1_user_prj3/common/images/images_book/noImg.jpg'"
		 	 	style="width: 130px; height: 190px;"/></a>
		 	 </div>  
		 	 <div id="bookContent" class="col-8" >
		 	 <a href="book_detail.do?code=${book.book_code}" > 
		 	 	<h5><strong><c:out value="${book.title}"/></strong></h5> 
		 	 	</a>
		 	 	<p><c:out value="${book.author}"/> | <c:out value="${book.company}"/> | 
		 	 
		 	 	<c:forEach var="i" begin="1"  end="5" step="1">
				  	<c:choose>
					  	<c:when test="${book.rating ge i }">
					 	 <font color="#EE4139"><c:out value="★"/></font>			  	
					  	</c:when>
					  	<c:otherwise>
					 	<font color="#EE4139"> <c:out value="☆"/></font>				  	
					  	</c:otherwise>
				  	</c:choose>
			  	</c:forEach>
		 	 	</p>
		 	 	<a href="book_detail.do?code=${book.book_code}&cateCode=${book.code}">
		 	 	<p>&nbsp;<c:out value="${book.intro}"/> </p></a>
		 	 	<c:choose>
		       <c:when test="${book.sale_class eq 'p'}">
		         <p>판매 : <font color="#0000a0"><c:out value="${book.sale_price}"/>원</font></p>
		       </c:when>
		       <c:when test="${book.sale_class eq 'r'}">
		         <p>대여 : <font color="#0000a0"><c:out value="${book.rental_price}"/>원</font></p>
		       </c:when>
		       <c:otherwise>
		        <p>판매 : <font color="#0000a0"><c:out value="${book.sale_price}"/>원</font><br/>
		        	대여 :<font color="#0000a0"> <c:out value="${book.rental_price}"/>원</font></p>
		       </c:otherwise>
		      </c:choose>
		 	 </div> 
	 	</div>
		</c:forEach>
		<c:if test="${empty searchBookList}">
		<div style="height: 1000px;text-align: center; margin-top: 100px">
		<span><strong>'${param.keyword}' 에 대한 검색결과가 존재하지 않습니다.</strong></span>
		</div>
		</c:if>
	<!-- 도서 조회 리스트 끝  -->
  <!--평점순끝-->
</div>
</div> 		
 <!--  페이지 넘기기 시작-->
 <nav aria-label="Page navigation example">
  <ul class="pagination">
 
<%-- <c:out value="${indexList}" escapeXml="false"/> --%>
<c:out value="${indexList}" escapeXml="false"/>
   
  </ul>
</nav>
 <!--  페이지 넘기기 끝-->
 <!-- 정렬 끝 -->		
	
	</div>
</div>
<!-- container 끝  -->		
<!-- footer 시작  -->	
<hr>
<div id ="footer">
  <jsp:include page="../../common/jsp/jinibooks_footer.jsp"/>
</div>
<!-- footer 끝  -->	
</div>

</body>
</html>
