<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modifyBloodPressure</title>
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
	<h1>modifyBloodPressure</h1>
	<div>
		<table>
			<tr>
				<th>단계</th>
				<td>수축기</td>
				<td>이완기</td>
			</tr>
			<tr>
				<th>정상 혈압</th>
				<td>120mmHg 미만</td>
				<td>80mmHg미만</td>
			</tr>
			<tr>
				<th>고혈압 전(前)단계</th>
				<td>120-139mmHg</td>
				<td>80-89mmHg</td>
			</tr>
			<tr>
				<th>1기 고혈압</th>	
				<td>140-159mmHg</td>
				<td>90-99mmHg</td>
			</tr>
			<tr>
				<th>2기고혈압</th>	
				<td>160mmHg 이상</td>
				<td>100mmHg 이상</td>
			<tr>
		</table>
		<p>혈압 설명 추가하기.</p>
	</div>
		등록번호 : ${bloodPressure.bloodPressureNo }
		등록일 : ${bloodPressure.bloodPressureDate }
		<form id="bloodPressureForm" onsubmit="return check()" action="${pageContext.request.contextPath}/modifyBloodPressure" method="post">
			<input type="hidden" name="bloodPressureNo" value="${bloodPressure.bloodPressureNo }">
			수축기 : <input type="text" name="systolicPressure" placeholder="${bloodPressure.systolicPressure}">
			이완기 : <input type="text" name="diastolicPressure" placeholder="${bloodPressure.diastolicPressure}">
			<input type="submit" value="수정하기">
		</form>
</body>
</html>