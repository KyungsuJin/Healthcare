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
	<td>공지코드</td>
	<td>회원코드</td>
	<td>제목</td>
	<td>내용</td>
	<td>조회수</td>
	<td>입력날짜</td>
</tr>
				<%--  ${notice.memberno}  --%>
	<tr>
	<form action="${pageContext.request.contextPath}/modifyNotice" method="POST">
		<td><input type="hidden" name="noticeNo" value="${notice.noticeNo}"></td>
		<td><input type="text" name="memberNo" value="${notice.memberNo}"></td>
		<td><input type="text" name="noticeTitle" value="${notice.noticeTitle}"></td>
		<td><input type="text" name="noticeContent" value="${notice.noticeContent}"></td>
		<td><input type="hidden" name="noticeCount" value="${notice.noticeCount}"></td>
		<td><input type="text" name="noticeDate" value="${notice.noticeDate}"></td>
		<td><input type="submit" value="수정하기">
	</form>
	</tr>
	</thead>
</table>
</body>
</html>  