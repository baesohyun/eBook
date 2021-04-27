<%@page import="kr.co.jinibooks.vo.CartPayVO"%>
<%@page import="kr.co.jinibooks.vo.paymentVO"%>
<%@page import="java.sql.Date"%>
<%@page import="kr.co.jinibooks.domain.SelectPayDomain" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="책 구매/대여 결제 창"
    %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
 	request.setCharacterEncoding("UTF-8");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/main.css"/>
<style type="text/css">
	
	/* aside시작 */
	.haside{position:fixed;  margin-top: 80px; top:170px; right: 30px; text-align: center;font-weight: normal;font-size:13px; width: 130px; } 
	/* aside끝 */
	 
	/* container 시작 */
	#container{ width: 1200px; min-height: 1000px; margin:0px auto;margin-top: 100px}
	
	#orderLabel{font-size: 20px; font-weight: bold}
	#payTxt{font-size: 18px; font-weight: bold}
	#orderTb{vertical-align: middle; font-size: 15px;}
	#ordering{margin-top: 35px; margin-bottom: 35px}
	#orderingTxt{font-weight: bold}
	#totalPay{font-weight: bold; font-size: 17px; margin-bottom: 80px; text-align: center; padding-top: 20px; padding-bottom:20px; background-color: #ffd5bf; border:2px solid #ffa275}
	#pay{margin-top: 35px; margin-bottom: 60px}
	#useCashTxt,#usePointTxt{width:100px}
	#payChoose{margin-bottom: 20px}
	#payChk{margin-bottom: 50px}
	#btn{width:300px}
	#payBtn{width:350px}
	#useCPBtn{color:#fa8d0a}
	/* container 끝 */
	
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<%
  String id=(String)session.getAttribute("user_id");
%>
<script type="text/javascript">
$(function(){
	
	
	var obj=document.postFrm;
	var originPrice=obj.totalPrice.value;
	var tempPrice;
	var updatePrice=document.getElementById("updatePrice");
	
	var onlyNum= RegExp(/^[0-9]{1,20}$/);
	
	$("#useCPBtn").click(function(){
		
		var useCashTxt=obj.useCashTxt.value;
		var usePointTxt=obj.usePointTxt.value;
		
		
		var memberCash=obj.memberCash.value;
		var memberPoint=obj.memberPoint.value;
		
		if(confirm("입력된 금액을 사용하시겠습니까?")){
			
			 if((useCashTxt=="") && (usePointTxt=="")){
				alert("사용할 금액을 입력해주세요.");
				$("#useCashTxt").focus();
				return;
			}//end if 
			if( (useCashTxt>0 && useCashTxt<100) || (usePointTxt>0 && usePointTxt<100)){
				alert("금액 단위는 100원 이상부터 사용가능합니다.");
				$("#useCashTxt").focus();
				return false;
			}//end if
			if (!onlyNum.test(useCashTxt) && !onlyNum.test(usePointTxt)) {
		        alert("숫자 형식에 맞게 입력해주세요");
		        $("#useCashTxt").focus();
		        return false;
			 }//end if
			if((useCashTxt>memberCash) || (usePointTxt>memberPoint) ){
				alert("보유 금액 이상 사용은 불가능합니다.");
				$("#useCashTxt").focus();
				return;
			}//end if
			if((useCashTxt>totalPrice) || (usePointTxt>totalPrice)){
				alert("구매하실 금액 이상 사용은 불가능합니다.");
				$("#useCashTxt").focus();
				return;
			}//end if
			
			document.postFrm.useCash.value=useCashTxt;
			document.postFrm.usePoint.value=usePointTxt;
			
			 tempPrice=originPrice-useCash-usePoint;
			updatePrice.innerHTML=tempPrice;
		}//end if
	})//useCBtn click
		
	
		$("#payBtn").click(function(){
		var useCash=document.postFrm.useCash.value;
		var usePoint=document.postFrm.usePoint.value;
		
		var temp=0;
		
			if(useCash==""){
				document.postFrm.useCash.value=temp;
			}//end if
			if(usePoint==""){
				document.postFrm.usePoint.value=temp;
			}//end if
			
			//결제 수단(라디오 버튼 선택 되었는가)
			var flag=false;
			var payMethod="";
			for(var i=0; i<obj.payMethod.length;i++){
				if(obj.payMethod[i].checked){
					flag=true;
					payMethod=obj.payMethod[i].value;
				}//end if
			}//end for
			
			if(confirm("도서를 결제하시겠습니까?")){
				
				if(!flag){
					alert("결제수단을 선택해주세요.");
				}else{
					if(!$("#customCheck1").is(":checked")){
						alert("구매에 동의함을 체크해주세요.");
					}else{
				$("#postFrm").submit();
					}//end esle
					
				}//end else
			}//end if(confrim)
	})//payBtn click
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
    <form name="postFrm" id="postFrm" action="book_paySuccess.do" method="post">
    <input type="hidden" name="id" value="${user_id}"/>
	<div class="row">
    <div class="col-8">
    <div>
    	<label class="form-check-label" for="gridCheck1" id="orderLabel">주문 목록</label>
    </div>
    <hr color="#959595"/>
    <div>
    	<table class="table table-borderless">
		  <tbody>
		  <c:forEach var="paybook" items="${payBook}">
		    <tr>
		      <th scope="row"><img src="http://localhost:8080/team1_user_prj3/common/images/images_book/${paybook.img}" width="100" hieght="300"></th>
		      <td id="orderTb">
			<c:if test="${paybook.buy eq 'p' }">
		      <span class="badge badge-pill badge-success"> 구매 </span>
			</c:if>
			
			<c:if test="${paybook.buy eq 'r' }">
		      <span class="badge badge-pill badge-success"> 대여 (7일) </span>
			</c:if>
		      
		      <td id="orderTb"><strong><c:out value="${paybook.title}"/>
		      </strong></td>
		      <td id="orderTb"><strong><c:out value="${paybook.price}"/>원</strong></td>
		    </tr>
		      <input type="hidden" value="${paybook.book_code}" name="bookCode"  id="bookCode">
		    <input type="hidden" value="${paybook.buy}" name="buyClass"  id="buyClass"> 
		  </c:forEach>
		  </tbody>
		</table>
    </div>
    <hr color="#c0c0c0"/>
    </div>
    <div class="col-4" style="padding-left: 80px">
    	<div>
    		<label class="form-check-label" for="gridCheck1" id="orderLabel">결제 정보</label>
    	</div>
    	<hr/>
    	<div>
    	 <div class="row" id="ordering">
		    <div class="col-5"><span id="orderingTxt">총 주문 금액</span></div>
		    <div class="col-7"><c:out value="${total}"/> 원</div>
    	</div>
    	 <div class="row"  id="ordering">
		    <div class="col-5"  id="orderingTxt">보유 캐시 <span class="badge badge-pill badge-warning"> C</span></div>
		    <div class="col-7"><c:out value="${cashPoint.cash}"/> 원</div>
		    <input type="hidden" value="${cashPoint.cash}" name="memberCash"  id="memberCash">
    	</div>
    	 <div class="row"  id="ordering">
		    <div class="col-5"  id="orderingTxt">보유 포인트 <span class="badge badge-pill badge-warning">P</span></div>
		    <div class="col-7"><c:out value="${cashPoint.point}"/> P</div>
		    <input type="hidden" value="${cashPoint.point}" name="memberPoint"  id="memberPoint">
    	</div>
    	 <div class="row"  id="ordering">
		    <div class="col-5" id="orderingTxt">사용할 캐시</div>
		    <div class="col-7">
	    		<input type="text" class="form-control"   name="useCashTxt" id="useCashTxt" placeholder="0원" >
	    		<input type="hidden" name="useCash" value="0"/>
			</div>
    	</div>
    	 <div class="row"  id="ordering">
		    <div class="col-5" id="orderingTxt">사용할 포인트</div>
		    <div class="col-7">
	    		<input type="text" class="form-control"  name="usePointTxt" id="usePointTxt" placeholder="0P" >
	    		<input type="hidden" name="usePoint" value="0"/>
			</div>
    	</div>
    	<div id="usebtn">
			<input type="button" class="btn btn-outline-warning"  id="useCPBtn" value="캐시 및 포인트 사용" >
    	</div>
    	</div>
    	<hr/>
    	<div id="totalPay">
    		<font color="#4d4d4d">총 결제 금액: <span id="updatePrice"><c:out value="${total}"/></span> 원</font>
    		<input type="hidden" value="${total}" name="totalPrice"  id="totalPrice">
    	</div>
    	 <div class="form-group row" >
			<label class="form-check-label" for="gridCheck1" id="orderLabel">결제 수단</label>
  		</div>
  		<hr/>
 	 <div id="pay">
		  <div class="custom-control custom-radio" id="payChoose">
			  <input type="radio" id="payMethod1" name="payMethod" value="card" class="custom-control-input">
			  <label class="custom-control-label" for="payMethod1">신용카드</label>
		 </div>
		<div class="custom-control custom-radio" id="payChoose">
		  <input type="radio" id="payMethod2" name="payMethod" value="deposit" class="custom-control-input">
		  <label class="custom-control-label" for="payMethod2">무통장 입금</label>
		</div>
 	</div>
	  <div class="form-group row">
			<label class="form-check-label" for="gridCheck1" id="orderLabel">구매 동의</label>
	  </div>
	  <hr/>
  	  <div class="custom-control custom-checkbox" id="payChk">
	  <input type="checkbox" class="custom-control-input" id="customCheck1" name="customCheck1">
	  <label class="custom-control-label" for="customCheck1">
	  	<font size="2px">상품,가격,할인정보,유의사항 등을 확인하였으며 구매에 동의합니다.</font>
	  </label>
	</div>
  	<div class="form-group row"  id="payBtn">
		<button type="button" class="btn btn-success"  id="payBtn">결제하기</button>
	</div>
  </div>
</div>
</form>
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
    