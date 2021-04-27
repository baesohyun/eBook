<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="" session="true" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/jsp_prj/common/css/main.css" />
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/team1_admin_prj3/common/css/admin_main_design.css" />
<style type="text/css">
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



<!-- datepicker -->
<link rel="stylesheet"
	href="../common/css/bootstrap-datepicker3.min.css">
<script src="../common/js/bootstrap-datepicker.min.js"></script>
<script src="../common/js/bootstrap-datepicker.ko.min.js"></script>

<script type="text/javascript">
	$(function() {
		$('.input-group.date').datepicker({
			maxViewMode : 3,
			language : "ko",
			autoclose : true,
			todayHighlight : true
		});
	});
</script>
</head>
<body>
	<div id="books">
		<div id="header">

			<%@ include file="../../common/jsp/admin_include_header.jsp"%>


		</div>
		<!-- header 끝 -->

		<div id="container">

			<div id="snb">

				<%@ include file="../../common/jsp/admin_include_snb_ebook.jsp"%>

			</div>

			<div id="content">
			
			<h6>회원 관리 > 회원 조회</h6>
			<h3>| 회원 조회</h3>
			<br/>
			
				<div id="member_right"
					style="width: 650px; height: 830px; margin-left: 200px; padding: 20px;">

					<!-- 회원 정보 검색 시작 -->
					<div id="member_searchbox"
						style="width: 550px; height: 220px; padding: 15px; border: 1px solid #333; margin-top: 25px; margin-left: 25px">

						<div class="btn-group"
							style="float: left; margin-left: 40px; margin-top: 10px">
							<button type="button" class="btn btn-secondary dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">회원 전체</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="#">---회원 전체---</a> <a
									class="dropdown-item" href="#">아이디</a> <a class="dropdown-item"
									href="#">회원 이름</a> <a class="dropdown-item" href="#">전화번호</a>
							</div>
						</div>

						<div class="input-group flex-nowrap"
							style="width: 300px; float: left; margin-left: 10px; margin-top: 10px">
							<div class="input-group-prepend">
								<span class="input-group-text" id="addon-wrapping"> <img
									src="../common/images/search.png" style="height: 15px" />
								</span>
							</div>
							<input type="text" class="form-control" aria-label="Username"
								aria-describedby="addon-wrapping">
						</div>



						<div style="width: 500px; height: 50px; float: left;">

							<div class="form-group">
								<label
									style="width: 110px; float: left; margin-top: 10px; margin-left: 50px"><strong>가입
										일자</strong></label>

								<div class="input-group date"
									style="float: left; width: 150px; margin-top: 5px;">
									<span class="input-group-addon"> <img
										src="../common/images/icon_calendar.png"
										style="margin-left: 2px; width: 30px" />
									</span> <input type="text" class="form-control form-control-sm">
									<label>~</label>
								</div>

								<div class="input-group date"
									style="width: 150px; margin-top: 5px;">
									<span class="input-group-addon" style="float: left"> <img
										src="../common/images/icon_calendar.png"
										style="margin-left: 2px; width: 30px" />
									</span> <input type="text" class="form-control form-control-sm">
								</div>

							</div>
						</div>


						<br />
						<div style="margin-left: 30px; float: left">
							<label style="float: left;"><strong>회원 등급</strong></label>&nbsp;
							<div style="float: left; margin-left: 10px">
								<a href="admin_member_grade.jsp" target="_blank"><img
									src="../common/images/question_mark.png" /></a> <input
									type="checkbox" value="ALL" checked="checked" />전체&nbsp; <input
									type="checkbox" value="VIP" />VIP&nbsp; <input type="checkbox"
									value="BRONZE" />BRONZE&nbsp; <input type="checkbox"
									value="SILVER" />SILVER&nbsp; <input type="checkbox"
									value="GOLD" />GOLD&nbsp; <input type="checkbox" value="FAMILY" />FAMILY
							</div>
						</div>

						<div
							style="width: 500px; height: 50px; margin-top: 10px; margin-left: 140px; float: left">
							<input type="button" class="btn btn-secondary" value="상세 조회" />
						</div>


					</div>

					<div
						style="width: 600px; height: 550px; padding: 15px; border: 1px solid #333; margin-top: 25px;">
						<div style="float: right">
							<label>검색된 회원 000명 / 총 등록된 회원 000명</label>
						</div>

						<div>
							<table class="table">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">아이디</th>
										<th scope="col">회원 이름</th>
										<th scope="col">등급</th>
										<th scope="col">전화번호</th>
										<th scope="col">구매금액</th>
										<th scope="col">가입 일자</th>
									</tr>
								</thead>
								<tbody>

									<%
										for (int i = 0; i < 9; i++) {
									%>
									<tr>
										<th scope="row"><%=i + 1%></th>
										<td>Mark</td>
										<td>Mark</td>
										<td>Mark</td>
										<td>Mark</td>
										<td>Mark</td>
										<td>Mark</td>
									</tr>
									<%
										}
									%>

								</tbody>
							</table>

						</div>

					</div>

					<nav aria-label="Page navigation example">
						<div style="margin-top: 15px; margin-left: 230px">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</div>
					</nav>
					<!-- 회원 정보 검색 끝 -->
				</div>
			</div>
			<!-- content 끝 -->

		</div>
		<!-- container 끝 -->

		<div id="footer">
			<%@ include file="../../common/jsp/admin_include_footer.jsp"%>

		</div>
</body>
</html>