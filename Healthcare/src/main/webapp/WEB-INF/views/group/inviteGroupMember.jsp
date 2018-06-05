<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>inviteMeber</title>
<script type="text/javascript">
	$(document).ready(function(){ 
		 $('#searchName').hide();
		 $('#searchId').hide();
	    $('#searchNameBtn').click(function(){ 
	        var state = $('#searchName').css('display');
	        if(state == 'none'){
	            $('#searchName').show();
	            $('#searchId').hide(); 
	        }else{ 
	            $('#searchName').hide();          
	        }
	    });
	     $('#searchIdBtn').click(function(){ 
	        var state = $('#searchId').css('display');
	        if(state == 'none'){
	            $('#searchId').show();
	            $('#searchName').hide(); 
	        }else{ 
	            $('#searchId').hide();          
	        }
	    });
	 });
	  function checkName() {
	    	if(searchName.memberName.value == "") {
				alert("찾고자하는 회원의 이름을 입력해주세요.");
				searchName.memberName.focus();
				return false;
	    	  }
			return true;
		}	
	  function checkId() {
			 if(searchId.memberId.value == "") {
				alert("찾고자하는 회원의 아이디을 입력해주세요.");
				searchId.memberId.focus();
				return false;
			}
			return true;
		}	
</script>
</head>
<body>
	<h1>회원 초대</h1>
	<div id="searchNameBtn">
	<input type="button" value="이름으로 회원 찾기">
	</div>
	<div id="searchName">
		찾고자하는 회원의 이름을 입력해주세요.
		<form action="${pageContext.request.contextPath}/inviteSearch" name="searchName" onsubmit="return checkName()" method="post">
			<input type="text" name="memberName" placeholder="이름으로 검색하기">
			<input type="submit" value="검색하기">
		</form>
	</div>
	<div id="searchIdBtn">
	<input type="button" value="아이디로 회원 찾기">
	</div>
	<div id="searchId">
		찾고자하는 회원의 아이디를 입력해주세요.
		<form action="${pageContext.request.contextPath}/inviteSearch" name="searchId" onsubmit="return checkId()" method="post">
			<input type="text" name="memberId" placeholder="아이디로 검색하기">
			<input type="submit" value="검색하기">
		</form>
	</div>
</body>
</html>