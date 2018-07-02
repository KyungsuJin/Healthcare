<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h1>getComplainAnswer.jsp</h1>
	<div>
		RE : ${complainAnswer.complainTitle}
	</div>
	<div>
		${complainAnswer.complainAnswerDate}
	</div>
	<div style="border-top: 1px solid gray; border-bottom: 1px solid gray;">
		<div style="margin: 10px">
			${complainAnswer.complainAnswerContent}
		</div>		
	</div>
</body>
</html>