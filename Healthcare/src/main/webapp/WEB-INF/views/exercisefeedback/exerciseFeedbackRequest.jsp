<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ExerciseFeedAsk</title>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript">

	function check() {
	if(confirm("선택한 강사님으로  운동피드백을 요청하시겠습니까?")){
		if(exercisefeedbackForm.exerciseFeedbackTitle.value == "") {
			alert("제목을 입력해주세요.");
			exercisefeedbackForm.exerciseFeedbackTitle.focus();
			return false;
		  }
		if(exercisefeedbackForm.exerciseFeedbackContent.value == ""){
			alert("내용을 해주세요.");
			exercisefeedbackForm.exerciseFeedbackContent.focus();
			return false;
		}else{
			return true;
		}
	}
}

function cancleBtn() {
    location.href="${pageContext.request.contextPath}/exerciseFeedbackPtList";
}   
</script>
</head>
<body>
<h1>운동 피드백 요청 스텝2</h1>
	<form id="exercisefeedbackForm" onsubmit="return check()" action="${pageContext.request.contextPath}/exerciseFeedbackRequest" method="post">
		<div>
			선택한 강사 : ${exerciseFeedback.memberName }
			<input type="hidden" name="teacherNo" value="${exerciseFeedback.memberNo }">
	<%-- <input type="hidden" name="memberNo" value="${sessionScope.memberNo}"> --%>
		</div>
		<div>
			제목 :
			<input type="text" name="exerciseFeedbackTitle">
		</div>
		<div>
			내용:
			<textarea name="exerciseFeedbackContent" style="resize: none;" cols="40" rows="8" placeholder="내용을 입력해주세요"></textarea>
		</div>
		<input type="submit" value="등록하기">
	</form>
		<input type="button" onclick="cancleBtn()" value="강사다시선택하기">
</body>
</html>