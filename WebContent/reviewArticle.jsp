<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
   background-color: #e9e9e9;
   margin-bottom: 3px;
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
<script>
   $(document).ready(function() {
      $("#reviewboard-bt").click(function() {
         $(location).attr("href", "reviewboard.bo?currentPage="+"${currentPage}");
      });
   });
</script>
</head>
<body>
   <%
      request.setCharacterEncoding("UTF-8");
   %>
   <div class="container">
      <div class="row title  text-center">
         <div class="col-sm-12">${review_title}</div>
      </div>
      <div class="row writer">
         <div class="col-sm-1 text-left">${review_seq}</div>
         <div class="col-sm-5 text-left">${review_writerN}</div>
         <div class="col-sm-3 text-right">${review_writedate}</div>
         <div class="col-sm-2 text-right">${review_viewcount}</div>
          <c:choose>
          <c:when test="${user eq review_writer}">
          <div class="col-sm-1 text-right">
          <a href="deleteReviewArticle.bo?review_seq=${review_seq}"><i class="far fa-times-circle"></i></a>
          </div>
          </c:when>
          <c:otherwise>
          <div class="col-sm-1 text-right"></div>
          </c:otherwise>
          </c:choose>
      </div>
      <div class="row contents">
         <div class="col-sm-12">${review_contents}</div>
      </div>
      <div class="row function">
         <div class="col-sm-4 offset-sm-4 text-center vote">
            <button type="button" class="btn btn-outline-danger" id="goodbtn">
               <i class="fas fa-heart"></i>30
            </button>
            <button type="button" class="btn btn-outline-primary" id="badbtn">
               <i class="far fa-frown"></i>30
            </button>
         </div>
         <div class="col-sm-4 text-right move">
            <button type="button" class="btn btn-outline-secondary"
               id="reviewboard-bt">목록</button>
            <button type="button" class="btn btn-outline-secondary">스크랩</button>
            <button type="button" class="btn btn-outline-danger">신고</button>
         </div>
      </div>
      <div class="comments">
         <button type="button"
            style="border: none; background-color: white; cursor: pointer;"
            id="comment-bnt">댓글보기▼</button>
         <form action="addReviewComment.bo?review_seq=${review_seq}"
            method="post" id="inputCommentForm">
            <div style="width: 100%; margin: 0px;">
               <div style="width: 80%">
                  <textarea class="form-control" rows="3" id="comment_text"
                     name="comment_text"
                     style="resize: none; width: 100%; margin: 0px; float: left;"
                     maxlength="70"></textarea>
               </div>
               <div
                  style="width: 20%; float: left; height: 86px; margin-bottom: 30px;">
                  <button style="width: 100%; height: 86px;background-color: white" id="commentbnt"
                     class="btn btn-default"><i class="fa fa-comments"></i>댓글 작성</button>
               </div>
            </div>
         </form>

         <table class="table" id="comment-table">
            <thead id="comment-thead">
               <tr>
                  <th scope="col" style="width: 15%;">작성자</th>
                  <th scope="col" style="width: 70%">댓 글 내 용</th>
                  <th scope="col" style="width: 15%;">Last</th>
               </tr>
            </thead>
            <tbody>

               <c:forEach var="comment" items="${commentResult}">
                  <tr>
                     <th scope="row"
                        style="width: 15%; max-width: 15%; max-height: 51px;"
                        class='writer'>${comment.comment_writer}</th>
                     <td style="width: 70%">${comment.comment_text}</td>
                     <td style="width: 15%; font-size: 10px;">${comment.comment_time}
                  
                        <button type="button" class="close" aria-label="Close">
                           <span aria-hidden="true"">&times;</span>
                        </button>
                     
                     </td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>
      </div>
   </div>
   </div>
   <script>
      $('#commentbtn').click(function() {
         $('#inputCommentForm').submit();
      })
   </script>
   <script>
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
 /*      $("#commentbnt").click(
                  function() {
                     var con = confirm("댓글을작성하시겠습니까?");
                     var comment = $("#comment_text").val();
                     if (con) {
                        if (comment != "") {
                           alert("댓글이 성공적으로 달렸습니다");
                           $("#comment_text").val("");
                        } else {
                           alert("댓글을 작성해주세요.");
                        }
                     } else {
                     }
                  }); */
   </script>
</body>
</html>