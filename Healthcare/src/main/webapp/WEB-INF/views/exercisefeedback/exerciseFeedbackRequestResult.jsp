<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>exerciseFeedbackRequestResult</title>
<jsp:include page="../include/header.jsp"></jsp:include>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
			<h1>운동 피드백 요청 스텝3</h1>
				요청이 완료 되었습니다.
				승인 완료 후 7일 이내로 답변이 완료됩니다.
				<a href="${pageContext.request.contextPath}/exerciseFeedbackList">내가 요청한 운동 피드백 리스트로 돌아가기</a>
			</div>
		</div>
	</div>
</body>
</html>