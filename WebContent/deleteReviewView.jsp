<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
if(${result}>0){
	alert("삭제가 완료되었습니다");
	location.href="reviewboard.bo";
}else{
	alert("삭제가 불가합니다 \n\t 관계자에게 문의해주세요");
	location.href="reviewArticle.bo?review_seq="+ ${review_seq};
}
</script>
</body>
</html>