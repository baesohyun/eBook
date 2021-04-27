<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="도서 상세페이지"
    %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세페이지</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/main.css">
<style type="text/css">

	/* container 시작 */
	#nav_Content{border-bottom: 1px solid #333; width: 700px;margin-left: 30px; margin-top: 10px}
	.container1{ max-width: 700px;width: 100%; padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;}
	#SearchContentHeader{border-bottom:2px solid #EE4137; height: 40px; padding-top:5px; margin-top: 50px; width: 800px}
	.book_detail_btn{margin-right: 15px}
	.bookIntro{margin:30px;width: 800px;}
	#book_similar{margin-left:70px;margin-top :20px;margin-bottom :20px; }
	.book_similar_Img{width: 150px; height: 200px;}
	
	#bookIntroContent{margin-top: 20px; margin-bottom: 100px}
	#bookIntroTitle{border-bottom: 3px solid #EE4137;}
	/* container 끝 */
	
	.clickColor a:hover{text-decoration: none;}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<%
	  String id=(String)session.getAttribute("user_id");
	  //session.setAttribute("id", id);
	%>
<script type="text/javascript">
$(function(){
	$("#cartBtn").click(function(){

		var params="&id=${user_id}";
	
		 if(confirm("장바구니에 담겠습니까?")){
		var code="book_code=${param.code}"+params;
			$.ajax({
				url:"add_cart.do",
				type:"get",
				data:code,
				dataType:"json",
				error:function(xhr){
					alert("로그인 후, 이용해주세요.");
					location.href="member/login.do";
				},
				success:function(json){
					if(json.flag){
						if(confirm("장바구니로 이동하겠습니까?")){
							location.href="book_cartList.do?id=${user_id}";
						}//end if
					}//end if
				}//success
			});//ajax
		}//end if 
	});
	
	var params="&code=${param.code}&id=${user_id}";
	
	$("#saleBtn").click(function(){
		if("${user_id}"!=""){
			location.href="book_pay.do?buy=p"+params;
		}else{
			alert("로그인 후, 이용해주세요.");
			location.href="member/login.do";
		}//end else
	})//click
	
	$("#rentalBtn").click(function(){
		if("${user_id}"!=""){
			location.href="book_pay.do?buy=r"+params;
		}else{
			alert("로그인 후, 이용해주세요.");
			location.href="member/login.do";
		}//end if
	})//click

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
<div  id="SearchContentHeader">

	<!-- ************* 12/08 ************************** -->
		<span style="margin-left: 30px;font-weight: bold; ">검색결과 > ${detailBook.name}</span>
	</div>
	<!-- 책 정보 시작 -->
	<c:if test="${detailBook.bookCode eq param.book_code}"></c:if>
	<div class="media" style="margin-top: 40px; padding-left: 50px;">
	<a href="#" data-toggle="modal" data-target="#exampleModalScrollable">
	  <img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${detailBook.img}"
	   class="mr-3" style="width: 210px; margin-top: 15px"
	   onerror="javascript:this.src='http://localhost:8080/team1_user_prj3/common/images/images_book/noImg.jpg'"/>
	   </a>
	 
<!-- Modal -->
<div class="modal fade " id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalScrollableTitle"><strong>${detailBook.title}</strong></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${detailBook.img}"
	   class="mr-3"
	   onerror="javascript:this.src='http://localhost:8080/team1_user_prj3/common/images/images_book/noImg.jpg'"/>
	   
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
	
	  <div class="media-body" style="margin: 10px; margin-bottom: 10px;">
	    <h4 class="mt-0"><strong><c:out value="${detailBook.title}"/></strong></h4>
	    <br/>
	  	<table border="2" bordercolor="#7A7A7A" cellpadding="14" >
		  	<tr>
		  		<th >저자</th>
		  		<td min-width="140"><c:out value="${detailBook.author}"/></td>
		  		<th>출판사</th>
		  		<td min-width="130"><c:out value="${detailBook.company}"/></td>
		  	</tr>
		  	<tr>
		  		<th>옮긴이</th>
			  	<td><c:out value="${detailBook.translator}"/></td>
			  
			  	<th>평점</th>
			  	<td>
			  	<c:forEach var="i" begin="1"  end="5" step="1">
				  	<c:choose>
					  	<c:when test="${detailBook.rating ge i }">
					 	<font color="#EE4139"><c:out value="★"/></font>
					  	</c:when>
					  	<c:otherwise>
					 	 <font color="#EE4139"><c:out value="☆"/></font>	  	
					  	</c:otherwise>
				  	</c:choose>
			  	</c:forEach>
			  	</td>
		  	</tr>
		  	<tr>
		  		<th>출간일</th>
		  		<td colspan="3"> <c:out value="${detailBook.pubDate}"/> </td>
		  		
		  	</tr>
	  	</table>
	  	<div id="book_price" class="row" style="margin-top: 10px">
	  <c:choose>
		       <c:when test="${detailBook.sale_class eq 'p'}">
		        <!--구매 시작  -->
			  	<div class="col">
				  	<table border="2" cellpadding="10" bordercolor="#7A7A7A" style="text-align: center; margin-right: 20px; margin-left: 20px">
				  	<tr>
				  	<th colspan="2" width="68px">전자 책 구매</th>
				  	</tr>
				  	<tr>
					  	<td  width="80px">금액 </td>
					  	<td  width="120px"><c:out value="${detailBook.salePrice}"/> 원</td>
				  	</tr>
				  	</table>
			  	</div>
			  	<!--구매 끝  -->
		       </c:when>
		       <c:when test="${detailBook.sale_class eq 'r'}">
		        <!--대여 시작  -->
			  	<div class="row">
				  	<table border="2" cellpadding="10" bordercolor="#7A7A7A" style="text-align: center; margin-left: 30px">
				  	<tr>
				  	<th colspan="3" width="68px">대여</th>
				  	</tr>
				  	<tr>
					  	<td  width="60px">금액 </td>
					  	<td  width="60px">7일</td>
					  	<td  width="100px"><c:out value="${detailBook.rentalPrice}"/> 원</td>
				  	</tr>
				  	</table>
			  	</div>
			  	<!--대여 끝  -->
		       </c:when>
		       <c:otherwise>
		        <!--구매 시작  -->
			  	<div class="row">
				  	<table border="2" cellpadding="10" bordercolor="#7A7A7A" style="text-align: center; margin-right: 20px; margin-left: 30px">
				  	<tr>
				  	<th colspan="2" width="68px">전자 책 구매</th>
				  	</tr>
				  	<tr>
					  	<td  width="80px">금액 </td>
					  	<td  width="120px"><c:out value="${detailBook.salePrice}"/>원 </td>
				  	</tr>
				  	</table>
			  	</div>
			  	<!--구매 끝  -->
			  	<!--대여 시작  -->
			  	<div class="row">
				  	<table border="2" cellpadding="10" bordercolor="#7A7A7A" style="text-align: center;margin-left: 30px">
				  	<tr>
				  	<th colspan="3" width="68px">대여</th>
				  	</tr>
				  	<tr>
					  	<td  width="60px">금액 </td>
					  	<td  width="60px">7일</td>
					  	<td  width="100px"><c:out value="${detailBook.rentalPrice}"/>원</td>
				  	</tr>
				  	</table>
			  	</div>
			  	<!--대여 끝  -->

		       </c:otherwise>
		</c:choose>
	  	
	  	
	  </div><!-- book_price  -->
	  
	  	<div style="margin-top: 20px; margin-left: 40px;">
			 <button type="button" class="btn btn-outline-secondary"  class="book_detail_btn" id="cartBtn">장바구니</button>
		  <c:choose>
		  <c:when test="${detailBook.sale_class eq 'r'}">
		 	<button type="button" class="btn btn-outline-secondary" class="book_detail_btn" id="rentalBtn">대여</button>
		  </c:when>
		  <c:when test="${detailBook.sale_class eq 'p'}">
		  	<button type="button" class="btn btn-outline-secondary" class="book_detail_btn" id="saleBtn">구매</button>
		  </c:when>
		  <c:otherwise>
		  	<button type="button" class="btn btn-outline-secondary" class="book_detail_btn" id="rentalBtn">대여</button>
		  	<button type="button" class="btn btn-outline-secondary" class="book_detail_btn" id="saleBtn">구매</button>
		  </c:otherwise>
		  </c:choose>
	  	</div>
	  </div>
	</div>
	<!-- 책 정보 끝 -->
	
	<br/>
	<!-- 책소개 시작 -->
		 <div id="bookIntro" class="bookIntro">
		  	<div id="bookIntroTitle">
		  	<h4><strong>책소개</strong></h4>
		  	</div>
	  		<div id="bookIntroContent">
		  		<p>
					&nbsp;&lt;책소개&gt;<br/>&nbsp;
					
					<% pageContext.setAttribute("newLineChar", "\n"); %>
					${fn:replace(detailBook.intro, newLineChar, "<br/>")}
					
				</p>
			</div>
	  	</div>
	<!-- 책소개 끝 -->
	<!-- 출판사 서평 시작 -->
		 <div id="bookpublisher" class="bookIntro">
		  	<div id="bookIntroTitle">
		  	<h4><strong>출판사 서평</strong> </h4>
		  	</div>
	  		<div id="bookIntroContent" >
		  		<p>
					&nbsp;&lt;출판사 서평&gt;<br/>&nbsp;
					 <% pageContext.setAttribute("newLineChar", "\n"); %>
					${fn:replace(detailBook.review, newLineChar, "<br/>")}
				</p>
			</div>
	  	</div>
	<!-- 출판사 서평  끝 -->
	<!-- 저자소개시작-->
		 <div id="bookWriterIntro" class="bookIntro" >
		  	<div id="bookIntroTitle">
		  	<h4><strong>저자소개(프로필)</strong> </h4>
		  	</div>
	  		<div id="bookIntroContent">
		  		<p>
					&nbsp;&lt;저자소개&gt;<br/>&nbsp;
					  <% pageContext.setAttribute("newLineChar", "\n"); %>
					${fn:replace(detailBook.authorIntro, newLineChar, "<br/>")}
				</p>
			</div>
	  	</div>
	<!-- 저자소개 끝-->
	<!-- 목차 시작-->
		 <div id="bookpublisher" class="bookIntro" >
		  	<div id="bookIntroTitle">
		  	<h4><strong>목차</strong> </h4>
		  	</div>
	  		<div id="bookIntroContent">
		  		<p>
					&nbsp;&lt;목차&gt;<br/>&nbsp;
				 	  <% pageContext.setAttribute("newLineChar", "\n"); %>
					${fn:replace(detailBook.bookIndex, newLineChar, "<br/>")}
				</p>
			</div>
	  	</div>
	<!-- 목차끝-->
	<!-- 비슷한 상품 시작 -->
	<!-- ****************12/8  수정**************** -->
	 <div id="bookpublisher" class="bookIntro">
		  	<div id="bookIntroTitle">
		  	<h5><strong>이 책과 비슷한 장르의 도서</strong> </h5>
		  	</div>
	  		
	<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
	  <div class="carousel-inner" style="border: 1px solid #e7e7e7;">
	    <div class="carousel-item active" id="book_similar">
	    <table cellpadding="10">
	    <tr>
	    <c:forEach var="random" items="${randomList1}">
	    <td style="text-align: center">
		     <a href="book_detail.do?code=${random.book_code}&cateCode=${detailBook.code}"> 
			    <img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${random.img}"
			    class="book_similar_Img" onerror="javascript:this.src='http://localhost:8080/team1_user_prj3/common/images/images_book/noImg.jpg'">
			 </a><br/>
			 
			 <c:out value="${random.title}"/>
	    </td>
	     </c:forEach>
	    </tr>
	    </table>
	    </div>
	    <div class="carousel-item" style="margin-left:70px;">
	   <table cellpadding="10">
	    <tr>
	    <c:forEach var="random" items="${randomList2}">
	    <td>
		     <a href="book_detail.do?code=${random.book_code}&cateCode=${detailBook.code}"> 
			    <img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${random.img}"
			    class="book_similar_Img" onerror="javascript:this.src='http://localhost:8080/team1_user_prj3/common/images/images_book/noImg.jpg'">
			 </a><br/>
			 <c:out value="${random.title}"/>
	    </td>
	     </c:forEach>
	    </tr>
	    </table>
	    </div>
	  </div>
	  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="false"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="false"></span>
	    <span class="sr-only">Next</span>
	  </a>
	  </div>
	  
</div>
	<!-- 비슷한 상품 끝 -->

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
