<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>refundList</title>
<jsp:include page="../include/header.jsp"></jsp:include>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<h4>환불 리스트</h4>
				<form id="formSearch" name="formSearch" onsubmit="return formSearchcheck()" action="${pageContext.request.contextPath}/refundListSearch" method="post">
					<select name="keyOption" size="1">
			            <option value="refundNo" <c:if test="${'refundNo'==keyOption }"> selected</c:if>>번호</option>
			            <option value="memberId" <c:if test="${'memberId'==keyOption }"> selected</c:if>>아이디</option>
			            <option value="refundDate" <c:if test="${'refundDate'==keyOption }"> selected</c:if>>환불신청날짜</option>
			        </select>
					<input type="text" id="keyWord" name="keyWord" value="${keyWord}"/>
					<button type="submit">검색</button>  
			    </form> 
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>아이디</th>
							<th>환불신청날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="refund" items="${list}">
						<tr>
							<td>${refund.refundNo }</td>
							<td><a href="${pageContext.request.contextPath }/refundListDetail?refundNo=${refund.refundNo}">${refund.refundTitle }</a></td>
							<td>${refund.memberId }</td>
							<td>${refund.refundDate }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<nav>
					<ul class="pagination pagination-sm">
						<c:if test="${currentPage > 10}">
							<li>
								<a aria-label="first" href="${pageContext.request.contextPath }/refundList?currentPage=1">&laquo;</a>
							</li>
						</c:if>
						<c:if test="${firstBlockPage > 2}">
							<li>
								<a aria-label="first" href="${pageContext.request.contextPath }/refundList?currentPage=${firstBlockPage-1}">&lsaquo;</a>
							</li>
						</c:if>
							<li>
							<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
								<a href="${pageContext.request.contextPath}/refundList?currentPage=${i}">${i}</a>				
							</c:forEach>		
							</li>
						<c:if test="${lastBlockPage < totalBlock}">
							<li>
								<a aria-label="last" href="${pageContext.request.contextPath}/refundList?currentPage=${lastBlockPage+1}">&rsaquo;</a>
							</li>
						</c:if>
						<c:if test="${currentPage < lastPage}">
							<li>
								<a aria-label="last" href="${pageContext.request.contextPath}/refundList?currentPage=${lastPage}">&raquo;</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>