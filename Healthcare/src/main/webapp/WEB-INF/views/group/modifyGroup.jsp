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
function cancleBtn() {
    location.href="${pageContext.request.contextPath}/groupList";
}   
</script>

</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<h1>modifyGroup</h1>
				<form name="groupForm" id="groupForm" onsubmit="return check()" action="${pageContext.request.contextPath}/modifyGroup" method="post">
					<input type="hidden" name="groupNo" value="${groupTable.groupNo }">
					<div>
						현재 그룹 종류는 ${groupTable.groupKindName}입니다. 변경하실 그룹 종류를 선택해주세요.
						<select name="groupKindNo">
						  <option value="group_kind_1" selected="selected">가족</option>
						  <option value="group_kind_2">회사</option>
						  <option value="group_kind_3">친구</option>
						</select>
					</div>
					<div>
						그룹명 : ${groupTable.groupName } ※그룹명은 변경이 불가능합니다.※
					</div>
					<div>
						그룹 소개:
						<textarea name="groupInfo" style="resize: none;" cols="40" rows="8" name="groupInfo" placeholder="현재 소개글 내용은 ${groupTable.groupInfo }입니다. **수정하실 내용을 적어주세요**"></textarea>
					</div>
					<input type="submit" value="수정하기">
				</form>
				<input type="button" onclick="cancleBtn()" value="수정취소">
			</div>
		</div>
	</div>
</body>
</html>