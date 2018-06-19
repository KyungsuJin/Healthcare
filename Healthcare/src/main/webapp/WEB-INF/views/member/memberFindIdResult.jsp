<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<jsp:include page="../include/header.jsp"></jsp:include>
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
	<div class="card">
		<div class="card-header" data-background-color="purple">
			<h4 class="title">찾은 아이디</h4>
		</div>
		<div class="card-content">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="form-group">
						<label class="control-label">찾은 아이디</label>
						<input class="form-control" type="text" id="memberIdCheck"  readonly>
					</div>
					<button type="button" id="resultBtn" class="btn btn-primary pull-right">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>