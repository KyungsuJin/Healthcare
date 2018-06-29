<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>exerciseFeedbackReqeust</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var memberNo = $('#memberNo').val();
		var checkPoint = 1000;
 		ajaxData();
 		
	});		
	
	function ajaxData() {
		var check = $.ajax({
			type : 'GET',
			data : {memberNo : memberNo},
			url : '${pageContext.request.contextPath}/exerciseFeedbackMemberPointCheck',
			dataType : 'json',
			contentType: 'application/json; charset=UTF-8',
			success : function(data){
				console.log(data);   
				
				if(data<checkPoint){
					alert('현재 고객님께서는 포인트 잔액이 부족하여 운동 피드백 신청이 불가능합니다.');
					return location.href="${pageContext.request.contextPath}/exerciseFeedbackList";
				}else{
					$('#myPoint').html('현재 잔액 : '+checkPoint);
				}
			}
		});
			check.fail(function(jqXHR, textStatus){
				alert( "Request failed: " + textStatus );
			}); 
	}
	
 	function checkForm() {
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
	function reset(){
		$('#exerciseFeedbackRequestTitle').val('');
		$('#exerciseFeedbackRequestContent').val('');
	}
	function cancleBtn() {
		history.back();
	}    
	function returnListBtn() {
	    location.href="${pageContext.request.contextPath}/exerciseFeedbackPtList";
	} 
</script>
<style>
#purple{
color: #9c27b0;
font-weight: bold;
font-size : 14px;
}
#center{
width: 600;
margin: 0 auto;
}
</style>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<div id="center">
				<h4>운동 피드백 요청 스텝2</h4>
					<form class="form-horizen" id="exercisefeedbackForm" onsubmit="return checkForm()" action="${pageContext.request.contextPath}/exerciseFeedbackRequest" method="POST">
						<div class="form-group">
							<p>선택한 강사 : ${map.ptMemberName }</p>
							<span id="myPoint"></span>
							<input type="hidden" name="memberName" value="${map.ptMemberName}">
							<input type="hidden" name="teacherNo" value="${map.ptMemberNo}">
							<input type="hidden" name="memberNo" value="${sessionScope.memberSessionNo}"> 
						</div>
						<div class="form-group">
							<span id="purple">제목</span>
							<input class="form-control" type="text" name="exerciseFeedbackRequestTitle" id="exerciseFeedbackTitle" placeholder="제목을 입력해주세요">
						</div>
						<div class="form-group">
							<label for="contents">내용</label>
							<textarea class="form-control" name="exerciseFeedbackRequestContent" id="exerciseFeedbackContent" style="resize: none;" cols="40" rows="8" placeholder="내용을 입력해주세요"></textarea>
						</div>
						<div align="right">
							<input type="submit" class="btn btn-sm btn-primary" value="등록">
						</div>
					</form>
					<div class="navbar-form navbar-left">
						<div class="form-group" style="margin:0px">
							<input type="button" class="btn btn-primary" onclick="returnListBtn()" value="목록으로">
						</div>
					</div>
					<div class="navbar-form navbar-right">
						<div class="form-group" style="margin:0px">
							<input type="button" class="btn btn-primary" onclick="reset()" value="다시입력">
							<input type="button" class="btn btn-primary" onclick="cancleBtn()" value="등록취소">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>