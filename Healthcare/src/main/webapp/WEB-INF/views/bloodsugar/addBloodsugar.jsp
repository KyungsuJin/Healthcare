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

<script>
	$(document).ready(function(){
		// 입력폼 
		//공백 또는 "" 불가
		$('#addbutton').click(function(){
			if($('#Bloodsugarno').val()==""){
				alert("혈당코드를 입력하세요.")
				$('#bloodsugarno').focus();
			}else if($('memberno').val()==""){
				alert("회원코드를 입력하세요.")
				$('#memberno').focus();
			}else if($('fastingbloodsugar').val()==""){
				alert("혈당을 입력하세요.")
				$('#fastingbloodsugar').focus();
			}else if($('fastingstate').val()==""){
				alert("공복여부를 입력하세요.")
				$('#fastingstate').focus();
			}else{
				$('#bloodsugardate').submit();
			}
		});
	});

</script>

<title>addBloodsugar</title>
</head>
<body>
<div class="container">
	<h1>addBloodsugar</h1>
	<form id="addForm" action="${pageContext.request.contextPath}/bloodsugar/addBloodsugar" method="POST">
		<div class="form-group">
			<label for="Bloodsugarno">bloodsugarno : </label>
			<input class="form-control" name = "bloodsugarno"  id="bloodsugarno" type="text"/>	
		</div>
		<div class="form-group">
			<label for="memberno">memberno : </label>
			<input class="form-control" name = "memberno"  id="memberno" type="text"/>	
		</div>
		<div class="form-group">
			<label for="fastingbloodsugar">fastingbloodsugar : </label>
			<input class="form-control" name = "fastingbloodsugar"  id="fastingbloodsugar" type="text"/>	
		</div>
		<div class="form-group">
			<label for="fastingstate">fastingstate : </label>
			<input class="form-control" name = "fastingstate"  id="fastingstate" type="text"/>	
		</div>
		<div class="form-group">
			<label for="bloodsugardate">bloodsugardate : </label>
			<input class="form-control" name = "bloodsugardate"  id="bloodsugardate" type="text"/>	
		</div>
		<div>
			<input class="btn btn-default" id=addButton" type="button" value="글입력">
			<input class="btn btn-default" type="reset" value="초기화"/>
			<a class="btn btn-default href="${pageContext.request.contextPath}/BloodsugarList"></a>글목록
		</div>
	</form>
</div>

</body>
</html>