<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modifyBloodPressure</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- jQuery -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
});
function check() {
	var checkCHar = /^[0-9]*$/;
	var systolicPressure = $('#systolicPressure').val();
	var diastolicPressure = $('#diastolicPressure').val();
	if(confirm("혈압정보를 수정하시겠습니까?")){
		if(!checkCHar.test(systolicPressure)){
			alert("숫자만 입력할 수 있습니다.");
			bloodPressureForm.systolicPressure.focus();
			return false;
		}
		if(!checkCHar.test(diastolicPressure)){
			alert("숫자만 입력할 수 있습니다.");
			bloodPressureForm.diastolicPressure.focus();
			return false;
		}
		if(bloodPressureForm.systolicPressure.value == "") {
			alert("이완기 혈압을 입력해주세요.");
			bloodPressureForm.systolicPressure.focus();
			return false;
		  }
		if(bloodPressureForm.diastolicPressure.value == ""){
			alert("수축기 혈압을 해주세요.");
			bloodPressureForm.diastolicPressure.focus();
			return false;
		}else{
			alert("혈압 정보가 수정 완료 되었습니다.");
			return true;
		}
	}
}
	function reset(){
		$('#systolicPressure').val('');
		$('#diastolicPressure').val('');
	}
	function returnBtn(){
		history.back();
	}
	function returnListBtn(){
		location.href="${pageContext.request.contextPath}/bloodPressure";
	}
</script>
<style>
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
			<h2>수정할 내용을 적어주세요.</h2>
				<div id="center" align="center">
					<form id="bloodPressureForm" onsubmit="return check()" action="${pageContext.request.contextPath}/modifyBloodPressure" method="post">
						<input type="hidden" name="bloodPressureNo" value="${bloodPressure.bloodPressureNo }">
						<div class="form-group">
							<label>등록번호 : ${bloodPressure.bloodPressureNo }</label>
						</div>
						<div class="form-group">
							<label>등록일 : ${bloodPressure.bloodPressureDate }</label>
						</div>
						<div class="form-group">
							<label for="diastolicPressure">수축기혈압을 적어주세요</label> 
							<input class="form-control" type="text" id="systolicPressure" name="systolicPressure" placeholder="${bloodPressure.systolicPressure}">
						</div>
						<div class="form-group">
							<label for="diastolicPressure">이완기혈압을 적어주세요</label> 
							<input class="form-control" type="text" id="diastolicPressure" name="diastolicPressure" placeholder="${bloodPressure.diastolicPressure}">
						</div>
						<input type="submit" class="btn btn-sm btn-default" value="수정">
					</form>
					<div align="left">
						<input type="button" class="btn btn-sm btn-default" onclick="returnListBtn()" value="목록으로">
					</div>
					<div align="right">
						<input type="button" class="btn btn-sm btn-default" onclick="reset()" value="다시입력">
						<input type="button" class="btn btn-sm btn-default" onclick="returnBtn()" value="수정취소">
					</div>
				</div>
 			</div>
		</div>
	</div>
</body>
</html>