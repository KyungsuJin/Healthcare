<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<h1></h1>
	<c:if test="${member.memberLevel==3}">
		<table border="1" class="table">
			<thead>
				<tr>
					<th>의사 면허 번호</th>
					<th>소속 병원</th>
					<th>진료 과목</th>
					<th>파일 이름</th>
					<th>MemberBirth</th>
					<th>Content</th>
					<th>Approval</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${member.doctorRegisterNo}</td>
					<td>${member.hospitalName}</td>
					<td>${member.treatmentDepartment}</td>
					<td>${member.memberFile.memberFileRealName}</td>
					<img src="${path}${member.memberFile.memberFileName }.${member.memberFile.memberFileExt}"/>
				</tr>
			</tbody>
		</table>
	</c:if>
	<c:if test="${member.memberLevel==4}">
		<table border="1" class="table">
			<thead>
				<tr>
					<th>PT 면허 번호</th>
					<th>근무지 정보</th>
					<th>Approval</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${member.doctorRegisterNo}</td>
					<td>${member.memberWorkSpace}</td>
					<td>${member.memberFile.memberFileRealName}</td>
					<img src="${path}${member.memberFile.memberFileName }.${member.memberFile.memberFileExt}">
				</tr>
			</tbody>
		</table>
	</c:if>
</body>
</html>