<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BloodsugarList</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

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

<body>
	 <div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<div> 
					<table class="table table-hover" id="tableCss">	
						<thead>
							<tr>
								<th>제목</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="notice" items="${list}">
								<tr>
									<td>
										<div style="float: left;"><input type="checkbox" class="checkbox" name="bloodSugarCheck" value="${bloodSugar.bloodSugarNo }"/></div>
										<div><a href="${pageContext.request.contextPath}/noticeListDetail?noticeNo=${notice.noticeNo}" id="noticeListDetail">${notice.noticeTitle}</a></div>
									</td>
								</tr>
							</c:forEach>	
							<tr>
								<%-- <td><a id="addBloodSugar" href="${pageContext.request.contextPath}/addBloodSugar">혈당등록하기</a><td> --%>
								<td><a id="purple" type="button" href="${pageContext.request.contextPath}/addNotice">공지 등록하기</a></td>
							<tr>
						</tbody>
					</table>
					
					<nav>
						<ul class="pagination pagination-sm1">
							<c:if test="${currentPage > 10}">
						<li>
							<a aria-label="first" href="${pageContext.request.contextPath }/notice/noticeList?currentPage=1">&laquo;</a>
						</li>
					</c:if>
					<c:if test="${firstBlockPage > 2}">
						<li>
							<a aria-label="first" href="${pageContext.request.contextPath }/notice/noticeList?currentPage=${firstBlockPage-1}">&lsaquo;</a>
						</li>
					</c:if>
						<li>
						<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
							<a href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${i}">${i}</a>				
						</c:forEach>		
						</li>
					<c:if test="${lastBlockPage < totalBlock}">
						<li>
							<a aria-label="last" href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${lastBlockPage+1}">&rsaquo;</a>
						</li>
					</c:if>
					<c:if test="${currentPage < lastPage}">
						<li>
							<a aria-label="last" href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${lastPage}">&raquo;</a>
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