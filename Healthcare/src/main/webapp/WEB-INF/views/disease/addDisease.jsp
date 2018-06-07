<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>질병등록</h1>
	<div>
		<form action="${pageContext.request.contextPath}/addDisease" method="POST">
			<div>
				질병이름 : <input type="text" name="diseaseName">
			</div>			
			<div>
				<button type="submit">질병등록하기</button>
				<button type="button">취소하기</button>
			</div>
		</form>
	</div>
</body>
</html>