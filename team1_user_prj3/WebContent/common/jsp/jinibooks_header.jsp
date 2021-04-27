<%@page import="java.util.List"%>
<%@page import="kr.co.jinibooks.dao.UserBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="지니북스 사용자 헤더"
    session="true"
    isELIgnored="false"
    %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% 
    //String url="home.jsp";
    String id=(String)session.getAttribute("user_id");
    System.out.println("헤더 세션 id: "+id);
    //pageContext.setAttribute("login_url", url);
    %>
    
<script type="text/javascript">
$(function(){
	
	$("#logout").click(function() {
		$.ajax({
			url:"/team1_user_prj3/member/logout_process.do",
			type:"post",
			dataType:"json",
			error:function(xhr){
				alert("문제발생");
			},
			success:function(json){
				if(json.flag){
					//alert("로그아웃 성공");
					//location.href="home.do";
				   	location.replace("/team1_user_prj3"+json.target);
				} else {
					alert("로그아웃에 실패하였습니다.");
				}//end if else
			}
		});//ajax
	});//click

});
/////////////12/10 수정///////////////////////
function enterkey() {
	if (window.event.keyCode == 13) {
		var temp="";
		temp=document.frm.keyword.value;
		if($("#keyword").val().trim()==""){
			document.frm.keyword.value="&nbsp";
			return;
		}//end if
	
	}//end if
}//enterkey

$(function(){
$("#cashBtn").click(function(){
	if("${user_id}"!=null){
		location.href="member/mypage/charge_cash.do";
	}else{
		alert("로그인 후, 이용해주세요.");
		location.href="member/login.do";
	}//end if
})//click
})//ready	
	

/////////////12/10 수정///////////////////////
</script>

    <div id="hLogo" >
		  <form class="form-inline" name="frm" id="pageViewFrm" action="book_searchList.do" method="get">
		 
		  <input type="hidden" name="pageView" id="pageView"/>
		  <input type="hidden" name="url" id="url"  value="book_searchList.do"/>
		  <input type="hidden" name="current_page" id="currentPage" value="1"/>
		<nav>
	  		<a class="navbar-brand" href="/team1_user_prj3/home.do">
	    		<img src="http://localhost:8080/team1_user_prj3/common/images/header_logo.PNG"  class="d-inline-block align-top" alt=""><span id="logo">JINI BOOKS</span>
			</a>
		</nav>
		<div id="hContent">
			    <input class="form-control mr-sm-2" type="search" placeholder="도서명 검색" aria-label="Search" id="keyword" name="keyword" onkeydown="enterkey()">
		</div>
		 <div id="hContent2">
		 <%if(id==null){ %>
			<a href="/team1_user_prj3/member/join.do" id="join">회원가입</a>
			<a href="/team1_user_prj3/member/login.do" id="login">로그인</a>
		<%}else{ %>
			<a href="/team1_user_prj3/member/mypage/pay_book.do?id=<%=id%>" id="myPage">마이페이지</a>
			<a href="book_cartList.do?id=<%=id%>"  id="cart">책바구니</a>
			<input type="button" id="logout" style="border: #FFF; background-color: #FFF;" value="로그아웃"/>
			<!-- <a href="member/logout_process.do" id="logout">로그아웃</a> -->
			<!-- <a href="javascript:location.replace('member/logout_process.do')" id="logout">로그아웃</a> -->
		<%}//end if %>
		</div>
		</form>
	</div>
		
	<div class="container" id="naviBar"> <!-- 헤더 카테고리 상단메뉴 캐시충전    id="naviBar" --> 
	<div class="row1" >

	<div class="col" ><!-- 카테고리 시작  -->
	<nav class="navbar navbar-dark bg" style="width:500px;padding-left:250px">
		<div id="cate">
		    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation"  id="cateBtn">
		      <span class="navbar-toggler-icon"></span>&nbsp;<span id="cateName_left">카테고리</span>
		    </button>
		</div>
	</nav>
		<!-- 카테고리 누르면 나오는 종류 -->
	<div class="pos-f-t" style="position: relative; z-index: 2;max-width: 400px;">
	  <div class="collapse" id="navbarToggleExternalContent">
	    <div class="bg-white p-4" style="border:1px solid #EE4137;" >
	    <hr color="#EE4137"/>
	   <dl>
	    <%
	   String cateName[]={"소설","경영/경제","인문/사회/역사","자기계발","에세이/시","여행","과학/컴퓨터/IT","건강/다이어트","만화"};
	  
	    session.setAttribute("cateName",cateName);
	    for(int i=0; i<cateName.length; i++){
	    %>
	      <dd >&nbsp;&nbsp;&nbsp;
	      <%-- <a href ="book_categoryList.do?cate=${cateName[i]}" class="sub" id="cateName"> --%>
	      <a href ="/team1_user_prj3/book_categoryList.do?cate=<%=cateName[i]%>" class="sub" id="cateName">
	      <span>| <%=cateName[i] %> </span></a></dd>
	    <!--  <hr color="#EE4137"/> -->
	      <%
	    }//end for
	      %>
	      </dl>
	      <hr color="#EE4137"/>
	    </div>
	  </div>
	</div><!-- 카테고리 누르면 나오는 종류 -->
	
	</div><!--카테고리 끝-->
	<!-- 홈,신간,베스트,공지사항  -->
	<div class="col-5">
		<div class="clickColor">
			<div class="container1 d-flex flex-column flex-md-row justify-content-between">
			   <a class="py-3 d-none d-md-inline-block" href="/team1_user_prj3/home.html"  id="cateName_right"><span>홈</span></a>
			   <a class="py-3 d-none d-md-inline-block" href="/team1_user_prj3/book_newList.do"  id="cateName_right"><span>신간</span></a>
			   <a class="py-3 d-none d-md-inline-block" href="/team1_user_prj3/book_bestList.do" id="cateName_right"><span >베스트</span></a>
			   <a class="py-3 d-none d-md-inline-block" href="/team1_user_prj3/notice.do"  id="cateName_right"><span>공지사항</span></a>
			</div>
		</div>
	</div>
	
	<!--캐시충전 시작  -->
		<div class="col" >
		
		 <button type="button" class="btn btn-warning" id="cashBtn"><span id="cashName">캐시충전</span></button>
		</div>
	<!--캐시충전 끝  -->
	</div>
	</div>
	<!-- 상단헤더 끝 -->
    
    
