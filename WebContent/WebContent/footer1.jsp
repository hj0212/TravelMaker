<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.page-footer {
	background-color: rgb(52, 52, 52);
}

.footerahref {
	color: gray;
	line-height: 2em;
}

.footerahref:hover {
	color: white;
	text-decoration: none;
}

.footertext {
	color: rgb(142, 185, 237);
	line-height: 2em;
}

.footerlogo {
	background: transparent url('source/img/TRAVEL/travelfooterlogo.png')
		center center no-repeat;
	width: 350px;
	background-size: contain;
	text-indent: 100%;
	white-space: nowrap;
	overflow: hidden;
}
.copyright{
	color : gray;
	text-decoration: none;
}
.copyright:hover{
	color : white;
	text-decoration: none;
}
.footcome1{
	color:gray;
	font-size:20pt;
}
.footcome2{
	color:gray;
}
.footlink{
	text-transform: uppercase;
	color:gray;
}
</style>

<footer class="page-footer font-small blue pt-4 mt-4">

	<!-- Footer Links -->
	<div class="container-fluid text-center text-md-left">

		<!-- Grid row -->
		<div class="row"
			style="width: 1300px; margin: 0 auto; padding: 30px">

			<!-- Grid column -->
			<div class="col-md-4 mt-md-0 mt-3" style="padding: 18px;">

				<!-- Content -->
				<a href="#" class="move_top"><img class="footerlogo"
					src="source/img/TRAVEL/travelfooterlogo.png"></a>

			</div>
			<!-- Grid column -->


			<div class="col-md-4 mt-md-0 mt-3">

				<!-- Content -->
				<h5 class="footcome1">오시는 길</h5>
				<p class="footcome2">
					서울특별시 영등포구 양평동4가 2 이레빌딩 19층<br> B클래스
				</p>

			</div>
			<!-- Grid column -->
			<hr class="clearfix w-100 d-md-none pb-3">

			<!-- Grid column -->
			<div class="col-md-4 mb-md-0 mb-3">

				<!-- Links -->
				<h5 class="footlink">Links</h5>

				<ul class="list-unstyled ">
					<li><a class="footerahref" href="travelintro1.jsp">팀 소개</a></li>
					<li><a class="footerahref" href="agree1.jsp">이용약관</a></li>
					<li><a class="footerahref" href="agree1.jsp">개인정보보호방침</a></li>
					<li><a class="footerahref" href="travelservice1.jsp">서비스안내</a></li>
					<li><a class="footerahref" href="contact1.jsp">고객지원</a></li>
				</ul>

			</div>
			<!-- Grid column -->

		</div>
		<!-- Grid row -->
	
	</div>
	<!-- Footer Links -->

	<!-- Copyright -->
	<div class="footer-copyright text-center py-3" style="color:gray; padding:30px;">
		<b>© 2018 Copyright: <a class="copyright"
			href="travelintro1.jsp"> Team TravelMaker</a></b>
			<p class="text-right">
			<a href="#"><i class="fab fa-facebook-square fa-2x" style="color:gray"></i></a>	
		<a href="#"><i class="fab fa-google-plus-square fa-2x" style="color:gray"></i></a>
		<a href="#"><i class="fab fa-twitter-square fa-2x" style="color:gray"></i></a>
		<a href="#"><i class="fab fa-instagram fa-2x" style="color:gray"></i></a>
		</p>
	</div>
	<!-- Copyright -->
	<script>
	$(".move_top").click(function() {
        $('html, body').animate({
            scrollTop : 0
        }, 600);
        return false;
    });
	</script>

</footer>
<!-- Footer -->


