<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 부트 스트랩 코드-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="source/css/mainPage.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">

<title>TravelMaker</title>

<style>

/*-----------------------
----- Basic Styles -----
-------------------------*/
.container {
	width: 960px;
}

body {
	font-family: Raleway, Arial, sans-serif;
	font-size: 16px;
	font-weight: 200;
	/*color: #858585;*/
	overflow-x: hidden;
}

a {
	color: #6d6d6d;
	text-decoration: none;
}

a:hover, a:focus {
	/*color: #6d6d6d;*/
	text-decoration: underline
}

a:focus, .btn:focus {
	outline: none;
}

.img-responsive {
	border: 1px solid #ddd;
	color: gray;
}

/*-----------------------
----- Typo Styles ------
-------------------------*/
h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {
	font-weight: 300;
}

.big-text {
	font-size: 58px;
	font-weight: 300;
	line-height: 62px;
	letter-spacing: 0.01em;
	word-spacing: 0.15em;
	text-transform: uppercase;
}

.section-title {
	margin-top: -20px;
	margin-bottom: 80px;
	text-align: center;
}

/*-----------------------
----- Layout Styles -----
-------------------------*/
.add-padding {
	padding-top: 50px;
	padding-bottom: 50px;
}

/*-----------------------
----- Color Styles ------
-------------------------*/
.bg-color1 {
	color: #fff;
	background: #509B9E;
}

.bg-color2 {
	color: #fff;
	background: gray;
}

.bg-color3 {
	color: #fff;
	background: #334959;
}

.border-bottom-color2 {
	border-bottom: 7px solid gray;
}

.border-top-color2 {
	border-top: 7px solid gray;
}

.color1 .service-icon, .color1.service-item ul li:nth-child(2):before {
	background: #509B9E;
}

.color1 .service-icon:after {
	border: 3px solid #509B9E;
}

.color2 .service-icon, .color2.service-item ul li:nth-child(2):before {
	background: gray;
}

.color2 .service-icon:after {
	border: 3px solid gray;
}

.color3 .service-icon, .color3.service-item ul li:nth-child(2):before {
	background: #334959;
}

.color3 .service-icon:after {
	border: 3px solid #334959;
}

/*------------------
----- Buttons ------
--------------------*/
.btn-color1, .btn-color2 {
	padding: 10px 30px;
	color: #fff;
	font-size: 21px;
	font-weight: 300;
	background: gray;
	outline: none !important;
	border-radius: 0;
	transition: opacity .2s ease-out;
}

.btn-color1 {
	background: #509B9E;
}

.btn-color1:hover, .btn-color2:hover {
	color: #fff;
	opacity: 0.9;
}

.btn-color1:focus, .btn-color1:active, .btn-color2:focus, .btn-color2:active
	{
	color: #fff;
}

.btn-color1 .fa, .btn-color2 .fa {
	margin-right: 15px;
}

/*----------------------
----- Contact Styles ----
------------------------*/
#contact {
	background-repeat: no-repeat;
	background-position: 0 100%;
	background-color: #fff;
}

#contact-form .form-group label {
	display: none;
	font-size: 18px;
	line-height: 24px;
	font-weight: 100;
	text-transform: uppercase;
}

#contact-form.no-placeholder .form-group label {
	display: block;
}

#contact-form .controls {
	padding: 0;
	margin-bottom: 30px;
	border: 1px solid #ddd;
	border-radius: 2px;
}

#contact-form .form-control {
	background: transparent !important;
	border: none;
	border-bottom: 3px solid transparent;
	border-radius: 0;
	outline: none;
	box-shadow: none;
	height: 56px;
	font-size: 21px;
	line-height: 32px;
	font-weight: 100;
	padding-left: 64px;
	-webkit-transition: border-color .3s ease-out;
	transition: border-color .3s ease-out;
	border-radius: 2px;
}

#contact-form .form-group {
	position: relative;
}

#contact-form .form-group [class*=fa] {
	display: block;
	width: 64px;
	position: absolute;
	top: 0;
	left: 5px;
	color: #e5e5e5;
	font-size: 24px;
	line-height: 53px;
	text-align: center;
	font-weight: 300;
	opacity: 0.5;
	transition: opacity .2s ease-out;
}

#contact-form.no-placeholder .form-group [class*=fa] {
	top: 30px;
}

#contact-form .form-control:focus+[class*=fa] {
	opacity: 1;
}

#contact-form textarea.form-control {
	height: auto;
	max-width: 100%;
	min-width: 100%;
	font-size: 21px;
	line-height: 32px;
	padding-top: 10px;
	resize: none;
}

#contact-form .form-control:focus {
	background: #fff;
	border-bottom: 3px solid gray;
	outline: none;
	box-snhadow: none;
	-webkit-transition: border-color .3s ease-in;
	transition: border-color .3s ease-in;
}

#contact-form .error-message {
	padding: 5px 0;
	position: absolute;
	top: -30px;
	right: 0;
	font-size: 14px;
	font-weight: 300;
	color: #ff0000;
	z-index: 10;
}

#contact-form .error-message:before {
	content: "\00d7";
	font-size: 21px;
	line-height: 21px;
	margin-right: 5px;
}

.contactp {
	font-size: 15pt;
}
</style>
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

	<div class="container">
		<!-- ==============================================
		CONTACT
		=============================================== -->
		<section id="contact">

		<div class="container text-center">

			<div class="row" style="margin-top: -120px;">

				<div class="col-sm-6 col-md-5 text-right scrollimation fade-up d1">

					<h1 class="big-text">Contact Message</h1>

					<p class="lead">
					<p class="contactp">기능에 대한 안내나 기술 지원이<br> 필요하신가요?</p>


					<p class="contactp">
						홈페이지를 사용하시는데<br> 궁금하신 점이나, <br> 불편 사항을 적어주세요.
					</p>
					<p class="contactp">
						문의주신 사항은 24시간 이내에<br> 순차적으로 처리됩니다.
					</p>


				</div>

				<!--=== Contact Form ===-->

				<form id="contact-form"
					class="col-sm-6 col-md-offset-1 scrollimation fade-left d3"
					action="https://script.google.com/macros/s/AKfycbzacg__M4grYGBLAtvqXFn3UiDshQARlvV9liWQ/exec"
					method="post" novalidate>

					<div class="form-group">
						<label class="control-label" for="contact-name">이름</label>
						<div class="controls">
							<input id="contact-name" name="contactName" placeholder="Name"
								class="form-control requiredField" data-new-placeholder="Name"
								type="text" data-error-empty="이름을 적어주세요."> <i
								class="fa fa-user"></i>
						</div>
					</div>
					<!-- End name input -->

					<div class="form-group">
						<label class="control-label" for="contact-mail">이메일</label>
						<div class=" controls">
							<input id="contact-mail" name="email" placeholder="Email"
								class="form-control requiredField" data-new-placeholder="Email"
								type="email" data-error-empty="이메일을 적어주세요."
								data-error-invalid="이메일 형식이 유효하지 않습니다."> <i
								class="fa fa-envelope"></i>
						</div>
					</div>
					<!-- End email input -->

					<div class="form-group">
						<label class="control-label" for="contact-message">내용</label>
						<div class="controls">
							<textarea id="contact-message" name="comments"
								placeholder="Write message" class="form-control requiredField"
								data-new-placeholder="Your message" rows="6"
								data-error-empty="메시지를 입력해주세요."></textarea>
							<i class="fa fa-comment"></i>
						</div>
					</div>
					<!-- End textarea -->

					<p>
						<button name="submit" type="submit"
							class="btn btn-color2 btn-block" data-error-message="Error!"
							data-sending-message="보내는중.." data-ok-message="전송 완료!">
							<i class="fa fa-paper-plane"></i>전송
						</button>
					</p>
					<input type="hidden" name="submitted" id="submitted" value="true" />

				</form>
				<!-- End contact-form -->

			</div>

		</div>

		</section>
	</div>

	<div id="footer">
		<%@include file="footer1.jsp"%>
	</div>

	<script>
		$(document)
				.ready(
						function() {

							/*============================================
							Page Preloader
							==============================================*/

							$(window).load(function() {
								$('#page-loader').fadeOut(500, function() {
									loadGmap();
								});

							})

							/*============================================
							Header
							==============================================*/

							$('#home').height($(window).height() + 50);

							$(window)
									.scroll(
											function() {
												var st = $(this).scrollTop(), wh = $(
														window).height(), sf = 1.2
														- st / (10 * wh);

												$('.backstretch img')
														.css(
																{
																	'transform' : 'scale('
																			+ sf
																			+ ')',
																	'-webkit-transform' : 'scale('
																			+ sf
																			+ ')'
																});

												$('#home .container')
														.css(
																{
																	'opacity' : (1.4 - st / 400)
																});

												if ($(window).scrollTop() > ($(
														window).height() + 50)) {
													$('.backstretch').hide();
												} else {
													$('.backstretch').show();
												}

											});

							var st = $(this).scrollTop(), wh = $(window)
									.height(), sf = 1.2 - st / (10 * wh);

							$('#home .container').css({
								'opacity' : (1.4 - st / 400)
							});

							/*============================================
							Navigation Functions
							==============================================*/
							if ($(window).scrollTop() < ($(window).height() - 50)) {
								$('#main-nav').removeClass('scrolled');
							} else {
								$('#main-nav').addClass('scrolled');
							}

							$(window)
									.scroll(
											function() {
												if ($(window).scrollTop() < ($(
														window).height() - 50)) {
													$('#main-nav').removeClass(
															'scrolled');
												} else {
													$('#main-nav').addClass(
															'scrolled');
												}
											});

							/*============================================
							ScrollTo Links
							==============================================*/
							$('a.scrollto').click(
									function(e) {
										$('html,body').scrollTo(this.hash,
												this.hash, {
													gap : {
														y : -70
													}
												});
										e.preventDefault();

										if ($('.navbar-collapse')
												.hasClass('in')) {
											$('.navbar-collapse').removeClass(
													'in').addClass('collapse');
										}
									});

							/*============================================
							Skills
							==============================================*/
							$('.skills-item').each(
									function() {
										var perc = $(this).find('.percent')
												.data('percent');

										$(this).data('height', perc);
									})

							$('.touch .skills-item').each(function() {
								$(this).css({
									'height' : $(this).data('height') + '%'
								});
							})

							$('.touch .skills-bars').css({
								'opacity' : 1
							});

							/*============================================
							Project thumbs - Masonry
							==============================================*/
							$(window)
									.load(
											function() {

												$('#projects-container').css({
													visibility : 'visible'
												});

												$('#projects-container')
														.masonry(
																{
																	itemSelector : '.project-item:not(.filtered)',
																	//columnWidth:370,
																	isFitWidth : true,
																	isResizable : true,
																	isAnimated : !Modernizr.csstransitions,
																	gutterWidth : 25
																});

												scrollSpyRefresh();
												waypointsRefresh();

											});

							/*============================================
							Filter Projects
							==============================================*/
							$('#filter-works a').click(function(e) {
								e.preventDefault();

								if ($('#project-preview').hasClass('open')) {
									closeProject();
								}

								$('#filter-works li').removeClass('active');
								$(this).parent('li').addClass('active');

								var category = $(this).attr('data-filter');

								$('.project-item').each(function() {
									if ($(this).is(category)) {
										$(this).removeClass('filtered');
									} else {
										$(this).addClass('filtered');
									}

									$('#projects-container').masonry('reload');
								});

								scrollSpyRefresh();
								waypointsRefresh();
							});

							/*============================================
							Project Preview
							==============================================*/
							$('.project-item')
									.click(
											function(e) {
												e.preventDefault();

												var elem = $(this), title = elem
														.find('.project-title')
														.text(), descr = elem
														.find(
																'.project-description')
														.html(), slidesHtml = '<ul class="slides">', elemDataCont = elem
														.find('.project-description');

												slides = elem.find(
														'.project-description')
														.data('images').split(
																',');

												for (var i = 0; i < slides.length; ++i) {
													slidesHtml = slidesHtml
															+ '<li><img src='+slides[i]+' alt=""></li>';
												}

												slidesHtml = slidesHtml
														+ '</ul>';

												$('#project-title').text(title);
												$('#project-content').html(
														descr);
												$('#project-slider').html(
														slidesHtml);

												openProject();

											});

							function openProject() {

								$('#project-preview').addClass('open');
								$('.masonry-wrapper').animate({
									'opacity' : 0
								}, 300);

								setTimeout(
										function() {
											$('#project-preview').slideDown();
											$('.masonry-wrapper').slideUp();

											$('html,body').scrollTo(0,
													'#filter-works', {
														gap : {
															y : -20
														},
														animation : {
															duration : 400
														}
													});

											$('#project-slider')
													.flexslider(
															{
																prevText : '<i class="fa fa-angle-left"></i>',
																nextText : '<i class="fa fa-angle-right"></i>',
																animation : 'slide',
																slideshowSpeed : 3000,
																useCSS : true,
																controlNav : true,
																pauseOnAction : false,
																pauseOnHover : true,
																smoothHeight : false,
																start : function() {
																	$(window)
																			.trigger(
																					'resize');
																	$(
																			'#project-preview')
																			.animate(
																					{
																						'opacity' : 1
																					},
																					300);
																}
															});

										}, 300);

							}

							function closeProject() {

								$('#project-preview').removeClass('open');
								$('#project-preview').animate({
									'opacity' : 0
								}, 300);

								setTimeout(function() {
									$('.masonry-wrapper').slideDown();
									$('#project-preview').slideUp();

									$('#project-slider').flexslider('destroy');
									$('.masonry-wrapper').animate({
										'opacity' : 1
									}, 300);

								}, 300);

								setTimeout(function() {
									$('#projects-container').masonry('reload');
								}, 500)
							}

							$('.close-preview').click(function() {
								closeProject();
							})

							/*============================================
							Contact Map
							==============================================*/
							function loadGmap() {

								if ($('#gmap').length) {

									var map;
									var mapstyles = [ {
										"stylers" : [ {
											"saturation" : -100
										} ]
									} ];

									var infoWindow = new google.maps.InfoWindow;

									var pointLatLng = new google.maps.LatLng(
											mapPoint.lat, mapPoint.lng);

									var mapOptions = {
										zoom : mapPoint.zoom,
										center : pointLatLng,
										zoomControl : true,
										panControl : false,
										streetViewControl : false,
										mapTypeControl : false,
										overviewMapControl : false,
										scrollwheel : false,
										styles : mapstyles
									}

									map = new google.maps.Map(document
											.getElementById("gmap"), mapOptions);

									var marker = new google.maps.Marker({
										position : pointLatLng,
										map : map,
										title : mapPoint.linkText,
										icon : mapPoint.icon
									});

									var mapLink = 'https://www.google.com/maps/preview?ll='
											+ mapPoint.lat
											+ ','
											+ mapPoint.lng
											+ '&z=14&q=' + mapPoint.mapAddress;

									var html = '<div class="infowin">'
											+ mapPoint.infoText
											+ '<a href="'+mapLink+'" target="_blank">'
											+ mapPoint.linkText + '</a>'
											+ '</div>';

									google.maps.event.addListener(marker,
											'mouseover', function() {
												infoWindow.setContent(html);
												infoWindow.open(map, marker);
											});

									google.maps.event.addListener(marker,
											'click', function() {
												window.open(mapLink, '_blank');
											});

								}
							}
							/*============================================
							Waypoints Animations
							==============================================*/
							$('#skills').waypoint(function() {

								$('.skills-item').each(function() {
									$(this).css({
										'height' : $(this).data('height') + '%'
									});
								})

								$('.skills-bars').css({
									'opacity' : 1
								});

							}, {
								offset : '40%'
							});

							$('.scrollimation').waypoint(function() {
								$(this).addClass('in');
							}, {
								offset : '90%'
							});

							/*============================================
							Resize Functions
							==============================================*/
							var thumbSize = $('.project-item').width();

							$(window).resize(function() {
								$('#home').height($(window).height() + 50);

								if ($('.project-item').width() != thumbSize) {

									$('#projects-container').masonry('reload');
									thumbSize = $('.project-item').width();
								}

								scrollSpyRefresh();
								waypointsRefresh();
							});

							/*============================================
							Refresh scrollSpy function
							==============================================*/
							function scrollSpyRefresh() {
								setTimeout(function() {
									$('body').scrollspy('refresh');
								}, 1000);
							}

							/*============================================
							Refresh waypoints function
							==============================================*/
							function waypointsRefresh() {
								setTimeout(function() {
									$.waypoints('refresh');
								}, 1000);
							}
						});

		$(document)
				.ready(
						function() {
							$('#contact-form')
									.submit(
											function() {

												var buttonCopy = $(
														'#contact-form button')
														.html(), errorMessage = $(
														'#contact-form button')
														.data('error-message'), sendingMessage = $(
														'#contact-form button')
														.data('sending-message'), okMessage = $(
														'#contact-form button')
														.data('ok-message'), hasError = false;

												$(
														'#contact-form .error-message')
														.remove();

												$('.requiredField')
														.each(
																function() {
																	if ($
																			.trim($(
																					this)
																					.val()) == '') {
																		var errorText = $(
																				this)
																				.data(
																						'error-empty');
																		$(this)
																				.parent()
																				.append(
																						'<span class="error-message" style="display:none;">'
																								+ errorText
																								+ '.</span>')
																				.find(
																						'.error-message')
																				.fadeIn(
																						'fast');
																		$(this)
																				.addClass(
																						'inputError');
																		hasError = true;
																	} else if ($(
																			this)
																			.is(
																					"input[type='email']")
																			|| $(
																					this)
																					.attr(
																							'name') === 'email') {
																		var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
																		if (!emailReg
																				.test($
																						.trim($(
																								this)
																								.val()))) {
																			var invalidEmail = $(
																					this)
																					.data(
																							'error-invalid');
																			$(
																					this)
																					.parent()
																					.append(
																							'<span class="error-message" style="display:none;">'
																									+ invalidEmail
																									+ '.</span>')
																					.find(
																							'.error-message')
																					.fadeIn(
																							'fast');
																			$(
																					this)
																					.addClass(
																							'inputError');
																			hasError = true;
																		}
																	}
																});

												if (hasError) {
													$('#contact-form button')
															.html(
																	'<i class="fa fa-times"></i>'
																			+ errorMessage);
													setTimeout(
															function() {
																$(
																		'#contact-form button')
																		.html(
																				buttonCopy);
															}, 2000);
												} else {
													$('#contact-form button')
															.html(
																	'<i class="fa fa-spinner fa-spin"></i>'
																			+ sendingMessage);

													var formInput = $(this)
															.serialize();
													$
															.post(
																	$(this)
																			.attr(
																					'action'),
																	formInput,
																	function(
																			data) {
																		$(
																				'#contact-form button')
																				.html(
																						'<i class="fa fa-check"></i>'
																								+ okMessage);

																		$('#contact-form')[0]
																				.reset();

																		setTimeout(
																				function() {
																					$(
																							'#contact-form button')
																							.html(
																									buttonCopy);
																				},
																				2000);

																	});
												}

												return false;
											});
						});
	</script>

</body>
</html>