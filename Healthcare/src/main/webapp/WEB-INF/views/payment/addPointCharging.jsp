<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../include/header.jsp"></jsp:include>
<title>addPointCharging</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<script type="text/javascript">
	function check() {
	if(confirm("포인트 결제를 신청하시겠습니까?")){
		if(pointChargingForm.memberId.value == "") {
			alert("입금자명을 입력해주세요.");
			pointChargingForm.memberId.focus();
			return false;
		 }else{
			alert("결제 신청이 완료 되었습니다.");
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
				<h1>포인트 결제 신청</h1>
					<form id="pointChargingForm" onsubmit="return check()" action="${pageContext.request.contextPath}/pointCharging" method="post">
						<input type="hidden" name="memberNo" value="${sessionScope.memberSessionNo}">
						<div>
							<select name="pointChargingRoot">
							  <option value="무통장입금" selected="selected">무통장입금</option>
							</select>
							입금자명 : <input type="text" id="pointChargingName" name="pointChargingName">
						</div>
						<div>
							충전할 금액 : 
							<select name="pointChargingSum">
								<option value="5000" selected="selected">5000</option>
								<option value="10000">10000</option>
								<option value="15000">15000</option>
								<option value="20000">20000</option>
								<option value="25000">25000</option>
							</select>
						</div>
						<input type="submit" value="결제신청하기">
					</form>
					<input type="button" onclick="cancleBtn()" value="결제취소">
			</div>
		</div>
	</div>
</body>
</html>