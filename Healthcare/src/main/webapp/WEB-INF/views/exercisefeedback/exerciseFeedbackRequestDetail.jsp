<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>exerciseFeedbackRequestDetail</title>
<script>
$(document).ready(function(){
	$('#foodFeedbackBtn').hide();
	$('#foodInfoadd').hide();
	$('#searchResult').hide();
	});
	function acceptBtn() {
		if(confirm("선택한 회원의 운동 피드백 요청을 수락하시겠습니까?")){
	    location.href="${pageContext.request.contextPath}/acceptExerciseFeedback?exerciseFeedbackRequestNo=${map.exerciseFeedbackDetail.exerciseFeedbackRequestNo }";
	    return true;
		}else {
			return false;
		}   
	}
	function deniedBtn() {
		if(confirm("선택한 회원의 운동 피드백 요청을 거절하시겠습니까?")){
	    location.href="${pageContext.request.contextPath}/deniedExerciseFeedback?exerciseFeedbackRequestNo=${map.exerciseFeedbackDetail.exerciseFeedbackRequestNo }";
	    return true;
		}else {
			return false;
		}
	}  
	function listBtn() {
	    location.href="${pageContext.request.contextPath}/exerciseFeedbackRequestList";
	} 
</script>
</head>
<body>
<h1>게시글 상세보기</h1>
	<table>
		<tr>
			<td>요청번호</td>
			<td>${map.exerciseFeedbackDetail.exerciseFeedbackRequestNo }</td>
		<tr>
		<tr>
			<td>요청회원명</td>
			<td>${map.exerciseFeedbackDetail.memberName }</td>
		<tr>
		<tr>
			<td>제목</td>
			<td>${map.exerciseFeedbackDetail.exerciseFeedbackRequestTitle }</td>
		<tr>
		<tr>
			<td>내용</td>
			<td>${map.exerciseFeedbackDetail.exerciseFeedbackRequestContent }</td>
		<tr>
			<td>등록일</td>
			<td>${map.exerciseFeedbackDetail.exerciseFeedbackRequestDate }</td>
		</tr>
	</table>
	<div>
		<c:if test="${map.approvalResult eq 0}"> 
			<button onclick="acceptBtn()">수락하기</button>
			<button onclick="deniedBtn()">거절하기</button>
		</c:if>
		<c:if test="${map.approvalResult>0 }">
			${map.exerciseFeedbackDetail.memberName }님의 요청을 ${map.exerciseFeedbackResultDetail.exerciseFeedbackApprovalDate }에 ${map.exerciseFeedbackResultDetail.exerciseFeedbackApproval}하였습니다. 
			<c:if test="${map.exerciseFeedbackResultDetail.exerciseFeedbackResult eq '대기'}">
				<br>아직 ${map.exerciseFeedbackDetail.memberName }님의 운동 피드백 요청에 대한 답변을 하지 않았습니다. 
				<br>
				<a type="button" href="${pageContext.request.contextPath}/exerciseFeedResponse?exerciseFeedbackRequestNo=${map.exerciseFeedbackDetail.exerciseFeedbackRequestNo }">운동 피드백 답변하기</a>
			</c:if>
		</c:if>
	</div>
	<div>
		<c:if test="${map.countNext > 0 }">
			<p>다음글 : <a type="button" href="${pageContext.request.contextPath}/exerciseFeedbackRequestDetail?exerciseFeedbackRequestNo=${map.nextExerciseFeedback.exerciseFeedbackRequestNo}">${map.nextExerciseFeedback.exerciseFeedbackRequestTitle }</a></p>
		</c:if>
		<c:if test="${map.countPrev >0 }">
			<p>이전글 : <a type="button" href="${pageContext.request.contextPath}/exerciseFeedbackRequestDetail?exerciseFeedbackRequestNo=${map.prevExerciseFeedback.exerciseFeedbackRequestNo}">${map.prevExerciseFeedback.exerciseFeedbackRequestTitle }</a></p>
		</c:if>
		<c:if test="${map.countPrev eq 0 }">
			<p>이전글이 없습니다.</p>
		</c:if>
		<c:if test="${map.countNext eq 0 }">
			<p>다음글이 없습니다.</p>
		</c:if>
	</div>
	<div>
		<button id="listBtn">리스트로 돌아가기</button>
	</div>
</body>
</html>