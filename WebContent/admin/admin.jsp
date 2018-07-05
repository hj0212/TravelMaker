<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet"
	href="source/lib/bootstrap-3.3.2-dist/css/bootstrap-theme.css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="source/css/admin.css">
<script type="text/javascript"> function msg(){alert("준비 중입니다.");} </script>
<style>
</style>
</head>

<body>
	<c:choose>
		<c:when test="${sessionScope.user.userid eq 'admin'}">
			<c:if test="${memberList[0] == null && fromCtrl == null}">
				<script>
					location.href = "../showMembers.ad";
				</script>
			</c:if>

			<div class="container center-align col-md-12">
				<div class="row" id="wrapper">
					<div class="overlay"></div>
					<!-- Sidebar -->
					<nav class="navbar navbar-invers e navbar-fixed-top"
						id="sidebar-wrapper" role="navigation">
					<ul class="nav sidebar-nav">
						<li class="sidebar-brand"><a href="main.jsp"> TravelMaker </a></li>
						<li><a href="showMembers.ad">Members</a></li>
						<li><a href="javascript:msg()">Log</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Reports<span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li class="dropdown-header">Pages</li>
								<li><a href="admin_free.ad">FreeBoard</a></li>
								<li><a href="admin_plan.ad">Share_Plan</a></li>
							</ul></li>
						<li><a href="javascript:msg()">Contact</a></li>
					</ul>
					</nav>

					<div id="page-content-wrapper">
						<button type="button" class="hamburger is-closed"
							data-toggle="offcanvas">
							<span class="hamb-top"></span> <span class="hamb-middle"></span>
							<span class="hamb-bottom"></span>
						</button>

						<div class="container">
							<div class="row">
								<div class="input-group mt-2 col-md-6 col-md-offset-3 "
									id="search_area">
									<input type="text" class="form-control" placeholder="회원 닉네임 검색"
										aria-label="reply" aria-describedby="basic-addon2" id="search">
									<span class="input-group-btn">

										<button class="btn btn-outline-secondary " type="button"
											id="searchbtn" name="searchbtn">검색</button>
									</span>

								</div>
								
							</div>

							<table class="table col-md-12" id="members">
								<thead>
									<tr>
										<th class="col-md-12 text-center" colspan=7>회원 관리</th>
									</tr>
								</thead>
								<tbody>
									<tr class="text-center">
										<th style="width: 7%" class="">번호</th>
										<th style="width: 20%" class="text-center">아이디</th>
										<th style="width: 20%" class="text-center">닉네임</th>
										<th style="width: 26%" class="text-center">이메일</th>
										<th style="width: 10%" class="text-center">가입경로</th>
										<th style="width: 10%" class="text-center">가입날짜</th>
										<th style="width: 7%" class="text-center">차단여부</th>
									</tr>

									<c:forEach var="m" items="${memberList}" varStatus="status">
										<tr>
											<th name="here">${m.seq}</th>
											<td class="text-center">${m.userid}</td>
											<c:choose>
												<c:when test="${m.part eq 'home'}">
													<td class="text-center">${m.nickname}</td>
												</c:when>
												<c:when test="${m.part eq 'naver'}">
													<td class="text-center">${m.naver_nickname}</td>
												</c:when>
												<c:when test="${m.part eq 'kakao'}">
													<td class="text-center">${m.kakao_nickname}</td>
												</c:when>
											</c:choose>

											<c:choose>
												<c:when test="${m.part eq 'home'}">
													<td class="text-center">${m.email}</td>
												</c:when>
												<c:when test="${m.part eq 'naver'}">
													<td class="text-center">${m.naver_email}</td>
												</c:when>
												<c:when test="${m.part eq 'kakao'}">
													<td class="text-center">${m.kakao_email}</td>
												</c:when>
											</c:choose>

											<td class="text-center">${m.part}</td>
											<td class="text-center">${m.create_date}</td>
											<td class="vertical-align-middle text-center"><c:choose>
													<c:when test="${m.block =='n' || m.block == 'x'}">
														<div class="TriSea-technologies-Switch">
															<input id="TriSeaDanger${status.index}" name="TriSea1" type="checkbox" /> 
															<label for="TriSeaDanger${status.index}" class="label-danger"name="TriSea2"></label>
														</div>
													</c:when>
													<c:when test="${m.block =='y'}">
														<div class="TriSea-technologies-Switch">
															<input id="TriSeaDanger${status.index}" name="TriSea1" type="checkbox" checked /> <label
																for="TriSeaDanger${status.index}" class="label-danger"
																name="TriSea2" checked></label>
														</div>
													</c:when>
												</c:choose></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
							<div class="col-md-12 mt-2">
								<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">${pageNavi}</ul>
								</nav>
							</div>



						</div>
					</div>

				</div>
			</div>




			<script>
				$(document)
						.ready(
								function() {
									var trigger = $('.hamburger'), overlay = $('.overlay'), isClosed = false;

									trigger.click(function() {
										hamburger_cross();
									});

									function hamburger_cross() {

										if (isClosed == true) {
											overlay.hide();
											trigger.removeClass('is-open');
											trigger.addClass('is-closed');
											isClosed = false;
										} else {
											overlay.show();
											trigger.removeClass('is-closed');
											trigger.addClass('is-open');
											isClosed = true;
										}
									}

									$('[data-toggle="offcanvas"]').click(
											function() {
												$('#wrapper').toggleClass(
														'toggled');
											});

									$('.TriSea-technologies-Switch>input[name="TriSea1"]').click(
											function() {
											var willBlock = $(this).parent().parent().parent().find('th[name="here"]').html();
														$.ajax({
																	url : "blockMember.do",
																	type : "get",
																	data : {
																		sequence : willBlock
																	},
																	success : function() {
																		alert("저장되었습니다.");
																	},
																	error : function() {
																		alert("다시 시도해주세요.");
																		location.href="../showMembers.ad";
																	}
																})

													});

								})

				$("#searchbtn").click(
						function() {
							location.href = "showMembers.ad?search="+ $("#search").val();
						})
			</script>

		</c:when>
		<c:otherwise>
			<script>
				location.href = "../error.jsp"
			</script>
		</c:otherwise>
	</c:choose>

</body>
</html>