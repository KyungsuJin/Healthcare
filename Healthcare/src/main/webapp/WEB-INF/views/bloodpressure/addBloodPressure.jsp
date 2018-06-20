<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addBloodPressure</title>
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
<h1>addBloodPressure</h1>
	<form id="addBloodPRessureForm" action="${pageContext.request.contextPath}/addBloodPressure" method="post">
<%-- <input type="hidden" name="memberNo" value="${sessionScope.memberNo}"> --%>
		<input type="text" name="memberNo" placeholder="memberNo">
		<input type="text" name="systolicPressure" placeholder="systolicPressure">
		<input type="text" name="diastolicPressure" placeholder="diastolicPressure">
		<input type="submit" value="등록하기">
	</form>
</body>
</html>