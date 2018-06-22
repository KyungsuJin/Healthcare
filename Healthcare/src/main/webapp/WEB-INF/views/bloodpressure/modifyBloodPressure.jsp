<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modifyBloodPressure</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
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
</script>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
			<h2>수정할 부분을 입력해주세요.</h2>
				등록번호 : ${bloodPressure.bloodPressureNo }
				등록일 : ${bloodPressure.bloodPressureDate }
				<form id="bloodPressureForm" onsubmit="return check()" action="${pageContext.request.contextPath}/modifyBloodPressure" method="post">
					<input type="hidden" name="bloodPressureNo" value="${bloodPressure.bloodPressureNo }">
					수축기 : <input type="text" name="systolicPressure" placeholder="${bloodPressure.systolicPressure}">
					이완기 : <input type="text" name="diastolicPressure" placeholder="${bloodPressure.diastolicPressure}">
					<input type="submit" value="수정하기">
				</form>
 			</div>
		</div>
	</div>
</body>
</html>