<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="문의사항"
    %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/main.css"/>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_user_prj3/common/css/noticeMenu.css"/>
<style type="text/css">
	 
	 #container{margin-top: 80px}
	/* container 시작 */
/* 	#container{ width: 1600px; min-height: 1000px; margin:0px auto; margin-top: 20px}
	
	#carouselExampleControls,#showBook,#cashBanner,#notice{margin-bottom: 50px}
	#bookTitle1{font-size: 20px; font-weight: bold; text-align: center; color: #800000}
	#bookTitle2{font-size: 20px; font-weight: bold;}
	
	#cashBanner{height:125px; background-color:#fff3cd}
	#cashText1{padding-left: 20px; padding-top: 10px;}
	#cashText2{font-size: 20px;}
	#cashText3{color:#bc79ff; font-weight: bold; font-size: 28px;}
	#cashText4{color:#787878; font-size: 15px;}
	
	#notice{margin-bottom: 50px}
	#notice1{font-size: 15px; font-weight: bold; margin-bottom: 10px}
	#notice2{border:1px solid #333; height:120px;}
	#notice3_1{margin: 10px auto; margin-left: 10px; font-size: 13px; }
	#notice3_2{ text-align: center; vertical-align: middle; margin: 20px auto; font-size: 13px; }
	#notice3_3{ text-align: center; vertical-align: middle; margin: 20px auto; font-size: 20px; }
	#notice4{font-size: 13px; text-align: center}
	/* container 끝 */
	
	#notice{ font-size: 30px; font-weight: bold;}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {
    $("#searchBtn").click(function(){
	    if($("#keyword").val().trim() == ""){
		    alert("검색어를 입력해 주세요.");
			$("#keyword").focus();
			return;
		}//end if
	    $("#searchFrm").submit();
    });//click    	
    $("#btn").click(function () {
		location.href="add_form.do"
	})
});//ready
</script>
</head>	
<body>
<div id="books">
<!-- header 시작  -->		
<div id="header">
	<jsp:include page="../../../common/jsp/jinibooks_header.jsp"/>	
</div>
<!-- header 끝  -->	
<div id="booksContent" class="row" style="margin-top: 80px">
<!-- container 시작  -->

<!-- 사이드메뉴바  -->
<jsp:include page="../../../common/jsp/jinibooks_noticeMenu.jsp"/>

<div id="MainContainer" class="col-8">
<div id="Wrap" style="width: 1000px; float: left; margin-left:0px;">
<div id="notice" style="text-align: center; margin-top: 40px;">문의사항</div><br>
<table class="table table-hover" style="text-align: center;" border="1px;">
 <thead>
    <tr>
      <th scope="col" style="width: 70px;">번호</th>
      <th scope="col" style="width: 300px;">제목</th>
      <th scope="col" style="width: 100px;">답변여부</th>	
      <th scope="col" style="width: 130px;">작성일</th>
    </tr>
  </thead>
  <tbody>  

  <c:forEach var="blVO" items="${requestScope.boardList}">
    <tr style="max-height: 40px;">
      <th scope="row">
      <c:out value="${fn:substring(blVO.num,2,8)}"/></th>
      <td><a href="detail2.do?num=${ blVO.num}" style="color: black;"><c:out value="${blVO.subject}"/></a></td>
      <td style="color: ${ blVO.answer_flag eq '미답변'?'#FF0000':'#0000FF'}"><c:out value="${blVO.answer_flag}"/></td>
      <td><c:out value="${blVO.w_day}"/></td>
    </tr>
  </c:forEach>

  </tbody>
</table>

    <div id="boardIndexList" style="margin-left: 300px">
  
<div style="margin:0px auto;">
<nav aria-label="Page navigation example">
  <ul class="pagination">
    <c:out value="${indexList}" escapeXml="false"/>
  </ul>
</nav>
</div>

  </div>
  
<div id="boardSearch" style="margin-left: 200px;">
  
<form class="form-inline" action="question.do" id="searchFrm" style="margin-top: 20px; ">
<input type="hidden" name="cmd" value="board_list"/>
  <select class="custom-select mr-sm-2" name="field" id="field">
    <option value="subject"${param.field eq 'subject'?" selected='selected'":""}>제목</option>
    <option value="content"${param.field eq 'content'?" selected='selected'":""}>내용</option>
  </select>

  <input type="text" style="vertical-align: top; margin-top: 8px;" class="form-control mb-2 mr-sm-2" id="keyword" name="keyword" value="${param.keyword}"/>
  <input type="button" class="btn btn-primary" id="searchBtn" value="검색" style="margin-left: 20px;"/>
  <input type="button" class="btn btn-secondary" id="btn" value="문의하기" style="margin-left: 250px;"/>
</form>  
</div>

  </div>
 

</div><!-- Wrap끝 -->
</div><!-- MainContainer 끝  -->
</div><!-- bookContent 끝  -->
<!-- footer 시작  -->	
<div id ="footer" style="clear: both;">
        <jsp:include page="../../../common/jsp/jinibooks_footer.jsp"/>
</div>
<!-- footer 끝  -->	

</body>
</html>