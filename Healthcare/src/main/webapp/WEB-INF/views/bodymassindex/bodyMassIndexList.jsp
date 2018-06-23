<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			/* bmi 정보 삭제시 건강검진표에 등록되어있나 확인 */
			$(document).on("click",".deleteBmi",function(){
				var bodyMassIndexNo=$(this).val();
				$.ajax({
					type : "POST"
					,url : "${pageContext.request.contextPath}/deleteBmi"
					,data :{"bodyMassIndexNo":bodyMassIndexNo}
					,dataType :"json"
					,success:function(data){
						if(data==0){
							alert('삭제되었습니다.');
							window.location.href="${pageContext.request.contextPath}/bodyMassIndexList?memberNo=${sessionScope.memberSessionNo}"
						}else{
							alert('해당 체질량정보는 건강검진표에 등록되어있습니다.삭제하시려면 건강검진표에 등록된체질량정보부터 삭제해주세요');
						}
					}
				});
			});
			/* bmi 정보 수정시 건강검진표에 등록되어있나 확인 */
			$(document).on("click",".modifyBmi",function(){
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
			/* bmi 검색시 검색 정보 */
			$("#bodyMassIndexDateSearchBtn").click(function(){
				console.log($("#bodyMassIndexDateStart").val());
				console.log($("#bodyMassIndexDateEnd").val());
				$.ajax({
						type : "POST"
						,url : "${pageContext.request.contextPath}/bodyMassIndexDateSearchList"
						,data :{"currentPage":$("#receiveCurrentPage").val()
								,"memberNo":$("#memberNo").val()
								,"bodyMassIndexDateStart":$("#bodyMassIndexDateStart").val()
								,"bodyMassIndexDateEnd":$("#bodyMassIndexDateEnd").val()
								}
						,dataType :"json"
						,success:function(data){
							console.log(data);
							$("#tbody").empty();
							$("#pageUl").empty();
							$("#pageUl").append("<input type='hidden' id='endPage' value='"+data.endPage+"'>");
							$.each(data.list,function(key,val){	
							$("#tbody").append('<tr><td>'+val.bodyHeight+'</td>'+
												'<td>'+val.bodyWeight+'</td>'+
												'<td>'+val.bodyWaistSize+'</td>'+
												'<td>'+val.bodyMassIndex+'</td>'+
												'<td>'+val.bodyDate+'</td>'+
												'<td><button type="button" class="deleteBmi" value="'+val.bodyMassIndexNo+'">삭제</button></td>'+
												'<td><button type="button" class="modifyBmi" value="'+val.bodyMassIndexNo+'">수정</button></td></tr>'
												);
							
						});
							if(data.currentPage>1){
								$("#pageUl").append("<li><a class='bodyMassIndexDateSaerchListPageStart' href='javascript:void(0);'><span aria-hidden='true'>&laquo;</span></a></li>");
								$("#pageUl").append("<li><a class='bodyMassIndexDateSaerchListPageBack' href='javascript:void(0);'>이전</a></li>");
							}
							for(var i =data.startPage; i <=data.endPage ; i++){
								$("#pageUl").append("<li><a class='bodyMassIndexDateSaerchListPage' href='javascript:void(0);'>"+i+"</a></li>");
							}
							if(data.currentPage<data.lastPage){
								$("#pageUl").append("<li><a class='bodyMassIndexDateSaerchListPageNext' href='javascript:void(0);'>다음</a></li>");
								$("#pageUl").append("<li><a class='bodyMassIndexDateSaerchListPageEnd' href='javascript:void(0);'><span aria-hidden='true'>&raquo;</span></a></li>");
							}
							$('li').find('a').each(function(){//li의 자식 a인것을 다찾는다
								if($(this).text() == data.currentPage){//만약 text 값이 현재페이지값과 같다면
									$(this).closest('li').addClass('active');//closest 를이용해 가장 가까운 li 를 찾아 class =active 를 추가해준다.
								}
							});
							 
						}
					});
				});
				//페이징 클릭시  메시지받은함 다시실행
				$(document).on("click",".bodyMassIndexDateSaerchListPage",function(){
					console.log($(this).text());
					$("#receiveCurrentPage").val($(this).text());
					$("#bodyMassIndexDateSearchBtn").click();
				});
				$(document).on("click",".bodyMassIndexDateSaerchListPageBack",function(){
					$("#receiveCurrentPage").val(Number($("#receiveCurrentPage").val())-1);
					$("#bodyMassIndexDateSearchBtn").click();
				});
				$(document).on("click",".bodyMassIndexDateSaerchListPageNext",function(){
					$("#receiveCurrentPage").val(Number($("#receiveCurrentPage").val())+1);
					$("#bodyMassIndexDateSearchBtn").click();
				});
				$(document).on("click",".bodyMassIndexDateSaerchListPageStart",function(){
					$("#receiveCurrentPage").val(1);
					$("#bodyMassIndexDateSearchBtn").click();
				});
				$(document).on("click",".bodyMassIndexDateSaerchListPageEnd",function(){
					$("#receiveCurrentPage").val(Number($("#endPage").val()));
					$("#bodyMassIndexDateSearchBtn").click();
				});
			});
	</script>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<input type="hidden" id="receiveCurrentPage">
				<h1>체질량 관리</h1>
				<table  class="table table-hover">
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
					<div id="pageDiv" style="text-align:center">
		  				<ul class="pagination pagination-sm" id="pageUl">
		  					<li>
								<c:if test="${currentPage>1}">
									<a href="${pageContext.request.contextPath}/bodyMassIndexList?currentPage=1&memberNo=${sessionScope.memberSessionNo}"><span aria-hidden="true">&laquo;</span></a>
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
				<div  class="navbar-form navbar-right" id="dateDiv">
					<form>
						<input type="hidden" id="memberNo" value="${sessionScope.memberSessionNo}">
						<div class="form-group">
							<label class="">기간</label>
							<input class="form-control" type="date" id="bodyMassIndexDateStart">
							<label class="control-label">~</label>
							<input class="form-control" type="date" id="bodyMassIndexDateEnd">
							<button type="button" class="btn btn-white btn-round btn-just-icon" id="bodyMassIndexDateSearchBtn"><i class="material-icons">search</i></button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>