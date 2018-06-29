<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>inviteGroupList</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<script type="text/javascript">

</script>
<style>
th td{
text-align : center;
}
#purple{
color: #9c27b0;
font-weight: bold;
font-size : 14px;
}
#tableCss{
font-size : 14px;
}
</style>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<h4>나를 초대한 그룹 리스트</h4>
					<table class="table table-hober" id="tableCss">
						<thead>
							<tr>
								<th>그룹명</th>
								<th>그룹종류</th>
								<th>그룹소개말</th>
								<th>그룹초대메세지</th>
								<th>초대한날짜</th>
								<th>수락</th>				
							</tr>
						</thead>
						<tbody>
							<c:forEach var="groupInvite" items="${list}">
							<tr>
								<td>${groupInvite.groupName }</td>
								<td>${groupInvite.groupKindName }</td>
								<td>${groupInvite.groupInfo }</td>
								<td>${groupInvite.groupInviteMessage }</td>
								<td>${groupInvite.groupInviteDate }</td>
								<td><a id="purple" href="${pageContext.request.contextPath}/accpetGroup?groupName=${groupInvite.groupName}" id="accpetGroup">수락하기</a></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<div align="center">
					<nav>
						<ul class="pagination pagination-sm">
							<c:if test="${currentPage > 10}">
								<li>
									<a aria-label="first" href="${pageContext.request.contextPath }/inviteGroupList?currentPage=1">&laquo;</a>
								</li>
							</c:if>
							<c:if test="${firstBlockPage > 2}">
								<li>
									<a aria-label="first" href="${pageContext.request.contextPath }/inviteGroupList?currentPage=${firstBlockPage-1}">&lsaquo;</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
								<c:if test="${currentPage == i}">
								<li class="active">
								</c:if>
								<c:if test="${currentPage != i}">
								<li class="">
								</c:if>
									<a href="${pageContext.request.contextPath}/inviteGroupList?currentPage=${i}">${i}</a>	
								</li>
							</c:forEach>
							<c:if test="${lastBlockPage < totalBlock}">
								<li>
									<a aria-label="last" href="${pageContext.request.contextPath}/inviteGroupList?currentPage=${lastBlockPage+1}">&rsaquo;</a>
								</li>
							</c:if>
							<c:if test="${currentPage < lastPage}">
								<li>
									<a aria-label="last" href="${pageContext.request.contextPath}/inviteGroupList?currentPage=${lastPage}">&raquo;</a>
								</li>
							</c:if>
						</ul>
					</nav>
					</div>
			</div>
		</div>
	</div>
</body>
</html>