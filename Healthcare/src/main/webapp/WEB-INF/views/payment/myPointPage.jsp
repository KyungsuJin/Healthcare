<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myPointPage</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<script type="text/javascript">
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
				<div id="center">
					<h4>나의 포인트 </h4>
						현재 회원님의 현재 포인트 잔액은 <span id="purple">${memberPoint}</span> 입니다.
						<div class="form-group">
						<a class="btn btn-primary" type="button" href="${pageContext.request.contextPath }/addPointCharging">포인트 충정하기</a>
						<a class="btn btn-primary" type="button" href="${pageContext.request.contextPath }/pointChargingList">포인트충전리스트</a>
						<a class="btn btn-primary" type="button" href="${pageContext.request.contextPath }/addRefund">환전 하기</a>
						<a class="btn btn-primary" type="button" href="${pageContext.request.contextPath }/refundList">환전리스트</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>