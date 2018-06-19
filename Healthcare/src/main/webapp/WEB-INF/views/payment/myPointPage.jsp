<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myPointPage</title>
</head>
<body>
<h1>포인트확인</h1>
현재 회원님의 포인트 잔액은 입니다.

<a href="${pageContext.request.contextPath }/addPointCharging">포인트 충정하기</a>
<a href="${pageContext.request.contextPath }/">포인트충전리스트</a>
<a href="${pageContext.request.contextPath }/addRefund">환전 하기</a>
<a href="${pageContext.request.contextPath }/">환전리스트</a>
</body>
</html>