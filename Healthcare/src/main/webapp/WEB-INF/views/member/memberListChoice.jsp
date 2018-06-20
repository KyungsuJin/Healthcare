<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$("#memberList").click(function(){
				window.open("${pageContext.request.contextPath}/basicMemberList"
						,"memberListForm","width=1600, height=500,resizable=no,scrollbars=yes");
			})
			$("#memberDoctorList").click(function(){
				window.open("${pageContext.request.contextPath}/doctorMemberList"
						,"memberListForm","width=1600, height=500,resizable=no,scrollbars=yes");
			})
			$("#memberPTList").click(function(){
						window.open("${pageContext.request.contextPath}/PtMemberList"
								,"memberListForm","width=1600, height=500,resizable=no,scrollbars=yes");
			})
		})
	</script>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<div class="row">
					<div class="col-md-2">
					</div>
                    <div class="col-md-8">
                    	<div class="card">
                    		<div class="card-header" data-background-color="purple">
							 	<h4 class="title">회원별 리스트</h4>
							 </div>
							 <div class="card-content" style="text-align:center;">
								<button  class="btn btn-primary" type="button" id="memberList">회원 리스트</button>
								<button  class="btn btn-primary" type="button" id="memberDoctorList">의사회원 리스트</button>
								<button  class="btn btn-primary" type="button" id="memberPTList">PT회원 리스트</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>