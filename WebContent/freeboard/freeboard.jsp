<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 부트 스트랩 코드-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
	integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="source/css/codepenNavi.css">

<style>
.container {
	padding-top: 140px;
}

div {
	box-sizing: border-box;
}

.container {
	height: 100%;
}

#navi {
	height: 70px;
}

#bestPlan {
	height: 400px;
}

#bests {
	height: 400px;
}

#foot {
	height: 100px;
}

.data, .data div {
	height: 400px;
}

.item {
	width: 300px;
}

#search_area {
	width: 350px;
}

#writebtn {
	float: right;
}
</style>
<script>
	$(document).ready(function() {
		$("#searchbtn").click(function() {
			location.href = "freeboard.bo?search=" + $("#search").val();
		})
	})
</script>

</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.loginId !=null}">
			<%@include file="../include/mainNavi_login.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="../include/mainNavi.jsp"%>
		</c:otherwise>
	</c:choose>
	<div class="container">
		<div class="row">
			<div class="col-md-12" id="bestPlan">
				<table class="table table-light">
					<thead>
						<tr>
							<th scope="col" style="width: 10%; text-align:center;">글번호</th>
							<th scope="col" style="width: 55%; text-align:center;">제목</th>
							<th scope="col" style="width: 15%; text-align:center;">작성자</th>
							<th scope="col" style="width: 10%; text-align:center;">작성일</th>
							<th scope="col" style="width: 10%; text-align:center;">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${freeboardlist[0] != null}">
								<c:forEach var="item" items="${freeboardlist}">
									<tr>
										<td align="center">${item.free_seq}</td>
										<td class="titlearea"><a
											href="viewArticle.bo?seq=${item.free_seq}&writer=${item.free_writer}&proc=view&comseq=0">${item.free_title}</a></td>
										<td align="center"><a href="">${item.free_writer}</a></td>
										<td align="center">${item.free_writedate}</td>
										<td align="center">${item.free_viewcount}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr id=empty height=340 align=center>
									<td colspan=5>표시할 내용이 없습니다.
								</tr>
							</c:otherwise>
						</c:choose>
						<tr>
							<td colspan="5" align="center">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
										${pageNavi}
									</ul>
								</nav>
							</td>
						</tr>
						<tr>
							<td colspan="5" id="input_area">
							<button type="button" class="btn btn-primary" id="writebtn">글쓰기</button>
								<div class="input-group mb-3" id="search_area">
									<input type="text" class="form-control" placeholder="제목 검색"
										aria-label="reply" aria-describedby="basic-addon2" id="search">
									<div class="input-group-append">
										<button class="btn btn-outline-secondary" type="button"
											id="searchbtn" name="searchbtn">검색</button>
									</div>
								</div>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script>
	document.getElementById("writebtn").onclick = function() {
		location.href = "freewrite.jsp";
	}
</script>
</html>