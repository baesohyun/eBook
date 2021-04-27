<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="사용자 마이페이지 메뉴"
    %>
<%
	String id=(String)session.getAttribute("user_id");
%>   

<nav id="navbar-example3" class="navbar navbar-light bg-light" style="border:1px solid #f0f0f0">
  <a class="navbar-brand" href="pay_book.do?id=<%=id%>">마이페이지 홈<hr/></a>
  <nav class="nav nav-pills flex-column">
    <a class="nav-link"><img src="http://localhost:8080/team1_user_prj3/common/images/images_mypage/my_book.png">&nbsp;책</a>
    <nav class="nav nav-pills flex-column">
        <a class="nav-link ml-3 my-1" href="pay_book.do?id=<%=id%>">내 서재</a>
    <!--   <a class="nav-link ml-3 my-1" href="recommend.do">추천 도서</a> -->
    </nav>
    <a class="nav-link"><img src="http://localhost:8080/team1_user_prj3/common/images/images_mypage/my_pay.png">&nbsp;결제</a>
    <nav class="nav nav-pills flex-column">
      <a class="nav-link ml-3 my-1" href="pay_history.do?id=${user_id}">결제 내역</a>
      <a class="nav-link ml-3 my-1" href="charge_cash.do">충전 관리</a>
    </nav>
    <a class="nav-link"><img src="http://localhost:8080/team1_user_prj3/common/images/images_mypage/my_user.png">&nbsp;개인</a>
    <nav class="nav nav-pills flex-column">
      <a class="nav-link ml-3 my-1" href="/team1_user_prj3/question.do">1:1 문의</a>
<!--       <form action="info.do" method="post">
        <input type="submit" class="nav-link ml-3 my-1" style="border: #FFF; color: #007bff; text-decoration: none; background-color: transparent;" value="정보 변경"/>
      </form> -->
      <a class="nav-link ml-3 my-1" href="info.do">정보 변경</a>
    </nav>
  </nav>
</nav>
