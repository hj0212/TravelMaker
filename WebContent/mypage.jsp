<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<!-- <link rel="stylesheet" href="source/css/mypage.css" type="text/css"> -->


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
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">

<style>
*{
color:black;
}
a{
text-decoration: none ! important;
}
/* #box-container {
	margin: 0px auto;
	float: left;
	 background : rgba(0, 0, 0, 0.3); 
	background: white;
	border: 1px solid #777777;
	width: 15%;
	position: relative;
	left:320px;
	top:50px;
	border-radius: 5px;
	padding: 5px;
	z-index: 300;
	filter: alpha(opacity : '' 30 '');
}

#box-container:after {
	bottom: 100%;
	left: 50%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
	 border-bottom-color: rgba(0, 0, 0, 0.3);
	background: white;
	border-bottom: 1px solid #777777;
	border-width: 8px;
	margin-left: -8px;
	z-index: 300;
	filter: alpha(opacity : '' 30 '');
} */

/* #box-container{
padding:0 auto;
}
 */
ul {li 
{ display:inline;
	 a { color : #777777;
	text-decoration: none;
	&:
	hover
	{
	color
	:
	white;
}

}
}
}
/* .clearfix:after {
	content: "";
	display: table;
	clear: both;
} */

ul li:before{
border-top: 1px solid #777777;
}
#tabs,#tab1,#tab2,#tab3,#tab4{
border:1px solid transparent;
border-top-left-radius: .25em;
border-top-right-radius: .25em;
}
#tab1,#tab2,#tab3,#tab4{
display:block;
padding: .5rem 1rem;
}
ul{
border-bottom: 1px solid #ddd;
-webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    -webkit-padding-start: 40px;
}
#box-container li a {
	color: #777777 !important;
	text-decoration: none !important;
}

#box-container li {
	list-style: none !important;
}

/* #cf-box{
text-align:center;
float: left;
display: inline;
width:120px;
height:100%;
background: white;
border: 1px solid #777777;
&::a{
color:#ddd;
}
} */

/* #cf-box div a{
::hover{
background-color:primary;
}
} */

 #cf-box button{
/* border:1px solid transparent; */
border-radius: 10px;
} 

#wrapper {
	width: 970px;
	box-sizing: border-box;
	margin: 100px auto;
}

.data, .data div {
	height: 400px;
}

.item {
	width: 300px;
	padding: 0;
}

#profile-cont{
box-sizing: border-box;
/* border:1px solid #777777; */
border-radius: 10px;
}

#profile-container{
box-sizing: border-box;
/* border:1px solid #777777; */
border-radius: 10px;
}

#profile-con{
width:30%;
display:inline;
box-sizing: border-box;
float:left;
}
#con{
width:50%;
height:100%;
display:inline;
float: left;
text-align:center;
}

/*input file*/ 

#profileImgForm input {             /*input tag 공통 스타일*/
  width: 200px;
  height: 30px;
  border-radius: 3px;
  font-weight: 300;
  border-color: transparent;
  font-size: 10px;
  background: #777777;
  color: #fff;
 cursor: pointer;
}

#img_file {  
  opacity: 0.1;       /*input type="file" tag 투명하게 처리*/
  position: relative;
}
#img_button{
	cursor: pointer;
	 opacity: 3;
	 background-color: #777777;
	border: transparent;
}

.card-header{
background-color:#eee;
}
 </style>
 <script>
 $(document).ready(function(){
	 $("#profile_img").attr('src',"/Git_Practice_Message/file/${file_name}");
	 $("#img_button").click(function(){
		 var img_file = $("#img_file").trigger("click");	 
		 if(img_file){ 
			 
		 var selected = $("#profile").text("프로필 사진 등록");
	 
		 if(selected ){
			 $("#profile").click(function(){
			 $("#profileImgForm").submit();
		 })
		 }else{
			 alert("파일을 선택해주세요");
		 }
		 }else{
		 $("#profile").text(""); 
		 }
	 });	 
 });
 
 </script>
</head>


<body>
<c:choose>
		<c:when test="${sessionScope.user.seq !=null}">
			<%@include file="include/mainNavi_login.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="include/mainNavi.jsp"%>
		</c:otherwise>
	</c:choose>
	
<div id="wrapper">
	<!--profile부분-->
  <div class="py-5 text-center w-100 h-100" id="profile-cont">
    <div class="container py-5">
      <div class="row">
        <!-- <div class="col-sm-8 col-md-3 col-lg-3"> -->
          <div class="w-100 h-100 py-3 px-1 align-items-center" id="profile-container">
            <!-- <img class="card-img-top float-left rounded-circle mt-5" src="Charlie-Chaplin-PNG-Image-17681.png" alt="Card image cap"> -->
            <!--프로필 이미지 업로드-->
            <div class="col-sm py-3 ml-3 align-center" id="profile-con" style="width: 344.59px; box-sizing: border-box;">
            <form action="profileImg.do" method="post" enctype="multipart/form-data" id="profileImgForm">
            <button id="img_button" type="button" class="d-inline" title="여기를 누르시면 이미지를 변경하실수있습니다." style="max-height: 238px;height: 238px;width: 344.59px;max-width: 344.59px"><img for="img_file" id="profile_img" src="Charlie-Chaplin-PNG-Image-17681.png" alt="프로필 사진을 등록해보세요!" style="width: 100%;height: 100%"></button>
            <div class="align-items-center">
            <input type="file"id="img_file" name="file" accept=".gif, .jpg, .png, .jpeg" value="이미지변경" hidden="true">
            <button class="btn btn-outline-primary" type="button" id="profile" style=" width: 344.59px;">프로필사진</button></div>
            </form>
            </div>
            <!--기본 프로필-->
            <div class="col-sm d-inline py-5 my-5" id="con">
              <h4 class="my-2">${nickname}</h4>
              <c:choose>
              <c:when test="${email eq null}">
              <h4 class="my-2">이메일을 입력해주세요</h4>
              </c:when>
              <c:otherwise>
               <h4 class="my-4">${email}</h4>
              </c:otherwise>
              </c:choose>
       
         <!--회원정보 수정-->
         <div id="cf-box" class="col-sm d-inline py-3 my-5">
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
			</div>
		</div>
     </div>
     
     <!--임시저장-->
     <div>
     <h1 class="divLine">작성중인Plan</h1>
		<hr/>

		<div class="row mt-2 mx-0">
			<c:forEach var="item" items="${planList}">
				<div class="item col-md-3 mb-3">
					<div class="card text-center">
		<a href="selectSchedule.plan?plan=${item.plan_seq}&day=1&create=f" style="text-decoration:none;">
						<div class="card-header planTitle" style="line-height:35px;height:55px; overflow:hidden;">${item.plan_title}</div>
		</a>
						<div class="card-body mt-1 text-center">
							<h6 class="text-muted d-inline mr-5" name="subTitle">${item.plan_writerN}</h6>
							<div class="btn-list d-inline">

								<i class="far fa-eye"></i> <span>${item.plan_viewcount}</span> <i
									class="fas fa-hand-holding-heart"></i> <span>${item.plan_good}</span>
							</div>
							<hr>
							<p class="text-center">여기다 뭐넣을까여</p>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
     
     
     
     
     </div>
     
     
		<!--tab부분-->
		<div class="py-5 mt-10">
			<div class="container">

				<div class="panel-heading">
					<ul class="nav nav-tabs nav-justified" id="tabs">
						<li class="nav-item px-0" id="tab1"><a href="#tabone"
							class="active nav-link" data-toggle="tab" data-target="#tabone"
							role="presentation">내후기글</a></li>
						<li class="nav-item px-0" id="tab2"><a href="#tabtwo" class="nav-link" data-toggle="tab"
							data-target="#tabtwo" role="presentation">내계획</a></li>
						<li class="nav-item px-0" id="tab3"><a href="#tabthree" class="nav-link" data-toggle="tab"
							data-target="#tabthree" role="presentation">좋아요누른글</a></li>
						<li class="nav-item px-0" id="tab4"><a href="#tabfour" class="nav-link" data-toggle="tab"
							data-target="#tabfour" role="presentation">Tab 4</a></li>
					</ul>
				</div>
				<div class="pannel-body">

					<div class="row tab-content ">
				
						<!-- tabone -->
						<div class="col tab-pane active" id="tabone" role="tabpanel">
							<div class="row">
								<c:forEach var="mrr" items="${MyReviewResult}">				
									<div class="item col-md-3 col-sm-3 w-25">
										<div class="card">
											<div class="card-header">
												<a href="reviewArticle.bo?review_seq=${mrr.review_seq}"
													style="text-decoration: none; text-align: center; margin: 0 auto;">
													<h6>${mrr.review_title}</h6>
												</a>
											</div>
											<img class="card-img-top float-left rounded"
												src="Charlie-Chaplin-PNG-Image-17681.png"
												alt="Card image cap">
											<div class="card-body">
												<p>${mrr.review_viewcount}</p>
												<h6 class="text-muted">${mrr.review_contents}</h6>
												<p>${mrr.review_writedate}</p>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>

						<!-- tabtwo -->


						<div class="col tab-pane" id="tabtwo" role="tabpanel">
							<div class="row">

								<c:forEach var="mpr" items="${MyPlanResult}">
									<div class="item col-md-3 col-sm-3 w-25">
										<div class="card">
											<div class="card-header">
												<a href="planArticle.plan?plan_seq=${mpr.plan_seq}"
													style="text-decoration: none; text-align: center; margin: 0 auto;">
													<h6>${mpr.plan_title}</h6>
												</a>
											</div>
											<div class="card-body">
												<p>${mpr.plan_viewcount}</p>
												<h6 class="text-muted">${mpr.plan_startdate}~
													${mpr.plan_enddate}</h6>
											</div>
										</div>
									</div>
								</c:forEach>


							</div>
						</div>

						<!-- tabthree -->
						<div class="col tab-pane" id="tabthree" role="tabpanel">
							<div class="row mt-2 mx-0">

								<c:forEach var="item" items="${flist}">
									<div class="item col-md-3 mb-3">
										<div class="card text-center">
											<div class="card-header"
												style="max-height: 64px; overflow: hidden;">
												<a href="planArticle.plan?plan_seq=${item.plan_seq}"
													style="text-decoration: none; margin: 0px auto; text-align: center; max-height: 64px; overflow: hidden;">
													${item.plan_title} </a>
											</div>
											<div class="card-body mt-1 text-center">
												<h6 class="text-muted d-inline mr-5" name="subTitle">${item.plan_writerN}</h6>
												<div class="btn-list d-inline">

													<i class="far fa-eye"></i> <span>${item.plan_viewcount}</span>
													<i class="fas fa-hand-holding-heart"></i> <span>${item.plan_good}</span>
												</div>
												<hr>
												<p class="text-center">여기다 뭐넣을까여</p>
											</div>
										</div>
									</div>
								</c:forEach>



							</div>
						</div>


						<!-- tabfour -->
						<div class="col tab-pane" id="tabfour" role="tabpanel">
							<div class="row">


								<div class="item col-md-3 col-sm-3 w-25">
									<div class="card">
										<div class="card-header">Header</div>
										<img class="card-img-top float-left rounded"
											src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg"
											alt="Card image cap">
										<div class="card-body">
											<h4>Card title</h4>
											<h6 class="text-muted">Subtitle</h6>
											<p>Some quick example text to build on the card title .</p>
										</div>
									</div>
								</div>
								<div class="item col-md-3 col-sm-3 w-25">
									<div class="card">
										<div class="card-header">Header</div>
										<img class="card-img-top float-left rounded"
											src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg"
											alt="Card image cap">
										<div class="card-body">
											<h4>Card title</h4>
											<h6 class="text-muted">Subtitle</h6>
											<p>Some quick example text to build on the card title .</p>
										</div>
									</div>
								</div>
								<div class="item col-md-3 col-sm-3 w-25">
									<div class="card">
										<div class="card-header">Header</div>
										<img class="card-img-top float-left rounded"
											src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg"
											alt="Card image cap">
										<div class="card-body">
											<h4>Card title</h4>
											<h6 class="text-muted">Subtitle</h6>
											<p>Some quick example text to build on the card title .</p>
										</div>
									</div>
								</div>
								<div class="item col-md-3 col-sm-3 w-25">
									<div class="card">
										<div class="card-header">Header</div>
										<img class="card-img-top float-left rounded"
											src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg"
											alt="Card image cap">
										<div class="card-body">
											<h4>Card title</h4>
											<h6 class="text-muted">Subtitle</h6>
											<p>Some quick example text to build on the card title .</p>
										</div>
									</div>
								</div>

							</div>
						</div>

						<!-- 검색  -->
						<div class="row col-md-12">
							<div class="input-group mt-2 col-md-12" id="inputSearch">
								<input type="text"
									class="form-control ml-auto col-4 justify-content-center"
									aria-label="reply" aria-describedby="basic-addon2" id="search">
								<div class="input-group-append">
									<button class="btn btn-outline-primery mx-1" type="button"
										id="searchbtn" name="searchbtn">검색</button>
								</div>
							</div>
						</div>

						<!-- 페이징 -->
						<div class="col-md-12 mt-2">
							<nav aria-label="Page navigation">
								<ul class="pagination justify-content-center">${MyReviewPageNavi}</ul>
							</nav>
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
		            $("#img_file").on('change', function(){
		            	var fileName =$("#img_file").val();
				        var idxDot = fileName.lastIndexOf(".") + 1;
				        var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
				            //TO DO
				        if (extFile=="jpg" || extFile=="jpeg" || extFile=="png"){
		            	readURL(this);
				        }else{
				            alert("프로필 사진은 이미지 파일만 입력 가능합니다");
				        } 
		            	
		            });
		        });

		        function readURL(input) {
		            if (input.files && input.files[0]) {

		            var reader = new FileReader();
		            
		            reader.onload = function (e) {
		                    $('#profile_img').attr('src', e.target.result);
		                }

		              reader.readAsDataURL(input.files[0]);
		            }
		        }

		$("#editInfo").click(
				function() {
					/* location.href="toPwCheck.do"; */
					window.open("toPwCheck.do", "_blank",
							"width=500, height=300, scrollbars=no, left=500, top=300");
				})

				$("#editInfoNK").click(
			function(){
				window.open("toEditInfoNK.do","_blank","width=1000, height=800, scrollbars=no, left=500, top=100");
			})
		
	</script>
</body>

</html>