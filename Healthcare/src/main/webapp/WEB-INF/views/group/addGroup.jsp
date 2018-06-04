<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addGroup</title>
</head>
<body>
<h1>addBloodPressure</h1>
	<form action="${pageContext.request.contextPath}/addGroup" method="post">
		그룹 종류 선택
		<select name="groupKindNo">
		  <option value="group_kind_1" selected="selected">가족</option>
		  <option value="group_kind_2" >회사</option>
		  <option value="group_kind_3" >친구</option>
		</select>
		<input type="text" name="memberNo" >
		<input type="text" name="groupName" placeholder="groupName">//중복체크값 생성
		<input type="submit" value="등록하기">
	</form>
</body>
</html>