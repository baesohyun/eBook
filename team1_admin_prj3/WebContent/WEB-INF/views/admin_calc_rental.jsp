<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    session="true"
    isELIgnored="false"
    %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
 	request.setCharacterEncoding("UTF-8");  //request.setCharacterEncoding ->POST 방식에서만 적용된다.
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Book 대여 관리</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/jsp_prj/common/css/main.css"/>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_admin_prj3/common/css/admin_main_design.css"/>
<style type="text/css">

</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 
<script type="text/javascript">

</script>
</head>
<body>
<div id="books">

<div id="header">

 <%@ include file="../../common/jsp/admin_include_header.jsp" %>

</div>

<div id="container">


<div id="snb">

 <%@ include file="../../common/jsp/admin_include_snb_ebook_calc.jsp" %>

</div>

<div id="content">

<h6>구매 대여 관리 > 대여 현황 관리</h6>
<h3>| 대여 현황 관리</h3>
<br/>


<%-- <form class="form-inline" action="admin_calc_rental.do" id="searchFrm">

	<div style="margin: 0px auto;"> <!-- 검색조건 시작  -->
	
	<input type="hidden" name="cmd" value="board_list"/>
	  <select class="custom-select mr-sm-2" name="field" id="field">
	     <option value="title"${ param.field eq 'title'?" selected='selected' ":""}>제목</option>
	     <option value="author"${ param.field eq 'author'?" selected='selected' ":""}>저자</option>
	  </select>
	  <input type="text" style="vertical-align: top;" class="form-control mb-2 mr-sm-2" id="keyword" name="keyword" value="${param.keyword}"/>
	
	  <input type="submit" class="btn btn-dark" id="searchBtn" value="검색" height="100px"/>
	
	</div> <!-- 검색조건 끝  -->
</form> --%>

<%-- <form class="form-inline" action="admin_calc_rental.do" id="searchFrm" method="get">

<div id="inquiry-condition" style="width: 900px; height:130px;  margin-bottom: 30px;"> 
 
 <div style="width: 310px; height: 60px; float: left; margin-left: 190px;" >
 <input type="hidden" name="cmd" value="book_list">  <!-- ? -->
  <select class="custom-select mr-sm-2" name="field" id="field" style="vertical-align: top;">
     <option value="title"${ param.field eq 'title'?" selected='selected' ":""}>제목</option>
     <option value="id"${ param.field eq 'id'?" selected='selected' ":""}>ID</option>
</select>
<input type="text" style="vertical-align:top;" class="form-control mb-2 mr-ms-2" name="keyword" id="keyword" value="${ param.keyword }"/>
</div> 

 <div style="width: 400px; height: 60px; float: right;">
 
	<div class="form-group">
	
	<label for="exampleFormControlSelect1" style="width: 110px;">결제일</label>
	
	<div class="input-group date">
	  <input type="text" class="form-control form-control-sm" id="input_date" name="input_date"  style="width: 100px;">
	  <span class="input-group-addon">
	    <img src="http://localhost:8080/Team1_prj3/common/images/icon_calendar.png" style="margin-top: 5px; margin-left: 2px;"/>
	  </span>
	</div>
	 ~ 
	<div class="input-group date">
	  <input type="text" class="form-control form-control-sm" id="input_date" name="input_date"  style="width: 100px;">
	  <span class="input-group-addon">
	    <img src="http://localhost:8080/Team1_prj3/common/images/icon_calendar.png" style="margin-top: 5px; margin-left: 2px;"/>
	  </span>
	</div>
	
	</div>
</div>  

<div style="width: 460px;  height: 50px; float:right; float:left; margin-left: 500px;  ">
  <input type="submit" class="btn btn-primary" id="searchBtn" value="검색" />
</div>

</div> 

</form>  --%>


<form class="form-inline" action="admin_calc_rental" id="searchFrm" method="get">

<div id="inquiry-condition" style="width: 900px; height:70px;  margin-bottom: 30px;"> 
 
 <div style="width: 320px; height: 60px; float: left; margin-left: 400px;" >
 <input type="hidden" name="cmd" value="book_list">  <!-- ? -->
  <select class="custom-select mr-sm-2" name="field" id="field" style="vertical-align: top;">
     <option value="title"${ param.field eq 'title'?" selected='selected' ":""}>제목</option>
     <option value="id"${ param.field eq 'id'?" selected='selected' ":""}>ID</option>
</select>
<input type="text" style="vertical-align:top;" class="form-control mb-2 mr-ms-2" name="keyword" id="keyword" value="${ param.keyword }"/>
</div> 

<div style="width: 100px;  height: 50px; float:right; float:left;  ">
  <input type="submit" class="btn btn-primary" id="searchBtn" value="검색" />
</div>

</div> 

</form> 


<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">결제코드</th>
      <th scope="col">ID</th>
      <th scope="col">도서명</th>  <!-- 에 따른 도서명 출력 -->
      <th scope="col">CASH</th>
      <th scope="col">POINT</th>
      <th scope="col">결제금액</th>
      <th scope="col">결제방식</th>
      <th scope="col">결제일</th>
      <th scope="col">대여시작일</th>
      <th scope="col">대여만료일</th>
    </tr>
  </thead>
  <tbody>
	    <c:forEach var="rental" items="${rentalData }">  <!-- ${purchaseData }" Controller에 설정되어있음 -->
	<tr>
		<td><c:out value="${ rental.code }"/></td>	
		<td><c:out value="${ rental.id }"/></td>	
		<td><c:out value="${ rental.title }"/></td>	
		<td><c:out value="${ rental.use_cash }"/></td>	
		<td><c:out value="${ rental.use_point }"/></td>	
		<td><c:out value="${ rental.total_price }"/></td>	
		<%-- <td><c:out value="${ purchase.pay_method }"/></td>	 --%>
		<c:choose>
			<c:when test="${rental.pay_method eq 'card'}"><td><c:out value="카드"/></td></c:when>
			<c:when test="${rental.pay_method eq 'deposit'}"><td><c:out value="무통장"/></td></c:when>
			<c:otherwise><td><c:out value="기타"/></c:otherwise>
		</c:choose>
		<td><c:out value="${ rental.pay_date }"/></td>	
		<td><c:out value="${ rental.rental_start }"/></td>	
		<td><c:out value="${ rental.rental_end }"/></td>	
	</tr>
	</c:forEach>
	<c:if test="${empty rentalData }">
	<tr>
		<td colspan="10" style="text-align: center">등록된 결제내역이 없습니다.</td>
	</tr>
	</c:if>

  </tbody>
</table>

	<div id="bookIndexList" >
		<div style="margin:0px auto; width:400px;">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
				<c:out value="${ indexList }" escapeXml="false"/>
			  </ul>
			</nav>
		</div>
	</div><!-- boardIndexList 끝 -->


</div><!-- content 끝 -->
</div> <!-- container 끝 -->
<div id="footer">

 <%@ include file="../../common/jsp/admin_include_footer.jsp" %>

</div>
</div>
</body>
</html>