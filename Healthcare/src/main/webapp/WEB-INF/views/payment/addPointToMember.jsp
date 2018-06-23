<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addPointToMember</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<script type="text/javascript">
	function check() {
	if(confirm("포인트를 지급하시겠습니까?")){
		if(addPointForm.memberNo.value == "") {
			alert("회원 번호를 입력해주세요.");
			addPointForm.memberNo.focus();
			return false;
		 }
		if(addPointForm.pointChargingSum.value == "") {
			alert("포인트를 입력해주세요.");
			addPointForm.pointChargingSum.focus();
			return false;
		 }else{
			alert("완료 되었습니다.");
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
				<h1>회원에게 포인트 지급</h1>
				<form id="addPointForm" onsubmit="return check()" action="${pageContext.request.contextPath}/addPoint" method="POST">
					회원번호 : <input type="text" id="memberNo" name="memberNo">
					지급할 포인트 금액 :<input type="text" id="pointChargingSum" name="pointChargingSum">
					<input type="submit" value="포인트지급">
				</form>
				<input type="button" onclick="cancleBtn()" value="취소">
			</div>
		</div>
	</div>
</body>
</html>