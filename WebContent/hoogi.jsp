<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">



<style>
</style>
</head>
<body>
<head>

<meta charset="utf-8">

<title>일정 확인</title>

<style type="text/css">
* {
	padding: 0;
	margin: 0;
	text-align: center;
}


.container {
	width: 960px;
	margin-top: 120px;
}

.wrapper {
	position: relative;
	margin: 10px 0 10px;
	height: 300px;
}

.left_half {
	position: absolute;
	top: 0;
	right: 50%;
	left: 0%;
	bottom: 0;
	overflow: visible;
}

.right_half {
	position: absolute;
	top: 0;
	right: 0%;
	left: 50%;
	bottom: 0;
	overflow: visible;
}

.form-control {
	position: absoulte;
	float: left;
}

.pagination {
	position: absoulte;
	float: left;
}

#schedule-table .budget_plan, .budget_amount {
	display: inline;
}

#btnarea {
	margin-bottom: 20px;
}
</style>
<script
  src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>



$(document).ready(function(){

	$("#goodbtn").click(function(){

	var article ="${plan_seq}";
	
	console.log(goodbtn);

	$.ajax({
		  type:'POST',
		  url:"plangood.btns",
		  data: {article:article},
		  success:function(good){
			  console.log("asdasd");
			
				 $("#goodbtn").html(""); 
				 $("#goodbtn").html('<i class="fas fa-heart"></i>'+good);
				  
		  }
		});
			
	});
	$("#badbtn").click(function(){	
	var article ="${plan_seq}";	

	$.ajax({
		  type:'POST',
		  url:"planbad.btns",
		  data: {article:article},
		  success:function(bad){
			  console.log("asdasd");
			 
				 $("#badbtn").html(""); 
				 $("#badbtn").html('<i class="far fa-frown"></i>'+bad);
			
			
			  
		  }
		});
			
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
	<div class="container text-center">
		<div class="form-group">
			<center>
				<input type="text" class="form-control" id="title" readonly
					style="width: 600px;" value="${plan_title }">
			</center>
			<button class="btn btn-default">수정</button>
			<button class="btn btn-default">후기보기</button>
			<button class="btn btn-default">목록</button>

			<div class="wrapper">			
				<div class="left_half">
					<div style="border: 1px solid gray; width: 450px; height: 300px;"></div>
				</div>
				<div class="right_half">
					<div style="border: 1px solid gray; width: 450px; height: 300px;"></div>
				</div>
			</div>
			
			<div class="schedule">
			
				<ul class="nav nav-tabs" role="tablist">
					<c:forEach var="day" begin="1" end="${plan_period}" step="1">
					<li class="nav-item">
						<a class='nav-link' href='#Day${day}' role='tab' data-toggle='tab'>Day${day}</a>
					</li>
					</c:forEach>
				</ul>
			
				<div class="tab-content">
				<c:set var="isFirst" value="true" />
				<c:forEach var="day" begin="1" end="${plan_period}" step="1">
				
				 <div role="tabpanel" class="tab-pane fade show active" id="Day${day}">
					<table class="table table-striped" id="schedule-table">
						<c:if test="${isFirst }">
						<thead>
							<tr>
								<th scope="col" style="width:160px;">시간</th>
								<th scope="col" style="width:170px;">장소</th>
								<th scope="col">일정</th>
								<th scope="col">예산</th>
								<th scope="col">참고</th>
							</tr>
						</thead>
						<c:set var="isFirst" value="false" />
						</c:if>
						<c:if test="${not isFirst}">
						<script>console.log("${empty scheduleList}")</script>
						<tbody id="schedule-tbody" style="table-layout: fixed; word-break: break-all;">
							<c:forEach var="item" items="${scheduleList}">
							<c:if test="${item.day_seq eq day }">
							<tr class="clickable-row">
								<th scope="row" style="height: 50px;">${item.schedule_starttime}~${item.schedule_endtime}</th>
								<td name="place">${item.location_name}<input type="hidden" value="${item.location_id}"></td>
								<td name="schedule">${item.schedule_plan}</td>

								<c:if test="${!empty budgetList}">
									<c:set var="loop_flag" value="false" />
									<c:set var="count" value="1" />
									<c:forEach var="bitem" items="${budgetList}" varStatus="index">
										<c:if test="${not loop_flag }">
											<c:if test="${item.schedule_seq == bitem.schedule_seq}">
												<c:choose>
													<c:when test="${count == 1}">
														<td name="money">
														<div>
														<div class="budget_plan">${bitem.budget_plan}:</div>
														<div class="budget_amount">${bitem.budget_amount}</div>
														</div><br>
														<c:set var="count" value="2" />
													</c:when>
													<c:otherwise>
														<div>
														<div class="budget_plan">${bitem.budget_plan}:</div>
														<div class="budget_amount">${bitem.budget_amount}</div>
														</div><br>
													</c:otherwise>
												</c:choose>
											</c:if>
											<c:if test="${index.last && count == 1 && item.schedule_seq != bitem.schedule_seq}">
												<td name="money"></td>
												<c:set var="loop_flag" value="true" />
											</c:if>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${empty budgetList}">
									<td name="money"></td>
								</c:if>
								<td name="reference">${item.schedule_ref}</td>
							</tr>
							</c:if>
							</c:forEach>
						
						</tbody>
						</c:if>
					</table>
				</div> 
				</c:forEach>
				</div>
			</div>
			
			<div id="btnarea">
				<button type="button" class="btn btn-outline-danger" id="goodbtn">
					<i class="fas fa-heart"></i>${good}
				</button>
				<button type="button" class="btn btn-outline-primary" id="badbtn" >
					<i class="far fa-frown"></i>${bad}
				</button>
				<button class="btn btn-outline-success">스크랩</button>
				
				<button class="btn btn-default" style="float: right;">신고</button>
			</div>
			
			<div class="comments">
			<form action="insertPlanComment.plan?plan_seq=${plan_seq}" method="post" id="planCommentForm" name="planCommentForm"> 
			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="reply"
					aria-label="reply" aria-describedby="basic-addon2" id="comment_text" name="comment_text">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button"
						id="commentbtn" name="commentbtn">댓글작성</button>
				</div>
			</div>
			</form>
			<button type="button"
            style="border: none; background-color: white; cursor: pointer;"
            id="comment-bnt">댓글보기▼</button>
			<div id="planCommentList">
		<table class="table" id="comment-table">
            <thead id="comment-thead">
               <tr>
                  <th scope="col" style="width: 15%;">작성자</th>
                  <th scope="col" style="width: 70%">댓 글 내 용</th>
                  <th scope="col" style="width: 15%;">Last</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach var="pc" items="${result1}">
                  <tr>
                     <th scope="row"
                        style="width: 15%; max-width: 15%; max-height: 51px;"
                        class='writer'>${pc.comment_writerN}</th>
                     <td style="width: 70%">${pc.comment_text}</td>
                     <td style="width: 15%; font-size: 10px;">${pc.comment_time}
               
                  <c:if test="${pc.comment_writer eq sessionScope.user.seq}">
                        <button type="button" class="close" aria-label="Close" id="deleteComment" >
                  <a href="deletePlanComment.plan?comment_seq=${pc.comment_seq}&plan_seq=${pc.plan_seq}">
                           <span aria-hidden="true">&times;</span>
                        </a>
                        </button>
                        </c:if>
        
                     </td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>
			</div>
		</div>
	</div>
</div>

   <script>
   /*댓글관련 버튼들*/
   /*댓글 작성*/
   $('#commentbtn').click(function() {
	   var comment_text = $("#comment_text").val(); 
	   if(comment_text != null){
       $('#planCommentForm').submit();
	   }else{
		  alert("내용을 입력해주세요");
	   }
    });
    /*댓글보기*/
      var commentBntCount = 2;
      $("#comment-bnt").click(function() {
         var writer = $(".writer").text();
         if (commentBntCount == 1) {
            $("#comment-bnt").text("댓글감추기▲");
            $("#comment-table").show();
            commentBntCount++;
         } else {
            $("#comment-bnt").text("댓글보기▼");
            $("#comment-table").hide();
            commentBntCount--;
         }
      });

 
   </script>
   
</body>
</html>