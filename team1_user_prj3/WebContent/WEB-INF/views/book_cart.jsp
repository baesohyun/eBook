<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="도서 장바구니"
    trimDirectiveWhitespaces="true"
    %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 장바구니</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/main.css">
<style type="text/css">

	/* container 시작 */
	#MainContainer{margin-top: 50px;}
	.container1{ max-width: 700px;width: 100%; padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;}
	
	#cartList_book_img{width: 130px; margin-bottom: 10px;}
	#cartListHeader{font-weight: bold;}
	#home-tab{font-weight: bold;}
	#profile-tab{font-weight: bold;}
	.navbar-brand{font-weight: bold;}
	#nav_Content{border-bottom: 2px solid #EE4137; width: 1460px;margin-left: 30px; margin-top: 10px; margin-bottom:50px}
	#cartListTable{text-align: center}
	
	/* container 끝 */
	
	.clickColor a:hover{text-decoration: none;}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<%
	 String id=(String)session.getAttribute("user_id");
	String book=(String)session.getAttribute("book_code");
%>
<script type="text/javascript">

//모두체크

function allChk(obj){
	var chkObj= document.getElementsByName("cartCode");
	var rowCnt = chkObj.length - 1;
    var check = obj.checked;
   
	var priceChk = document.getElementsByName("book_price");
    var chkCnt=0;
	var totalPrice=0;
    if (check) {﻿
        for (var i=0; i<=rowCnt; i++){
         if(chkObj[i].type == "checkbox")
             chkObj[i].checked = true;
    		chkCnt=chkCnt+1;
    		totalPrice+=parseInt(priceChk[i].value);
        }
    } else {
        for (var i=0; i<=rowCnt; i++) {
         if(chkObj[i].type == "checkbox"){
             chkObj[i].checked = false;
         }
         chkCnt=0;
         totalPrice=0;
        }
    }
    var divPrice= document.getElementById("chkPrice");
	  divPrice.innerHTML=totalPrice+" 원";
	  var divCnt= document.getElementById("chkCnt");
	  divCnt.innerHTML=chkCnt+" 권";
    
    
} //allChk

//선택 체크
////////////////////////////////////////
function bookDel(){

  var userid = "";
  var bookChk = document.getElementsByName("cartCode");
  var chked = false;
  var indexid = false;
  for(i=0; i < bookChk.length; i++){
   if(bookChk[i].checked ){//선택되었다면
    if(indexid){
      userid = userid + '-';
    }//end if 
    userid = userid + bookChk[i].value;
    indexid = true;
   }//end if
  }//end for
  if(!indexid){//선택되지 않았다면 
   alert("삭제할 도서를 체크해 주세요");
   return;
  }//end if

     if (confirm("삭제 하시겠습니까?")){
    	 
    	 var bookvar=new Array;
    	var params="&id=${user_id}";
    	
    	  for(i=0; i < bookChk.length; i++){
    		   if(bookChk[i].checked){//선택되었다면
    			   bookvar[i]=bookChk[i].value;
    			   params+="&cartCode="+bookvar[i];
    		   }//end if
    		  }//end for
    		  
			$.ajax({
				url:"remove_cart.do",
				type:"post",
				data:params,
				dataType:"json",
				error:function(xhr){
					alert("문제발생");
				},
				success:function(json){
					alert("선택한 도서를 삭제했습니다");
		    		 location.href="book_cartList.do?id=${user_id}";
				}//success
			});//ajax
     }//end if 
}//bookDel


function chkPrice(){
	  var totalChk = document.getElementsByName("bookcheckboxheader");
	  var codeChk = document.getElementsByName("cartCode");
	  var priceChk = document.getElementsByName("book_price");
	  var code1 = document.getElementsByName("code");
	  var chkCnt=0;
	  var totalPrice=0;
	  for(i=0; i < codeChk.length; i++){
		   if(codeChk[i].checked){//선택되었다면
			
			   chkCnt=chkCnt+1;
			   totalPrice+=parseInt(priceChk[i].value);
		   }//end if
	  }//end for

	  var divPrice= document.getElementById("chkPrice");
	  divPrice.innerHTML=totalPrice+" 원";
	  var divCnt= document.getElementById("chkCnt");
	  divCnt.innerHTML=chkCnt+" 권";

}//chkPrice

$(function(){
$("#payBtn").click(function(){
		
		var name=document.getElementsByName("cartCode");
		var buy=document.getElementsByName("buy");
		var hiddenBuy=document.getElementById("hiddenBuy");
		
		var tag = "";
		/* 	"<input type='hidden' name='code' value='${cart.book_code}'/>"; */
		
		for(var i=0; i<name.length; i++){
			if(name[i].checked){
				if(name[i].getAttribute('id') == 'saleChk'){
					tag += "<input type='hidden' name='buy' value='p'/>";
					/* document.CartBookFrm.code[i].value='${cart.book_code}'; */
				}//end if
				if(name[i].getAttribute('id') == 'rentalChk'){
					tag += "<input type='hidden' name='buy' value='r'/>";
				}//end if
			}//end if
		}//end for
		hiddenBuy.innerHTML = tag;
		$("#CartBookFrm").submit();
		
	})//click
})//ready

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
<div id="MainContainer" class="col-12">
<!--검색순서 시작-->
<nav class="navbar navbar-light" id="nav_Content">
  <span class="navbar-brand">
    <img src="http://localhost:8080/team1_user_prj3/common/images/book_cart.png" width="30" height="30" class="d-inline-block">
'<%=id %>'님의 책바구니
  </span>
</nav>
<!--검색순서 끝-->

<form name="CartBookFrm" id="CartBookFrm" action="book_pay.do" method="post">
<input type="hidden" name="id" value="${user_id}">
<input type="hidden" name="cartValue" value="value"/>
<div class="row"  style="border-bottom: 1px solid #f0f0f0; width: 1460px; margin:30px;">
		<div style="width: 100px; position:relative; float:right; margin-bottom: 15px;">
			<input type="button"  class="btn btn-outline-danger" value="선택삭제" id="deleteBtn" onclick="bookDel()"/>
		</div>
</div>
<div class="card-group">
  <div class="card">
    	<div style="text-align: center; margin: 10px; font-weight: bold" >구매리스트   </div>
    <div class="card-body">
    <!--"구매"리스트 시작-->
	
      <div>
			<table class="table table-hover" id="cartListTable">
			    <tr style="background-color: #FFFFFF; border: 2px solid #f0f0f0;">
			      <th style="width:70px;">
			      <input type="checkbox"  id="bookcheckboxheader" name="bookcheckboxheader" onclick="allChk(this)"/>
			      </th>
			      <th id="cartListHeader">도서명</th>
			      <th id="cartListHeader">저자</th>
			      <th id="cartListHeader">가격</th>
			    </tr>
			    <c:if test="${empty cartList}">
			 	 	<tr>
						<td colspan="4"> 카트에 담긴 책이 없습니다.</td>
					</tr>
				</c:if> 
				 <c:if test="${empty cart.sale_class eq 'r'}">
					 <tr >
						<td colspan="4"> 카트에 담긴 책이 없습니다.</td>
					</tr>
				</c:if> 
			
		<c:forEach var="cart" items="${cartList}">
			<c:if test="${cart.sale_class eq 'p'|| cart.sale_class eq 'p/r'}">
				<tr>
				  <td>
				  <input type="checkbox" id="saleChk" name="cartCode" class="book_code"  value="${cart.code}"  onclick="chkPrice()">
				  </td>
				  <td style="width: 280px">
				  <img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${cart.img}" id="cartList_book_img">
				  <br/>${cart.title} </td>
				  <td>${cart.author}</td>
				  <td> <input type="hidden" name="book_price" value="${cart.sale_price} "/> ${cart.sale_price} 원</td> 
				</tr>
				    <input type="hidden" name="code" value="${cart.book_code}">
			</c:if>
		</c:forEach>
		</table>
		</div>
    </div>
  </div><!--card2 -->
  <div class="card">
 	<div style="text-align: center; margin: 10px; font-weight: bold" >대여리스트</div>
    <div class="card-body">
    <!--"대여"리스트 시작-->
		<!-- 도서 리스트 시작 -->
		<div>
			<table class="table table-hover" id="cartListTable">
			    <tr style="background-color: #FFFFFF; border: 2px solid #f0f0f0;">
			      <th style="width:70px;">
			      <input type="checkbox"  id="bookcheckboxheader" name="bookcheckboxheader" onclick="allChk(this)"/>
			      </th>
			      <th id="cartListHeader">도서명</th>
			      <th id="cartListHeader">저자</th>
			      <th id="cartListHeader">대여일</th>
			      <th id="cartListHeader">가격</th>
			    </tr>
			
			 	 <c:if test="${empty cartList}">
			 	 	<tr>
						<td colspan="5"> 카트에 담긴 책이 없습니다.</td>
					</tr>
				</c:if> 
		
				 <c:if test="${empty cart.sale_class eq 'r' and  empty cart.sale_class eq 'p/r'}">
					 <tr >
						<td colspan="5"> 카트에 담긴 책이 없습니다.</td>
					</tr>
				</c:if> 
			   <c:forEach var="cart" items="${cartList}">
				
			   <c:if test="${cart.sale_class eq 'r' || cart.sale_class eq 'p/r'}">
			    <tr>
			      <td> 
			      <input type="checkbox" id="rentalChk" name="cartCode" class="book_code"  value="${cart.code}" onclick="chkPrice()">
			      </td>
			      <td style="width: 280px">
			      <img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${cart.img}" id="cartList_book_img">
			      <br/>${cart.title} </td>
			      <td>${cart.author}</td>
			      <td>7일</td>
			      <td> <input type="hidden" name="book_price" value="${cart.rental_price} "/>${cart.rental_price} 원</td> 
			    </tr>
			   <input type="hidden" name="code" value="${cart.book_code}">
			   </c:if>
		</c:forEach>
			</table>
		</div>
		<!-- 도서 리스트 끝 -->
		
</div>
		</div><!-- card2 -->

			</div><!--"대여"리스트 끝-->
			
			<!--총 결제금액 시작 -->
		<div class="card text-center" style="margin-top: 100px; border: 1px solid #f0f0f0">
		  <div class="card-header">
		   <font style="font-weight: bold; font-size: 20px;"> 총 결제금액</font>
		  </div>
		  <div class="card-body" >
		    <p class="card-text">선택한 상품 개수 :<span id="chkCnt" class=col> </span> </p>
		    <p class="card-text">선택한 상품의 금액 :<span id="chkPrice" class=col> </span> </p>
		    <button type="button" class="btn btn-outline-secondary" id="payBtn">결제하기</button>
		    
		    <div id="hiddenBuy"></div>
		  </div>
		</div>
		<!--총 결제금액 끝 -->
</form>
	<div class="card" style="margin-top: 30px; border: 1px solid #7A7A7A; color: #7A7A7A; padding:20px">
	- 포인트는 결제하기 페이지에서 적용이 가능합니다.<br/>
	- 이용에 문의사항이 있으시다면, 고객센터 > FAQ를 참고해 주시거나, 고객센터 > 1:1문의를 이용해 주시기 바랍니다.<br/>
	- 다운로드를 하신 컨텐츠는 주문 취소 및 환불이 불가능합니다.<br/>
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
