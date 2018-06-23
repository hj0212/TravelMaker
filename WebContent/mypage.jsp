<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
*{
border: 0.1px solid red;
box-sizing: border-box;
}
#wrapper{
width:970px;
margin: 0px auto;
box-sizing: border-box;
}
#mypage{
width:970px;
height:1200px;
box-sizing: border-box;
}
#about_me{
height:300px;
box-sizing: border-box;
padding-right:0em;
/*about_me*/

background: #e9e9e7;
  box-sizing: border-box;
	font-family: var(--sinSerif);
	font-size: 1rem;
	
	padding-right: calc(var(--size) * .5);
	overflow-X: hidden;
	overflow-Y: hidden;
	hyphens: auto;
	

}
/* #profile{
width:300px;
height:300px;
float: left;
box-sizing: border-box;
margin:0px;
}
#my_content{
 width:670px; 
width:669px;
height:300px;
float:left;
box-sizing: border-box;
margin:0px;
} */

#tabs{
height:900px;
margin:0px auto;
/*tab*/
-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	background: #7fcab6;
	font-size: 62.5%;
	font-family: 'Open Sans', Arial, Helvetica, Sans-serif;

}


/*about_me*/
#about_me, #about_me:after, #about_me:before {box-sizing: inherit;}
* {margin:0;padding:0;border: 0 none; position: relative;}
:root {
	--sinSerif: -apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto", "Oxygen", "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif;
	--Nhexa: 4;
	--gap: 2vw;
	--size: calc(calc(100vw / var(--Nhexa)) - var(--gap));
}
@media only screen and (min-width: 1100px) {:root {--Nhexa: 6;}}
@media only screen and (max-width: 600px) {
	:root {--Nhexa: 2;}
	/* body {margin-right: calc(var(--size) * .3);} */
}
/* html {
	background: #e9e9e7;
  box-sizing: border-box;
	font-family: var(--sinSerif);
	font-size: 1rem;
}
body {
	padding-right: calc(var(--size) * .5);
	overflow-X: hidden;
	hyphens: auto;
} */


#about_me section {
  margin: calc(var(--size) * .5) auto 0;
  width: calc(var(--size) * calc(var(--Nhexa) - 1));
	display: grid;
	grid-template-columns: repeat(var(--Nhexa), 1fr);
	grid-gap: var(--gap);
	align-items:center;
}
#about_me article {
	background: cadetblue;
  width: var(--size); 
  height: calc(var(--size) / 1.1111111);
	clip-path: url(#hexagono);
  clip-path: polygon(25% 0, 75% 0, 100% 50%, 75% 100%, 25% 100%, 0 50%);
  margin-right: calc(var(--size) / 2);
	color: #fff;
	overflow: hidden;
}
#about_me article:nth-child(2n) {margin: calc(var(--size) * -.5) calc(var(--size) * -.25) 0 calc(var(--size) * -.75);}
#about_me article::before {
	content: '';
	float: left;
	width: 25%;
	height: 100%;
	clip-path: polygon(0% 0%, 100% 0%, 0% 50%, 100% 100%, 0% 100%);
	shape-outside: polygon(0% 0%, 100% 0%, 0% 50%, 100% 100%, 0% 100%);
}
#about_me img {
  width: var(--size);
	height: var(--size);
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	transform-origin: 0% 50%;
	transition: .75s;
	clip-path: url(#hexagono);
	clip-path: inherit;
	z-index:  10;
}
#about_me article:hover img {transform: translate(-50%, -50%) rotate(-110deg);}
#about_me h2 {font-size: 100%;}
#about_me figure {
	display: flex;
	flex-direction: column;
	flex-wrap: nowrap;
	justify-content: center;
	max-width: 50%;
	height: 100%;
	font-size: calc(9 / var(--Nhexa) * 1vw);
	line-height: 1;
	color: #fff;
	transition: .75s .05s;
  text-align: center;
}
#about_me figure p {
	font-size: 70%;
	line-height: 1.2;
	width: 100%;
}

#about_me > p {
	font-size: 1.5rem;
	margin: 2rem 0 1rem calc(var(--size) * .5);
	font-weight: 200;
}


/*tab*/
/*--------------------------
* Menu Tabular solo Con CSS
*---------------------------*/
/* html {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
} */

#tabs, 
#tabs:before, 
#tabs:after {
	margin: 0;
	padding: 0;
	-webkit-box-sizing: inherit;
	-moz-box-sizing: inherit;
	box-sizing: inherit;
}

/* body {
	background: #7fcab6;
	font-size: 62.5%;
	font-family: 'Open Sans', Arial, Helvetica, Sans-serif;
} */
#tabs a {
	color: #31a687;
	font-weight: bold;
	text-decoration: none;
}
/*--------------------------
* MENU TABS
---------------------------*/
.menu__tabs {
	list-style: none;
	overflow: hidden;
}
.menu__tabs li {
	float: left;
	margin-right: 2px;
	font-size: 1.3em;
}
.menu__tabs a {
	padding: 1em;
	background: #333b48;
	display: inline-block;
	color: #FFF;
	text-decoration: none;
	-webkit-border-radius: 4px 4px 0 0;
	-moz-border-radius: 4px 4px 0 0;
	border-radius: 4px 4px 0 0;
	-webkit-transition: all 0.3s ease;
	-o-transition: all 0.3s ease;
	transition: all 0.3s ease;
	-webkit-box-shadow: inset 0 -2px 5px rgba(0,0,0,0.2);
	-moz-box-shadow: inset 0 -2px 5px rgba(0,0,0,0.2);
	box-shadow: inset 0 -2px 5px rgba(0,0,0,0.2);
}
.menu__tabs a:hover {
	background: #515a68;
}
.menu__tabs a.active {
	color: #333b48;
	background: #FFF;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
}
.menu__tabs a.active i {color: #80cbb7;}
.menu__tabs a i {
	margin-right: 3px;
	color: #aaaaaa;
}

/*--------------------------
* MENU WRAPPER
---------------------------*/
.menu {
	margin: 55px auto;
	width: 80%;
	max-width: 600px;
	position: relative;
}
.menu__wrapper {
	padding: 2em;
	margin:0px;
	position: relative;
	z-index: 400;
	background: #FFF;
	min-height: 300px;
	-webkit-border-radius: 0 4px 4px 4px;
	-moz-border-radius: 0 4px 4px 4px;
	border-radius: 0 4px 4px 4px;
}
.menu--shadow {
	position: absolute;
	z-index: 300;
	bottom: -5px;
	height: 25px;
	width: 100%;
}
.menu--shadow:after,
.menu--shadow:before {
	content: '';
	display: block;
	width: 50%;
	height: 25px;
	position: absolute;
	left: 0;
	background: rgba(0,0,0,0.2);
	-webkit-border-radius: 25px;
	-moz-border-radius: 25px;
	border-radius: 25px;
	-webkit-box-shadow: 0 0 15px 5px rgba(0,0,0,0.25);
	-moz-box-shadow: 0 0 15px 5px rgba(0,0,0,0.25);
	box-shadow: 0 0 15px 5px rgba(0,0,0,0.25);
	-webkit-transform: scale(0.8) rotate(-4deg);
	-ms-transform: scale(0.8) rotate(-4deg);
	-o-transform: scale(0.8) rotate(-4deg);
	transform: scale(0.8) rotate(-4deg);
}
.menu--shadow:after {
	right: 0;
	left: auto;
	-webkit-transform: scale(0.8) rotate(4deg);
	-ms-transform: scale(0.8) rotate(4deg);
	-o-transform: scale(0.8) rotate(4deg);
	transform: scale(0.8) rotate(4deg);
}
.menu__wrapper .menu__item {
	line-height: 1.3;
	color: #76716f;
	display: none;
}
.menu__wrapper .menu__item.item-active {
	display: block;
}
.menu__wrapper .menu__item h3 {
	font-size: 1.8em;
	color: #333b48;
	border-bottom: 1px solid #d9d9d9;
	padding-bottom: 5px;
	margin-bottom: 12px;
}
.menu__wrapper .menu__item p {
	font-size: 1.3em;
	line-height: 1.6em;
	color: #76716f;
}

</style>

<script  src="https://code.jquery.com/jquery-3.3.1.js"></script>

</head>
<body>


<div id="wrapper">
<div id="mypage">

<div id="about_me">

  <section>
		<article>
			<figure>
				<h2>@jorgeATGU</h2>
				<p>front/design Pirineo</p>
			</figure> 
			<img alt src='https://avatars1.githubusercontent.com/u/2649175?s=400&v=4' />
		</article>
		<article>
			<figure>
			<h2>@SaraSoueidan</h2>
				<p>Freelance front-end Web developer & speaker</p>
			</figure>
			<img alt src='http://www.webdirections.org/respond16/images/speakers/speaker-sara-soueidan.jpg' />
		</article>
		<article>
			<figure>
			<h2>@Furoya</h2>
				<p>La magia del puro JS y CSS en su mínima y expresión</p>
			</figure>
			<img alt src='https://4.bp.blogspot.com/-oEYLUC8u3Jg/Ua55qLcPbtI/AAAAAAAAADc/H-X_ID0b5bo/s250-c/avatarFuroya.jpg' />
		</article>
		<article>
			<figure>
				<h2>@AmeliasBrain</h2>
				<p>Writer & Developer. SVG guru, policy nut, science nerd, & music fan</p>
			</figure>
			<img alt src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/91525/profile/profile-512.jpg?3' />
		</article>
		<article>
			<figure>
			<h2>@lpez_elena</h2>
				<p>Tan a gusto en la cama, ocho de la mañana y suena el despertador… </p>
			</figure>
			<img alt src='https://cdn-images-1.medium.com/fit/c/125/125/0*oNbktSWCpFc07xOj.jpg' />
		</article>
  </section>
<svg width="0" height="0">
  <defs>
    <clipPath id="hexagono" clipPathUnits="objectBoundingBox">
      <polygon points=".25 0, .75 0, 1 .5, .75 1, .25 1, 0 .5" />
    </clipPath>
  </defs>
</svg>

<!-- <div id="profile"></div>
<div id="my_content"></div> -->
</div>




<div id="tabs">


	<!-- Contenedor principal -->
	<div class="menu">
	

		<ul class="menu__tabs">
			<li><a class="active" href="#item-1"><i class="fa fa-star"></i> Uno</a></li>
			<li><a href="#item-2"><i class="fa fa-link"></i> Dos</a></li>
			<li><a href="#item-3"><i class="fa fa-photo"></i> Tres</a></li>
			<li><a href="#item-4"><i class="fa fa-user"></i> Cuatro</a></li>
		</ul>
		<section class="menu__wrapper">
			<article id="item-1" class="menu__item item-active">
				<h3>Contenido Uno</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis facere dolore, repellat ratione. Deserunt adipisci quisquam ipsam ut neque, ex non tempore saepe odit consequuntur iusto magni quas expedita perferendis consectetur eius nobis quae, commodi exercitationem dolorum fugit nihil quidem mollitia! Sint totam, unde, ullam <a href="">exercitationem</a> pariatur doloremque tenetur est. Eligendi rerum officia, doloremque amet iusto delectus quo consequuntur, nostrum dolor ullam quod fugiat, eveniet perferendis natus. Illum eum, quas delectus ducimus dicta! Rem, mollitia sequi repellat corporis, numquam eligendi.</p>
			</article>
			
			<article id="item-2" class="menu__item">
				<h3>Contenido Dos</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis, dignissimos nam dolor est. Ad vel eum voluptates rerum. Harum quia dolore architecto ducimus, rem porro minus perferendis ab eveniet aliquid!</p>
			</article>

			<article id="item-3" class="menu__item">
				<h3>Contenido Tres</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis, dignissimos nam dolor est. Ad vel eum voluptates rerum. Harum quia dolore architecto ducimus, rem porro minus perferendis ab eveniet aliquid!</p>
			</article>
	
			<article id="item-4" class="menu__item">
				<h3>Contenido Cuatro</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis, dignissimos nam dolor est. Ad vel eum voluptates rerum. Harum quia dolore architecto ducimus, rem porro minus perferendis ab eveniet aliquid!</p>
			</article>

		</section>
		<div class="menu--shadow"></div>
	</div>



</div>

</div>
</div>

<script>
$(function() {

	// Menu Tabular
	var $menu_tabs = $('.menu__tabs li a'); 
	$menu_tabs.on('click', function(e) {
		e.preventDefault();
		$menu_tabs.removeClass('active');
		$(this).addClass('active');

		$('.menu__item').fadeOut(300);
		$(this.hash).delay(300).fadeIn();
	});

});
</script>


</body>
</html>