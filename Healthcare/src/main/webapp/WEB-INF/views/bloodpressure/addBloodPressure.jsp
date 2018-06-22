<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addBloodPressure</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
function check() {
	var checkCHar = /^[0-9]*$/;
	var systolicPressure = $('#systolicPressure').val();
	var diastolicPressure = $('#diastolicPressure').val();
	if(confirm("혈압정보를 수정하시겠습니까?")){
		if(!checkCHar.test(diastolicPressure)){
			alert("숫자만 입력할 수 있습니다.");
			addBloodPRessureForm.systolicPressure.focus();
			return false;
		}
		if(!checkCHar.test(diastolicPressure)){
			alert("숫자만 입력할 수 있습니다.");
			addBloodPRessureForm.diastolicPressure.focus();
			return false;
		}if(bloodPressureForm.systolicPressure.value == "") {
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
</script>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<h2>안녕하세요. 혈압을 등록해 주세요.</h2>
				<form id="addBloodPRessureForm" action="${pageContext.request.contextPath}/addBloodPressure" method="post">
					<input type="hidden" name="memberNo" value="${sessionScope.memberNo}">
					<div>
					수축기 : <input type="text" name="systolicPressure" placeholder="systolicPressure">/mmHg
					</div>
					<div>
					이완기 : <input type="text" name="diastolicPressure" placeholder="diastolicPressure">/mmHg
					</div>
					<div>
					<input type="submit" value="등록하기">
					</div>
				</form>
				<input type="button" value="다시입력하기">
				<input type="button" value="돌아가기">
			</div>
		</div>
	</div>
</body>
</html>