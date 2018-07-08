<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
<style>
#container {
	max-width: 940px;
	margin: 0 auto;
	margin-top: 150px;
}

#profileinfoarea {
	text-align: center;
	max-width: 680px;
	width: 100%;
}

.row {
	margin-bottom: 80px;
}

#img_file {
	opacity: 0.1; /*input type="file" tag 투명하게 처리*/
	position: relative;
}

#img_button {
	cursor: pointer;
	opacity: 3;
	background-color: white;
}

.noArticle {
	border-top: 1px dotted #eee;
	border-bottom: 1px dotted #eee;
	text-align: center;
}

.panel-heading {
 width: 100%;
}

.pannel-body {
	margin: 0 auto;
}

.card-container {
	-moz-perspective: 800px;
	-webkit-perspective: 800px;
	perspective: 800px;
	-moz-transform-style: preserve-3d;
	-webkit-transform-style: preserve-3d;
	transform-style: preserve-3d;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	margin-bottom: 30px;
	width: 100%;
	height: 350px;
}

.card {
	-moz-transform-style: preserve-3d;
	-webkit-transform-style: preserve-3d;
	transform-style: preserve-3d;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	-moz-transition: -moz-transform 1s
		cubic-bezier(0.175, 0.885, 0.32, 1.275);
	-o-transition: -o-transform 1s cubic-bezier(0.175, 0.885, 0.32, 1.275);
	-webkit-transition: -webkit-transform 1s
		cubic-bezier(0.175, 0.885, 0.32, 1.275);
	transition: transform 1s cubic-bezier(0.175, 0.885, 0.32, 1.275);
	position: relative;
	background: none repeat scroll 0 0 #fff;
	color: #444444;
	max-width: 320px;
	margin: 0 auto;
}

.card .cover {
	-moz-border-radius: 4px 4px 0 0;
	-webkit-border-radius: 4px;
	border-radius: 4px 4px 0 0;
	height: 105px;
	overflow: hidden;
	z-index: -2;
}

.card .cover img {
	width: 100%;
}

.card .profileimg {
	position: relative;
	background: #fff;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	display: block;
	height: 120px;
	margin: -55px auto 0;
	width: 120px;
	text-align: center;
}

.card .profileimg img {
	width: 120px;
	height: 120px;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 50%;
}

.card .content {
	background-color: transparent;
	-moz-box-shadow: none;
	-webkit-box-shadow: none;
	box-shadow: none;
	padding: 10px 20px 20px;
}

div.card-body {
	height: 100px;
	color: black;
	text-align: center;
}

div.card-body h6 {
	margin-bottom:10px;
}

.card .content .main {
	min-height: 140px;
}

.card .use-for {
	font-size: 22px;
	text-align: center;
}

.card h5 {
	margin: 5px 0;
	font-weight: 400;
	line-height: 20px;
}

.card .footer {
	color: #999;
	padding: 10px 0 0;
	text-align: center;
}

.card .footer .btn-simple {
	margin-top: -6px;
}

.card .header {
	padding: 15px 20px;
	height: 90px;
}

.front {
	-moz-backface-visibility: hidden;
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
	-moz-transition: -moz-transform 1s
		cubic-bezier(0.175, 0.885, 0.32, 1.275);
	-o-transition: -o-transform 1s cubic-bezier(0.175, 0.885, 0.32, 1.275);
	-webkit-transition: -webkit-transform 1s
		cubic-bezier(0.175, 0.885, 0.32, 1.275);
	transition: transform 1s cubic-bezier(0.175, 0.885, 0.32, 1.275);
	-moz-transform-style: preserve-3d;
	-webkit-transform-style: preserve-3d;
	transform-style: preserve-3d;
	-moz-transform: rotateY(0deg);
	-ms-transform: rotateY(0deg);
	-webkit-transform: rotateY(0deg);
	transform: rotateY(0deg);
	-moz-box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.14);
	-webkit-box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.14);
	box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.14);
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	position: absolute;
	background-color: #fff;
	width: 100%;
	height: 300px;
	top: 0;
	left: 0;
	z-index: 2;
}
</style>
<script>
  $(document).ready(function() {
    /* $("#profile_img").attr('src',"/TravelMaker/file/${file_name}"); */
    $("#img_button").click(function() {
      var img_file = $("#img_file").trigger("click");
      if (img_file) {
        var selected = $("#profile").text("프로필 사진 등록");
        if (selected) {
          $("#profile").click(function() {
            $("#profileImgForm").submit();
          });
        } else {
          alert("파일을 선택해주세요");
        };
      } else {
        $("#profile").text("");
      }
    });
  });
 
</script>
 

</head>
<body>
	<%@include file="../include/otherNavi.jsp"%>
	<div id="container">
		<div class="row">
			<div id="profileimgarea">
				<form action="profileImg.do" method="post"
					enctype="multipart/form-data" id="profileImgForm">
					<button id="img_button" type="button" class="d-inline"
						title="여기를 누르면 이미지를 변경할 수 있습니다."
						style="max-height: 250px; height: 250px; width: 280px; max-width: 280px">
						<script>console.log("${sessionScope.part eq 'kakao'}")</script>
						<c:choose>
							<c:when test="${sessionScope.part eq 'kakao'}">
								<img for="img_file" id="profile_img"
							src="${sessionScope.file_name}"
							alt="여기를 눌러 프로필 사진을 등록해보세요!" style="width: 100%; height: 100%">
							</c:when>
							<c:otherwise>
								<img for="img_file" id="profile_img"
							src="/TravelMaker/file/${sessionScope.file_name}"
							alt="여기를 눌러 프로필 사진을 등록해보세요!" style="width: 100%; height: 100%">
							</c:otherwise>
						</c:choose>
					</button>
					<div class="align-items-center">
						<input type="file" id="img_file" name="file"
							accept=".gif, .jpg, .png, .jpeg" value="이미지변경" hidden="true">
						<button class="btn btn-outline-primary" type="button" id="profile"
							style="width: 280px;">프로필사진</button>
					</div>
				</form>
			</div>
			<div id="profileinfoarea">
				<h4 class="my-4">${nickname}</h4>
				<c:choose>
					<c:when test="${email eq null}">
						<h4 class="my-4">이메일을 입력해주세요</h4>
					</c:when>
					<c:otherwise>
						<h4 class="my-4">${email}</h4>
					</c:otherwise>
				</c:choose>

				<!--회원정보 수정-->
				<div id="editinfo" class="">
					<c:choose>
						<c:when test="${sessionScope.part eq 'home'}">
							<button id="editInfo" class="btn btn-outline-primary">정보수정</button>
						</c:when>
						<c:otherwise>
							<button id="editInfoNK" class="btn btn-outline-primary">정보수정</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>

		<div class="row" style="margin-bottom: 15px;">
			<c:choose>
				<c:when test="${empty planList}">
					<div class="col-sm-12">
						<fieldset class="border p-4" style="text-align: center;">
							<legend class="w-auto">
								<h1>작성중인 Plan이 없습니다</h1>
							</legend>
							<h5>당신의 Plan을 만들어보세요!</h5>
						</fieldset>
					</div>
				</c:when>
				<c:otherwise>
					<h1 class="divLine">작성중인 Plan</h1>
					<hr />
					<div class="row col-sm-12" id="tempplanarea">
						<c:forEach var="item" items="${planList}" varStatus="Status">
						<div class="item col-sm-6 col-md-4 col-lg-3 mb-3" style="width: 300px; height: 300px; padding: 5px;">
							<div class="card col-md-12 col-sm-12" style="height: 100%; padding: 0px;">
								<div class="front">
									<div class="cover">
										<img src="source/img/back1.png" />
									</div>
									<div class="profileimg">
										<script>console.log("${item.part eq 'kakao'}")</script>
										<c:choose>
											<c:when test="${sessionScope.part eq 'kakao'}">
												<span><img src="${sessionScope.file_name}"></span>
											</c:when>
											<c:otherwise>
												<span><img src="/TravelMaker/file/${sessionScope.file_name}"></span>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="card-body">
										<h4 style="max-height: 29px; overflow: hidden;"><a
											href="selectSchedule.plan?plan=${item.plan_seq}&day=1&create=f"
											style="text-decoration: none;">${item.plan_title}</a></h4>
										<h6 class="text-muted">${item.plan_writerN}
											<i class="far fa-eye"></i> <span>${item.plan_viewcount}</span>
											<i class="fas fa-hand-holding-heart"></i> <span>${item.plan_good}</span>
										</h6>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="row">
			<div class="panel-heading">
				<ul class="nav nav-tabs nav-justified" id="tabs">
					<li class="nav-item px-0 col-md-4" id="tab2"><a href="#tabtwo"
						class="active nav-link" data-toggle="tab" data-target="#tabtwo"
						role="presentation">내 계획</a></li>
					<li class="nav-item px-0 col-md-4" id="tab1"><a href="#tabone"
						class="nav-link" data-toggle="tab" data-target="#tabone"
						role="presentation">내 후기글</a></li>
					<li class="nav-item px-0 col-md-4" id="tab3"><a href="#tabthree"
						class="nav-link" data-toggle="tab" data-target="#tabthree"
						role="presentation">좋아요 누른 글</a></li>
				</ul>
			</div>

			<div class="pannel-body">
				<div class="row tab-content">

					<!-- tabone -->
					<div class="col tab-pane" id="tabone" role="tabpanel">
						<div class="row">

							<c:if test="${empty MyReviewResult}">
								<div class="noArticle col-md-12 w-100 h-100 py-5">
									<div style="height: 300px;">
										<h3 style="margin: 50px;">표시할 내용이 없습니다</h3>
										<small>당신의 후기글을 기다립니다</small>
									</div>
								</div>
							</c:if>


							<c:forEach var="item" items="${MyReviewResult}">
								<div class="item col-sm-6 col-md-4 col-lg-3" style="width: 300px; height: 300px; padding: 5px;">
									<div class="card col-md-12 col-sm-12 w-100" style="height: 100%; padding: 0px;">
										<div class="front">
											<div class="cover">
												<img src="source/img/back2.png" />
											</div>
											<div class="profileimg">
												<c:choose>
													<c:when test="${item.part eq 'kakao'}">
														<span><img src="${item.file_name}"></span>
													</c:when>
													<c:otherwise>
														<span><img src="/TravelMaker/file/${item.file_name}"></span>
													</c:otherwise>
												</c:choose>
											</div>
											<div class="card-body">
												<h4 style="max-height: 29px; overflow: hidden;"><a
													href="reviewArticle.bo?review_seq=${item.review_seq}"
													style="text-decoration: none;">${item.review_title}</a></h4>
												<h6 class="text-muted">${item.review_writerN}
													<i class="far fa-eye"></i> <span>${item.review_viewcount}</span>
												</h6>
												<h6 class="text-muted">${item.review_writedate}</h6>
											</div>
										</div>
									</div>
								</div> 
							</c:forEach>
							<!-- 페이징 -->
							<div class="col-md-12 mt-4" id="pagenaviarea">
								<nav aria-label="Page navigation">
								<ul class="pagination justify-content-center">${MyReviewPageNavi}</ul>
								</nav>
							</div>
						</div>
					</div>

					<!-- tabtwo -->
					<div class="col tab-pane active" id="tabtwo" role="tabpanel">
						<div class="row">

							<c:if test="${empty MyPlanResult}">
								<div class="noArticle col-md-12 w-100 h-100 py-5">
									<div style="height: 300px;">
										<h3 style="margin: 50px;">표시할 내용이 없습니다</h3>
										<small>당신의 여행계획을 기다립니다</small>
									</div>
								</div>
							</c:if>

							<c:forEach var="item" items="${MyPlanResult}">
								<div class="item col-sm-6 col-md-4 col-lg-3 mb-3" style="width: 300px; height: 300px; padding: 5px;">
							<div class="card col-md-12 col-sm-12" style="height: 100%; padding: 0px;">
								<div class="front">
									<div class="cover">
										<img src="source/img/back1.png" />
									</div>
									<div class="profileimg">
										<script>console.log("${item.part eq 'kakao'}")</script>
										<c:choose>
											<c:when test="${sessionScope.part eq 'kakao'}">
												<span><img src="${sessionScope.file_name}"></span>
											</c:when>
											<c:otherwise>
												<span><img src="/TravelMaker/file/${sessionScope.file_name}"></span>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="card-body">
										<h4 style="max-height: 29px; overflow: hidden;"><a
											href="selectSchedule.plan?plan=${item.plan_seq}&day=1&create=f"
											style="text-decoration: none;">${item.plan_title}</a></h4>
										<h6 class="text-muted">${item.plan_writerN}
											<i class="far fa-eye"></i> <span>${item.plan_viewcount}</span>
											<i class="fas fa-hand-holding-heart"></i> <span>${item.plan_good}</span>
										</h6>
									</div>
								</div>
							</div>
						</div> 
							</c:forEach>
							<div class="col-md-12 mt-4" id="pagenaviarea">
								<nav aria-label="Page navigation">
								<ul class="pagination justify-content-center">${MyPlanPageNavi}</ul>
								</nav>
							</div>
						</div>
					</div>

					<!-- tabthree -->
					<div class="col tab-pane" id="tabthree" role="tabpanel">
						<div class="row mt-2 mx-0">

							<c:if test="${empty flist}">
								<div class="noArticle col-md-12 w-100 h-100 py-5">
									<div style="height: 300px;">
										<h3 style="margin: 50px;">표시할 내용이 없습니다</h3>
										<small>좋아요를 눌러주세요...ㅜ</small>
									</div>
								</div>
							</c:if>

							<c:forEach var="item" items="${flist}">
								<div class="item col-sm-6 col-md-4 col-lg-3 mt-2"
							style="width: 300px; height: 300px; padding: 5px;">
							<div class="card col-md-12 col-sm-12 w-100"
								style="height: 100%; padding: 0px;">
								<div class="front">
								<div class="cover">
									<img src="source/img/back1.png" />
								</div>
								<div class="profileimg">
									<c:choose>
										<c:when test="${item.part eq 'kakao'}">
											<span><img src="${item.file_name}"></span>
										</c:when>
										<c:otherwise>
											<span><img src="/TravelMaker/file/${tmp.file_name}"></span>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="card-body">
									<h4 style="max-height: 29px; overflow: hidden;"><a
										style="text-decoration: none;">${item.plan_title}</a></h4>
									<h6 class="text-muted">${item.plan_writerN}
										<i class="far fa-eye"></i> <span>${item.plan_viewcount}</span>
										<i class="fas fa-hand-holding-heart"></i> <span>${item.plan_good}</span>
									</h6>
								</div>
								</div>
							</div>
						</div> 
							</c:forEach>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div id="footer">
			<%@include file="footer1.jsp"%>
		</div>
	<script>
		/*검색*/
		$("#searchbtn").click(function() {
			location.href = "mypage.do?search=" + $("#search").val();
		})

		$(function() {
			$("#img_file").on('change', function() {
				var fileName = $("#img_file").val();
				var idxDot = fileName.lastIndexOf(".") + 1;
				var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
				//TO DO
				if (extFile == "jpg" || extFile == "jpeg" || extFile == "png") {
					readURL(this);
				} else {
					alert("프로필 사진은 이미지 파일만 입력 가능합니다");
				}
			});
		});

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#profile_img').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		$("#editInfo").click(function() {
			/* location.href="toPwCheck.do"; */
			window.open("toPwCheck.do", "_blank", "width=500, height=300, scrollbars=no, left=500, top=300");
		})

		$("#editInfoNK").click(function() {
			window.open("toEditInfoNK.do", "_blank","width=1000, height=800, scrollbars=no, left=500, top=100");
		})
	</script>
</body>
</html>