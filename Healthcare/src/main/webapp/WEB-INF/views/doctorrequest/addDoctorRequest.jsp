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
</script>

<title>addDoctorRequest</title>
</head>
<body>
<div class="container">
	<h1>addDoctorRequest</h1>
	<form id="addDoctorRequest" action="${pageContext.request.contextPath}/addDoctorRequest" method="POST">
		<div class="form-group">
			<label for="teacherNo">teacherNo : </label>
			<input class="form-control" name = "teacherNo"  id="teacherNo" type="text"/>	
		</div>
		<div class="form-group">
			<label for="memberNo">memberNo : </label>
			<input class="form-control" name = "memberNo"  id="memberNo" type="text"/>	
		</div>
		<div class="form-group">
			<label for="requestTitle">requestTitle : </label>
			<input class="form-control" name = "requestTitle"  id="requestTitle" type="text"/>	
		</div>
		<div class="form-group">
			<label for="requestContent">requestContent : </label>
			<input class="form-control" name = "requestContent"  id="requestContent" type="text"/>	
		</div>
		<div class="form-group">
			<label for="requestDate">requestDate : </label>
			<input class="form-control" name = "requestDate"  id="requestDate" type="text"/>	
		</div>
		<div>
			<input class="btn btn-default" id=addButton" type="submit" value="등록하기">
			<input class="btn btn-default" type="reset" value="초기화"/>
			<a class="btn btn-default" id="addDoctorRequest" href="${pageContext.request.contextPath}/doctorRequestList">글목록</a>
		</div>  
	</form>
</div>

</body>
</html>