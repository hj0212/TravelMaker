<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="source/css/mypage.css" type="text/css">
  
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
 
</head>

<body>
<c:choose>
		<c:when test="${sessionScope.loginId != null}">
			<%@include file="include/mainNavi_login.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="include/mainNavi.jsp"%>
		</c:otherwise>
	</c:choose>
  <div class="py-5 text-center w-100 h-75 text-lowercase text-primary no-padding-bottom mt-5">
    <div class="container w-100 h-100 py-0">
      <div class="row">
        <div class="col-sm-8 col-md-3 col-lg-3">
          <div class="card w-100 h-100">
            <img class="card-img-top float-left rounded-circle mt-5" src="Charlie-Chaplin-PNG-Image-17681.png" alt="Card image cap">
            <div class="card-body h-100 py-4 my-5">
              <h4 class="card-title my-4">${nickname}</h4>
              <c:choose>
              <c:when test="${email eq null}">
              <h4 class="my-4">이메일을 입력해주세요</h4>
              </c:when>
              <c:otherwise>
               <h4 class="my-4">${email}</h4>
              </c:otherwise>
              </c:choose>
  		<a href="#" class="btn dropdown-toggle" id="editlink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">정보수정</a>
  		<div class="dropdown mt-5 z-index:3" aria-labelledby="editlink">
  		<c:choose>
  		<c:when test="${sessionScope.part eq 'home'}">
  		<a class="dropdown-item " href="#" id="editInfo">회원정보</a>
  		<a class="dropdown-item" href="#" id="editPw">비밀번호</a>
  		<a class="dropdown-item" href="#" id="updateEmail">이메일</a>
  		</c:when>
  		<c:otherwise>
  		<a class="dropdown-item" href="#" id="updateEmail">이메일</a>
  		</c:otherwise>
  		</c:choose>
  		
  		</div>
            </div>
          </div>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-9 col-12 col-xl-9 w-100 h-100 align-items-center mt-5">
          <div id="tb" class="py-5 my-5">
            <table class="table col-mt-5 col-md-5 col-sm-12 text-center">
              <thead>
                <tr>
                  <th scope="col" class="text-center">게시글</th>
                  <th scope="col" class="text-center">스크랩</th>
                  <th scope="col" class="text-center">좋아요</th>
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
                  <td class="">
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
  
  <div class="py-5 no-padding-top">
    <div class="container">
   
       <div class="panel-heading">
          <ul class="nav nav-tabs nav-justified">
            <li class="nav-item">
              <a href="#tabone" class="active nav-link" data-toggle="tab" data-target="#tabone" role="presentation">Tab 1</a>
            </li>
            <li class="nav-item">
              <a href="#tabtwo" data-toggle="tab" data-target="#tabtwo" role="presentation">Tab 2</a>
            </li>
            <li class="nav-item">
              <a href="#tabthree" data-toggle="tab" data-target="#tabthree" role="presentation">Tab 3</a>
            </li>
          </ul>
          </div>     
            <div class="pannel-body">
            <div class="row tab-content">
            <div class="col tab-pane active" id="tabone" role="tabpanel">
            <div class="row">
            <div class="item col-md-3 col-sm-3 w-25">
					<div class="card">
                <div class="card-header"> Header </div>
                <img class="card-img-top float-left rounded" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" alt="Card image cap">
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
                <img class="card-img-top float-left rounded" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" alt="Card image cap">
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
                <img class="card-img-top float-left rounded" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" alt="Card image cap">
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
                <img class="card-img-top float-left rounded" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" alt="Card image cap">
                <div class="card-body">
                  <h4 >Card title</h4>
                  <h6 class="text-muted">Subtitle</h6>
                  <p>Some quick example text to build on the card title .</p>
                </div>
              </div>
				</div>
				</div>
				</div>

            <div class="col tab-pane fade" id="tabtwo" role="tabpanel">
            <div class="row">
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
                       <div class="col tab-pane fade" id="tabthree" role="tabpanel">
            <div class="row">
            <div class="item col-md-3 col-sm-3 w-25">
					<div class="card">
                <div class="card-header"> Header </div>
                <img class="card-img-top float-left rounded" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" alt="Card image cap">
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
                <img class="card-img-top float-left rounded" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" alt="Card image cap">
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
                <img class="card-img-top float-left rounded" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" alt="Card image cap">
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
                <img class="card-img-top float-left rounded" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" alt="Card image cap">
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
          
        </div>
        </div>
      </div>
  

 
<script>

$(function() {
	$('.dropdown').hide(); 
	// Dropdown toggle
	$('.dropdown-toggle').click(function(){
	  $(this).next('.dropdown').toggle();
	});

	$(document).click(function(e) {
	  var target = e.target;
	  if (!$(target).is('.dropdown-toggle') && !$(target).parents().is('.dropdown-toggle')) {
	    $('.dropdown').hide();
	  }
	});

	});

$("#editInfo").click(function(){
	/* location.href="toPwCheck.do"; */
	window.open("toPwCheck.do","_blank","width=500, height=300, scrollbars=no");
})

$("#updateEmail").click(function(){
	/* location.href="toUpdateEmail.do"; */
	window.open("toUpdateEmail.do","_blank","width=500, height=300, scrollbars=no");
})

$("#editPw").click(function(){
	window.open("toPwTrueCheck.do","_blank","width=500, height=300, scrollbars=no");
})
</script>


</body>

</html>