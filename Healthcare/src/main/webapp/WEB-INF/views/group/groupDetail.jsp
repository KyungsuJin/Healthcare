<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>groupDetail</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	}); 
	function deleteBtn(){	
		alert('삭제가 진행됩니다.');
		var groupName= $('#groupName').val();
		var groupNo = $('#groupNo').val();
		console.log("groupNo:"+groupNo);
		console.log("groupName:"+groupName);
		var checkGroupNo = $.ajax({
			type : "GET",
	        data : {groupName : groupName},
	        url : "${pageContext.request.contextPath}/deleteGroupSearch",
	        dataType : "json",
	        contentType: "application/json; charset=UTF-8"
	    });  
		checkGroupNo.done(function(data){
		   console.log(data);   
			if(data.memberCount> 0){
		   		alert('현재 그룹에 회원이 있어 그룹 유예기간에 들어갑니다.');
		   		location.href="${pageContext.request.contextPath}/deleteGroup?groupNo="+groupNo;
			}else{
		   		alert('삭제가 완료되었습니다.');
		   		location.href="${pageContext.request.contextPath}/deleteGroup?groupNo="+groupNo;
			}
		}); 
		checkGroupNo.fail(function(jqXHR, textStatus){
			alert( "Request failed: " + textStatus );
		});
	}
	
	function modifyBtn(){	
		location.href="${pageContext.request.contextPath}/modifyGroup?groupNo="+groupNo;
	}
</script>
</head>
<body>
<h1>그룹 상세보기</h1>
<input type="hidden" id="groupNo" value="${map.groupDetail.groupNo}">
<input type="hidden" id="groupName" value="${map.groupDetail.groupName}">
	<table>
		<tr>
			<td>그룹명</td>
			<td>${map.groupDetail.groupName }</td>
		<tr>
		<tr>
			<td>그룹종류</td>
			<td>${map.groupDetail.groupKindName }</td>
		<tr>
		<tr>
			<td>그룹장</td>
			<td>${map.groupDetail.memberName }</td>
		<tr>
		<tr>
			<td>그룹설명</td>
			<td>${map.groupDetail.groupInfo }</td>
		<tr>
			<td>생성일</td>
			<td>${map.groupDetail.groupCreateDate }</td>
		</tr>
	</table>
	<div>
		<input type="button" onclick="deleteBtn()" value="그룹삭제">
		<input type="button" onclick="modifyBtn()" value="그룹수정하기">
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/groupMembersList?groupName=${map.groupDetail.groupName }">회원리스트</a>
	</div>
	<div>
		<c:if test="${map.countNext > 0 }">
			<p>다음글 : <a type="button" href="${pageContext.request.contextPath}/groupDetail?groupNo=${map.nextGroup.groupNo}">${map.nextGroup.groupName }</a></p>
		</c:if>
		<c:if test="${map.countNext eq 0 }">
			<p>다음글이 없습니다.</p>
		</c:if>
		<c:if test="${map.countPrev > 0 }">
			<p>이전글 : <a type="button" href="${pageContext.request.contextPath}/groupDetail?groupNo=${map.prevGroup.groupNo}">${map.prevGroup.groupName }</a></p>
		</c:if>
		<c:if test="${map.countPrev eq 0 }">
			<p>이전글이 없습니다.</p>
		</c:if>
	</div>
</body>
</html>