<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.modal.fade .modal-dialog.modal-dialog-zoom {-webkit-transform: translate(0,0)scale(.5);transform: translate(0,0)scale(.5);}
.modal.show .modal-dialog.modal-dialog-zoom {-webkit-transform: translate(0,0)scale(1);transform: translate(0,0)scale(1);}
</style>

</head>
<body>

<div class="container">
    <div class="row text-center">
        <div class="col">
            <h1>Modal zoom from center</h1>
            <p>First two examples already available in Bootstrap V4. It's super simple and just add class and it will convert as super side out the panel. Yes, It's Responsive. :)</p>
            <p>To view more samples Visit <a href="https://bootsnipp.com/pradeep330">Here</a></a></p>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal2">
                Launch demo modal zoom small
            </button>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal3">
                Launch demo modal zoom normal
            </button>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal4">
                Launch demo modal zoom large
            </button>
        </div>
    </div>
</div>



<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-zoom modal-md" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style="font-weight:650">게시글 신고하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
        <p>&#60; 사유선택&#62;<br>
     여러 사유에 해당되는 경우, 대표적인 사유 1개를 선택해 주세요.</p>
        
        <div class="radio">
        <label class="radio-inline"><input type="radio" name="optradio">  타인의 지적재산권을 침해하는 게시글</label><br>
<label class="radio-inline"><input type="radio" name="optradio">  부적절한 홍보 게시글</label><br>
<label class="radio-inline"><input type="radio" name="optradio">  서비스 취지에 맞지 않는 게시글, 장난성 게시글</label><br>
<label class="radio-inline"><input type="radio" name="optradio">  음란성 또는 청소년에게 부적합한 내용</label><br>
        </div>
      </div>
      <div class="modal-footer">
      <button type="button" class="btn btn-primary">신고하기</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>