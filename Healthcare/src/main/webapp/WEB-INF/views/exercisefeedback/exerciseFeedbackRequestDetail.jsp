<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>exerciseFeedbackRequestDetail</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<script>
var memberNo = $('#memberNo').val();
$(document).ready(function(){
	$('#foodFeedbackBtn').hide();
	$('#foodInfoadd').hide();
	$('#searchResult').hide();
	ajaxMemberSearch();
	});
	
	//회원이 탈퇴했을 경우 리스트로 돌아가기
	function ajaxMemberSearch(){
		 var checkAjax = $.ajax({
	           type : "GET",
	           data : {memberNo : memberNo},
	           url : "${pageContext.request.contextPath}/memberSearchCount",
	           dataType : "json",
	           contentType: "application/json; charset=UTF-8"
	       });    
		 checkAjax.done(function(data){
			 console.log(data);
			 if(data.count < 1){
				 alert('찾을 수 없는 회원입니다.');
				 history.back();
			 }
			 
		 });
	}
	
	function acceptBtn() {
		if(confirm("선택한 회원의 운동 피드백 요청을 수락하시겠습니까?")){
	    location.href="${pageContext.request.contextPath}/acceptExerciseFeedback?exerciseFeedbackRequestNo="+${map.exerciseFeedbackDetail.exerciseFeedbackRequestNo };
	    return true;
		}else {
			return false;
		}   
	}
	function deniedBtn() {
		if(confirm("선택한 회원의 운동 피드백 요청을 거절하시겠습니까?")){
	    location.href="${pageContext.request.contextPath}/deniedExerciseFeedback?exerciseFeedbackRequestNo="+${map.exerciseFeedbackDetail.exerciseFeedbackRequestNo };
	    return true;
		}else {
			return false;
		}
	}  
	function listBtn() {
		history.back();
	} 
	function cnacleBtn() {
		history.back();
	} 
</script>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<input type="hidden" id="memberNo" value="${map.exerciseFeedbackDetail.memberNo }">
				<h4>게시글 상세보기</h4>
					<table class="table table-hober" id="tableCss">
						<tr>
							<td>요청번호</td>
							<td>${map.exerciseFeedbackDetail.exerciseFeedbackRequestNo }</td>
						<tr>
						<tr>
							<td>등록일</td>
							<td>${map.exerciseFeedbackDetail.exerciseFeedbackRequestDate }</td>
						</tr>
						<tr>
							<td>아이디</td>
							<td>${map.exerciseFeedbackDetail.memberId }</td>
						<tr>
						<tr>
							<td>회원명</td>
							<td>${map.exerciseFeedbackDetail.memberName }</td>
						<tr>
						<tr>
							<td>제목</td>
							<td>${map.exerciseFeedbackDetail.exerciseFeedbackRequestTitle }</td>
						<tr>
						<tr>
							<td>내용</td>
							<td>${map.exerciseFeedbackDetail.exerciseFeedbackRequestContent }</td>
					</table>
					<c:choose>
						<c:when test="${sessionScope.memberSessionNo == map.exerciseFeedbackDetail.teacherNo }">
							<div class="form-group">
								<c:if test="${map.approvalResult eq 0}"> 
									<div class="form-group">
										<button class="btn btn-sm btn-primary" onclick="acceptBtn()">수락</button>
										<button class="btn btn-sm btn-primary" onclick="deniedBtn()">거절</button>
									</div>
								</c:if>
								<c:if test="${map.approvalResult>0 }">
										<div class="form-group">
											<label>${map.exerciseFeedbackDetail.memberName }님의 요청을 ${map.exerciseFeedbackResultDetail.exerciseFeedbackApprovalDate }에 ${map.exerciseFeedbackResultDetail.exerciseFeedbackApproval}하였습니다.</label> 
										</div>
									<c:if test="${map.exerciseFeedbackResultDetail.exerciseFeedbackResult eq '대기'}">
										<div class="form-group">
											<label>아직 ${map.exerciseFeedbackDetail.memberName }님의 운동 피드백 요청에 대한 답변을 하지 않았습니다.</label> 
											<a type="button" class="btn btn-sm btn-primary" href="${pageContext.request.contextPath}/exerciseFeedResponse?exerciseFeedbackRequestNo=${map.nextExerciseFeedback.exerciseFeedbackRequestNo}">운동 피드백 답변하기</a>
										</div>
									</c:if>
								</c:if>
							</div>
						</c:when>
						<c:when test="${sessionScope.memberSessionLevel !=4 }">
							<div class="form-group">
								<button class="btn btn-sm btn-primary" onclick="cnacleBtn()">요청취소</button>
							</div>
						</c:when>
					</c:choose>
					<div class="form-group">
						<button class="btn btn-sm btn-primary" onclick="listBtn()">운동 피드백 요청 리스트로 돌아가기</button>
					</div>
					<div>
						<c:if test="${map.countNext > 0 }">
							<p>다음글 : <a type="button" href="${pageContext.request.contextPath}/exerciseFeedbackRequestDetail?exerciseFeedbackRequestNo=${map.nextExerciseFeedback.exerciseFeedbackRequestNo}">${map.nextExerciseFeedback.exerciseFeedbackRequestTitle }</a></p>
						</c:if>
						<c:if test="${map.countNext eq 0 || map.countNext == null}">
							<p>다음글 : 다음글이 없습니다.</p>
						</c:if>
						<c:if test="${map.countPrev >0 }">
							<p>이전글 : <a type="button" href="${pageContext.request.contextPath}/exerciseFeedbackRequestDetail?exerciseFeedbackRequestNo=${map.prevExerciseFeedback.exerciseFeedbackRequestNo}">${map.prevExerciseFeedback.exerciseFeedbackRequestTitle }</a></p>
						</c:if>
						<c:if test="${map.countPrev eq 0 || map.countPrev == null}">
							<p>이전글 : 이전글이 없습니다.</p>
						</c:if>
					</div>
			</div>
		</div>
	</div>
</body>
</html>