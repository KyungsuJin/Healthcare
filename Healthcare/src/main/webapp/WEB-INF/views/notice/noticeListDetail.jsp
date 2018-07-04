<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BloodsugarList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"></script>
</head>
<body>
<h1>공지사항 상세내용</h1>








<div>
	<table>		
		<thead>
			<tr>
				<th>공지번호</th>
				<th>멤버코드</th>
				<th>제목</th>
				<th>내용</th>
				<th>조회수</th>
				<th>등록시간</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var = "notice" items = "${list}">
			<tr>
				<td>${notice.noticeNo}</td>
				<td>${notice.memberNo}</td>
				<td>${notice.noticeTitle}</td>
				<td>${notice.noticeContent }</td>
				<td>${notice.noticeCount }</td>
				<td>${notice.noticeDate }</td>
				<td><%-- noticeNO=${gdfgdfgdfg}&noticeCount=${ghfghfghfgh} --%></td>
				<td><a type="button" href="${pageContext.request.contextPath}/modifyNotice?noticeNo=${notice.noticeNo}" id="modifyNotice">수정</a></td>
			 	<td><a type="button" href="${pageContext.request.contextPath}/deleteNotice?noticeNo=${notice.noticeNo}"id="deleteNotice">삭제</a></td>
			 	<td><a type="button" href="${pageContext.request.contextPath}/noticeCountUp?noticeCount=${notice.noticeCount}&noticeNo=${notice.noticeNo}" id="noticeCountUp">재실행(카운트)</a></td>
				
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<a class="btn btn-default" id="noticeList" href="${pageContext.request.contextPath}/noticeList">글목록</a>
	
	<nav>
		<ul class="pagination pagination-sm1">
		<c:if test="${currentPage > 10}">
			<li>
				<a aria-label="first" href="${pageContext.request.contextPath }/notice/noticeListDetail?currentPage=1">&laquo;</a>
			</li>
		</c:if>
		<c:if test="${firstBlockPage > 2}">
			<li>
				<a aria-label="first" href="${pageContext.request.contextPath }/notice/noticeListDetail?currentPage=${firstBlockPage-1}">&lsaquo;</a>
			</li>
		</c:if>
			<li>
			<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
				<a href="${pageContext.request.contextPath}/notice/noticeListDetail?currentPage=${i}">${i}</a>				
			</c:forEach>		
			</li>
		<c:if test="${lastBlockPage < totalBlock}">
			<li>
				<a aria-label="last" href="${pageContext.request.contextPath}/notice/noticeListDetail?currentPage=${lastBlockPage+1}">&rsaquo;</a>
			</li>
		</c:if>
		<c:if test="${currentPage < lastPage}">
			<li>
				<a aria-label="last" href="${pageContext.request.contextPath}/notice/noticeListDetail?currentPage=${lastPage}">&raquo;</a>
			</li>
		</c:if>
		</ul>
	</nav>
</div>
</body>
</html> 