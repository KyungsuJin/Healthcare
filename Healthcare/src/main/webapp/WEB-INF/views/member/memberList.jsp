<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
				$.ajax({
					type : "GET"
					,url : "${pageContext.request.contextPath}/memberList"
					,data :
							{"memberLevel":2 
							,"currentPage":$("#currentPage").val()
							,"searchSelect" : $("#searchSelect").val()
							,"searchText" :$("#searchText").val()
							}
					,datatype : "json"
					,success:function(data){
						console.log(data.endPage);
						$.each(data.memberList,function(key,val){	
							console.log(data.memberList);
							$("#tbody").append('<tr><td>'+val.memberNo+'</td>'+
											'<td>'+val.memberId+'</td>'+
											'<td>'+val.memberName+'</td>'+
											'<td>'+val.memberGender+'</td>'+
											'<td>'+val.memberAddress+'</td>'+
											'<td>'+val.memberTel+'</td>'+
											'<td>'+val.memberEmail+'</td>'+
											'<td>'+val.memberBirth+'</td>'+
											'<td>'+val.memberPoint+'</td>'+
											'<td>'+val.memberJoinDate+'</td>'+
											'<td>'+val.memberAgree+'</td>'+
											'<td><a href="${pageContext.request.contextPath}/memberExpulsion?memberId='+val.memberId+'&memberLevel='+val.memberLevel+'">강퇴</a></td></tr>'
											);
						});
							if(data.currentPage>1){
								$("#pageUl").append('<li><a href="${pageContext.request.contextPath}/basicMemberList?currentPage=1&searchSelect='+$("#searchSelect").val()+'&searchTextTest='+$("#searchText").val()+'"><span aria-hidden="true">&laquo;</span></a></li>');
								$("#pageUl").append('<li><a href="${pageContext.request.contextPath}/basicMemberList?currentPage='+(data.currentPage-1)+'&searchSelect='+$("#searchSelect").val()+'&searchTextTest='+$("#searchText").val()+'">이전</a></li>');
							}
							for(var i = data.startPage;i<=data.endPage; i++){
								$("#pageUl").append('<li><a href="${pageContext.request.contextPath}/basicMemberList?currentPage='+i+'&searchSelect='+$("#searchSelect").val()+'&searchTextTest='+$("#searchText").val()+'"> ' +i+ ' </a></li>');
							}
							if(data.lastPage>data.currentPage){
								$("#pageUl").append('<li><a href="${pageContext.request.contextPath}/basicMemberList?currentPage='+(data.currentPage+1)+'&searchSelect='+$("#searchSelect").val()+'&searchTextTest='+$("#searchText").val()+'">다음</a></li>');
								$("#pageUl").append('<li><a href="${pageContext.request.contextPath}/basicMemberList?currentPage='+data.lastPage+'&searchSelect='+$("#searchSelect").val()+'&searchTextTest='+$("#searchText").val()+'"><span aria-hidden="true">&raquo;</span></a></li>');
							}
							$('li').find('a').each(function(){//li의 자식 a인것을 다찾는다
								if($(this).text() == data.currentPage){//만약 text 값이 현재페이지값과 같다면
									$(this).closest('li').addClass('active');//closest 를이용해 가장 가까운 li 를 찾아 class =active 를 추가해준다.
								}
							});
					}
				});
			 $("#searchBtn").click(function(){
				 window.location.href='${pageContext.request.contextPath}/basicMemberList?searchSelect='+$("#searchSelect").val()+'&searchTextTest='+$("#searchTextTest").val();
			}); 
			
		});

	</script>
</head>
<body>
	<div class="card">
		<div class="card-header" data-background-color="purple">
			<h4 class="title">회원 리스트</h4>
		</div>
	</div>
	<div class="container"  style="overflow:scroll;">
		<table  border="1" class="table">
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
					<th>강퇴</th>
				</tr>
			</thead>
			<tbody id="tbody">
			</tbody>
		</table>
	</div>
	<div id="page"	style="text-align:center">
		<ul class="pagination pagination-sm" id="pageUl">
		</ul>
	</div>
	<div class="navbar-form navbar-right">
		<div class="form-group">
			<form>
				<input type="hidden" name="currentPage" id="currentPage" value="${currentPage}">
				<input type="hidden" name="searchText" id="searchText" value="${searchText}">
					<select class="form-control" id="searchSelect" name="searchSelect">
						<option value="member_id">아이디</option>
						<option <c:out value="${searchSelect eq 'member_name' ? 'selected=selected':''}"/> value="member_name">이름</option>
						<option <c:out value="${searchSelect eq 'member_no' ? 'selected=selected':''}"/> value="member_no">회원번호</option>
					</select>
					<input class="form-control" type="text" id="searchTextTest" name="searchTextTest">
					<button  class="btn btn-white btn-round btn-just-icon" type="button" id="searchBtn"><i class="material-icons">search</i></button>
			</form>
		</div>
	</div>
</body>
</html>