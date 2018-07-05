<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="https://v40.pingendo.com/assets/4.0.0/default/theme.css" type="text/css"> </head>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
  <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <table class="table">
            <thead>
              <tr>
                <th>회원정보 수정</th>
              </tr>
            </thead>
            <form action="modiNKMemInfo.do" method="post"> 
            <tbody>
              <tr>
                <td>아이디</td>
                <td><input type="text" value= "${id}" readonly></td>
                <td></td>
              </tr>
              <tr>
                <td>닉네임</td>
                <td><input type="text" value= "${nickname}" name="nickname"></td>
                <td>the Bird</td>
              </tr>
              <tr>
                <td>이메일</td>
                <td><input type="text" value= "${email}" name="email"></td>
                <td>Otto</td>
              </tr>
              <tr>
               
                <td colspan="3" style="text-align:right"><button type="submit" class="btn btn-outline-primary btn-lg" >수정</button></td>
                
              </tr>
              </tbody>
              </form>
          </table>
        </div>
      </div>
    </div>
  </div>
</body>
</html>