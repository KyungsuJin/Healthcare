<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BloodsugarList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
<style>
h1 {
    color: white;
    text-align: center;
     width: 37.5%; 
     margin: auto;
	} 
div {
    width: 37%; 
    text-align: center;
    margin: auto;
    border: 3px solid purple;
} 
table {
    text-align: center;
    margin: auto;
} 
</style>
<h1 style="background-color:purple;">공지사항</h1>
<div>
	<table>
		<thead>
			<tr>
				<th>제목</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="notice" items="${list}">
				<tr>
					<td><a href="${pageContext.request.contextPath}/noticeListDetail?noticeNo=${notice.noticeNo}" id="noticeListDetail">${notice.noticeTitle}</a></td>
				</tr>
			</c:forEach>	
		</tbody>
	</table>
		<a id="addNotice" href="${pageContext.request.contextPath}/addNotice">공지 등록하기</a>
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

</body>
</html>