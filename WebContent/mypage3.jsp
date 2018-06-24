<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="mypage.css" type="text/css">
  <style>
 #wrapper{
 width:970px;
 margin:0px auto;
 }
 
 
 
// Options
// 
// Quickly modify global styling by enabling or disabling optional features.
  
$enable-rounded:            true !default;
$enable-shadows:            true;
$enable-transitions:        true;
$enable-hover-media-query:  false;
$enable-grid-classes:       true;
$enable-print-styles:       true;

// Variables
//
// Colors

$theme-colors: (
  primary: #f2f6fc,
  secondary: #4f70ce,
  light: #f3f3f3,
  dark: #151515,
  info: #ccc,
  success: #28a745,
  warning: #ffc107,
  danger: #dc3545
);

$body-bg: white;
$body-color: #333;


$body-color-inverse: invert($body-color) !default;
$link-color: #f2f6fc;


// Fonts
$font-family-base: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
$headings-font-family: $font-family-base;
$display-font-family: $font-family-base;
$font-weight-normal: 200;
$headings-font-weight: 200;
$lead-font-size:   1.30rem;



$border-radius: 1rem;
$border-radius-lg: $border-radius * 1.2;
$border-radius-sm: $border-radius * .8;

$spacer: 1.5rem;
@import 'bootstrap-4.0.0';

 
html,body {
   height:100%;
}

.cover {
	min-height:100%;
  display:flex;
  align-items:center
}


.bg-gradient {
  overflow: hidden;
  color: color-yiq(map-get($theme-colors, 'primary'));
  background: linear-gradient(-30deg, theme-color("secondary") 0%, theme-color("primary") 50%, theme-color("primary") 100%);
}

.filter-dark {
  overflow: hidden;
  position: relative;
  color: color-yiq(map-get($theme-colors, 'dark'));
	&:before {
    position: absolute;
    top:0px;
    left:0px;
    width:100%;
    height: 100%;
    content: ' ';
    background: rgba(map-get($theme-colors, 'dark'), 0.75);
  }
}

.filter-light {
  overflow: hidden;
  position: relative;
  color: color-yiq(map-get($theme-colors, 'light'));
	&:before {
    position: absolute;
    top:0px;
    left:0px;
    width:100%;
    height: 100%;
    content: ' ';
    background: rgba(map-get($theme-colors, 'light'),0.75);
  }
}

.filter-color {
  overflow: hidden;
  position: relative;
  color: color-yiq(map-get($theme-colors, 'primary'));
	&:before {
    position: absolute;
    top:0px;
    left:0px;
    width:100%;
    height: 100%;
    content: ' ';
    background: rgba(map-get($theme-colors, 'primary'), 0.75);
  }
}

.filter-gradient {
  overflow: hidden;
  position: relative;
  color: color-yiq(map-get($theme-colors, 'primary'));
	&:before {
    position: absolute;
    top:0px;
    left:0px;
    width:100%;
    height: 100%;
    content: ' ';
    background: linear-gradient(-30deg, transparentize(theme-color("secondary"), 0.1) 0%, transparentize(theme-color("primary"), 0.1) 50%, transparentize(theme-color("primary"), 0.05) 100%);
  }
}

.filter-fade-in {
  overflow: hidden;
  position: relative;
  &:before {
    position: absolute;
    top:0px;
    left:0px;
    width:100%;
    height: 100%;
    content: ' ';
    background: linear-gradient($body-bg, transparentize($body-bg, 0.2),transparentize($body-bg, 0.9),transparentize($body-bg, 1));
	}
}


  @import url(https://fonts.googleapis.com/css?family=Open+Sans);
    td,
    td::before,
    td::after {
      box-sizing: border-box;
    }

   td {
      background: #FDFDFD;
      margin: 25px 0;
    }
    .basicBox {
      width: 130px;
      height: 65px;
      margin: 15px auto;
      color: #4274D3;
      font-family: 'Open Sans', sans-serif;
      font-size: 1.15rem;
      line-height: 65px;
      text-transform: uppercase;
      text-align: center;
      position: relative;
      cursor: pointer;
    }

    .basicBox svg {
      position: absolute;
      top: 0;
      left: 0;
    }

   .basicBox svg rect {
      fill: none;
      stroke: #4274D3;
      stroke-width: 1;
    }

    .basicBox:hover svg rect {
      stroke: #4274D3;
    }
    /* Basic Box */

   .basicBox svg rect {
      stroke-dasharray: 400, 0;
      -webkit-transition: all 0.8s ease-in-out;
      -moz-transition: all 0.8s ease-in-out;
      -ms-transition: all 0.8s ease-in-out;
      -o-transition: all 0.8s ease-in-out;
    }

    .basicBox:hover svg rect {
      stroke-width: 3;
      stroke-dasharray: 35, 245;
      stroke-dashoffset: 38;
      -webkit-transition: all 0.8s ease-in-out;
      -moz-transition: all 0.8s ease-in-out;
      -ms-transition: all 0.8s ease-in-out;
      -o-transition: all 0.8s ease-in-out;
    }
  </style>
</head>

<body>

<div id="wrapper">
  <div class="py-5 text-center w-100 h-75 text-lowercase text-primary">
    <div class="container w-100 h-100 py-0">
      <div class="row">
        <div class="col-sm-12 col-md-6 col-12 col-lg-3">
          <div class="card w-100 h-100">
            <img class="card-img-top float-left rounded-circle" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" alt="Card image cap">
            <div class="card-body h-100 py-4 my-5">
              <h4 class="card-title my-4">아이디</h4>
              <h4 class="my-4">아이디@naver.com</h4>
            </div>
          </div>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-9 col-12 col-xl-9 w-100 h-100 align-items-center">
          <div id="tb" class="py-5 my-5">
            <table class="table col-mt-5 col-md-5 col-sm-12 text-center">
              <thead>
                <tr>
                  <th scope="col" class="text-center">게시글</th>
                  <th scope="col" class="text-center">스크랩</th>
                  <th scope="col" class="text-center" >좋아요</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>
                    <div class="basicBox"> num1
                      <svg width="130" height="65" viewBox="0 0 130 65" xmlns="http://www.w3.org/2000/svg">
                        <rect x="0" y="0" fill="none" width="130" height="65"></rect>
                      </svg>
                    </div>
                  </td>
                  <td>
                    <div class="basicBox"> num2
                      <svg width="130" height="65" viewBox="0 0 130 65" xmlns="http://www.w3.org/2000/svg">
                        <rect x="0" y="0" fill="none" width="130" height="65"></rect>
                      </svg>
                    </div>
                  </td>
                  <td>
                    <div class="basicBox"> num3
                      <svg width="130" height="65" viewBox="0 0 130 65" xmlns="http://www.w3.org/2000/svg">
                        <rect x="0" y="0" fill="none" width="130" height="65"></rect>
                      </svg>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-12 w-100 h-100">
          <ul class="nav nav-tabs">
            <li class="nav-item">
              <a href="" class="active nav-link" data-toggle="tab" data-target="#tabone">Tab 1</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="" data-toggle="tab" data-target="#tabtwo">Tab 2</a>
            </li>
            <li class="nav-item">
              <a href="" class="nav-link active" data-toggle="tab" data-target="#tabthree">Tab 3</a>
            </li>
          </ul>
          <div class="tab-content mt-2">
            <div class="tab-pane fade show active align-items-start row-md-3 d-inline-flex bg-primary border border-info" id="tabone" role="tabpanel">
              <div class="card col-md-3 col-sm-12 w-100">
                <img class="card-img-top float-left rounded" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" alt="Card image cap">
                <div class="card-body w-100">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
              </div>
              <div class="card col-md-3 col-sm-12 w-100">
                <img class="card-img-top float-left rounded" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" alt="Card image cap">
                <div class="card-body w-100">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
              </div>
              <div class="card col-md-3 col-sm-12 w-100">
                <img class="card-img-top float-left rounded" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" alt="Card image cap">
                <div class="card-body w-100">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
              </div>
              <div class="card col-md-3 col-sm-12 w-100">
                <img class="card-img-top float-left rounded" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" alt="Card image cap">
                <div class="card-body w-100">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>
  <!-- 합쳐지고 최소화된 최신 CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/source/lib/bootstrap-3.3.2-dist/css/bootstrap.min.css">
  <!-- 부가적인 테마 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/source/lib/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/source/lib/bootstrap-3.3.2-dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>

</html>