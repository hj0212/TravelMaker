
$(document).ready(function(){
	
	$("#user_idcheck").keydown(function(){
		var str = $("#user_idchek").val();
	
		if(blankid(str)){
			var regex = /\s/g;
			document.getElementById("user_idcheck").value =document.getElementById("user_idcheck").value.replace(regex,"");
		};
		
		function blankid(str){
			var regex =/\s/g;
			return regex.test(str);
		};
	});
	
	
	
	document.getElementById("user_idcheck").onblur= function(){
		var str = document.getElementById("user_idcheck").value;
		if(!idcheck(str)){
			document.getElementById("user_idcheck").value ="";
			$("#label-text").html("id 형식이  맞지않습니다");								
		};		
		
		function idcheck(str){
			var regex =/^[a-z][a-z\d]{7,44}$/g;
			return regex.test(str);
		};
	};
	

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
			alert("이름의 형식이 맞지않습니다");
		};
		function namecheck(str){
			var regex =/^[가-힣]{2,6}$|[a-zA-Z]{4,45}$/;
			return regex.test(str);
		};
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
	

	
	
	
	
	
	
	
	
	
});