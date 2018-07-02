<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h1>addComplainAnswer.jsp</h1>
	<form action="${pageContext.request.contextPath}/addComplainAnswer" method="POST">
		<input type="text" name="complainNo" value="${complainNo}">
		<input type="text" name="memberNo" value="${memberNo}">
		<div>
			제목 : <input type="text" name="complainAnswerTitle">
		</div>
		<div>
			내용 <br>
			<textarea name="complainAnswerContent" cols="100" rows="30" autofocus="autofocus" required="required" style="resize: none;"></textarea>
		</div>
		<button type="submit">답변보내기</button>
	</form>
</body>
</html>