<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
  <link rel="stylesheet" href="source/css/mypage.css" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  
  <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
	integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>
	
 <style>
 body{
 width:970px;
 margin : 0 auto;
 }
#searchwrap{
padding:0;
}
 </style>
</head>
<body>
<div id="wrapper" class="row mt-5">
<div id="searchwrap" class="col-md-12 col-sm-12 ml-3"><input type="text" id="search" name="search" placeholder="검색어름 입력하세요" class="col-md-8">
<button type="button" class="btn btn-outline-success btn-md"><i class="fas fa-search"></i></button>
</div>
<div class="mt-5">
     <div class="row">
            <div class="item col-md-3 col-sm-3 w-25">
					<div class="card">
                <div class="card-header">
                  <h4 >Card title</h4></div>
                <div class="card-body">
               <!--  <a href="#" class="badge badge-primary">후기</a>
           		<a href="#" class="badge badge-success">조회수</a> -->
                  <h6 class="text-muted d-inline">Subtitle</h6>
                <div class="btn-list w-30 ml-1 d-inline">
           		<button type="button" class="btn-review btn-outline-primary btn-sm "><i class="fas fa-pencil-alt"></i></button>
           		<button type="button" class="btn-view btn-outline-success btn-sm " ><i class="far fa-caret-square-right"></i></button>
           		<button type="button" class="btn-like btn-outline-danger btn-sm"><i class="far fa-heart"></i></button>
           		</div>
         <hr>
           		
                  <p>Some quick example text to build on the card title .</p>
                </div>
              </div>
				</div>
				<div class="item col-md-3 col-sm-3 w-25">
					<div class="card">
                <div class="card-header"> Header </div>
                <div class="card-body">
                  <h4 >Card title</h4>
                  <h6 class="text-muted">Subtitle</h6>
                  <p>Some quick example text to build on the card title .</p>
                </div>
              </div>
				</div>
				<div class="item col-md-3 col-sm-3 w-25">
					<div class="card">
                <div class="card-header"> Header </div>
                <div class="card-body">
                  <h4 >Card title</h4>
                  <h6 class="text-muted">Subtitle</h6>
                  <p>Some quick example text to build on the card title .</p>
                </div>
              </div>
				</div>
				<div class="item col-md-3 col-sm-3 w-25">
					<div class="card">
                <div class="card-header"> Header </div>
                <div class="card-body">
                  <h4 >Card title</h4>
                  <h6 class="text-muted">Subtitle</h6>
                  <p>Some quick example text to build on the card title .</p>
                </div>
              </div>
				</div>
				</div>
</div>
</div>
<script>
$('.btn-review').click(function(){
	location.href="#"
})
$('.btn-view').mouseover(function(){
	$('.btn-view').html('<span class="btn-viewtext style="font-size:8px;"">123</span>');
})
$('.btn-view').mouseleave(function(){
	$('.btn-view').html('<i class="far fa-caret-square-right"></i>');
	
})
$('.btn-like').click(function(){
	$('.btn-like').html('<i class="fas fa-heart"></i>');
})
</script>
</body>
</html>