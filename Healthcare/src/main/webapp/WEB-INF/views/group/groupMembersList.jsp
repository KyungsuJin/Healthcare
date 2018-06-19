<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>groupMemberList</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function inviteMemberBtn() {
		var groupNo = $('#groupNo').val();
		console.log("groupNo:"+groupNo);
		location.href="${pageContext.request.contextPath}/inviteMemberForm?groupNo="+groupNo;
	}   
</script>
</head>
<body>
<h1>그룹에 가입한 회원 리스트</h1>
<c:choose>
	<c:when test="${memberCountResult>0 }">
		총 ${memberCountResult }명의 회원이 있습니다.
		
		<table>
			<thead>
				<tr>
					<th>회원아이디</th>
					<th>회원명</th>
					<th>개인정보공개유무</th>
					<th>가입일</th>
					<th>추방</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="groupMember" items="${list }">
				<tr>
					<td>${groupMember.memberId }</td>
					<td>${groupMember.memberName }</td>
					<td>${groupMember.personalInformationApproval }</td>
					<td>${groupMember.groupInviteApprovalDate }</td>
					<td><a href="${pageContext.request.contextPath}/expulsionToMembmer?memberNo=${groupMember.memberNo}">추방하기</a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<input type="hidden" id="groupNo" value="${groupNoSend }">
		<input type="button" onclick="inviteMemberBtn()" value="회원초대하기">
		<nav>
			<ul class="pagination pagination-sm">
				<c:if test="${currentPage > 10}">
					<li>
						<a aria-label="first" href="${pageContext.request.contextPath }/groupMemberList?currentPage=1">&laquo;</a>
					</li>
				</c:if>
				<c:if test="${firstBlockPage > 2}">
					<li>
						<a aria-label="first" href="${pageContext.request.contextPath }/groupMemberList?currentPage=${firstBlockPage-1}">&lsaquo;</a>
					</li>
				</c:if>
					<li>
					<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
						<a href="${pageContext.request.contextPath}/groupMemberList?currentPage=${i}">${i}</a>	
					</c:forEach>		
					</li>
				<c:if test="${lastBlockPage < totalBlock}">
					<li>
						<a aria-label="last" href="${pageContext.request.contextPath}/groupMemberList?currentPage=${lastBlockPage+1}">&rsaquo;</a>
					</li>
				</c:if>
				<c:if test="${currentPage < lastPage}">
					<li>
						<a aria-label="last" href="${pageContext.request.contextPath}/groupMemberList?currentPage=${lastPage}">&raquo;</a>
					</li>
				</c:if>
			</ul>
		</nav>	
	</c:when>
	<c:otherwise>
		<input type="hidden" id="groupNo" value="${groupNoSend }">
		현재 그룹에 회원이 없습니다. 회원을 초대하시겠습니까?
		<input type="button" onclick="inviteMemberBtn()" value="회원초대하기">
	</c:otherwise>
</c:choose>
</body>
</html>