<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			/* 운동매칭 리스트 출력 및 페이징 */
			$.ajax({
				type: "POST"
				,data :{"currentPage" :$("#currentPage").val()
						,"searchSelect" : $("#searchSelect").val()
						,"searchText" :$("#searchText").val()
						,"exerciseDateStart" :$("#exerciseDateStart").val()
						,"exerciseDateEnd" : $("#exerciseDateEnd").val()
						}
				,url : "${pageContext.request.contextPath}/exerciseMatchingList"
				,dateType: "json"
				,success:function(data){
					console.log(data.exerciseMatchingList);
					exerciseMatchingList(data);
				}
			});
			function exerciseMatchingList(data){
				console.log(data);
				var currentDate =new Date();
				$.each(data.exerciseMatchingList,function(key,val){
					console.log("현재날짜:"+currentDate);
					console.log("게임날짜:"+new Date(val.exerciseMatchingScheduleDate));
					$("#tbody").append('<tr><td class="exerciseMatchingCondition'+key+'"></td>'+
										'<td><a class="exerciseMatchingTitle'+key+'" href="${pageContext.request.contextPath}/exerciseMatchingContent?exerciseMatchingNo='+val.exerciseMatchingNo+'">'+val.exerciseMatchingTitle+'</a></td>'+
										'<td>'+val.exerciseNo+'</td>'+
										'<td><a href="#" class="matchingPlace">'+val.exerciseMatchingPlace+'</a></td>'+
										'<td>'+val.exerciseMatchingAttendCount+'/'+val.exerciseMatchingCount+'</td>'+
										'<td>'+val.exerciseMatchingScheduleDate+'/'+val.exerciseMatchingTime.replace(",","~")+'</td>'+
										'<td>'+val.memberId+'</td><input type="hidden" value="'+val.exerciseMatchingNo+'"></tr>'
										);
					/*운동매칭의 상태정보를 나태냄  */
					if(val.exerciseMatchingAttendCount < val.exerciseMatchingCount){
						$(".exerciseMatchingCondition"+key).text('모집중');
					}
					if(val.exerciseMatchingAttendCount=== val.exerciseMatchingCount){
						$(".exerciseMatchingCondition"+key).text('모집마감');
						console.log(currentDate);
					}
					if (new Date(val.exerciseMatchingScheduleDate) <= currentDate ){
						$(".exerciseMatchingCondition"+key).text('진행중');
					}
					if(new Date(val.exerciseMatchingScheduleDate) <= currentDate && val.exerciseMatchingAttendCount < val.exerciseMatchingCount){
						$(".exerciseMatchingCondition"+key).text('모집탈락');
						$(".exerciseMatchingTitle"+key).attr("href","#");
						$(".exerciseMatchingTitle"+key).css('color','black');
					}
					if(val.exerciseMatchingResult==1){
						$(".exerciseMatchingCondition"+key).text('완료');
						$(".exerciseMatchingTitle"+key).attr("href","#");
						$(".exerciseMatchingTitle"+key).css('color','black');
					}
				});
				/* 페이징 */
				if(data.currentPage>1){
					$("#pageUl").append('<li><a href="${pageContext.request.contextPath}/exerciseSearchList?currentPage=1&searchSelect='+$("#searchSelect").val()+'&searchTextTest='+$("#searchText").val()+'" ><span aria-hidden="true">&laquo;</span></a></li>');
					$("#pageUl").append('<li><a href="${pageContext.request.contextPath}/exerciseSearchList?currentPage='+(data.currentPage-1)+'&searchSelect='+$("#searchSelect").val()+'&searchTextTest='+$("#searchText").val()+'">이전 </a></li>');
				}
				for(var i =data.startPage; i <=data.endPage ; i++){
						$("#pageUl").append('<li><a href="${pageContext.request.contextPath}/exerciseSearchList?currentPage='+i+'&searchSelect='+$("#searchSelect").val()+'&searchTextTest='+$("#searchText").val()+'">'+i+'</a></li>');
				}
				
				if(data.currentPage<data.lastPage){
					$("#pageUl").append('<li><a href="${pageContext.request.contextPath}/exerciseSearchList?currentPage='+(data.currentPage+1)+'&searchSelect='+$("#searchSelect").val()+'&searchTextTest='+$("#searchText").val()+'">다음</a></li>');
					$("#pageUl").append('<li><a href="${pageContext.request.contextPath}/exerciseSearchList?currentPage='+(data.lastPage)+'&searchSelect='+$("#searchSelect").val()+'&searchTextTest='+$("#searchText").val()+'"><span aria-hidden="true">&raquo;</span></a></li>');
				}
				
				$('li').find('a').each(function(){//li의 자식 a인것을 다찾는다
					if($(this).text() == data.currentPage){//만약 text 값이 현재페이지값과 같다면
						$(this).closest('li').addClass('active');//closest 를이용해 가장 가까운 li 를 찾아 class =active 를 추가해준다.
					}
				});
			}
			$(document).on("click",".page",function(){
				$(this).parent().addClass("active");
			});
			$(document).on("click",".matchingPlace",function(){
				$("#exercisePlaceView").val($(this).text());
				console.log($("#exercisePlaceView").val());
				    	window.open("${pageContext.request.contextPath}/exercisePlaceView"
				    			,"Registration","width=800, height=500,resizable=no,scrollbars=yes");
			});
			$("#searchBtn").click(function(){
				window.location.href='${pageContext.request.contextPath}/exerciseSearchList?searchSelect='+$("#searchSelect").val()+'&searchTextTest='+$("#searchTextTest").val();
			})
			$("#dateBtn").click(function(){
				if($("#exerciseDateStart").val() <= $("#exerciseDateEnd").val()){
					window.location.href='${pageContext.request.contextPath}/exerciseSearchList?searchSelect=exercise.exercise_matching_schedule_date&exerciseDateStart='+$("#exerciseDateStart").val()+'&exerciseDateEnd='+$("#exerciseDateEnd").val();	
				}else{
					alert('검색 시작날짜가 더클수는 없습니다.');
				}
				
			})
		});
	</script>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<h1>운동매칭</h1><a href="${pageContext.request.contextPath}/addExerciseMatching" class="btn btn-primary pull-right">운동매칭 글등록</a>
				<input type="hidden" name="exercisePlaceView" id="exercisePlaceView">
				<input type="hidden" name="currnetPage" id="currentPage"
					value="${currentPage}"> <input type="hidden"
					name="searchText" id="searchText" value="${searchText}">
				<table  class="table table-hover" id="tb">
					<thead>
						<tr>
							<th>현재상태</th>
							<th>제목</th>
							<th>종목</th>
							<th>장소</th>
							<th>참가/모집(인원)</th>
							<th>일시</th>
							<th>아이디</th>
						</tr>
					</thead>
					<tbody id="tbody">
					</tbody>
				</table>
				<div id="page"	style="text-align:center">
					<ul class="pagination pagination-sm" id="pageUl">
							
					</ul>
				</div>
				<div class="navbar-form navbar-left">
					<div class="form-group" style="margin:0px">
						<select class="form-control" id="searchSelect" name="searchSelect">
							<option value="exercise_matching_place">장소</option>
							<option <c:out value="${searchSelect eq 'member.member_no' ? 'selected=selected':''}"/> value="member.member_no">아이디</option>
							<option <c:out value="${searchSelect eq 'exercise_no' ? 'selected=selected':''}"/> value="exercise_no">종목</option>
						</select> 
						<input class="form-control" type="text" id="searchTextTest" name="searchTextTest" value="${searchText}">
						<button class="btn btn-white btn-round btn-just-icon" type="button" id="searchBtn"><i class="material-icons">search</i></button>
					</div>
				</div>
				<div  class="navbar-form navbar-right" id="dateDiv">
					<div class="form-group" style="margin:0px">
						<label class="">기간</label>
						<input class="form-control" type="date" id="exerciseDateStart" value="${exerciseDateStart}">
						<label class="control-label">~</label>
						<input class="form-control" type="date" id="exerciseDateEnd" value="${exerciseDateEnd}">
						<button type="button" class="btn btn-white btn-round btn-just-icon" id="dateBtn"><i class="material-icons">search</i></button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
