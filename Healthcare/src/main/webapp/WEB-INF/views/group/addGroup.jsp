<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addGroup</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript">
var count = 0;
	function checkName(){		
		var groupName = $('#groupName').val();
		var checkCHar = /[!#$%^&*()?+=\/]/;
		if(groupName == "" || groupName == null ||checkCHar.test(groupName)){
			$('#Name').html('공백 또는 특수문자가 포함된 아이디는 사용할 수 없습니다.');
			groupForm.groupName.focus();
			return false;
		}
       var checkName = $.ajax({
            type : "GET",
            data : {groupName : groupName},
            url : "${pageContext.request.contextPath}/checkGroupName",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data){
            	console.log(data);   
            	if(data.result> 0){
            		$('#Name').html('입력하신 그룹명은 현재 사용중이므로 사용할 수 없습니다. 다시 입력해주세요.');
            		return count = 0;
            	}else if(data.result == 0){
            		$('#Name').html('사용가능한 그룹명입니다.');
            		return count = 1;
            	}
            }
        });       
       checkName.fail(function(jqXHR, textStatus){
    	   alert( "Request failed: " + textStatus );
		});
	}

	function check() {
	if(confirm("그룹을 생성하시겠습니까?")){
		if(groupForm.groupName.value == "") {
			alert("그룹명을 입력해주세요.");
			groupForm.groupName.focus();
			return false;
		  }
		if(groupForm.groupInfo.value == ""){
			alert("그룹 소개글을 해주세요.");
			groupForm.groupInfo.focus();
			return false;
		}else{
			alert("그룹 생성이 완료 되었습니다.");
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
				<div class="row">
					<div class='col-sm-10'>
						<div class="panel panel-default">
						<div class="panel-body">
							<h5>addBloodPressure</h5>
								<form name="groupForm" id="groupForm" onsubmit="return check()" action="${pageContext.request.contextPath}/addGroup" method="post">
									<input type="hidden" name="memberNo" value="${sessionScope.memberSessionNo}">
									<div>
										그룹 종류를 선택해주세요.
										<select class="form-control" name="groupKindNo">
										  <option value="group_kind_1" selected="selected">가족</option>
										  <option value="group_kind_2">회사</option>
										  <option value="group_kind_3">친구</option>
										</select>
									</div>
									<div>
										그룹명 :
											<input type="text" class="form-control"  id="groupName" name="groupName" required class="groupName" maxlength="10" onchange="checkName()">&nbsp;<span id="Name"></span>
									</div>
									<div>
										그룹 소개:
										<textarea class="form-control" name="groupInfo" style="resize: none;" cols="40" rows="8" placeholder="그룹 소개글을 입력해주세요"></textarea>
									</div>
									<input class="btn btn-sm btn-default" type="submit" value="등록하기">
								</form>
									<input type="button" class="btn btn-sm btn-default" onclick="cancleBtn()" value="등록취소">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>