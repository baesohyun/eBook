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
<title>E-Book 리스트</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/jsp_prj/common/css/main.css"/>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_admin_prj3/common/css/admin_main_design.css"/>
<style type="text/css">

   #inquiry-condition{margin: 0px auto;}

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

 <%@ include file="../../common/jsp/admin_include_snb_ebook_list.jsp" %>

</div>

<div id="content">

<h6>e-book 관리 > e-book 리스트</h6>
<h3>| e-book 리스트</h3>
<br/>

 <div id="bookSearch"> <!-- 검색조건 시작  -->

<form class="form-inline" action="admin_book_list.do" id="searchFrm" method="get">

 <div id="inquiry-condition" style="width: 800px; height:150px;  margin-bottom: 30px;"> 
 
 <div style="width: 320px; height: 50px; float:left; margin-left: 80px">
  <div class="form-group">
    <label for="exampleFormControlSelect1" style="width: 125px;">카테고리</label>
    <select class="form-control" id="category_code" name="category_code"  style="width:  160px">
        <option value=""${param.category_code eq ''?" selected='selected' ":""}><c:out value="전체"/></option> 
        <option value="BC_000001"${param.category_code eq 'BC_000001'?" selected='selected' ":""}><c:out value="소설"/></option> 
		<option value="BC_000002"${param.category_code eq 'BC_000002'?" selected='selected' ":""}><c:out value="경영/경제"/></option> 
		<option value="BC_000003"${param.category_code eq 'BC_000003'?" selected='selected' ":""}><c:out value="인문/사회/역사"/></option> 
		<option value="BC_000004"${param.category_code eq 'BC_000004'?" selected='selected' ":""}><c:out value="자기계발"/></option> 
		<option value="BC_000005"${param.category_code eq 'BC_000005'?" selected='selected' ":""}><c:out value="에세이/시"/></option> 
		<option value="BC_000006"${param.category_code eq 'BC_000006'?" selected='selected' ":""}><c:out value="여행"/></option> 
		<option value="BC_000007"${param.category_code eq 'BC_000007'?" selected='selected' ":""}><c:out value="컴퓨터/IT"/></option> 
		<option value="BC_000008"${param.category_code eq 'BC_000008'?" selected='selected' ":""}><c:out value="건강/다이어트"/></option> 
		<option value="BC_000009"${param.category_code eq 'BC_000009'?" selected='selected' ":""}><c:out value="만화"/></option> 
    </select>
  </div>
</div> 

  <div style="width: 800px; height: 60px;" >
 <input type="hidden" name="cmd" value="book_list">  <!-- ? -->
  <select class="custom-select mr-sm-2" name="field" id="field" style="vertical-align: top;">
     <option value="title"${ param.field eq 'title'?" selected='selected' ":""}>제목</option>
     <option value="author"${ param.field eq 'author'?" selected='selected' ":""}>저자</option>
</select>
<input type="text" style="vertical-align:top;" class="form-control mb-2 mr-ms-2" name="keyword" id="keyword" value="${ param.keyword }"/>
</div> 

 <div style="width: 250px; height: 50px; float: left; margin-left: 100px">
  <div class="form-group">
    <label for="exampleFormControlSelect1" style="width: 125px;">진열 여부</label>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="radio" id="sale_state"  name="sale_state"  value="y" checked="checked">
      <label class="form-check-label" for="inlineRadio1">진열</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="radio" id="sale_state"  name="sale_state"  value="n">
      <label class="form-check-label" for="inlineRadio2">품절</label>
    </div>
  </div>
</div>

<div style="width: 415px; height: 50px; float:right; ">
  <div class="form-group">
    <label for="exampleFormControlSelect1" style="width: 125px;">판매/대출 여부</label>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="radio" id="sale_class"  name="sale_class" value="p/r">
      <label class="form-check-label" for="inlineCheckbox1">전체</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="radio" id="sale_class"  name="sale_class"  value="p">
      <label class="form-check-label" for="inlineCheckbox1">구매</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="radio" id="sale_class"  name="sale_class"  value="r">
      <label class="form-check-label" for="inlineCheckbox2">대여</label>
    </div>
  </div>
</div > 
<div style="width: 460px;  height: 50px; float:right; float:left; margin-left: 350px;  ">
  <input type="submit" class="btn btn-primary" id="searchBtn" value="검색" />
</div>

</div> 

</form> 
</div> <!-- 검색조건 끝  -->

<!-- <div style="float: right; margin-right: 12px;">
    검색 등록 도서 0000개 / 총 등록 도서 0000개
</div> -->

<div> <!-- E-Book 리스트 시작 -->	
<table class="table">
  <thead class="thead-dark">
    <tr>
      <!-- 1350 -->
      <th scope="col" style="width:100px;">도서코드</th>
      <th scope="col" style="width:100px;">판매분류</th>
      <th scope="col" style="width:140px;">카테고리</th>
      <th scope="col" style="width:400px;">도서명</th>
      <th scope="col" style="width:180px;">저자</th>
      <th scope="col" style="width:150px;">등록일</th>
      <th scope="col" style="width:100px;">판매가격</th>
      <th scope="col" style="width:100px;">대여가격</th>
      <th scope="col" style="width:80px;">상태</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="book" items="${bookData }">  <!-- ${bookData }" Controller에 설정되어있음 -->
	<tr>
		<td><c:out value="${ book.book_code }"/></td>	 
		<c:choose>
			<c:when test="${book.sale_class eq 'p/r'}"><td><c:out value="전체"/></td></c:when>
			<c:when test="${book.sale_class eq 'p'}"><td><c:out value="구매"/></td></c:when>
			<c:otherwise><td><c:out value="대여"/></c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${book.category_code eq 'BC_000001'}"><td><c:out value="소설"/></td></c:when>
			<c:when test="${book.category_code eq 'BC_000002'}"><td><c:out value="경영/경제"/></td></c:when>
			<c:when test="${book.category_code eq 'BC_000003'}"><td><c:out value="인문/사회/역사"/></td></c:when>
			<c:when test="${book.category_code eq 'BC_000004'}"><td><c:out value="자기계발"/></td></c:when>
			<c:when test="${book.category_code eq 'BC_000005'}"><td><c:out value="에세이/시"/></td></c:when>
			<c:when test="${book.category_code eq 'BC_000006'}"><td><c:out value="여행"/></td></c:when>
			<c:when test="${book.category_code eq 'BC_000007'}"><td><c:out value="컴퓨터/IT"/></td></c:when>
			<c:when test="${book.category_code eq 'BC_000008'}"><td><c:out value="건강/다이어트"/></td></c:when>
			<c:otherwise><td><c:out value="만화"/></c:otherwise>
		</c:choose>
		<td><a href="admin_book_detail_modify.do?book_code=${ book.book_code}"><c:out value="${ book.title }"/></a></td>	
		<td><c:out value="${ book.author }"/></td>	
		<td><c:out value="${ book.input_date }"/></td>	
		<td><c:out value="${ book.sale_price }"/></td>	
		<td><c:out value="${ book.rental_price }"/></td>	
	   <td><c:out value="${ book.sale_state eq 'y'? '판매' : '절판'}"/></td> 
	</tr>
	</c:forEach>
	<c:if test="${empty bookData }">
	<tr>
		<td colspan="10" style="text-align: center">등록된 책 정보가 없습니다.</td>
	</tr>
	</c:if>
  </tbody>
</table>
</div><!-- E-Book 리스트 끝 -->	

	<div id="bookIndexList" >
		<div style="margin:0px auto; width: 400px;">
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