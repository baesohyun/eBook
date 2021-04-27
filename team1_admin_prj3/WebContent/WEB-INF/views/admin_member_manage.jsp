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


<script type="text/javascript">
	$(function() {

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

				<div id="member_right"
					style="width: 650px; height: 830px; margin-left: 200px; padding: 20px;">

					<div style="text-align: center">
						<h2>
							<strong>회원 정보 관리</strong>
						</h2>
						<hr width="90%" align="center" />
					</div>

					<div style="margin: 30px">
						<img src="../common/images/search_member.png" style="float: left" />
						<h5>
							<strong>&nbsp;회원 상세 정보</strong>
						</h5>
					</div>

					<div id="member_info_tab">
						<table class="table table-bordered"
							style="text-align: center; width: 600px; margin-left: 10px;">
							<tbody>
								<tr>
									<th style="background-color: #ECECED">이름</th>
									<td>윤소인</td>
									<th style="background-color: #ECECED">나이</th>
									<td>28</td>
									<th style="background-color: #ECECED">성별</th>
									<td>여성</td>
								</tr>
								<tr>
									<th style="background-color: #ECECED">아이디</th>
									<td>test</td>
									<th style="background-color: #ECECED">비밀번호</th>
									<td>**********</td>
									<th style="background-color: #ECECED">가입 일자</th>
									<td>2019-11-01</td>
								</tr>
								<tr>
									<th style="background-color: #ECECED">총 충전 금액</th>
									<td>20,000</td>
									<th style="background-color: #ECECED">사용금액</th>
									<td>30,0000</td>
									<th style="background-color: #ECECED">등급</th>
									<td>GOLD</td>
								</tr>
								<tr>
									<th style="background-color: #ECECED" colspan="3">전화번호</th>
									<td colspan="3">010-1234-5678</td>
								</tr>
								<tr>
									<th style="background-color: #ECECED" colspan="3">이메일</th>
									<td colspan="3">test@test.com</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div id=member_info_tab style="margin-left: 20px; margin-top: 20px">
						<h5>
							<strong>[test]님이 최근 주문하신 내역</strong>
						</h5>
						<table class="table table-bordered"
							style="text-align: center; width: 600px">
							<thead>
								<tr>
									<th scope="col">주문 번호</th>
									<th scope="col">상품명</th>
									<th scope="col">수량</th>
									<th scope="col">금액</th>
									<th scope="col">결제 방식</th>
									<th scope="col">주문 일자</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (int i = 0; i < 10; i++) {
								%>
								<tr>
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

					<div
						style="width: 600px; height: 50px; margin-top: 10px; margin-left: 200px; float: left">
						<input type="button" class="btn btn-secondary" value="수정"
							style="width: 100px" /> <input type="button"
							class="btn btn-secondary" value="닫기"
							style="margin-left: 50px; width: 100px" />
					</div>


				</div>

			</div>
			<!-- content 끝 -->

		</div>
		<!-- container 끝 -->

		<div id="footer">
			<%@ include file="../../common/jsp/admin_include_footer.jsp" %>
		</div>
		
	</div>
</body>
</html>