<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="gallery.css" type="text/css"> -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<style>

#wrapper{
width:970px;
margin: 0;
}

#gallery-content{
width: 100%;
height:500px;
}

#gallery-wrapper {
  box-sizing: border-box;
  font-family: Roboto, sans-serif;
  -webkit-text-size-adjust: 100%;
}

.top {
  width: 100%;
  min-height: 300px;
  padding: 20px 0;
  text-align: center; }

.galleryItem {
  width: 250px;
  height: 250px;
  margin: 10px;
  border: solid 0px #fff;
  padding: 0;
  display: inline-block;
  -webkit-box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.25);
  box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.25); }

.galleryItem img {
  width: 250px;
  height: 250px; }

.caption {
  position: relative;
  display: inline-block;
  width: 250px;
  height: 250px;
  z-index: 2; }

.caption::before {
  content: attr(data-title);
  width: 250px;
  height: 0; 
  position: absolute;
  top: 0;
  left: 0;
  color: #000;
  background-color: rgba(255,255,255,0.3);
  font: bold 1.2em 'helvetica neue', helvetica, arial, sans-serif;
  overflow: hidden;
  opacity: 0;
  -webkit-transition: all 0.3s ease;
  -moz-transition: all 0.3s ease;
  -ms-transition: all 0.3s ease;
  -o-transition: all 0.3s ease;
  transition: all 0.3s ease; }

.caption::after {
  content: attr(data-description);
  width: 250px;
  height: 0;
  position: absolute;
  bottom: -0;
  left: 0;
  color: #fff;
  background-color: rgba(34,34,34,0.5);
  font-family: 'helvetica neue', helvetica, arial, sans-serif;
  overflow: hidden;
  opacity: 0;
  -webkit-transition: all 0.3s ease;
  -moz-transition: all 0.3s ease;
  -ms-transition: all 0.3s ease;
  -o-transition: all 0.3s ease;
  transition: all 0.3s ease; }

.caption:hover::before {
  opacity: 1;
  height: 25px; }

.caption:hover::after {
  opacity: 1;
  bottom: 0;
  height: 65px; }

/* lightbox */

.lightbox {
  display: none;
  position: fixed;
  z-index: 3;
  width: 100%;
  height: 100%;
  text-align: center;
  top: 0;
  left: 0;
  background: rgba(0,0,0,0.85);
}

.lightbox a { 
  color: #fff;
  text-decoration: none; 
}

.lightbox img {
  max-height: 85%;
  max-width: 85%;
}

.lightbox:target {
  display: table;
}

.lightbox .image {
  display: table-cell;
  vertical-align: middle; }

.lightbox .image img {
  -webkit-box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.25);
  box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.25); }

.next, .prev, .close { display: block; position: fixed; }

.close { width: 5000px; height: 5000px; overflow: hidden; top: 0; left: 0; z-index: 5; cursor: default; }

.next, .prev { width: 100px; height: 25px; top: 50%; z-index: 10; opacity: 0.7; font-size: 2em; line-height: 25px; text-shadow: 0px 0px 15px rgba(0, 0, 0, 1); }

.prev { left: 10px; text-align: left; }

.prev::after { content: '\2039'; }
	
.next { right: 10px; text-align: right; }

.next::before { content: '\203A'; }

</style>
</head>
<body>
<div id="wrapper">
<div id="gallery-content"></div>
<div id="gallery-wrapper">
<section class="products gallery">
 <ul class="top">
  <li class="galleryItem">
    <a class="caption" href="#1" data-title="colored landscape" data-description="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id sapien condimentum, sagittis erat rhoncus, bibendum nisi.">
      <img src="http://media.digitalcameraworld.com/files/2012/10/Vertorama_landscape_photography_tips_PHO17.insight02and03.vertorama.jpg" alt="Landscape image">
    </a>
  </li>
  <li class="galleryItem">
    <a class="caption" href="#2" data-title="black &amp; white photo" data-description="Vivamus ut sem id magna consequat porta vitae ut sem. Proin eget commodo risus, vitae blandit velit. ">
      <img src="http://media.digitalcameraworld.com/files/2012/11/Black_and_white_landscape_photography_DCM131.shoot_creative.main_image_RGB.jpg" alt="Landscape image">
    </a>
  </li>
  <li class="galleryItem">
    <a class="caption" href="#3" data-title="colored landscape" data-description="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id sapien condimentum, sagittis erat rhoncus, bibendum nisi.">
      <img src="http://media.digitalcameraworld.com/files/2012/10/Vertorama_landscape_photography_tips_PHO17.insight02and03.vertorama.jpg" alt="Landscape image">
    </a>
  </li>
  <li class="galleryItem">
    <a class="caption" href="#4" data-title="colored landscape" data-description="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id sapien condimentum, sagittis erat rhoncus, bibendum nisi.">
      <img src="http://media.digitalcameraworld.com/files/2012/10/Vertorama_landscape_photography_tips_PHO17.insight02and03.vertorama.jpg" alt="Landscape image">
    </a>
  </li>
  <li class="galleryItem">
    <a class="caption" href="#5" data-title="colored landscape" data-description="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id sapien condimentum, sagittis erat rhoncus, bibendum nisi.">
      <img src="http://media.digitalcameraworld.com/files/2012/10/Vertorama_landscape_photography_tips_PHO17.insight02and03.vertorama.jpg" alt="Landscape image">
    </a>
  </li>
  <li class="galleryItem">
    <a class="caption" href="#6" data-title="target" data-description="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id sapien condimentum, sagittis erat rhoncus, bibendum nisi.">
      <img src="http://i.kinja-img.com/gawker-media/image/upload/s--v1mMDXQY--/c_fit,fl_progressive,q_80,w_636/otveb9dlpcz16you6de9.jpg" alt="Landscape image">
    </a>
  </li>
</ul>
    
<!-- lightbox -->

<div class="lightbox" id="1">
   <div class="image">
       <img src="http://media.digitalcameraworld.com/files/2012/10/Vertorama_landscape_photography_tips_PHO17.insight02and03.vertorama.jpg">
          <a href="#6" class="prev"></a>
          <a href="#" class="close"></a>
          <a href="#2" class="next"></a>
   </div>
</div>
<div class="lightbox" id="2">
    <div class="image">
         <img src="http://media.digitalcameraworld.com/files/2012/11/Black_and_white_landscape_photography_DCM131.shoot_creative.main_image_RGB.jpg">
             <a href="#1" class="prev"></a>
             <a href="#" class="close"></a>
             <a href="#3" class="next"></a>
        </div>
    </div>
	<div class="lightbox" id="3">
    	<div class="image">
            <img src="http://media.digitalcameraworld.com/files/2012/10/Vertorama_landscape_photography_tips_PHO17.insight02and03.vertorama.jpg">
                <a href="#2" class="prev"></a>
                <a href="#" class="close"></a>
                <a href="#4" class="next"></a>
       </div>
   </div>
	<div class="lightbox" id="4">
    	<div class="image">
            <img src="http://media.digitalcameraworld.com/files/2012/10/Vertorama_landscape_photography_tips_PHO17.insight02and03.vertorama.jpg">
                <a href="#3" class="prev"></a>
                <a href="#" class="close"></a>
                <a href="#5" class="next"></a>
       </div>
   </div>
	<div class="lightbox" id="5">
    	<div class="image">
            <img src="http://media.digitalcameraworld.com/files/2012/10/Vertorama_landscape_photography_tips_PHO17.insight02and03.vertorama.jpg">
                <a href="#4" class="prev"></a>
                <a href="#" class="close"></a>
                <a href="#6" class="next"></a>
       </div>
   </div>
	<div class="lightbox" id="6">
    	<div class="image">
            <img src="http://i.kinja-img.com/gawker-media/image/upload/s--v1mMDXQY--/c_fit,fl_progressive,q_80,w_636/otveb9dlpcz16you6de9.jpg">
                <a href="#5" class="prev"></a>
                <a href="#" class="close"></a>
                <a href="#1" class="next"></a>
       </div>
   </div>
</section>
</div>
</div>

<script>

$('.btn-gallery').on('click', function() {
	  $('.products').removeClass('list').addClass('gallery');
	  $('.btn-list').removeClass('active');
	  $(this).addClass('active');
	});

	$('.btn-list').on('click', function() {
	  $('.products').removeClass('gallery').addClass('list');
	  $('.btn-gallery').removeClass('active');
	  $(this).addClass('active');
	});

</script>




</body>
</html>