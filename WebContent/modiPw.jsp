<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
            <form action="modiPw.do" method="post"> 
            <tbody>
              <tr>
                <td>아이디</td>
                <td><input type="text" value= "${sessionScope.loginId}" readonly></td>
                <td>Otto</td>
              </tr>
               <tr>
                <td>비밀번호</td>
                <td><input type="password" value= "${pw}" name="pw" ></td>
                <td>Thornton</td>
              </tr>
              <tr>
                <td>비밀번호 재확인</td>
                <td><input type="password" value="${pw}" name="repw"></td>
                <td>Thornton</td>
              </tr>              
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