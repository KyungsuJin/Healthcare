<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$.ajax({
				type : "GET"
				,url : "${pageContext.request.contextPath}/memberList"
				,data : {"memberLevel" :3
						,"currentPage":$("#currentPage").val()
						,"searchSelect" : $("#searchSelect").val()
						,"searchText" :$("#searchText").val()
						}
				,dataType : "json"
				,success:function(data){
					console.log(data);
					$.each(data.memberList,function(key,val){
						$("#tbody").append('<tr><td>'+val.memberNo+'</td>'+
											'<td>'+val.memberId+'</td>'+
											'<td>'+val.memberName+'</td>'+
											'<td>'+val.teacherRegisterNo+'</td>'+
											'<td>'+val.hospitalName+'</td>'+
											'<td>'+val.treatmentDepartment+'</td>'+
											'<td>'+val.memberGender+'</td>'+
											'<td>'+val.memberAddress+'</td>'+
											'<td>'+val.memberTel+'</td>'+
											'<td>'+val.memberEmail+'</td>'+
											'<td>'+val.memberBirth+'</td>'+
											'<td>'+val.memberPoint+'</td>'+
											'<td>'+val.memberJoinDate+'</td>'+
											'<td>'+val.memberAgree+'</td></tr>'
											);
					});
						if(data.currentPage>1){
							$("#page").append('<a href="${pageContext.request.contextPath}/DoctorMemberList?currentPage=1&searchSelect='+$("#searchSelect").val()+'&searchTextTest='+$("#searchText").val()+'"> << </a>');
							$("#page").append('<a href="${pageContext.request.contextPath}/DoctorMemberList?currentPage='+(data.currentPage-1)+'&searchSelect='+$("#searchSelect").val()+'&searchTextTest='+$("#searchText").val()+'"> 이전 </a>');
						}
						for(i=data.startPage;i<=data.endPage;i++){
							$("#page").append('<a href="${pageContext.request.contextPath}/DoctorMemberList?currentPage='+i+'&searchSelect='+$("#searchSelect").val()+'&searchTextTest='+$("#searchText").val()+'"> ' +i+ ' </a>');
						}
						
						if(data.lastPage>data.currentPage){
							$("#page").append('<a href="${pageContext.request.contextPath}/DoctorMemberList?currentPage='+(data.currentPage+1)+'&searchSelect='+$("#searchSelect").val()+'&searchTextTest='+$("#searchText").val()+'"> 다음 </a>');
							$("#page").append('<a href="${pageContext.request.contextPath}/DoctorMemberList?currentPage='+data.lastPage+'&searchSelect='+$("#searchSelect").val()+'&searchTextTest='+$("#searchText").val()+'"> >> </a>');
						}
					
					
				}
			});
			$("#searchBtn").click(function(){
				window.location.href='${pageContext.request.contextPath}/DoctorMemberList?searchSelect='+$("#searchSelect").val()+'&searchTextTest='+$("#searchTextTest").val();
			})
		});
	</script>

</head>
<body>
	<h1>의사회원 리스트</h1>
	<table border="1" class="table">
		<thead>
			<tr>
				<th>회원 번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>의사 면허 번호</th>
				<th>소속 병원</th>
				<th>진료 과목</th>
				<th>성별</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>생년월일</th>
				<th>포인트</th>
				<th>가입날짜</th>
				<th>개인정보동의여부</th>
			</tr>
		</thead>
		<tbody id="tbody">
		</tbody>
	</table>
	<div id=page>
	</div>
	<input type="hidden" name="currentPage" id="currentPage" value="${currentPage}">
	<input type="hidden" id="searchText" name="searchText" value="${searchText}">
	<form>
		<select id="searchSelect" name="searchSelect">
			<option value="member_id">아이디</option>
			<option <c:out value="${searchSelect eq 'member_name' ? 'selected=selected' :'' }"/> value="member_name">이름</option>
			<option <c:out value="${searchSelect eq 'member_no' ? 'selected=selected' :'' }"/> value="member_no">회원번호</option>
			<option <c:out value="${searchSelect eq 'member_hospital_name' ? 'selected=selected' :'' }"/> value="member_hospital_name">소속병원</option>
			<option <c:out value="${searchSelect eq 'treatment_department' ? 'selected=selected' :'' }"/> value="treatment_department">진료과목</option>
		</select>
		<input type="text" id="searchTextTest" name="searchTextTest">
		<button type="button" id="searchBtn">검색</button>
	</form>
</body>
</html>