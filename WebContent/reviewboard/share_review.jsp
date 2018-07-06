<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Share Review</title>
	<!-- 부트스트랩 CDN -->
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<style>
	.container {
		padding-top: 140px;
	}
	
	div {
		box-sizing: border-box;
	}
	
	.card-body .card-title, .card-text {
		text-align: center;
	}
	
	.card-footer {
		margin-top: 10px;
		padding-right: 0px;
	}
	
	.card-body {
		text-align: right;
		padding: 5px;
	}
	
	.card-img-top {
		height:250px;
		width: 100%;
		object-fit:cover;
	}
	
	.card-title {
		height: 24px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	
	.card {
		margin-top: 15px;
	}
	
	.card:hover {
		opacity : 0.6;
		cursor : pointer;
	}
	
    .card a {
        text-decoration: none;
    }
</style>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.user.seq == null}">
			<%@include file="../include/otherNavi_login.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="../include/otherNavi.jsp"%>

		</c:otherwise>
	</c:choose>


	<div class="container">
		<h1 class="divLine">Review</h1>
		<hr />

		<div class="row" id="cardArea">
			<c:choose>
				<c:when test="${reviewList[0]!= null}">
					<c:forEach var="item" items="${reviewList}">
						<div class="col-md-4">
							<div class="card">
							<a href="reviewArticle.bo?review_seq=${item.review_seq}">
								<img class="card-img-top" src="${pageContext.request.contextPath}/files/${item.review_thumbnail}" alt="Card image cap">
								<div class="card-body">
									<h5 class="card-title">${item.review_title}</h5>
									<p class="card-text">${item.review_writerN}</p>
									<div class="card-footer bg-transparent"><small class="text-muted">"${item.review_writedate}"</small></div>
								</div>
							</a>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>

					<div class="text-center mt-4 mb-4">
						<h4>검색 결과가 존재하지 않습니다.</h4>
					</div>

				</c:otherwise>
			</c:choose>
			<div class="mt-4 mb-2 col-md-12">
				<div class="row">
					<div class="input-group col-md-4 offset-md-4">
						<input type="text" class="form-control" placeholder="제목 검색" id="search">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" id="searchbtn">검색</button>
						</div>
					</div>
					<div class="col-md-4 text-right">
						<button class="btn btn-primary" id="writebtn">글쓰기</button>
					</div>
				</div>
			</div>
			<!-- 페이지 네비 -->
			<div class="col-md-12">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">${pageNavi}</ul>
				</nav>
			</div>
		</div>
	</div>

	<script>
		$("#searchbtn").click(function() {
			location.href = "reviewboard.bo?search=" + $("#search").val();
		})
		
		$("#writebtn").click(function() {
			location.href = "writeReview.bo";
		})
	</script>
</body>
</html>