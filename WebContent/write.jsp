<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="smarteditor/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">


<style>
.container {
	width: 960px;
}

.title {
	margin-top: 5%;
}
</style>

</head>
<body>

	<form id="frm" action="insert.jsp" method="post">
		<div class="container">
			<table width="100%" class="form-group">
				<tr>

					<td><input type="text" class="form-control" name="title"
						id="title" placeholder="제목을 입력해주세요"></td>
				</tr>
				<td>
					<div class="input-group">
						<select class="custom-select" id="inputGroupSelect04">
							<option selected>일정을 선택해주세요.</option>
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
						</select>
						<div class="input-group-append">
							<button class="btn btn-outline-primary btn-lg" type="button">
								<i class="fas fa-map-marked-alt"></i>

							</button>
						</div>
					</div>
				</td>
				<tr>
					<td><textarea rows="10" cols="30" id="ir1" name="content"
							style="width: 100%; height: 500px;"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><button type="submit"
							class="btn btn-primary" id="save">작성</button>
						<button type="button" class="btn btn-primary">취소</button></td>
				</tr>
			</table>
		</div>
	</form>

	<script type="text/javascript">
		var oEditors = [];
		$(function() {
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "ir1",
				sSkinURI : "smarteditor/SmartEditor2Skin.html",
				htParams : {
					bUseToolbar : true,
					bUseVerticalResizer : true,
					bUseModeChanger : true,
					fOnBeforeUnload : function() {
					}
				},
				fOnAppLoad : function() {
					oEditors.getById["ir1"].exec("PASTE_HTML", [ "" ]);
				},
				fCreator : "createSEditor2"
			});
		});

		$("#save").click(function() {
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
		})
	</script>


</body>
</html>