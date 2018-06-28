<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
   		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
   		crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	    crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
    	<script src="./freeboard/summernote-ko-KR.js"></script>
        <link rel="stylesheet" href="./freeboard/freewrite.css">
        <link rel="stylesheet" href="./freeboard/freewrite.css">
        <link rel="stylesheet" href="source/css/codepenNavi.css">
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
            <form action="freeview.jsp" method="post" onsubmit="return sendContents()" name="writeContents">
            	<div class="form-group">
            		<input type="text" class="form-control" name="title" placeholder="제목을 입력해주세요" maxlength="50">
        		</div>
        		<div class="form-group">
            		<textarea name="contents" class="form-control" id="editor"></textarea>
        		</div>
                <div class="text-right">
        		    <input type="submit" class="btn btn-primary" value="작성"></button>
            		<button type="button" class="btn btn-primary" id="cancel">취소</button>
            		<button type="button" class="btn btn-primary" id="list">목록</button>
        		</div>
            </form>
        </div>
    </body>
    <script src="./freeboard/editor.js"></script>
    </html>