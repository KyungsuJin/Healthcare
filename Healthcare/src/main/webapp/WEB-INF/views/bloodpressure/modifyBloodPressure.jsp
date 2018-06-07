<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modifyBloodPressure</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript">

function check() {
	if(confirm("혈압정보를 수정하시겠습니까?")){
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
</script>
</head>
	<body>
		<h1>modifyBloodPressure</h1>
			${bloodPressure.bloodPressureNo }
			등록일
			${bloodPressure.bloodPressureDate }
			<form id="bloodPressureForm" onsubmit="return check()" action="${pageContext.request.contextPath}/modifyBloodPressure" method="post">
				<input type="hidden" name="bloodPressureNo" value="${bloodPressure.bloodPressureNo }">
				<input type="text" name="systolicPressure" placeholder="${bloodPressure.systolicPressure}">
				<input type="text" name="diastolicPressure" placeholder="${bloodPressure.diastolicPressure}">
				<input type="submit" value="수정하기">
			</form>
	</body>
</html>