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
	function reset(){
		$('#pointChargingRoot').val('');
		$('#pointChargingName').val('');
	}
	function returnBtn(){
		history.back();
	}
	function returnListBtn(){
		location.href="${pageContext.request.contextPath}/pointChargingList";
	}  
</script>
<style>
#center{
width: 600;
margin: 0 auto;
}
#purple{
color: #9c27b0;
 font-weight: bold;
}
h4{
font-weight: bold;
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
				<h4>포인트 결제 신청</h4>
					<form id="pointChargingForm" onsubmit="return check()" action="${pageContext.request.contextPath}/pointCharging" method="post">
						<input type="hidden" name="memberNo" value="${sessionScope.memberSessionNo}">
						<div class="form-group">
							<select  class="form-control" name="pointChargingRoot">
							  <option value="무통장입금" selected="selected">무통장입금</option>
							  <option value="무통장입금" selected="selected">카드결제</option>
							  <option value="무통장입금" selected="selected">계좌이체</option>
							</select>
						</div>
						<div class="form-group">
							<input type="text" id="pointChargingName" name="pointChargingName" placeholder="입금자명을 입력해주세요">
						</div>
						<div class="form-group">
							<span>충전할 금액을 선택해주세요</span>
							<select class="form-control" name="pointChargingSum">
								<option value="5000" selected="selected">5000</option>
								<option value="10000">10000</option>
								<option value="15000">15000</option>
								<option value="20000">20000</option>
								<option value="25000">25000</option>
							</select>
						</div>
						<div class="form-group" align="right">
						<input type="submit" class="btn btn-sm btn-primary" value="결제신청">
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
							<input type="button" class="btn btn-primary" onclick="returnBtn()" value="등록취소">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>