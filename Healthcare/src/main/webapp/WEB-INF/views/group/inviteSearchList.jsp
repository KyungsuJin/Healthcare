<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>inviteSearchList</title>
<script type="text/javascript">
	$(document).ready(function(){ 
		 $('#searchName').hide();
		 $('#searchId').hide();
	    $('#searchNameBtn').click(function(){ 
	        var state = $('#searchName').css('display');
	        if(state == 'none'){
	            $('#searchName').show();
	            $('#searchId').hide(); 
	        }else{ 
	            $('#searchName').hide();          
	        }
	    });
	     $('#searchIdBtn').click(function(){ 
	        var state = $('#searchId').css('display');
	        if(state == 'none'){
	            $('#searchId').show();
	            $('#searchName').hide(); 
	        }else{ 
	            $('#searchId').hide();          
	        }
	    });
	 });
	  function checkName() {
	    	if(searchName.memberName.value == "") {
				alert("찾고자하는 회원의 이름을 입력해주세요.");
				searchName.memberName.focus();
				return false;
	    	  }
			return true;
		}	
	  function checkId() {
			 if(searchId.memberId.value == "") {
				alert("찾고자하는 회원의 아이디을 입력해주세요.");
				searchId.memberId.focus();
				return false;
			}
			return true;
		}	
</script>
</head>
<body>
	<h1>검색결과리스트</h1>
	<c:choose>
		<c:when test="${result == 1 }">
			<h4>검색결과 ${memberId }라는 아이디가 없습니다.</h4>
			<div id="searchNameBtn">
				<input type="button" value="이름으로 회원 재검색">
			</div>
			<div id="searchName">
				찾고자하는 회원의 이름을 입력해주세요.
				<form action="${pageContext.request.contextPath}/inviteSearch" name="searchName" onsubmit="return checkName()" method="post">
					<input type="text" name="memberName" placeholder="이름을 입력해주세요.">
					<input type="submit" value="검색">
				</form>
			</div>
			<div id="searchIdBtn">
				<input type="button" value="아이디로 회원 재검색">
			</div>
			<div id="searchId">
				찾고자하는 회원의 아이디를 입력해주세요.
				<form action="${pageContext.request.contextPath}/inviteSearch" name="searchId" onsubmit="return checkId()" method="post">
					<input type="text" name="memberId" placeholder="아이디를 입력해주세요.">
					<input type="submit" value="검색">
				</form>
			</div>
		</c:when>
		<c:when test="${result == 2 }">
			<h4>검색결과 ${memberName }이라는 이름이 없습니다.</h4>
			<div id="searchNameBtn">
				<input type="button" value="이름으로 회원 재검색">
			</div>
			<div id="searchName">
				찾고자하는 회원의 이름을 입력해주세요.
				<form action="${pageContext.request.contextPath}/inviteSearch" name="searchName" onsubmit="return checkName()" method="post">
					<input type="text" name="memberName" placeholder="이름을 입력해주세요.">
					<input type="submit" value="검색">
				</form>
			</div>
			<div id="searchIdBtn">
				<input type="button" value="아이디로 회원 재검색">
			</div>
			<div id="searchId">
				찾고자하는 회원의 아이디를 입력해주세요.
				<form action="${pageContext.request.contextPath}/inviteSearch" name="searchId" onsubmit="return checkId()" method="post">
					<input type="text" name="memberId" placeholder="아이디를 입력해주세요.">
					<input type="submit" value="검색">
				</form>
			</div>
		</c:when>
		<c:when test="${result == 3 }">
			<h4>회원 아이디 ${memberId }로 검색한 결과입니다.</h4>
			<c:forEach var="group" items="${list }">
			<table>
				<thead>
					<tr>
						<th>아이디</th>					
						<th>이름</th>
						<th>초대</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>${group.memberId }</th>					
						<th>${group.memberName }</th>
						<th><a href="#">초대하기</a></th>
					</tr>
				</tbody>
			</table>
			</c:forEach>
			<div id="searchNameBtn">
				<input type="button" value="이름으로 회원 재검색">
			</div>
			<div id="searchName">
				찾고자하는 회원의 이름을 입력해주세요.
				<form action="${pageContext.request.contextPath}/inviteSearch" name="searchName" onsubmit="return checkName()" method="post">
					<input type="text" name="memberName" placeholder="이름을 입력해주세요.">
					<input type="submit" value="검색">
				</form>
			</div>
			<div id="searchIdBtn">
				<input type="button" value="아이디로 회원 재검색">
			</div>
			<div id="searchId">
				찾고자하는 회원의 아이디를 입력해주세요.
				<form action="${pageContext.request.contextPath}/inviteSearch" name="searchId" onsubmit="return checkId()" method="post">
					<input type="text" name="memberId" placeholder="아이디를 입력해주세요.">
					<input type="submit" value="검색">
				</form>
			</div>
		</c:when>
		<c:when test="${result == 4 }">
			<h4> 회원명 ${memberName }으로 ${count }개가 검색되었습니다.</h4>
			<c:forEach var="group" items="${list }">
				<table>
					<thead>
						<tr>
							<th>아이디</th>					
							<th>이름</th>
							<th>초대</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>${group.memberId }</th>					
							<th>${group.memberName }</th>
							<th><a  href="#">초대하기</a></th>
						</tr>
					</tbody>
				</table>
			</c:forEach>
			<div id="searchNameBtn">
				<input type="button" value="이름으로 회원 재검색">
			</div>
			<div id="searchName">
				찾고자하는 회원의 이름을 입력해주세요.
				<form action="${pageContext.request.contextPath}/inviteSearch" name="searchName" onsubmit="return checkName()" method="post">
					<input type="text" name="memberName" placeholder="이름을 입력해주세요.">
					<input type="submit" value="검색">
				</form>
			</div>
			<div id="searchIdBtn">
				<input type="button" value="아이디로 회원 재검색">
			</div>
			<div id="searchId">
				찾고자하는 회원의 아이디를 입력해주세요.
				<form action="${pageContext.request.contextPath}/inviteSearch" name="searchId" onsubmit="return checkId()" method="post">
					<input type="text" name="memberId" placeholder="아이디를 입력해주세요.">
					<input type="submit" value="검색">
				</form>
			</div>
		</c:when>
	</c:choose>
</body>
</html>