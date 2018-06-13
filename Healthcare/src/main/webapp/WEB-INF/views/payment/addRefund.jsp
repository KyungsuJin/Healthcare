<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addRefund</title>
<script type="text/javascript">
	function check() {
	if(confirm("환불 신청하시겠습니까?")){
		if(refundForm.refundSum.value == "") {
			alert("입금자명을 입력해주세요.");
			refundForm.refundSum.focus();
			return false;
		 }
		if(refundForm.refundTitle.value == "") {
			alert("제목을 입력해주세요.");
			refundForm.refundTitle.focus();
			return false;
		 }
		if(refundForm.refundContent.value == "") {
			alert("내용을 입력해주세요.");
			refundForm.refundContent.focus();
			return false;
		 }else{
			alert("환불 신청이 완료 되었습니다.");
			return true;
		}
	}
</script>
</head>
<body>
<h1>포인트 결제 신청</h1>
	<form id="refundForm" onsubmit="return check()" action="${pageContext.request.contextPath}/addRefund" method="post">
<%-- <input type="hidden" name="memberNo" value="${sessionScope.memberNo}"> --%>
		memberNo <input type="text" name="memberNo">
		<div>
			환불 금액 : 
			<input type="text" name="refundSum">
		</div>
		<div>
			제목 : 
			<input type="text" name="refundTitle">
		</div>
		<div>
			환불 사유 : 
			<input type="text" name="refundContent">
		</div>
		<input type="submit" value="환불신청하기">
	</form>
		<input type="button" onclick="cancleBtn()" value="결제취소">
</body>
</html>