<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="캐시 충전"
    %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캐시충전</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/main.css">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/mypageMenu.css">
<style type="text/css">
	
	/* container 시작 */
	#Maincontainer{margin-left: 100px}
	#nav_Content{border-bottom: 1px solid #333; width: 700px;margin-left: 30px; margin-top: 10px}
	.container1{ max-width: 700px;width: 100%; padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;}
	.row1{display: flex;flex-wrap: wrap;}
	.navbar-brand{font-weight: bold;}
	.lately_td{ width : 160px}
	
	#cash{margin-top: 50px; margin-left: 20px}
	#cashInput{text-align: center}
	#cashLabel{padding-top: 30px; padding-left: 10px; font-size: 25px; font-weight: bold;}
	#jiniCash,#myCash, #payTxt{font-size: 20px; font-weight: bold; padding-left: 20px; color:#646464}
	#jiniCash{padding-bottom: 10px}
	#myCash{padding-top: 30px; padding-bottom: 20px}
	#cashTb{font-size: 15px;}
	#payTxt{padding-top: 30px; padding-bottom: 10px}
	#pay{margin-top: 10px; margin-bottom: 50px; border:2px solid #c0c0c0; height:80px; width:350px; text-align: left; padding-left: 50px; padding-top:30px}
	#payRadio{margin-right: 20px}
	#payChk,#payBtn{margin-top: 10px; margin-bottom: 80px; }
	#payChk{padding-left: 15px}
	#payBtn{padding-left: 350px}
	#btn{width:200px}
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
<div id="Maincontainer" class="col-8">
<div id="cash">
<form class="cashFrm">
<div id="cashInput">
  <div class="form-group row"  id="jiniCash">
  	<img src="http://localhost:8080/team1_user_prj3/common/images/images_mypage/my_cash.png">
	<label class="form-check-label" for="gridCheck1" id="cashLabel">지니 캐시</label>
  </div>
	<hr/>
  <div class="form-group row" id="myCash">
	<label class="form-check-label" for="gridCheck1">내 캐시 : 0원</label>
  </div>
  <div class="form-group row" >
  	<table class="table" >
  <thead>
    <tr >
      <th scope="col"></th>
      <th scope="col" id="cashTb">캐시 충전</th>
      <th scope="col" id="cashTb">적립률</th>
      <th scope="col" id="cashTb">포인트 적립</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">
      <div class="custom-control custom-radio">
  		<input type="radio" id="customRadio1" name="customRadio" class="custom-control-input">
  		<label class="custom-control-label" for="customRadio1"></label>
	 </div>
      </th>
      <td>2,000원</td>
      <td>5%</td>
      <td>+100 point</td>
    </tr>
    <tr>
      <th scope="row">
      <div class="custom-control custom-radio">
		  <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input">
		  <label class="custom-control-label" for="customRadio2"></label>
	 </div>
      </th>
      <td>3,000원</td>
      <td>5%</td>
      <td>+150 point</td>
    </tr>
    <tr>
      <th scope="row">
      <div class="custom-control custom-radio">
		  <input type="radio" id="customRadio3" name="customRadio" class="custom-control-input">
		  <label class="custom-control-label" for="customRadio3"></label>
	 </div>
      </th>
      <td>5,000원</td>
      <td>5%</td>
      <td>+250 point</td>
    </tr>
    <tr>
      <th scope="row">
      <div class="custom-control custom-radio">
		  <input type="radio" id="customRadio4" name="customRadio" class="custom-control-input">
		  <label class="custom-control-label" for="customRadio4"></label>
	 </div>
      </th>
      <td>10,000원</td>
      <td>10%</td>
      <td>+1,000 point</td>
    </tr>
    <tr>
      <th scope="row">
      <div class="custom-control custom-radio">
		  <input type="radio" id="customRadio5" name="customRadio" class="custom-control-input">
		  <label class="custom-control-label" for="customRadio5"></label>
	 </div>
      </th>
      <td>50,000원</td>
      <td>10%</td>
      <td>+5,000 point</td>
    </tr>
  </tbody>
</table>
  </div>
  <div class="form-group row"  id="payTxt">
		<label class="form-check-label" for="gridCheck1">결제수단</label>
  </div>
  <div id="pay">
	  <div class="custom-control custom-radio custom-control-inline">
	  <input type="radio" id="customRadioInline1" name="customRadioInline1" class="custom-control-input">
	  <label class="custom-control-label" for="customRadioInline1" id="payRadio">신용카드</label>
	</div>
	<div class="custom-control custom-radio custom-control-inline">
	  <input type="radio" id="customRadioInline2" name="customRadioInline1" class="custom-control-input">
	  <label class="custom-control-label" for="customRadioInline2">무통장 입금</label>
	</div>
 </div>
  <div class="form-group row"  id="payChk" >
  	<div class="custom-control custom-checkbox" >
	  <input type="checkbox" class="custom-control-input" id="customCheck1">
	  <label class="custom-control-label" for="customCheck1">
	  	<span style="font-weight: bold">상품,가격,할인정보,유의사항 등을 확인하였으며 구매에 동의합니다.</span>
	  </label>
	</div>
  </div>
  <div class="form-group row"  id="payBtn">
	<button type="submit" class="btn btn-warning"  id="btn">캐시 충전</button>
</div>
</div>
</form>
</div>
</div>
<!-- container 끝  -->		
</div>

<hr>
<!-- footer 시작  -->	
<div id ="footer">
   <jsp:include page="../../../../common/jsp/jinibooks_footer.jsp"/>
</div>
<!-- footer 끝  -->	
</div>

</body>
</html>
