<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
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
	<div class="card">
		<div class="card-header" data-background-color="purple">
			<h4 class="title">찾은 비밀번호</h4>
		</div>
		<div class="card-content">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="form-group">
						<label class="control-label">찾은 비밀번호</label>
						<input class="form-control" type="text" id="memberPwCheck"  readonly>
					</div>
					<button type="button" id="resultBtn" class="btn btn-primary pull-right">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>