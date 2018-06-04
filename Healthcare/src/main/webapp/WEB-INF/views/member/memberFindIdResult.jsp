<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
	      $("#memberIdCheck").val(window.opener.document.memberFind.memberId.value);
	      $("#resultBtn").click(function(){
	    	  window.close();
	    	  opener.window.location.href="${pageContext.request.contextPath}/";
	      })
	    })
      </script>
</head>
<body>
	<h1>아이디 찾기</h1>
	아이디 : <input type="text" id="memberIdCheck"  readonly>
	<button type="button" id="resultBtn">확인</button>
</body>
</html>