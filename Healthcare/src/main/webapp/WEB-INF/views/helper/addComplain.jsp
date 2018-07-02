<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h1>addComplain.jsp</h1>
	<form action="${pageContext.request.contextPath}/addComplain" method="POST">
		<input type="hidden" name="memberNo" value="${memberSessionNo}">
			신고대상 : <input type="text" name="complainMemberNo">
		<div>
			제목 : <input type="text" name="complainTitle">
		</div>
		<div>
			내용 <br>
			<textarea name="complainContent" cols="100" rows="30" autofocus="autofocus" required="required" style="resize: none;"></textarea>
		</div>
		<button type="submit">답변보내기</button>
	</form>
</body>
</html>