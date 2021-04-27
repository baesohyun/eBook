<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    session="true"
    isELIgnored="false"
    %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   <div id="hLogo">
     <!-- <a href="#"><img src="http://localhost:8080/team1_admin_prj3/common/images/logo1.png" title="로고"/></a></div> -->
     <div id="hContent">
       <span id="hTitle">JINI BOOKS</span>
     </div>
   </div>
   
      <nav id="naviBar" class="navbar navbar-expand-lg navbar-light bg-light">
     <a class="navbar-brand" href="#">HOME</a>
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
     </button>
     <div class="collapse navbar-collapse" id="navbarNav">
       <ul class="navbar-nav">
         <li class="nav-item">
           <a class="nav-link" href="admin_member.do">회원관리</a>
         </li>
         <li class="nav-item">
           <a class="nav-link" href="admin_book_list.do">E-Book관리</a>
         </li>
         <li class="nav-item">
           <a class="nav-link" href="admin_calc_purchase.do">구매/대여관리</a>
         </li>
         <li class="nav-item">
           <a class="nav-link" href="notcie.do">게시판관리</a>
         </li>
       </ul>
     </div>
     <button type="button" class="btn btn-secondary btn-sm">로그아웃</button>
   </nav>
   
   