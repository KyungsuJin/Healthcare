<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h1>inquire.jsp</h1>
	<form action="${pageContext.request.contextPath}/addInquire" method="POST">
		<input type="hidden" name="memberNo" value="${memberSessionNo}">
		<div>
			문의 제목 : <input type="text" name="inquireTitle">
		</div>
		<div>
			문의 내용 <br>
			<textarea name="inquireContent" cols="100" rows="30" autofocus="autofocus" required="required" style="resize: none;"></textarea>
		</div>
		<button type="submit">문의하기</button>
	</form>
</body>
</html>