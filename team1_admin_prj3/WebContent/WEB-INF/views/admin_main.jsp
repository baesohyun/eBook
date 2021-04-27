<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="" session="true" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/jsp_prj/common/css/main.css" />
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/team1_admin_prj3/common/css/admin_main_design.css" />
<style type="text/css">
#box {
	width: 200px;
	height: 150px;
	float: left;
	margin-left: 50px;
	text-align: center;
	border: solid 1px #333;
	border-spacing: 30px
}

#mainBtn {
	margin-top: 10px;
	margin-left: 50px;
	width: 200px;
	height: 30px;
	line-height: 15px;
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


			<div
				style="float: left; width: 200px; height: 800px; background: #ECECED;"></div>

			<div id="content">

				<form action="admin_member.do" method="get" id="memberFrm">

					<div class="alert alert-success">
						안녕하세요? [<c:out value="${ adminId }" />]로 로그인하셨습니다.
					</div>
					<div style="padding-left: 70px; padding-right: 100px">
						<div>
							<button type="button" class="btn btn-success" id="mainBtn">회원/방문자
								현황</button>
						</div>

						<hr color="#333" width="90%">

						<div class="card" id="box">
							<div class="card-body">
								<h5 class="title">오늘 방문 회원</h5>
								<h5 class="card-text" style="text-align: center;">
									<c:out value="${ selectCnt }" />
								</h5>
							</div>
						</div>

						<div class="card" id="box">
							<div class="card-body">
								<h5 class="title">오늘 회원 가입</h5>
								<h5 class="card-text" style="text-align: center;">
									<c:out value="${ selectJoinCnt }" />
								</h5>
							</div>
						</div>

						<div class="card" id="box">
							<div class="card-body">
								<h5 class="title">총 누적 회원</h5>
								<h5 class="card-text" style="text-align: center;">
									<c:out value="${ selectAllCnt }" />
								</h5>
							</div>
						</div>


						<div>
							<button type="button" class="btn btn-success" id="mainBtn">게시물
								현황</button>
							<button type="button" class="btn btn-success" id="mainBtn">주문
								정산 현황</button>
						</div>

						<hr color="#333" width="90%">

						<div>

							<div class="card" id="box">
								<div class="card-body">
									<h5 class="title">1:1문의(미응답)</h5>
									<h5 class="card-text" style="text-align: center;">
										<c:out value="${ selectQNA }" />
									</h5>
								</div>
							</div>

							<div class="card" id="box">
								<div class="card-body">
									<h5 class="title">오늘 주문건 수</h5>
									<h5 class="card-text" style="text-align: center;">
										<c:out value="${ selectOrderCnt }" />
									</h5>
								</div>
							</div>

							<div class="card" id="box">
								<div class="card-body">
									<h5 class="title">오늘 주문 금액</h5>
									<h5 class="card-text" style="text-align: center;">
										<c:out value="${ selectOrderPrice }" />
									</h5>
								</div>
							</div>

						</div>

						<div>
							<button type="button" class="btn btn-success" id="mainBtn">공지사항</button>
						</div>
						<hr color="#333" width="90%">
						<table class="table table-sm"
							style="margin-left: 50px; width: 90%">
							<tbody>
								<c:forEach var="selectMainNoticeList"
									items="${ requestScope.selectMainNoticeList }">
									<tr>
										<th>●</th>
										<th scope="row"><c:out value="${ selectMainNoticeList }" />
										</th>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<c:if test="${ empty selectMainNoticeList }">
							<div>공지사항이 존재하지 않습니다.</div>
						</c:if>


					</div>
				</form>
			</div>
			<!-- content 끝 -->

		</div>
		<!-- container 끝 -->

		<div id="footer">
			<%@ include file="../../common/jsp/admin_include_footer.jsp"%>

		</div>
</body>
</html>