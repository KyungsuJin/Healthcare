<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bloodPressure</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
    $(document).ready(function(){
    	 $('#searchBtn').click(function(){
			var searchValue = jQuery('#formSearch #searchValue').val(); 
			if (searchValue == '') { 
				alert('검색어를 입력하세요.'); 
				} else { 
					jQuery('#formSearch').submit(); 
				} 
			JQuery('#formSearch #searchType value').val('${mapSearch.searchType}');
		});
	});
</script>
</head>
<body>
<h1>bloodPressure</h1>
	<!-- 검색 -->
	<form id="formSearch" name="formSearch"  action="${pageContext.request.contextPath}/BloodPressureSearch" method="post"> 
		<select id="searchType" name="searchType"> 
		<option value="systolicBloodPressure" selected="systolicBloodPressure">수축기혈압</option> 
		<option value="relaxerBloodPressure">이완기혈압</option> 
		</select>		
		<input type="text" id="searchValue" name="searchValue" value="${mapSearch.searchType}"/> 
		<button type="button" id="searchBtn">검색</button> 
	</form>
		<table>		
			<thead>
				<tr>
					<th>번호</th>
					<th>회원아이디</th>
					<th>회원명</th>
					<th>수축기</th>
					<th>이완기</th>
					<th>날짜</th>
					<th>수정</th>
					<th>삭제</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="bloodPressure" items="${list}">
					<tr>
						<td>${bloodPressure.bloodPressureNo }</td>
						<td>${bloodPressure.memberId}</td>
						<td>${bloodPressure.memberName}</td>
						<td>${bloodPressure.bloodPressureDate }</td>
						<td>${bloodPressure.systolicBloodPressure }</td>
						<td>${bloodPressure.relaxerBloodPressure }</td>
						<td><a type="button" href="${pageContext.request.contextPath}/modifyBloodPressure?bloodPressureNo=${bloodPressure.bloodPressureNo}" id="buttonModify">수정</a></td>
						<td><a type="button" href="${pageContext.request.contextPath}/deleteBloodPressure?bloodPressureNo=${bloodPressure.bloodPressureNo}" id="buttonDelete">삭제</a></td>
					</tr>
				</c:forEach>
			</tbody>	
		</table>
		<a id="addBloodPressure" href="${pageContext.request.contextPath}/addBloodPressure">혈압등록하기</a>
		<nav>
			<ul class="pagination pagination-sm">
				<c:if test="${currentPage > 10}">
					<li>
						<a aria-label="first" href="${pageContext.request.contextPath }/bloodPressure?currentPage=1">&laquo;</a>
					</li>
				</c:if>
				<c:if test="${firstBlockPage > 2}">
					<li>
						<a aria-label="first" href="${pageContext.request.contextPath }/bloodPressure?currentPage=${firstBlockPage-1}">&lsaquo;</a>
					</li>
				</c:if>
					<li>
					<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
						<a href="${pageContext.request.contextPath}/bloodPressure?currentPage=${i}">${i}</a>				
					</c:forEach>		
					</li>
				<c:if test="${lastBlockPage < totalBlock}">
					<li>
						<a aria-label="last" href="${pageContext.request.contextPath}/bloodPressure?currentPage=${lastBlockPage+1}">&rsaquo;</a>
					</li>
				</c:if>
				<c:if test="${currentPage < lastPage}">
					<li>
						<a aria-label="last" href="${pageContext.request.contextPath}/bloodPressure?currentPage=${lastPage}">&raquo;</a>
					</li>
				</c:if>
			</ul>
		</nav>
</body>
</html>