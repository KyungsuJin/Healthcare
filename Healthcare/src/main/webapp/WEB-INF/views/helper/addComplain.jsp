<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<form action="" method="POST">
		<div>
			신고 제목 : <input type="text" name="complainTitle">
		</div>
		<div>
			신고 대상 : <input type="text" name="complainMemberNo">
		</div>
		<div>
			신고 내용 <br>
			<textarea name="complainContent" cols="100" rows="30" autofocus="autofocus" required="required" style="resize: none;"></textarea>
		</div>
		
	</form>
</body>
</html>