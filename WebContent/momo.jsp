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
        <h5 class="modal-title" id="exampleModalLabel" style="font-weight:650">�Խñ� �Ű��ϱ�</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">��</span>
        </button>
      </div>
      <div class="modal-body">
        <p>&#60; ��������&#62;<br>
     ���� ������ �ش�Ǵ� ���, ��ǥ���� ���� 1���� ������ �ּ���.</p>
        
        <div class="radio">
        <label class="radio-inline"><input type="radio" name="optradio">  Ÿ���� ���������� ħ���ϴ� �Խñ�</label><br>
<label class="radio-inline"><input type="radio" name="optradio">  �������� ȫ�� �Խñ�</label><br>
<label class="radio-inline"><input type="radio" name="optradio">  ���� ������ ���� �ʴ� �Խñ�, �峭�� �Խñ�</label><br>
<label class="radio-inline"><input type="radio" name="optradio">  ������ �Ǵ� û�ҳ⿡�� �������� ����</label><br>
        </div>
      </div>
      <div class="modal-footer">
      <button type="button" class="btn btn-primary">�Ű��ϱ�</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">���</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>