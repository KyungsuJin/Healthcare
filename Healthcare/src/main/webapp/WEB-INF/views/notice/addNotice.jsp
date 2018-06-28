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
			if($('#noticeNo').val()==""){
				alert(" 공지사항코드입력하세요.")
				$('#noticeNo').focus();
			}else if($('memberNo').val()==""){
				alert("회원코드를 입력하세요.")
				$('#memberNo').focus();
			}else if($('noticeTitle').val()==""){
				alert("제목을 입력하세요.")
				$('#noticeTitle').focus();
			}else if($('noticeContent').val()==""){
				alert("내용을 입력하세요.")
				$('#noticeCount').focus();
			}else if($('noticeCount').val()==""){
				alert("조회수를 입력하세요.")
				$('#noticeCount').focus();
			}else{
				$('#noticeDate').submit();
			}
		});
	});

</script>

<title>addNotice</title>
</head>
<body>
<div class="container">
	<h1>addNotice</h1>
	<form id="addForm" action="${pageContext.request.contextPath}/addNotice" method="POST">
		<!-- <div class="form-group">
			<label for="noticeNo">addNotice : </label>
			<input class="form-control" name = "noticeNo"  id=noticeNo type="text"/>	
		</div> -->
		<div class="form-group">
			<label for="memberNo">memberno : </label>
			<input class="form-control" name = "memberNo"  id="memberNo" type="text"/>	
		</div>
		<div class="form-group">
			<label for="noticeTitle">noticetitle : </label>
			<input class="form-control" name = "noticeTitle"  id="noticeTitle" type="text"/>	
		</div>
		<div class="form-group">
			<label for="noticeContent">noticecontent : </label>
			<input class="form-control" name = "noticeContent"  id="noticeContent" type="text"/>	
		</div>
		<div class="form-group">
			<label for="noticeCount">noticecount : </label>
			<input class="form-control" name = "noticeCount"  id="noticeCount" type="text"/>	
		</div>
		<!-- <div class="form-group">
			<label for="noticeDate">noticedate : </label>
			<input class="form-control" name = "noticeDate"  id="noticeDate" type="text"/>	
		</div> -->
		<div>
			<input class="btn btn-default" id=addButton" type="submit" value="공지입력">
			<input class="btn btn-default" type="reset" value="초기화"/>
			<a class="btn btn-default" id="noticeList" href="${pageContext.request.contextPath}/noticeList">글목록</a>
		</div>
	</form>
</div>

</body>
</html>