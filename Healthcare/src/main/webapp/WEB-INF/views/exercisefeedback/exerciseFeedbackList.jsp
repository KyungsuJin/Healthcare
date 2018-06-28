<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>exerciseFeedbackList</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript">
	//날짜 형식 
	Date.prototype.yyyymmdd = function(){
	 var yyyy = this.getFullYear().toString();
	    var mm = (this.getMonth() + 1).toString();
	    var dd = this.getDate().toString();
	    return yyyy +"-"+(mm[1] ? mm : '0'+mm[0])+"-"+(dd[1] ? dd : '0'+dd[0]);
	}
	var today = new Date()

$(document).ready(function(){
	//검색 달력 생성
	var rangeDate = 31; // set limit day
	var setSdate, setEdate;
	  $.datepicker.setDefaults({
		    dateFormat: 'yy-mm-dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    showMonthAfterYear: true,
		    yearSuffix: '년'
		  });

		  $(function() {
		    $("#startDate, #endDate").datepicker();
		  });
});
	//기간별 검색
	function formSearchcheck(){
   		var startDate = $('#startDate').val();
   		var endDate = $('#endDate').val();
   		console.log("startDate:"+startDate);
   		console.log("endDate:"+endDate);
 		if(startDate == ''|| startDate == null){
			alert('날짜를 입력해주세요.');
			formSearch.startDate.focus();
			return false;
		}else if(endDate == ''|| endDate == null){
			alert('날짜를 입력해주세요.');
			formSearch.endDate.focus();
			return false;
		}else{ 
			alert(startDate+'~'+endDate+'기간의 리스트 검색이 완료되었습니다.');
			return true;
		
	}  
	//1주일전 검색
	function SearchWeek(){
			today.setDate(today.getDate() -3)
		var startDate = today.yyyymmdd()
		var endDate = (new Date).yyyymmdd()
		console.log("endDate:"+endDate);
		console.log("startDate:"+startDate);
		location.href="${pageContext.request.contextPath}/exerciseFeedbackListSearch?startDate="+startDate+"&&endDate="+endDate; 
	}
	//1개월전 검색
	function SearchMonth(){
			today.setDate(today.getMonth() -1)
			var startDate = today.yyyymmdd()
			var endDate = (new Date).yyyymmdd()
			console.log("endDate:"+endDate);
			console.log("startDate:"+startDate);
			location.href="${pageContext.request.contextPath}/exerciseFeedbackListSearch?startDate="+startDate+"&&endDate="+endDate; 
	}
	//6개월전 검색
	function SearchSixMonth(){
			today.setDate(today.getMonth() -6)
			var startDate = today.yyyymmdd()
			var endDate = (new Date).yyyymmdd()
			console.log("endDate:"+endDate);
			console.log("startDate:"+startDate);
			location.href="${pageContext.request.contextPath}/exerciseFeedbackListSearch?startDate="+startDate+"&&endDate="+endDate; 
	}
	
</script>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
			<h1>운동피드백요청리스트</h1>
				<!-- 기간 검색 -->   		
				<form id="formSearch" name="formSearch" onsubmit="return formSearchcheck()" action="${pageContext.request.contextPath}/exerciseFeedbackListSearch" method="POST"> 
				<h4>기간별 검색</h4>
					<div> 
						시작일 :
						<input type="text" id="startDate" name="startDate">
					</div>
					<div>
					 	 종료일 :
						 <input type="text" id="endDate" name="endDate">
					 </div>
					 <div>
						<input class="btn btn-sm btn-default" type="submit" value="검색">
					</div>
				</form>
					<input type="button" class="btn btn-sm btn-default" onclick="SearchWeek()" value="1주일">
				    <input type="button" class="btn btn-sm btn-default" onclick="SearchMonth()" value="1개월">
				    <input type="button" class="btn btn-sm btn-default" onclick="SearchSixMonth()" value="6개월">
				<c:choose>
					<c:when test="${result > 0 }">
						총 ${result }개의 게시물을 찾았습니다.
						${startDate } ~ ${endDate }기간 동안의 리스트 검색 결과입니다.
					</c:when>
					<c:when test="${result eq 0 }">
						${startDate } ~ ${endDate } 기간 동안의 해당하는 리스트 검색 결과가 없습니다.
					</c:when>
				</c:choose>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>피드백번호</th>
							<th>강사명</th>
							<th>제목</th>
							<th>내용</th>
							<th>요청날짜</th>
							<th>승인결과</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="exerciseFeedback" items="${list}">
						<tr>
							<td>${exerciseFeedback.exerciseFeedbackRequestNo }</td>
							<td>${exerciseFeedback.memberName }</td>
							<td>${exerciseFeedback.exerciseFeedbackRequestTitle }</td>
							<td>${exerciseFeedback.exerciseFeedbackRequestContent }</td>
							<td>${exerciseFeedback.exerciseFeedbackRequestDate }</td>
							<td>${exerciseFeedback.exerciseFeedbackResult }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<nav>
					<ul class="pagination pagination-sm">
						<c:if test="${currentPage > 10}">
							<li>
								<a aria-label="first" href="${pageContext.request.contextPath }/exerciseFeedbackList?currentPage=1">&laquo;</a>
							</li>
						</c:if>
						<c:if test="${firstBlockPage > 2}">
							<li>
								<a aria-label="first" href="${pageContext.request.contextPath }/exerciseFeedbackList?currentPage=${firstBlockPage-1}">&lsaquo;</a>
							</li>
						</c:if>
							<li>
							<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
								<a href="${pageContext.request.contextPath}/exerciseFeedbackList?currentPage=${i}">${i}</a>				
							</c:forEach>		
							</li>
						<c:if test="${lastBlockPage < totalBlock}">
							<li>
								<a aria-label="last" href="${pageContext.request.contextPath}/exerciseFeedbackList?currentPage=${lastBlockPage+1}">&rsaquo;</a>
							</li>
						</c:if>
						<c:if test="${currentPage < lastPage}">
							<li>
								<a aria-label="last" href="${pageContext.request.contextPath}/exerciseFeedbackList?currentPage=${lastPage}">&raquo;</a>
							</li>
						</c:if>
					</ul>
				</nav>
	 		</div>
		</div>
	</div>
</body>
</html>