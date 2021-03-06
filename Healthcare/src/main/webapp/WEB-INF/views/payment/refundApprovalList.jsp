<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>refundApprovalList</title>
<jsp:include page="../include/header.jsp"></jsp:include>
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
				<h4>환불 승인 리스트</h4>
					<table class="table table-hober" id="tableCss">
						<thead>
							<tr>
								<th>회원아이디</th>
								<th>회원명</th>
								<th>환불금액</th>
								<th>환불책임자번호</th>
								<th>환불승인날짜</th>
								<th>환불지급완료</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="refund" items="${list}">
								<tr>
									<td>${refund.memberId }</td>
									<td>${refund.memberName }</td>
									<td>${refund.refundSum }</td>
									<td>${refund.refundDate }</td>
									<td>${refund.refundDirectorNo }</td>
									<td>${refund.refundApprovalDate }</td>
									<td><a type="button" href="${pageContext.request.contextPath}/completeRefund?refundNo=${refund.refundNo}">승인</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<nav>
						<ul class="pagination pagination-sm">
							<c:if test="${currentPage > 10}">
								<li>
									<a aria-label="first" href="${pageContext.request.contextPath }/refundApprovalList?currentPage=1">&laquo;</a>
								</li>
							</c:if>
							<c:if test="${firstBlockPage > 2}">
								<li>
									<a aria-label="first" href="${pageContext.request.contextPath }/refundApprovalList?currentPage=${firstBlockPage-1}">&lsaquo;</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
								<c:if test="${currentPage eq i}">
									<li class="active">
								</c:if>
								<c:if test="${currentPage ne i}">
									<li class="">
								</c:if>
									<a href="${pageContext.request.contextPath}/refundApprovalList?currentPage=${i}">${i}</a>				
								</li>
							</c:forEach>
							<c:if test="${lastBlockPage < totalBlock}">
								<li>
									<a aria-label="last" href="${pageContext.request.contextPath}/refundApprovalList?currentPage=${lastBlockPage+1}">&rsaquo;</a>
								</li>
							</c:if>
							<c:if test="${currentPage < lastPage}">
								<li>
									<a aria-label="last" href="${pageContext.request.contextPath}/refundApprovalList?currentPage=${lastPage}">&raquo;</a>
								</li>
							</c:if>
						</ul>
					</nav>
			</div>
		</div>
	</div>
</body>
</html>