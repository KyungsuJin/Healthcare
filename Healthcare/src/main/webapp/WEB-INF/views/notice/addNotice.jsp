<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- <!-- jquery를 사용하기위한 CDN주소 -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> --> -->
<script type="text/javascript">
function reset(){
		$('#noticeTitle').val('');
		$('#noticeContent').val('');
	}
	function returnBtn(){
		history.back();
	}
	function returnListBtn(){
		location.href="${pageContext.request.contextPath}/noticeList";
	}
</script>
<style>
#purple{
color: #9c27b0;
 font-weight: bold;
}
h4{
font-weight: bold;
text-align: center;
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
                         		<h4 class="title">공지사항등록</h4>
							</div>
							<div class="card-content">
								<form id="addForm" action="${pageContext.request.contextPath}/addNotice" method="POST">
									<div class="row">
										<div class="col-md-2">
										</div>
										<div class="col-md-8">	
											<c:if test="${sessionScope.memberSessionLevel == 1 }">
											<!-- <div class="form-group">
												<span>회원번호</span>
												<input class="form-control" type="text" id="memberNo" name="memberNo">
											</div> -->
											</c:if>
											<c:if test="${sessionScope.memberSessionLevel != 1 }">
												<input class="form-control" type="hidden" id="memberNo" name="memberNo" value="${sessionScope.memberSessionNo}">
												<span id="purple">${sessionScope.memberSessionId }</span><span>님! 공지를 등록 할 수 없습니다.</span>
											</c:if>
											<div class="form-group">
												<span><span id="purple">공지제목 </span>를 입력해주세요</span>  
												<input class="form-control" name = "noticeTitle"  id="noticeTitle" type="text">	
											</div>
											<div class="form-group">
												<span><span id="purple">공지제목 </span>를 입력해주세요</span>  
												<input class="form-control" name = "noticeContent"  id="noticeContent" type="text">	
											</div>
											<div class="form-group">
												<input type="submit" class="btn btn-sm btn-primary pull-right" value="등록">
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
</body>
</html>




<title>공지등록</title>
</head>
<body>
<div class="container">
	<h1>addNotice</h1>
	<form id="addForm" action="${pageContext.request.contextPath}/addNotice" method="POST">
		
		
		<div class="form-group">
			<label for="noticeTitle">noticetitle : </label>
			<input class="form-control" name = "noticeTitle"  id="noticeTitle" type="text"/>	
		</div>
		<div class="form-group">
			<label for="noticeContent">noticecontent : </label>
			<input class="form-control" name = "noticeContent"  id="noticeContent" type="text"/>	
		</div>
		<div>
			<input class="btn btn-default" id=addButton" type="submit" value="공지입력">
			<input class="btn btn-default" type="reset" value="초기화"/>
			<a class="btn btn-default" id="noticeList" href="${pageContext.request.contextPath}/noticeList">글목록</a>
		</div>
	</form>
</div>

</body>
</html>