<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>exerciseFeedbackRequestList</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript">
	// 검색
	function formSearchcheck(){
   		var keyWord = $('#keyWord').val();
 		if(keyWord == ''|| keyWord == null){
			alert('검색하실 내용을 입력해주세요.');
			formSearch.keyWord.focus();
			return false;
		}else{ 
			alert('리스트 검색이 완료되었습니다.');
			return true;
	}  
</script>
</head>
<body>
<h1>운동피드백요청한회원리스트</h1>
	<form id="formSearch" name="formSearch" onsubmit="return formSearchcheck()" action="${pageContext.request.contextPath}/exerciseFeedbackRequestListSearch" method="POST"> 
		<h4>검색</h4>
		<div>
			 <select name="keyOption" size="1">
	            <option value="exerciseFeedbackRequestNo" <c:out value="${keyOption == 'exerciseFeedbackRequestNo'?'selected':''}"/>>번호</option>
	            <option value="exerciseFeedbackRequestTitle" <c:out value="${keyOption == 'exerciseFeedbackRequestTitle'?'selected':''}"/>>제목</option>
	            <option value="memberName" <c:out value="${keyOption == 'memberName'?'selected':''}"/>>요청한회원명</option>
	        </select>
			<input type="text" id="keyWord" name="keyWord" value="${keyword}"/>
		</div>
		 <div>
			<input type="submit" value="조회">
		</div>
	</form>
	<c:choose>
		<c:when test="${result > 0 }">
			총 ${result }개의 게시물을 찾았습니다.
			${keyOption }로(으로) ${keyWord } 검색한 리스트 결과입니다.
		</c:when>
		<c:when test="${result eq 0 }">
			${keyOption }로(으로) ${keyWord }로 해당하는 리스트 검색 결과가 없습니다.
		</c:when>
	</c:choose>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>요청한회원아이디</th>
				<th>등록날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="exerciseFeedback" items="${exercisefeedbacklist}">
			<tr>
				<td>${exerciseFeedback.exerciseFeedbackRequestNo }</td>
				<td><a type="button" href="${pageContext.request.contextPath}/exerciseFeedbackRequestDetail?exerciseFeedbackRequestNo=${exerciseFeedback.exerciseFeedbackRequestNo }">${exerciseFeedback.exerciseFeedbackRequestTitle }</a></td>
				<td>${exerciseFeedback.memberId }</td>
				<td>${exerciseFeedback.exerciseFeedbackRequestDate }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<nav>
		<ul class="pagination pagination-sm">
			<c:if test="${currentPage > 10}">
				<li>
					<a aria-label="first" href="${pageContext.request.contextPath }/exerciseFeedbackRequestList?currentPage=1">&laquo;</a>
				</li>
			</c:if>
			<c:if test="${firstBlockPage > 2}">
				<li>
					<a aria-label="first" href="${pageContext.request.contextPath }/exerciseFeedbackRequestList?currentPage=${firstBlockPage-1}">&lsaquo;</a>
				</li>
			</c:if>
				<li>
				<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
					<a href="${pageContext.request.contextPath}/exerciseFeedbackRequestList?currentPage=${i}">${i}</a>				
				</c:forEach>		
				</li>
			<c:if test="${lastBlockPage < totalBlock}">
				<li>
					<a aria-label="last" href="${pageContext.request.contextPath}/exerciseFeedbackRequestList?currentPage=${lastBlockPage+1}">&rsaquo;</a>
				</li>
			</c:if>
			<c:if test="${currentPage < lastPage}">
				<li>
					<a aria-label="last" href="${pageContext.request.contextPath}/exerciseFeedbackRequestList?currentPage=${lastPage}">&raquo;</a>
				</li>
			</c:if>
		</ul>
	</nav>
</body>
</html>