<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<h1>승인전 회원 상세보기</h1>
				<c:if test="${member.memberLevel==3}">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>의사 면허 번호</th>
								<th>소속 병원</th>
								<th>진료 과목</th>
								<th>파일 이름</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${member.doctorRegisterNo}</td>
								<td>${member.hospitalName}</td>
								<td>${member.treatmentDepartment}</td>
								<td>${member.memberFile.memberFileRealName}</td>
							</tr>
							<tr>
								<td colspan="4"><div style="text-align:center;">첨부파일</div></td>
							</tr>
							<tr>
								<td colspan="4"><div style="text-align:center;"><img src="img/${member.memberFile.memberFileName }.${member.memberFile.memberFileExt}"/></div></td>
							<tr>
						</tbody>
					</table>
				</c:if>
				<c:if test="${member.memberLevel==4}">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>PT 면허 번호</th>
								<th>근무지 정보</th>
								<th>파일이름</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${member.doctorRegisterNo}</td>
								<td>${member.memberWorkSpace}</td>
								<td>${member.memberFile.memberFileRealName}</td>
							</tr>
							<tr>
								<td colspan="4"><div style="text-align:center;">첨부파일</div></td>
							</tr>
							<tr>
								<td colspan="4"><div style="text-align:center;"><img  class="col-xs-12" src="${path}${member.memberFile.memberFileName }.${member.memberFile.memberFileExt}"></div></td>
							<tr>
						</tbody>
					</table>
				</c:if>
				<a href="${pageContext.request.contextPath}/memberApprovalList" class="btn btn-primary">목록으로</a>
			</div>
		</div>
	</div>
	
</body>
</html>