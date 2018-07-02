<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
   integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
   integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
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
<style>
* {
   box-sizing: border-box;
}

.container {
   width: 970px;
   margin-top: 130px;
}

.title {
   font-size: 35px;
}

.writer {
   font-size: 17px;
}

.writer * {
   padding: 0px;
}

.contents {
   border: 1px solid #e9e9e9;
   margin-top: 20px;
   border-radius: 10px;
   min-height: 100px;
}

/* 편법임... */
.contents p {
   margin: 0 0 0.0001pt;
}

.function {
   margin-top: 15px;
}

.move {
   padding: 0px;
}

.comments {
   margin-top: 15px;
}

.comment {
   text-align: center;
   background-color: #e9e9e9;
   margin-bottom: 3px;
   background-color: #e9e9e9;
}

#comment-bnt:hover {
   color: red;
}

#comment-table {
   text-align: center;
}

tr {
   border-bottom: 3px dotted #e9e9e9;
}

</style>
<script
  src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>



$(document).ready(function(){

	$("#goodbtn").click(function(){

	var article ="${seq}";
	
	console.log(goodbtn);

	$.ajax({
		  type:'POST',
		  url:"frGoodbtn.btns",
		  data: {article:article},
		  success:function(good){
			  console.log("asdasd");
			
				 $("#goodbtn").html(""); 			
				 $("#goodbtn").html('<i class="fas fa-heart"></i>'+good);
			
			
			  
		  }
		});
			
	});
	$("#badbtn").click(function(){	
	var article ="${seq}";	

	$.ajax({
		  type:'POST',
		  url:"frBadbtn.btns",
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
		<c:when test="${sessionScope.loginId !=null}">
			<%@include file="../include/mainNavi_login.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="../include/mainNavi.jsp"%>
		</c:otherwise>
	</c:choose>
   <div class="container">
      <div class="row title  text-center">
         <div class="col-sm-12">${article.free_title}</div>
      </div>
      <div class="row writer">
         <div class="col-sm-6 text-left">${writer}</div>
         <div class="col-sm-4 text-right">${article.free_writedate}</div>
         <div class="col-sm-2 text-right">${article.free_viewcount}</div>
      </div>
      <div class="row contents">
         <div class="col-sm-12">
            ${article.free_contents}
         </div>
      </div>
      <div class="row function">
          <div class="col-sm-4 offset-sm-4 text-center vote">
            <button type="button" class="btn btn-outline-danger" id="goodbtn">
               <i class="fas fa-heart"></i>${good}
            </button>
            <button type="button" class="btn btn-outline-primary" id="badbtn">
               <i class="far fa-frown"></i>${bad}
            </button>
         </div> 
         <div class="col-sm-4 offset-sm-8 text-right move">
            <button type="button" class="btn btn-outline-secondary" id="goList">목록</button>
            <!-- <button type="button" class="btn btn-outline-secondary">스크랩</button>
            <button type="button" class="btn btn-outline-danger">신고</button> -->
            <c:if test="${article.free_writer == sessionScope.user.seq}">
            	<button type="button" class="btn btn-outline-secondary" id="update">수정</button>
            	<button type="button" class="btn btn-outline-secondary" id="delete">삭제</button>
            </c:if>
         </div>
      </div>
      <div class="comments">
         <button type="button" style="border: none; background-color: white;"
            id="comment-bnt">댓글보기▼</button>

         <div style="width: 100%; margin: 0px;">
            <div style="width: 80%">
               <textarea class="form-control" rows="3" id="comment"
                  " style="resize: none; width: 100%; margin: 0px; float: left;"
                  maxlength="70"></textarea>
            </div>
            <div
               style="width: 20%; float: left; height: 86px; margin-bottom: 30px;">
               <button style="width: 100%; height: 86px;background-color: white" id="comment-write-bnt"  class=""btn btn-default"><i class="fa fa-comments"></i>댓글
                  작성</button>
            </div>
         </div>


         <table class="table" id="comment-table">
            <thead id="comment-thead">
               <tr>
                  <th scope="col" style="width: 15%;">작성자</th>
                  <th scope="col" style="width: 70%">댓 글 내 용</th>
                  <th scope="col" style="width: 15%;">Last</th>

               </tr>
            </thead>
            <tbody>
               <tr>
                  <th scope="row"
                     style="width: 15%; max-width: 15%; max-height: 51px;"
                     class="writer">김형섭</th>
                  <td style="width: 70%; max-width: 70%;"></td>
                  <td style="width: 15%; font-size: 10px;">Ott
                     <button type="button" class="close" aria-label="Close">
                        <span aria-hidden="true"">&times;</span>
                     </button>
                  </td>


               </tr>
               <tr>
                  <th scope="row"
                     style="width: 15%; max-width: 15%; max-height: 51px; word-break: break-all;"
                     class="writer"></th>
                  <td style="width: 70%">asdasd</td>
                  <td style="width: 15%; font-size: 10px;">Thornton
                     <button type="button" class="close" aria-label="Close">
                        <span aria-hidden="true"">&times;</span>
                     </button>
                  </td>


               </tr>
               <tr>
                  <th scope="row"
                     style="width: 15%; max-width: 15%; max-height: 51px;"
                     class='writer'>3</th>
                  <td style="width: 70%">Larry</td>
                  <td style="width: 15%; font-size: 10px;">2018-51-29 11:53:39
                     <button type="button" class="close" aria-label="Close">
                        <span aria-hidden="true"">&times;</span>
                     </button>
                  </td>
               </tr>
            </tbody>

         </table>

      </div>
   </div>


   <script>
    
      var commentBntCount = 2;
      $("#comment-bnt").click(function() {
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

      $("#comment-write-bnt").click(function () {
            var con = confirm("댓글을작성하시겠습니까?");


            var Now = new Date();
            var NowMonth = Now.getMonth() + 1;
            var NowTime = Now.getFullYear();
            NowTime += '-' + NowMonth;
            NowTime += '-' + Now.getDate();
            NowTime += ' ' + Now.getHours();
            NowTime += ':' + Now.getMinutes();
            NowTime += ':' + Now.getSeconds();

            var writer = "논개";
            var comment = $("#comment").val();

            var commentinput = "";

            commentinput += "<tr>";
            commentinput += "<th scope='row' style='width:15%' class='writer'>"
                  + writer + "</th>";
            commentinput += "<td style='width:70%;max-width: 60%;'>"
                  + comment + "</td>";
            commentinput += "<td style='width:15%;font-size: 10px;'>"
                  + NowTime
                  + "   <button type='button' class='close' aria-label='Close' hide>"
                  + "<span aria-hidden='true'>&times;</span>"
                  + "</button></td>";
            commentinput += "</tr>";

            if (con) {

                  if (comment != "") {
                        $("#comment-table tbody").prepend(
                              commentinput);
                        $("#comment").val("");

                  } else {
                        alert("댓글을 작성해주세요.");
                  }
            } else {

            }

      });
      
      $("#goList").click(function(){
            location.href = "freeboard.bo?currentPage="+${currentPage};
      })

      <c:if test="${article.free_writer == sessionScope.user.seq}">
	  	$("#delete").click(function(){
	  		location.href = "deleteCheck.bo?articlenum=${article.free_seq}";
	  	})
      </c:if>
		
   </script>
</body>
</html>