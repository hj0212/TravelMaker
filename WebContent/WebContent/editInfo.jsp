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
<script>
$(document).ready(function(){

	$("#password").keypress(function(){
		var str = document.getElementById("password").value;
		
		if(blankpw(str)){
			console.log(str);
			 var regex = /\s/g;
			document.getElementById("password").value = document.getElementById("password").value.replace(regex,"");
			$("#password-label").html("password");
		};
		
		function blankpw(str){
			var regex =/\s/g;
			return regex.test(str);
			
		};
	}); 
		
	
	
	

	document.getElementById("nickname").onblur = function(){
		var str =$("#nickname").val();		  
		
		if(!namecheck(str)){
			document.getElementById("nickname").value="";
			alert("닉네임의 형식이 맞지않습니다");
		};
	};
		function namecheck(str){
			var regex =/^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]{2,45}$/;
			return regex.test(str);
		};
	
	$("#nickname").keypress(function(){
		var str = $("#nickname").val();
		
		if(blankname(str)){
			console.log("nickname");
			 var regex = /\s/g;
			document.getElementById("nickname").value =document.getElementById("nickname").value.replace(regex,"");
		};
		
		function blankname(str){
			var regex = /\s/g;
			return regex.test(str);
		};
	});
	
	
	
	
	$("#email").keypress(function(){
		var str = $("#email").val();
		
		if(blankemail(str)){
			console.log("email");
			 var regex = /\s/g;
			document.getElementById("email").value =document.getElementById("email").value.replace(regex,"");
		};
		
		function blankemail(str){
			var regex=/\s/g;
			return regex.test(str);
		};
	});
	
	  function emailcheck(email){
		  var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;  
		  return regex.test(email);
	  };
 
	
	$("#confirm-password").keyup(function(){
		var pw = $("#password").val();
		var conpw = $("#confirm-password").val();
	
				
		if(pw==conpw){
			$("#confirm-label").html("<font color=blue>confirm password(일치)</font>");
		}else{
			
			$("#confirm-label").html("<font color=red>confirm password(불일치)</font>");
			if(pw == ""){
				$("#confirm-label").html("confirm password");
				$("#confirm-password").val("");
			
			};
			
		};
		
	});
	
	$("#edit").click(function(){
		 console.log("여기2");
		var pw = $("#password").val();
		var conpw = $("#confirm-password").val();
		var nickname = $("#nickname").val();
		var email = $("#email").val();
		
		 if(pw ==""){
			  alert("패스워드를 입력해주세요.");
		  }else if(conpw ==""){
			  alert("패스워드 확인을 입력해주세요.");
		  }else if(!namecheck(nickname)){		  	  
			  alert("유효한 형식의 닉네임을 입력해주세요.");
		  }else if(!emailcheck(email)){
		       alert("유효한 형식의 이메일이아닙니다.");
		  }else if(conpw != pw){
			  alert("패스워드가 일치 하지않습니다");
		  }else{
			  console.log("여기");
			  $("#editInfoForm").submit();	
		  }		  
	})
	
	
	
});

</script>
</head>
<body>
  <div class="py-5">
    <div class="container">
      <div class="row mt-5">
        <div class="table-responsive-sm col-md-12">
        
        <form action="modiHomeMemInfo.do" method="post" id="editInfoForm">
          <table class="table table-hover">
            <thead>
              <tr>
                <th scope="row" rowspan="3">회원정보 수정</th>
                <th></th>
                <th></th>
              </tr>
            </thead>
             
            <tbody>
              <tr>
                <td scop="row">아이디</td>
                <td><input type="text" value= "${id}" readonly></td>
                <td>수정불가</td>
              </tr>
               <tr>
                <td scop="row">비밀번호</td>
                <td><input type="password" value= "${pw}" id="password"></td>
                <td id="password-label"></td>
              </tr>
              <tr>
                <td scop="row">비밀번호 재확인</td>
                <td><input type="password" value="${pw}" name="pw" id="confirm-password"></td>
                <td id="confirm-label"></td>
              </tr>
              <tr>
                <td scop="row">닉네임</td>
                <td><input type="text" value= "${nickname}" name="nickname" id="nickname" placeholder="특수문자제외한 2글자이상"></td>
                <td id="nickname-label"></td>
              </tr>
              <tr>
                <td scop="row">이메일</td>
                <td><input type="text" value= "${email}" name="email" id="email"></td>
                <td id="email-label"></td>
              </tr>
              <tr>
               
                <td colspan="3" style="text-align:right"><button id="edit" type="button" class="btn btn-outline-primary btn-lg">수정</button></td>
                
              </tr>
              </tbody>
              
          </table>
          </form>
        </div>
      </div>
    </div>
  </div>
</body>
</html>