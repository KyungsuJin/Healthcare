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
	function reset(){
		$('#pointChargingSum').val('');
		$('#memberNo').val('');
	}
	function returnBtn(){
		history.back();
	}
	function returnListBtn(){
		location.href="${pageContext.request.contextPath}/pointChargingList";
	}  
</script>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
			<div id="center">
				<h4>회원에게 포인트 지급</h4>
					<form id="addPointForm" onsubmit="return check()" action="${pageContext.request.contextPath}/addPoint" method="POST">
						<div class="form-group">
						회원번호 : 
						<input class="form-control" type="text" id="memberNo" name="memberNo">
						</div>
						<div class="form-group">
						지급할 포인트 금액 :
						<input class="form-control" type="text" id="pointChargingSum" name="pointChargingSum">
						</div>
						<div align="right">
							<input type="submit" class="btn btn-sm btn-primary" value="포인트지급">
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