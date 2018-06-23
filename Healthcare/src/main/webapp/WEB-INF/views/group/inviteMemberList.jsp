<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>inviteMemberList</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript">
//체크박스 전체선택
function checkAll(){
    if( $('#selectAll').is(':checked') ){
      $('input:checkbox[name=groupInviteCheck]').prop('checked', true);
    }else{
      $('input:checkbox[name=groupInviteCheck]').prop('checked', false);
    }
}
//선택해서 삭제하기
function outGroupMember(){
  $('input:checkbox[name="groupInviteCheck"]:checked').each(function() {
	var groupInviteNo = $(this).val();
	console.log('groupInviteNo:'+groupInviteNo);
	if(groupInviteNo == ''){
		    alert('추방할 회원을 선택하세요.');
		    return false;
	}else{
		if(confirm('추방하시겠습니까?')){
			alert('회원이 추방 되었습니다.');
			location.href="${pageContext.request.contextPath}/groupInviteMemberCancle?groupInviteNo="+groupInviteNo;
		}
	}	
  });
}
</script>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<h1>초대한 회원 리스트</h1>
					<table>
						<thead>
							<tr>
								<th><input type="checkbox" name="selectAll" id="selectAll" onclick="checkAll();"></th>
								<th>아이디</th>					
								<th>이름</th>
								<th>초대</th>
								<th>초대한그룹명</th>
								<th>초대승인여부</th>
								<th>초대날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="groupInvite" items="${list}">
								<tr>
									<td><input type="checkbox" name="groupInviteCheck" value="${groupInvite.groupInviteNo}"/></td>
									<th>${groupInvite.memberId }</th>					
									<th>${groupInvite.memberName }</th>
									<th>${groupInvite.groupName}</th>
									<th>${groupInvite.groupInviteApproval }</th>
									<th>${groupInvite.groupInviteDate }</th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<input type="button" onclick="outGroupMember()" value="초대취소하기">
					<nav>
						<ul class="pagination pagination-sm">
							<c:if test="${currentPage > 10}">
								<li>
									<a aria-label="first" href="${pageContext.request.contextPath }/inviteMemberList?currentPage=1">&laquo;</a>
								</li>
							</c:if>
							<c:if test="${firstBlockPage > 2}">
								<li>
									<a aria-label="first" href="${pageContext.request.contextPath }/inviteMemberList?currentPage=${firstBlockPage-1}">&lsaquo;</a>
								</li>
							</c:if>
								<li>
								<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
									<a href="${pageContext.request.contextPath}/inviteMemberList?currentPage=${i}">${i}</a>	
								</c:forEach>		
								</li>
							<c:if test="${lastBlockPage < totalBlock}">
								<li>
									<a aria-label="last" href="${pageContext.request.contextPath}/inviteMemberList?currentPage=${lastBlockPage+1}">&rsaquo;</a>
								</li>
							</c:if>
							<c:if test="${currentPage < lastPage}">
								<li>
									<a aria-label="last" href="${pageContext.request.contextPath}/inviteMemberList?currentPage=${lastPage}">&raquo;</a>
								</li>
							</c:if>
						</ul>
					</nav>	
			</div>
		</div>
	</div>
</body>
</html>