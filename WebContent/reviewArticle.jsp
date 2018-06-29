<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
        crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
        crossorigin="anonymous">
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
    </style>
</head>
<body>
   <%
      request.setCharacterEncoding("UTF-8");
   %>
    <div class="container">
        <div class="row title  text-center">
            <div class="col-sm-12">
               ${review_title}      
            </div>
        </div>
        <div class="row writer">
        <div class="col-sm-1 text-left">${review_seq}</div>
            <div class="col-sm-5 text-left">${review_writer}</div>
            <div class="col-sm-4 text-right">${review_writedate}</div>
            <div class="col-sm-2 text-right">${review_viewcount}</div>
        </div>
        <div class="row contents">
            <div class="col-sm-12">
               ${review_contents}
            </div>
        </div>
        <div class="row function">
            <div class="col-sm-4 offset-sm-4 text-center vote">
                <button type="button" class="btn btn-outline-danger" id="goodbtn">
                    <i class="fas fa-heart"></i>30</button>
                <button type="button" class="btn btn-outline-primary" id="badbtn">
                    <i class="far fa-frown"></i>30</button>
            </div>
            <div class="col-sm-4 text-right move">
                <button type="button" class="btn btn-outline-secondary">목록</button>
                <button type="button" class="btn btn-outline-secondary">스크랩</button>
                <button type="button" class="btn btn-outline-danger">신고</button>
            </div>
        </div>
        <div class="comments">
            <div class="comment row">
                <div class="col-sm-2">${comment_writer}</div>
                <div class="col-sm-7">${comment_text}</div>
                <div class="col-sm-2">${comment_time}</div>
                <div class="col-sm-1">
                    <a href="#">
                        <i class="fas fa-times-circle"></i>
                    </a>
                </div>
            </div>
        </div>
        <form action="addReviewComment.bo?review_seq=${review_seq}" method="post" id="inputCommentForm">
          <div class="input_comments">
            <div class="input_comment row">
                <!-- <div class="col-sm-7"><input type="text" id="input_comment_text" class="w-100"></div> -->
                <div class="col-sm-7"><textarea class="w-100" name="comment_text"></textarea></div>
                <div class="col-sm-1">
                    <a href="#" type="submit" id="inputComment">
                        <i class="fas fa-pen"></i>
                    </a>
                </div>
            </div>
        </div>
       </form> 
        
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
        crossorigin="anonymous"></script>
    <script>
$('#inputComment').click(function(){
	$('#inputCommentForm').submit();
})

    </script>
</body>
</html>