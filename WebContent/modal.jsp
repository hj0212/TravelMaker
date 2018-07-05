<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Snippet - Bootsnipp.com</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<style></style>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript"></script>
</head>


<body>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="address">
				<button type="button" class="btn btn-danger" data-toggle="modal"
					data-target="#ordine">Invia ordine</button>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>

	<!-- Modal -->
	<div id="ordine" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">Ordine inviato!</h4>
				</div>
				<div class="modal-body">
					<p>계정 정지</p>
					<p>Grazie per aver scelto Mailmodel !</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
</body>
</html>