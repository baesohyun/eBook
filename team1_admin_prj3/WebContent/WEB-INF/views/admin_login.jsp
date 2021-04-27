<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="로그인 폼" session="true" isELIgnored="false"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>

<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/team1_admin_prj3/common/css/main.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/team1_admin_prj3/common/css/admin_main_design.css"/>
<style type="text/css">
#loginBox {
	padding-top: 100px;
	width: 300px;
	height: 250px;
	margin: 0px auto
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<jsp:include page="../../common/jsp/smartmenu_head.jsp"></jsp:include>


<script type="text/javascript">
	$(function() {

		$("#btn").click(function() {
			chkNull();
		}); // click

		$("#id").keydown(function(evt) {
			if (evt.which == 13) {
				chkNull();
			} // end if
		}); // keydown

		$("#passwd").keydown(function(evt) {
			if (evt.which == 13) {
				chkNull();
			} // end if
		}); // keydown

	}); // ready

	function chkNull() {

		var id = $("#id").val();

		if (id.trim() == "") {
			$("id").focus();
			return;
		} // end if

		var passwd = $("#passwd").val();
		if (passwd.trim() == "") {
			$("passwd").focus();
			return;
		} // end if

		var param = "id=" + encodeURI($("#id").val()) + "&passwd="
				+ encodeURI($("#passwd").val());
		$.ajax({
			url : "admin_login_process.do",
			type : "post",
			data : param,
			dataType : "json",
			error : function(xhr) {
				alert("서비스가 원활하지 못해 죄송합니다.");
				/* 	console.log("에러코드: "+xhr.status);
					console.log("에러메세지: "+xhr.statusText); */
			},
			success : function(json_obj) {
				var flag = json_obj.result;

				if (flag) {
					$("#logFrm").submit();
				} else {
					alert("아이디와 비밀번호를 확인해 주세요.");
				} // end if

			}
		});//ajax

	} // chkNull
</script>

</head>

<body>

	<div id="books">
		<div id="header">

			<div id="hContent">
				<span id="hTitle">JINI BOOKS</span>
			</div>

		</div>

		<div id="container">



			<div id="loginBox">

				<form action="admin_main.do" method="post" id="logFrm">

					<table style="margin-top: 200px">

						<tr>
							<td><input type="text" name="id" id="id" class="inputBox"
								style="text-align: center; width: 300px; height: 40px; font-size: 20px; font-weight: bold"
								placeholder="아이디" autofocus="autofocus" /></td>
						</tr>

						<tr>
							<td><input type="password" name="passwd" id="passwd"
								class="inputBox"
								style="text-align: center; width: 300px; height: 40px; font-size: 20px; font-weight: bold; margin-top: 5px"
								placeholder="비밀번호" /></td>
						</tr>

						<tr>
							<td align="center"><input type="button" id="btn" class="btn"
								value="로그인"
								style="width: 120px; height: 40px; font-size: 16px; font-weight: bold; background-color: #F58E69; margin-top: 10px" />
							</td>
						</tr>

					</table>
				</form>

			</div>

		</div>

		<div id="footer">
			<%@ include file="../../common/jsp/admin_include_footer.jsp"%>
		</div>
</body>

</html>