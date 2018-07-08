<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script   src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet"
	href="source/lib/bootstrap-3.3.2-dist/css/bootstrap-theme.css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="source/css/admin.css">
<script type="text/javascript"> function msg(){alert("준비 중입니다.");}</script>
<style>
</style>
</head>

<body>
	<c:choose>
		<c:when test="${sessionScope.user.userid eq 'admin'}">
			
			<div class="container center-align col-md-11">
				<div class="row" id="wrapper">
					<div class="overlay"></div>
					<!-- Sidebar -->
					<nav class="navbar navbar-inverse navbar-fixed-top"
						id="sidebar-wrapper" role="navigation">
					<ul class="nav sidebar-nav">
						<li class="sidebar-brand"><a href="main.jsp"> TravelMaker </a></li>
						<li><a href="showMembers.ad">Members</a></li>
						<li><a href="javascript:msg()">Log</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Pages<span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li class="dropdown-header">신고 확인</li>
								<li><a href="admin_free.ad">FreeBoard</a></li>
								<li><a href="admin_review.ad">Share_reivew</a></li>
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
								<div class="col-md-10 col-md-offset-2">
									
									<table class="table col-md-12">
										<thead>
											<tr>
												<th colspan=8 class="text-center" style="font-size:20px;">자유게시판 신고 관리 <button type="button" class="btn btn-outline-light pull-right" id="alignReport">신고수 확인</button></th>		
											</tr>
											  
										</thead>
										<tbody class="text-center">
											<tr>
												<th style="width:10%">번호</th>
												<th class="text-center" style="width:10%;">글 번호</th>
												<th class="text-center" style="width:30%;">글 제목</th>
												<th class="text-center" style="width:15%;">작성자</th>											
												<th class="text-center" style="width:15%;">신고자</th>
												<th class="text-center" style="width:10%;">신고 날짜</th>
												<th class="text-center" style="width:10%;">확인</th>
											</tr>

											<c:forEach var="f" items="${freereport}" varStatus="status">
												<tr>
													<th>${f.reportfree_seq}</th>
													<td>${f.free_seq}</td>
													<fmt:parseNumber var="seq" type="number" integerOnly="true" value="${f.free_seq}"/>											
													<td>${f.free_title}</td>
													<td>${f.free_writer}</td>
													<td>${f.report_user}</td>
													<td>${f.report_date}</td>
																							
													<td><a href="viewFreeArticle.bo?seq=${seq}" id="linkId">확인</a></td>											
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="row">

						<!-- 페이징 -->
						<div class="col-md-12 mt-2">
							<nav aria-label="Page navigation">
							<ul class="pagination justify-content-center"></ul>
							</nav>
						</div>
					</div>
				</div>
			</div>


			<script>
				$(document).ready(
					function() {
						var trigger = $('.hamburger'), overlay = $('.overlay'), isClosed = false;
						trigger.click(function() {
							hamburger_cross();});

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
							$('#wrapper').toggleClass('toggled');});
					
					 $("#alignReport").click(function(){
						 location.href="admin_free_count.ad"; 
								
						
					}) 
					
					
					})	
					
					
			</script>

		</c:when>
		<c:otherwise>
			<script> location.href="../error.jsp"</script>
		</c:otherwise>
	</c:choose>

</body>
</html>







