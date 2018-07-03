<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modifyBloodSugar</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
#purple{
color: #9c27b0;
font-weight: bold;
}
h4{
font-weight: bold;
text-align:center;
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
						<div class="col-md-2">
						</div>
	                     <div class="col-md-8">
						 	<div class="card">
                         		<div class="card-header" data-background-color="purple">
									<h4 class="title">혈당수정</h4>
										</div>
											<div class="card-content">
											<%-- <form id="bloodPressureForm" onsubmit="return check()" action="${pageContext.request.contextPath}/modifyBloodPressure" method="post"> --%>
											<form action="${pageContext.request.contextPath}/modifyBloodSugar" method="POST">
									<div class="row">
										<div class="col-md-2">
										</div>
										<div class="col-md-8">
											<input type="hidden" name="bloodSugarNo" value="${bloodSugar.bloodSugarNo}">	
											<input type="hidden" name="bloodPressureNo" value="${bloodPressure.bloodPressureNo }">
											<div class="form-group">
													<%-- <td><input type="text" name="memberNo" value="${bloodSugar.memberNo}"></td>
				<td><input type="text" name="fastingBloodSugar" value="${bloodSugar.fastingBloodSugar}"></td>
				<td><input type="text" name="bloodSugarDate" value="${bloodSugar.bloodSugarDate}"></td> --%>
												<span><span id="purple" name="memberNo">등록번호 :</span> ${bloodSugar.memberNo}</span><br>
												<span><span id="purple" name="bloodSugarDate">등록일 :</span> ${bloodSugar.bloodSugarDate}</span>
											</div>
											<div class="form-group">
												<span><span id="purple">혈당</span>을 입력해주세요</span> 
												<input class="form-control" type="text" id="fastingBloodSugar" name="fastingBloodSugar" placeholder="${bloodSugar.fastingBloodSugar}">
											</div>
											<div class="form-group">
												<input type="submit" class="btn btn-sm btn-primary pull-right" value="수정">
											</div>
										</div>
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
										<input type="button" class="btn btn-primary" onclick="returnBtn()" value="수정취소">
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

<%--  <table border="1">
	<thead>
		<tr>
			<td>혈당코드</td>
			<td>회원코드</td>
			<td>혈당수치</td>
			<td>등록시간</td>
			<td>수정버튼</td>
			<td>공복아님</td>
			<td>공복상태</td>
		</tr>
		<tr>
			<form action="${pageContext.request.contextPath}/modifyBloodSugar" method="POST">
				<td><input type="hidden" name="bloodSugarNo" value="${bloodSugar.bloodSugarNo}"></td>
				<td><input type="text" name="memberNo" value="${bloodSugar.memberNo}"></td>
				<td><input type="text" name="fastingBloodSugar" value="${bloodSugar.fastingBloodSugar}"></td>
				<td><input type="text" name="bloodSugarDate" value="${bloodSugar.bloodSugarDate}"></td>
				<td><input type="submit" value="수정하기"></td>
			<form>
				<td><input type="radio" name ="fastingState"  checked="checked" value="F" id="fastingState"/>F</td>
				<td><input type="radio" name="fastingState" value="T">T</td> 	
			</form>	
			</form>
		</tr>
	</thead>
</table>
</body>
</html> --%>