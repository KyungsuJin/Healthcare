<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DoctorRequestList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


 <!-- <script>
    $(document).ready(function(){
    	 $('#searchBtn').click(function(){
			var searchValue = jQuery('#formSearch #searchValue').val(); 
			if (searchValue == '') { 
				alert('검색어를 입력하세요.'); 
				} else { 
					jQuery('#formSearch').submit(); 
				} 
			JQuery('#formSearch #searchCode value').val('${mapSearch.searchCode}');
		});
	});
</script>
 -->
</head>
<body>
	<h1>DoctorRequestList</h1>
	<form id="DoctorRequestList" action="${pageContext.request.contextPath}/DoctorRequestList" method="POST">
	<!-- 검색 -->
	 <%-- <form id="formSearch" name="formSearch"  action="${pageContext.request.contextPath}/BloodsugarSearch" method="post"> 
		<select id="searchCode" name="searchCode"> 
		<option value="fastingbloodsugar" selected="Bloodsugarno">혈당코드</option> 
		<option value="memberno">회원코드</option> 
		</select>		
		<input type="text" id="searchValue" name="searchValue" value="${mapSearch.searchCode}"/> 
		<button type="button" id="searchBtn">검색</button> 
	</form>	 --%>
	 
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
			<c:forEach var="DoctorRequest" items="${list}">
				<tr>
					<td>${doctorRequest.RequestHealthInformationNo}</td>
					<td>${doctorRequest.TeacherNo}</td>
					<td>${doctorRequest.MemberNo }</td>
					<td>${doctorRequest.RequestTitle }</td>
					<td>${doctorRequest.RequestContent }</td>
					<td>${doctorRequest.RequestDate }</td>
					<%-- <td><a type="button" href="${pageContext.request.contextPath}/modifyBloodsugar?bloodsugarno=${bloodsugar.bloodsugarno}" id="buttonModify">수정</a></td>
					<td><a type="button" href="${pageContext.request.contextPath}/deleteBloodsugar?bloodsugarno=${bloodsugar.bloodsugarno}" id="buttonDelete">삭제</a></td>   --%>
				</tr>
			</c:forEach>	
		</tbody>
	</table>
	<%-- <a id="addBloodsugar" href="${pageContext.request.contextPath}/addBloodsugar">혈압등록하기</a> --%>

	<nav>
			<ul class="pagination pagination-sm">
				<c:if test="${currentPage > 10}">
					<li>
						<a aria-label="first" href="${pageContext.request.contextPath }/doctorrequest/DoctorRequestList?currentPage=1">&laquo;</a>
					</li>
				</c:if>
				<c:if test="${firstBlockPage > 2}">
					<li>
						<a aria-label="first" href="${pageContext.request.contextPath }/doctorrequest/DoctorRequestList?currentPage=${firstBlockPage-1}">&lsaquo;</a>
					</li>
				</c:if>
					<li>
					<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
						<a href="${pageContext.request.contextPath}/doctorrequest/DoctorRequestList?currentPage=${i}">${i}</a>				
					</c:forEach>		
					</li>
				<c:if test="${lastBlockPage < totalBlock}">
					<li>
						<a aria-label="last" href="${pageContext.request.contextPath}/doctorrequest/DoctorRequestList?currentPage=${lastBlockPage+1}">&rsaquo;</a>
					</li>
				</c:if>
				<c:if test="${currentPage < lastPage}">
					<li>
						<a aria-label="last" href="${pageContext.request.contextPath}/doctorrequest/DoctorRequestList?currentPage=${lastPage}">&raquo;</a>
					</li>
				</c:if>
			</ul>
		</nav>


</body>
</html>