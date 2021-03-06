<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$(".approvalBtn").click(function(){
				if(confirm('회원가입을 승인하시겠습니까?')){
					
				}else{
					return false;
				}
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
				<h1>회원 승인 대기리스트</h1>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>회원 번호</th>
							<th>아이디</th>
							<th>이름</th>
							<th>성별</th>
							<th>생년월일</th>
							<th>상세보기</th>
							<th>승인</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${member}" var="member">
						<tr>
							<td>${member.memberNo}</td>
							<td>${member.memberId}</td>
							<td>${member.memberName}</td>
							<td>${member.memberGender}</td>
							<td>${member.memberBirth}</td>
							<td><a href="${pageContext.request.contextPath}/memberApprovalContent?memberNo=${member.memberNo}&memberLevel=${member.memberLevel}">상세보기</a></td>
							<td>
								<a id="approvalBtn" class="approvalBtn" href="${pageContext.request.contextPath}/approval?memberNo=${member.memberNo}&memberLevel=${member.memberLevel}">승인</a>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div id="pageDiv" style="text-align:center;">
					<ul class="pagination pagination-sm">
		  				<li>
							<c:if test="${currentPage>1}">
								<a href="${pageContext.request.contextPath}/memberApprovalList?currentPage=1"><span aria-hidden="true">&laquo;</span></a>
								<a href="${pageContext.request.contextPath}/memberApprovalList?currentPage=${currentPage-1}">이전</a>
							</c:if>
						</li>
								<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
									<li <c:out value="${currentPage eq i ? 'class=active': ''}"/>><a href="${pageContext.request.contextPath}/memberApprovalList?currentPage=${i}">${i}</a></li>
								</c:forEach>
						<li>
							<c:if test="${lastPage>currentPage}">
								<a href="${pageContext.request.contextPath}/memberApprovalList?currentPage=${currentPage+1}">다음</a>
								<a href="${pageContext.request.contextPath}/memberApprovalList?currentPage=${lastPage}"><span aria-hidden="true">&raquo;</span></a>
							</c:if>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>