<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addBloodPressureForAll</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- jQuery -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
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
		if(bloodPressureForm.memberNo.value == ""){
			alert("회원번호를 입력 해주세요.");
			bloodPressureForm.memberNo.focus();
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
</script>
<style>
#center{
width: 700;
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
				<h2>혈압을 등록해 주세요.</h2>
				<div id="center">
					<form id="addBloodPRessureForm" action="${pageContext.request.contextPath}/addBloodPressure" method="post">
						<div>
							<label>회원번호</label>
							<input class="form-control" type="text" id="memberNo" name="memberNo">
						</div>
						<div class="form-group">
							<label>수축기혈압</label>
							<input class="form-control" type="text" id="systolicPressure" name="systolicPressure" placeholder="systolicPressure/mmHg">
						</div>
						<div class="form-group">
							<label>이완기 혈압</label>
							<input class="form-control" type="text" id="diastolicPressure" name="diastolicPressure" placeholder="diastolicPressure/mmHg">
						</div>
						<div align="right">
							<input type="submit" class="btn btn-sm btn-default" value="등록">
						</div>
					</form>
				</div>
				<div align="right">
					<input type="button" class="btn btn-sm btn-default" onclick="reset()" value="다시입력">
					<input type="button" class="btn btn-sm btn-default" onclick="returnBtn()" value="등록취소">
				</div>
			</div>
		</div>
	</div>
</body>
</html>