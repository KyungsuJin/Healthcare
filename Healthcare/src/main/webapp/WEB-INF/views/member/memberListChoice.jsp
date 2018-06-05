<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$("#memberList").click(function(){
				window.open("${pageContext.request.contextPath}/memberList1?memberLevel=2"
						,"memberListForm","width=1600, height=500,resizable=no,scrollbars=yes");
			})
			$("#memberDoctorList").click(function(){
				window.open("${pageContext.request.contextPath}/memberList2?memberLevel=3"
						,"memberListForm","width=1600, height=500,resizable=no,scrollbars=yes");
			})
			$("#memberPTList").click(function(){
						window.open("${pageContext.request.contextPath}/memberList3?memberLevel=3"
								,"memberListForm","width=1600, height=500,resizable=no,scrollbars=yes");
			})
		})
	</script>
</head>
<body>
	<h1>회원별 리스트 보기</h1>
	<button type="button" id="memberList">회원 리스트</button>
	<button type="button" id="memberDoctorList">의사회원 리스트</button>
	<button type="button" id="memberPTList">PT회원 리스트</button>

</body>
</html>