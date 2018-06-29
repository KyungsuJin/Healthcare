<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modifyGroup</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript">
 
	function check() {
	if(confirm("그룹정보를 수정하시겠습니까?")){
		if(groupForm.groupInfo.value == ""){
			alert("그룹 소개글을 해주세요.");
			groupForm.groupInfo.focus();
			return false;
		}else{
			alert("그룹 정보가 수정 완료 되었습니다.");
			return true;
		}
	}
}
	function reset(){
		$('#memberId').val('');
		$('#groupInfo').val('');
	}
	function returnBtn(){
		history.back();
	}
	function returnListBtn(){
		var groupNo = $('#groupNo').val();
		location.href="${pageContext.request.contextPath}/groupMainDetail?groupNo="+groupNo;
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
				<h4>그룹수정</h4>
				<form name="groupForm" id="groupForm" onsubmit="return check()" action="${pageContext.request.contextPath}/modifyGroup" method="post">
					<input class="form-control" type="hidden" name="groupNo" value="${groupTable.groupNo }">
					<div class="form-group">
						<span>현재 그룹 종류는<span id="purple"> ${groupTable.groupKindName}</span>입니다. 변경하실 그룹 종류를 선택해주세요.</span>
						<select class="form-control" name="groupKindNo">
						  <option value="group_kind_1" selected="selected">가족</option>
						  <option value="group_kind_2">회사</option>
						  <option value="group_kind_3">친구</option>
						</select>
					</div>
					<div class="form-group">
						<span>그룹명 : <span id="purple">${groupTable.groupName }</span> ※그룹명은 변경이 불가능합니다.※</span>
					</div>
					<div class="form-group">
						<span>그룹 소개:</span>
						<textarea class="form-control" id="groupInfo" style="resize: none;" cols="40" rows="8" name="groupInfo" placeholder="현재 소개글 내용은 ${groupTable.groupInfo }입니다. **수정하실 내용을 적어주세요**"></textarea>
					</div>
					<div align="right">
					<input class="btn btn-sm btn-primary" type="submit" value="수정하기">
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