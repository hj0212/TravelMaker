<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- ��Ʈ ��Ʈ�� �ڵ�-->
<link rel="stylesheet"
	href="source/lib/bootstrap-3.3.2-dist/css/bootstrap.css">
<link rel="stylesheet"
	href="source/lib/bootstrap-3.3.2-dist/css/bootstrap-theme.css">
<script src="source/lib/bootstrap-3.3.2-dist/js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<style>
div {
	border: 1px solid black;
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
</style>
<!-- <div class="shadow-none p-3 mb-5 bg-light rounded">No shadow</div>
<div class="shadow-sm p-3 mb-5 bg-white rounded">Small shadow</div>
<div class="shadow p-3 mb-5 bg-white rounded">Regular shadow</div>
<div class="shadow-lg p-3 mb-5 bg-white rounded">Larger shadow</div> -->
</head>
<body>

	<div
		class="navbar navbar-default navbar-fixed-top collapse navbar-collapse"
		role="navigation">
		<ul class="nav navbar-nav">
			<li class="active"><a href="#"> <span class="sr-only">Plans</span></a></li>
			<li><a href="#"><span class="sr-only">Schedules</span></a></li>
			<li><a href="#"><span class="sr-only">Review</span></a></li>
			<li><a href="#"><span class="sr-only">Board</span></a></li>
			<li class="dropdown"></li>
		</ul>
	</div>
	<div class="container">

		<div class="row" id="navi">
			<div class="col-md-12">
				<h1>�׺�� ��</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12" id="bestPlan">����Ʈ �����ȹ �̹��� �����̴�</div>
		</div>

		<div class="row">
			<div class="col-md-12" id="bests">����Ʈ ����, ����Ʈ ���, ����Ʈ �ı�</div>
		</div>

		<div class="row">
			<div class="col-md-12" id="foot">
				<h1>Ǫ�Ϳ� ��</h1>
			</div>
		</div>

	</div>
	</div>

</body>
</html>