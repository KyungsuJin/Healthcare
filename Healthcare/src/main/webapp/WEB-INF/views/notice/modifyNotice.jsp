 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modifyNotice</title>
</head>
<body>
<h1>modifyNotice</h1>

<table border="1">
<thead>
<tr>
	<td>noticeno</td>
	<td>memberno</td>
	<td>noticetitle</td>
	<td>noticecontent</td>
	<td>noticecount</td>
	<td>noticedate</td>
</tr>
				 ${notice.memberno} 
	<tr>
	<form action="${pageContext.request.contextPath}/modifyNotice" method="POST">
		<td><input type="hidden" name="noticeno" value="${notice.noticeno}"></td>
		<td><input type="text" name="memberno" value="${notice.memberno}"></td>
		<td><input type="text" name="noticetitle" value="${notice.noticetitle}"></td>
		<td><input type="text" name="noticecontent" value="${notice.noticecontent}"></td>
		<td><input type="hidden" name="noticecount" value="${notice.noticecount}"></td>
		<td><input type="text" name="noticedate" value="${notice.noticedate}"></td>
		<td><input type="submit" value="수정하기">
	</form>
	</tr>
	</thead>
</table>
</body>
</html>  