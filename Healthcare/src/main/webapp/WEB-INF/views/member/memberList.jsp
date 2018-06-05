<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
				$.ajax({
					type : "get"
					,url : "${pageContext.request.contextPath}/memberList"
					,data : {"memberLevel":2 ,"currentPage":$("#currentPage").val()}
					,datatype : "json"
					,success:function(data){
						console.log(data.endPage);
						$.each(data.memberList,function(key,val){						 
							$("#ds").append('<tr><td>'+val.memberNo+'</td>'+
											'<td>'+val.memberId+'</td>'+
											'<td>'+val.memberName+'</td>'+
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
							for(var i = data.startPage;i<=data.endPage; i++){
								$("#ds").append('<a href="${pageContext.request.contextPath}/memberList1?currentPage='+i+'&memberLevel=2">'+i+'</a>');
							}
					}
				});
			$("#searchBtn").click(function(){
				var formData=$("#searchForm").serialize();
				console.log(formData);
			    $.ajax({
					type:"GET"
					,url :"${pageContext.request.contextPath}/memberList"
					,data: formData
					,dataType:"json",
					success :function(data){
						console.log(data);
					}
					
				});
			});
		});

	</script>
</head>
<body>
	<h1>회원 리스트</h1>
	<table border="1" class="table">
		<thead>
			<tr>
				<th>회원 번호</th>
				<th>아이디</th>
				<th>이름</th>
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
		
		<tbody id="ds">

		</tbody>
	</table>
	<div id="sd"></div>
	<form id="searchForm" method="get">
		<input type="hidden" name="memberLevel" value="2">
		<input type="hidden" name="currentPage" id="currentPage" value="${currentPage}">
		<div>
			<select id="searchSelect" name="searchSelect">
				<option value="member_id">아이디</option>
				<option value="member_name">이름</option>
			</select>
			<input type="text" id="searchText" name="searchText">
			<button type="button" id="searchBtn">검색</button>
		</div>
	</form>
</body>
</html>