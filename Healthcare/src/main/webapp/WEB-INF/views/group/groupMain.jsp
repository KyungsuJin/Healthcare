<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>groupMain</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

</script>
<style>
#center{
width: 600;
margin: 0 auto;
}
#purple{
color: #9c27b0;
 font-weight: bold;
}
h4{
font-weight: bold;
}
</style>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<div class='col-sm-10'>
					<div class="panel panel-default">
						<div class="panel-body">
						<div id="center">
						<h4>그룹메인</h4>
							<c:if test="${map.creationResult >0 }">
								<span>회원님은 현재 <span id="purple">${map.creationResult }</span>개의 그룹을 생성하셨습니다. </span>
								<div class="form-group">
									<c:forEach var="groupCreation" items="${map.groupCreateList}">
										<a class="btn btn-sm btn-primary" href="${pageContext.request.contextPath}/detailGroupMainForCreationMember?groupName=${ groupCreation.groupName}">${ groupCreation.groupName}</a>
									</c:forEach>	
								</div>
							</c:if>
							<c:if test="${map.creationResult == 0 }">
								현재 생성하신 그룹이 업습니다.
							</c:if>
							<c:if test="${map.result > 0 }">
								<div class="form-group">
									회원님은 현재 <span id="purple">${map.result }</span>개의 그룹에 가입되어 있습니다.
									<div class="form-group">
										<c:forEach var="groupTable" items="${map.groupJoinList }">
											<a class="btn btn-sm btn-primary" type="button" href="${pageContext.request.contextPath}/detailGroupMain?groupName=${ groupTable.groupName}">${ groupTable.groupName}</a>
										</c:forEach>
									</div>
								</div>
							</c:if>
							<c:if test="${map.result == 0 }">
								현재 가입된 그룹이 업습니다.
							</c:if>
							<div class="navbar-form navbar-left">
								<div class="form-group" style="margin:0px">
									<a class="btn btn-sm btn-primary" type="button" href="${pageContext.request.contextPath}/groupList">그룹가입하기</a>
								</div>
							</div>
							<div class="navbar-form navbar-right">
								<div class="form-group" style="margin:0px">
									<a class="btn btn-sm btn-primary" type="button" href="${pageContext.request.contextPath}/addGroup">그룹생성하기</a>
									<a class="btn btn-sm btn-primary" type="button" href="${pageContext.request.contextPath}/inviteGroupList">나를초대한그룹보기</a>
								</div>
							</div>
				
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>