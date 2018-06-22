<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>deleteGroupList</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	//체크박스 전체선택
	function checkAll(){
	    if( $('#selectAll').is(':checked') ){
	      $('input:checkbox[name=deleteGroupcheck]').prop('checked', true);
	    }else{
	      $('input:checkbox[name=deleteGroupcheck]').prop('checked', false);
	    }
	}
	//선택해서 취소
	function deleteGroupcheckCancle(){
	  $('input:checkbox[name="deleteGroupcheck"]:checked').each(function() {
		var groupNo = $(this).val();
		console.log('groupNo:'+groupNo);
		if(groupNo == ''){
			    alert('삭제할 대상을 선택하세요.');
			    return false;
		}else{
			if(confirm('그룹 삭제 진행을 취소하시겠습니까?')){
				alert('그룹 삭제 진행이 취소 되었습니다.');
				location.href="${pageContext.request.contextPath}/groupDeleteCancle?groupNo="+groupNo;
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
			<h1>그룹삭제유예기간리스트</h1>
			 	<form id="formSearch" name="formSearch" onsubmit="return formSearchcheck()" action="${pageContext.request.contextPath}/deleteGroupListSearch" method="post">
					<select name="keyOption" size="1">
			            <option value="all" <c:if test="${'all'==keyOption }"> selected</c:if>>전체검색</option>
			            <option value="groupName" <c:if test="${'systolicPressure'==keyOption }"> selected</c:if>>그룹명</option>
			            <option value="groupKindName" <c:if test="${'diastolicPressure'==keyOption }"> selected</c:if>>그룹종류</option>
			        </select>
					<input type="text" id="keyWord" name="keyWord" value="${keyWord}"/>
					<button type="submit">검색</button>  
			    </form> 
				<table>
					<thead>
						<tr>
							<th><input type="checkbox" name="selectAll" id="selectAll" onclick="checkAll();"></th>
							<th>그룹명</th>
							<th>그룹종류</th>
							<th>그룹상세</th>
							<th>날짜</th>
							<th>삭제예정날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="deleteGroup" items="${list}">
						<tr>
							<td><input type="checkbox" name="deleteGroupcheck" value="${deleteGroup.groupNo}"/></td>
							<td>${deleteGroup.groupName }</td>
							<td>${deleteGroup.groupKindName }</td>
							<td>${deleteGroup.groupInfo }</td>
							<td>${deleteGroup.groupCreateDate }</td>
							<td>${deleteGroup.groupExpiredDate }</td>		
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<input type="button" onclick="deleteGroupcheckCancle()" value="그룹삭제취소">
				<a href="${pageContext.request.contextPath}/groupList">그룹리스트로 돌아가기</a>
				<nav>
					<ul class="pagination pagination-sm">
						<c:if test="${currentPage > 10}">
							<li>
								<a aria-label="first" href="${pageContext.request.contextPath }/deleteGroupList?currentPage=1">&laquo;</a>
							</li>
						</c:if>
						<c:if test="${firstBlockPage > 2}">
							<li>
								<a aria-label="first" href="${pageContext.request.contextPath }/deleteGroupList?currentPage=${firstBlockPage-1}">&lsaquo;</a>
							</li>
						</c:if>
							<li>
							<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
								<a href="${pageContext.request.contextPath}/deleteGroupList?currentPage=${i}">${i}</a>	
							</c:forEach>		
							</li>
						<c:if test="${lastBlockPage < totalBlock}">
							<li>
								<a aria-label="last" href="${pageContext.request.contextPath}/deleteGroupList?currentPage=${lastBlockPage+1}">&rsaquo;</a>
							</li>
						</c:if>
						<c:if test="${currentPage < lastPage}">
							<li>
								<a aria-label="last" href="${pageContext.request.contextPath}/deleteGroupList?currentPage=${lastPage}">&raquo;</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>