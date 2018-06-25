<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mypage</title>
<!--  jquery cdn-->
<script
  src="https://code.jquery.com/jquery-3.3.1.js"></script>
<!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
<style>
*{
border:1px solid red;
}
#mypage{
width:970px;
height:1200px;
margin: 0 auto;
box-sizing: border-box;
}
#about_me{
width:100%;
height:30%;
box-sizing: border-box;
}
#profile{
width:40%;
height:100%;
box-sizing: border-box;
float:left;
}
#my_content{
width:60%;
height:100%;
box-sizing: border-box;
float:left;
}
#my_article_count,#my_scrap_count,#my_like_count{
width:33%;
height:100%;
float:left;
box-sizing: border-box;
margin: 0 auto;
}
#tab_content{
width:100%;
height:70%;
box-sizing: border-box;
}
.row{
width:100%;
height:100%;
margin:0px;
box-sizing: border-box;
}
.card{
width:100%;
height:100%;
margin:0px;
box-sizing: border-box;
}
.card-content{
width:100%;
height:40%;
margin:0px;
box-sizing: border-box;
}
.circle{
width:100px;
height:100px;
margin:0 auto;
border-radius: 50%;
overflow:hidden;
}
.circle > img{
width:100%;
height:100%;
}
.card-action{
width:100%;
height:60%;
padding: 0px;
top: 3px;
}
.p{
width:100%;
height:100%;
margin:20px 0px;
padding: 0px;
text-align:center;
border-radius: 20%;
}
.card-panel{
margin: 100px 0px;
height:100px;
}

/*tab*/

@import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400&subset=latin,latin-ext);

body {
    overflow-y: scroll;
  
}
.wrap {
  marin: 0 auto;
}
ul.tabs {
	width: 100%;
	height: 80%;
	margin: 0 auto;
	list-style: none;
	overflow: hidden;
  padding: 0;
}
ul.tabs li {	
	float: left;
	width: 130px;

  
}
ul.tabs li a {
	position: relative;
	display: block;
	height: 10%;
	margin-top: 40px;
	padding: 10px 0 0 0;
	font-family: 'Open Sans', sans-serif;
	font-size: 18px;
	text-align: center;	
	text-decoration: none;
	color: #ffffff;
	background: #6edeef;
	-webkit-box-shadow: 8px 12px 25px 2px rgba(0,0,0,0.4);
	   -moz-box-shadow: 8px 12px 25px 2px rgba(0,0,0,0.4);
	        box-shadow: 8px 12px 25px 2px rgba(0,0,0,0.4);
	        	border: 0px solid #000000;
	-webkit-transition: padding 0.2s ease, margin 0.2s ease;
       -moz-transition: padding 0.2s ease, margin 0.2s ease;
         -o-transition: padding 0.2s ease, margin 0.2s ease;
        -ms-transition: padding 0.2s ease, margin 0.2s ease;
            transition: padding 0.2s ease, margin 0.2s ease;
}
.tabs li:first-child a {
	z-index: 3;
  -webkit-border-top-left-radius: 8px;
-moz-border-radius-topleft: 8px;
border-top-left-radius: 8px;
}
.tabs li:nth-child(2) a {
	z-index: 2;
}
.tabs li:last-child a {
	z-index: 1;
  -webkit-box-shadow: 2px 8px 25px -2px rgba(0,0,0,0.3);
	   -moz-box-shadow: 2px 8px 25px -2px rgba(0,0,0,0.3);
	        box-shadow: 2px 8px 25px -2px rgba(0,0,0,0.3);
  -webkit-border-top-right-radius: 8px;
-moz-border-radius-topright: 8px;
border-top-right-radius: 8px;
}
ul.tabs li a:hover {
	margin: 35px 0 0 0;
	padding: 10px 0 5px 0;
}
ul.tabs li a.active {
	margin: 30px 0 0 0;
	padding: 10px 0 10px 0;
	background: #545f60;
	color: #6edeef;
	/*color: #ff6831;*/
	z-index: 4;
	outline: none;
}
.group:before,
.group:after {
    content: " "; /* 1 */
    display: table; /* 2 */
}
.group:after {
    clear: both;
}
#content {
  width: 100%;
  height: 70%;
  margin: 0 auto;
  background: #545f60;
-webkit-box-shadow: 2px 8px 25px -2px rgba(0,0,0,0.3);
   	   -moz-box-shadow: 2px 8px 25px -2px rgba(0,0,0,0.3);
   	        box-shadow: 2px 8px 25px -2px rgba(0,0,0,0.3);
  -webkit-border-bottom-right-radius: 8px;
-webkit-border-bottom-left-radius: 8px;
-moz-border-radius-bottomright: 8px;
-moz-border-radius-bottomleft: 8px;
border-bottom-right-radius: 8px;
border-bottom-left-radius: 8px;
}
.p{
  font-family: 'Open Sans', sans-serif;
  padding: 30px 40px;
  color: #ffffff;
  line-height: 26px;
  font-size: 18px;
  margin: 0;
}
#one {
  
}
#two {
  
}
#three {
  
}

</style>
</head>
<body>
<div id="wrapper">
<div id="mypage">
<div id="about_me">
<div id="profile">

  <div class="row">    
      <div class="card light-blue">
        <div class="card-content white-text">
        <div class="circle">          
          <img alt="" src="Charlie-Chaplin-PNG-Image-17681.png">
          </div>
        </div>
        <div class="card-action">
        <div><p class="p">ID</p></div>
        <div><p class="p">email</p></div>     
        </div>
      </div>

  </div>

</div>
<div id="my_content">
<div id="my_article_count"><div class="col s12 m2 blue z-depth-5 card-panel">z-depth-5</div></div>
<div id="my_scrap_count"><div class="col s12 m2 blue z-depth-5 card-panel">z-depth-5</div></div>
<div id="my_like_count"><div class="col s12 m2 blue z-depth-5 card-panel">z-depth-5</div></div>
</div>
</div>
<div id="tab_content">
 <div class="wrap">
  
  <ul class="tabs group">
    <li><a class="active" href="#/one">Light &</a></li>
    <li><a href="#/two">Sexy</a></li>
    <li><a href="#/three">Tabs</a></li>
  </ul>
  
  <div id="content" >
    <!-- <p id="one">Some text about Light sit amet, consectetur adipisicing elit. Pariatur modi quod quo iure recusandae eligendi q.t, consectetur adipisicing elit. Pariatur </p> 
    <p id="two">Sexy sexy  consectetur adipisicing elit. Pariatur modi quod quo iure recusandae eligendi q.t, consectetur adipisicing elit. Pariatur modi quod quo iureq</p>
    <p id="three">Tabs , consectetur adipisicing elit. Pariatur modi quod quo iure recusandae eligendi q.t, consectetur adipisicing elit. Pariatur modi quod quo iureq</p>
    -->
    <div id="one" class="arti">
    <div class="row" >
    <div class="col s12 m6">
      <div class="card">
        <div class="card-image">
          <img src="Charlie-Chaplin-PNG-Image-17681.png">
          <span class="card-title">Card Title</span>
          <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">add</i></a>
        </div>
        <div class="card-content">
          <p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
        </div>
      </div>
    </div>
  </div>
</div>
    
    <div id="two" class="arti">
    <div class="row" >
    <div class="col s12 m6">
      <div class="card">
        <div class="card-image">
          <img src="Charlie-Chaplin-PNG-Image-17681.png">
          <span class="card-title">Card Title</span>
          <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">add</i></a>
        </div>
        <div class="card-content">
          <p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
        </div>
      </div>
    </div>
  </div>
</div>

<div id="three" class="arti">
    <div class="row" >
    <div class="col s12 m6">
      <div class="card">
        <div class="card-image">
          <img src="Charlie-Chaplin-PNG-Image-17681.png">
          <span class="card-title">Card Title</span>
          <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">add</i></a>
        </div>
        <div class="card-content">
          <p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
        </div>
      </div>
    </div>
  </div>
  
      <div class="row" >
    <div class="col s12 m6">
      <div class="card">
        <div class="card-image">
          <img src="Charlie-Chaplin-PNG-Image-17681.png">
          <span class="card-title">Card Title</span>
          <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">add</i></a>
        </div>
        <div class="card-content">
          <p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
        </div>
      </div>
    </div>
  </div>
  
      <div class="row" >
    <div class="col s12 m6">
      <div class="card">
        <div class="card-image">
          <img src="Charlie-Chaplin-PNG-Image-17681.png">
          <span class="card-title">Card Title</span>
          <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">add</i></a>
        </div>
        <div class="card-content">
          <p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
        </div>
      </div>
    </div>
  </div>
</div>

  </div>
  
</div>
</div>
</div>
</div>

<script>
 $("#two").hide();
$("#three").hide(); 
(function($) {
	var tabs =  $(".tabs li a");
  
	tabs.click(function() {
		var content = this.hash.replace('/','');
		tabs.removeClass("active");
		$(this).addClass("active");
    $("#content").find('.arti').hide();
    $(content).fadeIn(200);
	});

})(jQuery);
</script>
</body>
</html>