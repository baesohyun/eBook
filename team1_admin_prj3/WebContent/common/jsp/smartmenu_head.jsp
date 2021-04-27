<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="스마트메뉴를 사용하기 위한 스크립트와 CSS"
%>

 <!-- SmartMenus  CSS 시작 -->
    <link href="http://localhost:8080/spring_mvc_temp/common/smart_menu/css/sm-core-css.css" rel="stylesheet" type="text/css" />
   <!--  <link href="http://localhost:8080/html_prj/common/smart_menu/css/sm-blue/sm-blue.css" rel="stylesheet" type="text/css" /> -->
<!--  <link href="http://localhost:8080/html_prj/common/smart_menu/css/sm-clean/sm-clean.css" rel="stylesheet" type="text/css" /> -->
    <link href="http://localhost:8080/spring_mvc_temp/common/smart_menu/css/sm-simple/sm-simple.css" rel="stylesheet" type="text/css" />
  <!-- SmartMenus  CSS 끝 -->
  <!-- SmartMenus 시작 -->
    <script type="text/javascript" src="http://localhost:8080/spring_mvc_temp/common/smart_menu/jquery.smartmenus.min.js"></script>
    <script type="text/javascript">
    	$(function() {
    		$('#main-menu').smartmenus({
    			subMenusSubOffsetX: 1,
    			subMenusSubOffsetY: -8
    		});
    	});
    </script>
    <!-- SmartMenus 끝 -->