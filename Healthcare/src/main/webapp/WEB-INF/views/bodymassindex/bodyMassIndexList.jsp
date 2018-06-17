<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$(".deleteBmi").click(function(){
				var bodyMassIndexNo=$(this).val();
				$.ajax({
					type : "POST"
					,url : "${pageContext.request.contextPath}/deleteBmi"
					,data :{"bodyMassIndexNo":bodyMassIndexNo}
					,dataType :"json"
					,success:function(data){
						if(data==0){
							alert('삭제되었습니다.')
							window.location.href="${pageContext.request.contextPath}/bodyMassIndexList?memberNo=${sessionScope.memberSessionNo}"
						}else{
							alert('해당 체질량정보는 건강검진표에 등록되어있습니다.삭제하시려면 건강검진표에 등록된체질량정보부터 삭제해주세요');
						}
					}
				});
			});
			$(".modifyBmi").click(function(){
				var bodyMassIndexNo=$(this).val();
				$.ajax({
					type : "POST"
					,url : "${pageContext.request.contextPath}/healtScreenCount"
					,data :{"bodyMassIndexNo":bodyMassIndexNo}
					,dataType :"json"
					,success:function(data){
						if(data==0){
							window.location.href="${pageContext.request.contextPath}/modifyBmi?bodyMassIndexNo="+bodyMassIndexNo;
						}else{
							alert('해당 체질량정보는 건강검진표에 등록되어있습니다.수정하시려면 건강검진표에 등록된체질량정보부터 삭제해주세요');
						}
					}
				});
			});
		});
	</script>
	
</head>
<body>
	<h1>체질량 관리</h1>
	<a href="${pageContext.request.contextPath}/addBodyMassIndex">체질량 등록</a>
	<a href="${pageContext.request.contextPath}/bodyMassIndexChart">체질량 차트</a>
	<table border="1" class="table">
		<thead>
			<tr>
				<th>키</th>
				<th>몸무게</th>
				<th>허리둘레</th>
				<th>BMI</th>
				<th>등록날짜</th>
				<th>삭제</th>
				<th>수정</th>
			</tr>
		</thead>
		<tbody id="tbody">
			<c:forEach items="${bodyMassIndexList}" var="bodyMassIndexList">
				
				<tr>
					
					<td>${bodyMassIndexList.bodyHeight}</td>
					<td>${bodyMassIndexList.bodyWeight}</td>
					<td>${bodyMassIndexList.bodyWaistSize}</td>
					<td>${bodyMassIndexList.bodyMassIndex}</td>
					<td>${bodyMassIndexList.bodyDate}</td>
					<td><button type="button" class="deleteBmi" value="${bodyMassIndexList.bodyMassIndexNo}">삭제</button></td>
					<td><button type="button" class="modifyBmi" value="${bodyMassIndexList.bodyMassIndexNo}">수정</button></td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
			<nav>
				<div id="pageDiv">
	  				<ul class="pagination pagination-sm">
	  					<li>
							<c:if test="${currentPage>1}">
								<a href="${pageContext.request.contextPath}/bodyMassIndexList?currentPage=1&memberNo=${sessionScope.memberSessionNo}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
								<a href="${pageContext.request.contextPath}/bodyMassIndexList?currentPage=${currentPage-1}&memberNo=${sessionScope.memberSessionNo}">이전</a>
							</c:if>
						</li>
						<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
							
								<li <c:out value="${currentPage eq i ? 'class=active': ''}"/>><a class="" href="${pageContext.request.contextPath}/bodyMassIndexList?currentPage=${i}&memberNo=${sessionScope.memberSessionNo}">${i}</a></li>
							
						</c:forEach>
						<li>
							<c:if test="${lastPage>currentPage}">
								<a href="${pageContext.request.contextPath}/bodyMassIndexList?currentPage=${currentPage+1}&memberNo=${sessionScope.memberSessionNo}">다음</a>
								<a href="${pageContext.request.contextPath}/bodyMassIndexList?currentPage=${lastPage}&memberNo=${sessionScope.memberSessionNo}"><span aria-hidden="true">&raquo;</span></a>
							</c:if>
						</li>
					</ul>
				</div>
			</nav>

</body>
</html>