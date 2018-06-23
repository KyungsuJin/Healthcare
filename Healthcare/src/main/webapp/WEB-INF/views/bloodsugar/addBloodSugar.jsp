<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
   console.log($("input[name=myRadio]:checked").val());
});
</script>
<!-- <script>
	$(document).ready(function(){
		// 입력폼 
		//공백 또는 "" 불가
		$('#addbutton').click(function(){
			if($('#bloodSugarNo').val()==""){
				alert("혈당코드를 입력하세요.")
				$('#bloodSugarNo').focus();
			}else if($('memberNo').val()==""){
				alert("회원코드를 입력하세요.")
				$('#memberNo').focus();
			}else if($('fastingBloodSugar').val()==""){
				alert("혈당을 입력하세요.")
				$('#fastingBloodSugar').focus();
			}else if($('fastingState').val()==""){
				alert("공복여부를 입력하세요.")
				$('#fastingState').focus();
			}else{
				$('#bloodSugarDate').submit();
			}
		});
	});

</script>
 -->
<title>addBloodSugar</title>
</head>
<body>
<div class="container">
	<h1>addBloodSugar</h1>
	<form id="addBloodSugar" action="${pageContext.request.contextPath}/addBloodSugar" method="POST">
		<!-- <div class="form-group">
			<label for="bloodSugarNo">bloodSugarNo : </label>
			<input class="form-control" name = "bloodSugarNo"  id="bloodSugarNo" type="text"/>	
		</div> -->
		<div class="form-group">
			<label for="memberNo">memberNo : </label>
			<input class="form-control" name = "memberNo"  id="memberNo" type="text"/>	
		</div>
		<div class="form-group">
			<label for="fastingBloodSugar">fastingBloodSugar : </label>
			<input class="form-control" name = "fastingBloodSugar"  id="fastingBloodSugar" type="text"/>	
		</div>
		<div class="form-group">
			<label for="bloodSugarDate">bloodSugarDate : </label>
			<input class="form-control" name = "bloodSugarDate"  id="bloodSugarDate" type="text"/>	
		</div>
		<div>
			<input class="btn btn-default" id=addButton" type="submit" value="등록하기">
			<input class="btn btn-default" type="reset" value="초기화"/>
			<a class="btn btn-default" id="BloodsugarList" href="${pageContext.request.contextPath}/bloodSugarList">글목록</a>
		</div>
		<form>
			<input type="radio" name ="fastingState"  checked="checked" value="F" id="fastingState"/>F
			<input type="radio" name ="fastingState"  id="fastingState" value="T">T 	
		</form>
	</form>
</div>

</body>
</html>