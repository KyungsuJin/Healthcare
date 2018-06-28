<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bloodSugarList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>

<table>
		<thead>
			<tr>
				<th>건강정보요청코드</th>
				<th>의사강사코드</th>
				<th>회원코드</th>
				<th>제목</th>
				<th>요청내용</th>
				<th>요청날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="doctorRequest" items="${list}">
				<tr>
					<td>${doctorRequest.requestHealthInformationNo}</td>
					<td>${doctorRequest.teacherNo}</td>
					<td>${doctorRequest.memberNo }</td>
					<td>${doctorRequest.requestTitle }</td>
					<td>${doctorRequest.requestContent }</td>
					<td>${doctorRequest.requestDate }</td>
					<td><a href="${pageContext.request.contextPath}/modifyBloodSugar?bloodSugarNo=${bloodSugar.bloodSugarNo}" id="buttonModify">수정</a></td>
					<%-- <td><a type="button" href="${pageContext.request.contextPath}/modifyBloodSugar?bloodSugarNo=${bloodSugar.bloodSugarNo}" id="buttonModify">수정</a></td>
					<td><a type="button" href="${pageContext.request.contextPath}/deleteBloodSugar?bloodSugarNo=${bloodSugar.bloodSugarNo}" id="buttonDelete">삭제</a></td>   --%>
				</tr>
			</c:forEach>	
		</tbody>
	</table>
	<%-- <a id="addBloodSugar" href="${pageContext.request.contextPath}/addBloodSugar">혈당등록하기</a> --%>
	<nav>
		<ul class="pagination pagination-sm">
			<c:if test="${currentPage > 10}">
				<li>
					<a aria-label="first" href="${pageContext.request.contextPath }/bloodSugarList?currentPage=1">&laquo;</a>
				</li>
			</c:if>
			<c:if test="${firstBlockPage > 2}">
				<li>
					<a aria-label="first" href="${pageContext.request.contextPath }/bloodSugarList?currentPage=${firstBlockPage-1}">&lsaquo;</a>
				</li>
			</c:if>
				<li>
				<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
					<a href="${pageContext.request.contextPath}/bloodSugarList?currentPage=${i}">${i}</a>				
				</c:forEach>		
				</li>
			<c:if test="${lastBlockPage < totalBlock}">
				<li>
					<a aria-label="last" href="${pageContext.request.contextPath}/bloodSugarList?currentPage=${lastBlockPage+1}">&rsaquo;</a>
				</li>
			</c:if>
				<c:if test="${currentPage < lastPage}">
				<li>
					<a aria-label="last" href="${pageContext.request.contextPath}/bloodSugarList?currentPage=${lastPage}">&raquo;</a>
				</li>
			</c:if>
		</ul>
	</nav>

</body>
</html>