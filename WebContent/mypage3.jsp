<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 *, *:after, *:before {box-sizing: inherit;}
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
	body {margin-right: calc(var(--size) * .3);}
}
html {
	background: #e9e9e7;
  box-sizing: border-box;
	font-family: var(--sinSerif);
	font-size: 1rem;
}
body {
	padding-right: calc(var(--size) * .5);
	overflow-X: hidden;
	hyphens: auto;
}
section {
  margin: calc(var(--size) * .5) auto 0;
  width: calc(var(--size) * calc(var(--Nhexa) - 1));
	display: grid;
	grid-template-columns: repeat(var(--Nhexa), 1fr);
	grid-gap: var(--gap);
}
article {
	background: cadetblue;
  width: var(--size); 
  height: calc(var(--size) / 1.1111111);
	clip-path: url(#hexagono);
  clip-path: polygon(25% 0, 75% 0, 100% 50%, 75% 100%, 25% 100%, 0 50%);
  margin-right: calc(var(--size) / 2);
	color: #fff;
	overflow: hidden;
}
article:nth-child(2n) {margin: calc(var(--size) * -.5) calc(var(--size) * -.25) 0 calc(var(--size) * -.75);}
article::before {
	content: '';
	float: left;
	width: 25%;
	height: 100%;
	clip-path: polygon(0% 0%, 100% 0%, 0% 50%, 100% 100%, 0% 100%);
	shape-outside: polygon(0% 0%, 100% 0%, 0% 50%, 100% 100%, 0% 100%);
}
img {
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
article:hover img {transform: translate(-50%, -50%) rotate(-110deg);}
h2 {font-size: 100%;}
figure {
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
figure p {
	font-size: 70%;
	line-height: 1.2;
	width: 100%;
}
h1 {
	width: 100vw;
	background: #FF0066;
	position: sticky;
	top: 0;
	z-index: 1;
	margin-bottom: calc(var(--size) * .55 + var(--gap));
	padding: 2vh 0;
	text-align: center;
	font-weight: 400;
	color: #fff;
}
body > p {
	font-size: 1.5rem;
	margin: 2rem 0 1rem calc(var(--size) * .5);
	font-weight: 200;
}
</style>

<script  src="https://code.jquery.com/jquery-3.3.1.js"></script>

</head>
<body>

	<h1>Auto Hexagonal CSS Grid Layout</h1>
  <section>
		<article>
			<figure>
				<h2>@Xavisu</h2>
				<p>Hola, vengo a flotar. Front~end</p>
			</figure>
			<img alt src='https://kaleidos.net/media/filer_public_thumbnails/filer_public/91/7c/917ca0ca-f069-455e-b25f-154db357d09a/xaviju2.jpg__300x300_q85_crop_subject_location-3257%2C1894_subsampling-2_upscale.jpg' />
		</article>
		<article>
			<figure>
			<h2>@Kseso</h2>
				<p>Enredique Amanuense de CSS</p>
			</figure>
			<img alt src='https://1.bp.blogspot.com/-8xv4oUIGGdo/WR3XHvAb5hI/AAAAAAAANjo/Pi2TSd9llSQBvuIgWWe4RY8l9msbOgcbgCK4B/s250-c/hrRtW6LJ.jpg' />
		</article>
		<article>
			<figure>
				<h2>@abelsutilo</h2>
			<p>Diseño Productos Digitales. Formador en #UX #U</p>
			</figure>
			<img alt src='http://abelsutilo.com/wp-content/uploads/2009/01/10850250_10152894635423684_7160074995457018570_n.jpg.pagespeed.ce.tgatamlOAJ.jpg' />
		</article>
		<article>
			<figure>
				<h2>@Olgacarreras</h2>
			<p>Consultora freelance. Accesibilidad web y PDF</p>
			</figure>
			<img alt src='https://www.usableyaccesible.com/images/olga_carreras_montoto.jpg' />
		</article>
		<article>
			<figure>
				<h2>@cristinafsanz<h2>
					<p>Front-end developer in learning mode</p>
			</figure>
			<img alt src='https://cristinafsanz.github.io/images/avatar.png' />
		</article>
		<article>
			<figure>
				<h2>@lau_es</h2>
				<p>#OpenSource rocks! Making awesome things</p>
			</figure>
			<img alt src='https://www.gravatar.com/avatar/73f55f92af57327a909da02fd88ac4d0?d=404&s=250' />
		</article>
		<article>
			<figure>
				<h2>@yoksel_en</h2>
				<p>CSS and SVG lover : ) In Russian</p>
			</figure>
			<img alt src='https://avatars3.githubusercontent.com/u/2571308?s=400&v=4' />
		</article>
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
			
			<p>
				<code><b>--Nhexa</b></code>: conviene que sea un valor par <code>(2n)</code> por usar el selector <code>:nth-child(2n)</code> para crear el panal y desplazar los hexágonos.</p>
			<p><b>Please</b>, show the pen & link the post: <a href='https://escss.blogspot.com/2017/04/auto-hexagonal-css-grid-layout.html'>The post in my blog: now with 2 versions</a>. Thanks</p>
			

			
<svg width="0" height="0">
  <defs>
    <clipPath id="hexagono" clipPathUnits="objectBoundingBox">
      <polygon points=".25 0, .75 0, 1 .5, .75 1, .25 1, 0 .5" />
    </clipPath>
  </defs>
</svg>

</body>
</html>