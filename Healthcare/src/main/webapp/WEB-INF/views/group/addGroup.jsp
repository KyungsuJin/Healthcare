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

	function reset(){
		$('#groupName').val('');
		$('#groupInfo').val('');
	}
	function returnBtn(){
		history.back();
	}
	function returnListBtn(){
		location.href="${pageContext.request.contextPath}/groupMain";
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
				<div class="row">
					<div class='col-sm-10'>
						<div class="panel panel-default">
						<div class="panel-body">
							<div id="center">
								<h4>그룹등록</h4>
									<form name="groupForm" id="groupForm" onsubmit="return check()" action="${pageContext.request.contextPath}/addGroup" method="post">
										<input type="hidden" name="memberNo" value="${sessionScope.memberSessionNo}">
										<div class="form-group">
											<span><span id="purple">그룹 종류를</span>을 선택해주세요</span> 
											<select class="form-control" name="groupKindNo">
											  <option value="group_kind_1" selected="selected">가족</option>
											  <option value="group_kind_2">회사</option>
											  <option value="group_kind_3">친구</option>
											</select>
										</div>
										<div class="form-group">
											<span><span id="purple">그룹명</span>을 입력해주세요</span> 
											<input type="text" class="form-control"  id="groupName" name="groupName" required class="groupName" maxlength="10" onchange="checkName()">&nbsp;<span id="Name"></span>
										</div>
										<div class="form-group">
											<span><span id="purple">그룹소개</span>를 입력해주세요</span> 
											<textarea class="form-control" name="groupInfo" style="resize: none;" cols="40" rows="8" placeholder="그룹 소개글을 입력해주세요"></textarea>
										</div>
										<div align="right">
											<input class="btn btn-sm btn-primary" type="submit" value="등록하기">
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
				</div>
			</div>
		</div>
	</div>
</body>
</html>