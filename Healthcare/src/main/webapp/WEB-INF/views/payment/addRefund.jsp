<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addRefund</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript">

	function checkSum(){
		var memberPoint = ${map.memberPoint};
		console.log("memberPoint:"+memberPoint);
		var refundsum = $('#refundSum').val();
		console.log("refundSum:"+refundsum);
		if(refundsum>memberPoint){
			var result = refundsum-memberPoint;
			$('#Name').html("환불금액이 회원님의 포인트 잔액보다"+result+"많습니다. 다시입력해주세요.");
			$('#refundSum').val("");
		}else{
			alert("환불가능");
		}
	}
 	
  function check() {
		if(confirm("환불 신청하시겠습니까?")){
			if(refundForm.refundSum.value == "") {
				alert("환불금액을 입력해주세요.");
				refundForm.refundSum.focus();
				return false;
			 }
			if(refundForm.refundTitle.value == "") {
				alert("환불종류 입력해주세요.");
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
				<form id="refundForm" name="refundForm" onsubmit="return check()" action="${pageContext.request.contextPath}/addRefund" method="post">
			<%-- <input type="hidden" name="memberNo" value="${sessionScope.memberNo}"> --%>
				현재 고객님의 포인트 잔액은 ${map.memberPoint }입니다.
					<input type=hidden name="memberNo" value="${map.memberNo}">
					<div>
						환불 금액 : 
						<input type="text" id="refundSum" name="refundSum" onchange="checkSum()">&nbsp;<span id="Name"></span>
					</div>
					<div>
						제목 : 
						<input type="text" name="refundTitle" id="refundTitle">
					</div>
					<div>
						환불 사유 : 
						<input type="text" name="refundContent" id="refundContent">
					</div>
					<input type="submit" value="환불신청하기">
				</form>
				<input type="button" onclick="cancleBtn()" value="결제취소">
			</div>
		</div>
	</div>
</body>
</html>