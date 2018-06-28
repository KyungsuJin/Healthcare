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
						<h2>그룹메인</h2>
							<c:if test="${map.creationResult >0 }">
								회원님은 현재 ${map.creationResult }개의 그룹을 생성하셨습니다. 
								<div>
									<c:forEach var="groupCreation" items="${map.groupCreateList}">
										<a class="btn btn-sm btn-default" href="${pageContext.request.contextPath}/detailGroupMainForCreationMember?groupName=${ groupCreation.groupName}">${ groupCreation.groupName}</a>
									</c:forEach>	
								</div>
							</c:if>
							<c:if test="${map.creationResult == 0 }">
								현재 생성하신 그룹이 업습니다.
							</c:if>
							<c:if test="${map.result > 0 }">
								<div>
									회원님은 현재 ${map.result }개의 그룹에 가입되어 있습니다.
									<div>
										<c:forEach var="groupTable" items="${map.groupJoinList }">
											<a class="btn btn-sm btn-default" type="button" href="${pageContext.request.contextPath}/detailGroupMain?groupName=${ groupTable.groupName}">${ groupTable.groupName}</a>
										</c:forEach>
									</div>
								</div>
							</c:if>
							<c:if test="${map.result == 0 }">
								현재 가입된 그룹이 업습니다.
							</c:if>
							<div>
								<a class="btn btn-sm btn-default" type="button" href="${pageContext.request.contextPath}/groupList">그룹가입하기</a>
								<a class="btn btn-sm btn-default" type="button" href="${pageContext.request.contextPath}/addGroup">그룹생성하기</a>
								<a class="btn btn-sm btn-default" type="button" href="${pageContext.request.contextPath}/inviteGroupList">초대한그룹보기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>