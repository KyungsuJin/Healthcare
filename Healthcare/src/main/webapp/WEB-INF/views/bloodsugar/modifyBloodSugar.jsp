<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modifyBloodSugar</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<script type="text/javascript">
function reset(){
		$('#fastingBloodSugar').val('');
	}
	function returnBtn(){
		history.back();
	}
	function returnListBtn(){
		location.href="${pageContext.request.contextPath}/bloodSugarList";
	}
</script>
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
											<form id="modifyBloodSugar" action="${pageContext.request.contextPath}/modifyBloodSugar" method="POST">
									<div class="row">
										<div class="col-md-2">
										</div>
										<div class="col-md-8">
											<input type="hidden" name="bloodSugarNo" value="${bloodSugar.bloodSugarNo}">	
											<div class="form-group">
												<span><span id="purple" name="memberNo">회원코드 :</span> <input class="form-control" type = "text" name ="memberNo" value="${bloodSugar.memberNo}"></span><br>
												<span><span id="purple" name="bloodSugarNo">등록번호 :</span> ${bloodSugar.bloodSugarNo}</span>
												<span><span id="purple" name="bloodSugarDate">등록일 :</span> ${bloodSugar.bloodSugarDate}</span>
											</div>
											<div class="form-group">
												<span><span id="purple">혈당</span>을 입력해주세요</span> 
												<input class="form-control" type="text" id="fastingBloodSugar" name="fastingBloodSugar" placeholder="${bloodSugar.fastingBloodSugar}">
												<%-- <input class="form-control" type="text" id="systolicPressure" name="systolicPressure" placeholder="${bloodPressure.systolicPressure}"> --%>
											</div>
											<div class="form-group">
												<span><span id="purple">공복여부</span>를 입력해주세요</span>
												<input type="radio" name ="fastingState"  checked="checked" value="F" id="fastingState"/>F</td>
												<td><input type="radio" name="fastingState" value="T">T</td> 	
											</div>
											<div class="form-group">
												<input type="submit"  class="btn btn-sm btn-primary pull-right" value="수정">
											</div>
										</div>
									</div>
								</form>
								<div class="navbar-form navbar-left">
									<div class="form-group" style="margin:0px">
										<!-- <input type="button" class="btn btn-primary" onclick="returnListBtn()" value="목록으로"> -->
										<a  class="btn btn-primary" id="bloodSugarList" href="${pageContext.request.contextPath}/bloodSugarList">목록으로</a>
									</div>
								</div>
								<div class="navbar-form navbar-right">
									<div class="form-group" style="margin:0px">
										<input class="btn btn-primary"  onclick="reset()" value="다시입력">
										<input type="button" class="btn btn-primary" onclick="returnBtn()" value="수정취소">
										
										
		<%-- 								<input class="btn btn-default" id=addButton" type="submit" value="공지입력">
			<input class="btn btn-default" type="reset" value="초기화"/>
			<a class="btn btn-default" id="noticeList" href="${pageContext.request.contextPath}/noticeList">글목록</a> --%>
										
										
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