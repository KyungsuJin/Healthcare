<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
	      $("#memberPwCheck").val(window.opener.document.memberFindPw.memberPw.value);
	      $("#resultBtn").click(function(){
	    	  window.close();
	    	  opener.window.location.href="${pageContext.request.contextPath}/";
	      })
	    })
      </script>
</head>
<body>
	<h1>비밀번호 찾기</h1>
	비밀번호: <input type="text" id="memberPwCheck"  readonly>
	<button type="button" id="resultBtn">확인</button>
</body>
</html>