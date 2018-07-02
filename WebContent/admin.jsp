<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="source/lib/bootstrap-3.3.2-dist/css/bootstrap-theme.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style>
	.container {
	margin-top:140px;		
	}
</style>

</head>
<body>

  <div class="row col-md-11">
    
   
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

            <div class="row tab-content ">
            
            <!-- tabone -->
            <div class="col tab-pane active" id="tabone" role="tabpanel">
            <div class="row">
            <c:forEach var="mrr" items="${MyReviewResult}">
            <div class="item col-md-3 col-sm-3 w-25">
					<div class="card">
                <div class="card-header">${mrr.review_title}</div>
                <img class="card-img-top float-left rounded" src="Charlie-Chaplin-PNG-Image-17681.png" alt="Card image cap">
                <div class="card-body">
                  <h6 class="text-muted">${mrr.review_contents}</h6>
                  <p>${mrr.review_writedate}</p>
                </div>
              </div>
				</div>
			</c:forEach>
	
				
				</div>
				</div>
				
<!-- tabtwo -->
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
				
				<!-- tabthree -->
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
        
          
           <!-- 검색  -->
          <div class="row col-md-12">
			<div class="input-group mt-2 col-md-12" id="inputSearch">
				<input type="text"
					class="form-control ml-auto col-4 justify-content-center" aria-label="reply"
					aria-describedby="basic-addon2" id="search">
				<div class="input-group-append">
					<button class="btn btn-outline-primery mx-1" type="button"
						id="searchbtn" name="searchbtn">검색</button>
				</div>				
			</div>
		</div>

		<!-- 페이징 -->
		<div class="col-md-12 mt-2">
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-center">${MyReviewPageNavi}</ul>
			</nav>
		</div>
        </div>
        </div>
	<div class="container center-align">
		<table class="table col-md-12">
			<thead>
				<tr>
					<th colspan=5>회원 관리</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>${part}</td>
					<td>${nickname}</td>
					<td>${email}</td>
					<td>@mdo</td>
				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>