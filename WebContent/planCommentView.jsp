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
	location.href="planArticle.plan?plan_seq="+ ${plan_seq};
}else{
	alert("댓글 작성에 실패하였습니다 \n\t관계자에게 문의해주세요");
	location.href="planArticle.plan?plan_seq="+ ${plan_seq};
}
</script>
</body>
</html>