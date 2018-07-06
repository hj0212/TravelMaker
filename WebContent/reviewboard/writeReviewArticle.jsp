<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js""></script>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css"
	rel="stylesheet">
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<script src="./reviewboard/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="source/css/codepenNavi.css">
<style>
/* 에디터 p태그의 높이 조절 */
.note-editable p {
	margin: 0 0 0.0001pt;
}

.container {
	margin-top: 140px;
	width: 970px;
}
</style>
</head>

<body>
	<c:choose>
		<c:when test="${sessionScope.loginId !=null}">
			<%@include file="../include/otherNavi.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="../include/mainNavi.jsp"%>
		</c:otherwise>
	</c:choose>

	<c:choose>
		<c:when test="${sessionScope.user.seq eq null}">
			<script>
					location.href = "reviewlogin.bo";
			</script>
		</c:when>
		<c:otherwise>
			<div class="container">
				<form action="writeReviewArticle.bo" method="post"
					name="writeContents">
					<div class="form-group">
						<input type="text" class="form-control" name="title"
							placeholder="제목을 입력해주세요" maxlength="50">
					</div>
					<div class="form-group">
						<textarea name="contents" class="form-control" id="editor"></textarea>
						<input type="text" readonly style="display:none" id="imageList" name="imageList">
					</div>
					<div class="text-right">
						<input type="button" class="btn btn-primary" value="작성"
							onclick="sendContents()" id="send">
						</button>
						<button type="button" class="btn btn-primary" id="cancel">취소</button>
						<button type="button" class="btn btn-primary" id="list">목록
						</button>
					</div>
				</form>
			</div>
</body>
<script src="./reviewboard/editor.js"></script>
</c:otherwise>
</c:choose>
</html>