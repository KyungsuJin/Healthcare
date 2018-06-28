<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bloodPressure</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- jQuery -->
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
		//1주일전 혈압 검색
		$('#bloodPressureWeek').click(function(){
			today.setDate(today.getDate() -7)
			var startDate = today.yyyymmdd()
			var endDate = (new Date).yyyymmdd()
			console.log("endDate:"+endDate);
			console.log("startDate:"+startDate);
			location.href="${pageContext.request.contextPath}/bloodPressureSearch?startDate="+startDate+"&&endDate="+endDate; 
		 });
		//1개월전  혈압 검색
		$('#bloodPressureMonth').click(function(){
			today.setDate(today.getMonth() -1)
			var startDate = today.yyyymmdd()
			var endDate = (new Date).yyyymmdd()
			console.log("endDate:"+endDate);
			console.log("startDate:"+startDate);
			location.href="${pageContext.request.contextPath}/bloodPressureSearch?startDate="+startDate+"&&endDate="+endDate; 
		 });
		//6개월전  혈압 검색
		$('#bloodPressureSixMonth').click(function(){
			today.setDate(today.getMonth() -6)
			var startDate = today.yyyymmdd()
			var endDate = (new Date).yyyymmdd()
			console.log("endDate:"+endDate);
			console.log("startDate:"+startDate);
			location.href="${pageContext.request.contextPath}/bloodPressureSearch?startDate="+startDate+"&&endDate="+endDate;
		});
});	

//체크박스 전체선택
	function checkAll(){
	    if( $('#selectAll').is(':checked') ){
	      $('input:checkbox[name=bloodPressureCheck]').prop('checked', true);
	    }else{
	      $('input:checkbox[name=bloodPressureCheck]').prop('checked', false);
	    }
	}
	//선택해서 삭제하기
	function bloodPressureCheckDelete(){
	  $('input:checkbox[name="bloodPressureCheck"]:checked').each(function() {
		var bloodPressureNo = $(this).val();
		console.log('bloodPressureNo:'+bloodPressureNo);
		if(bloodPressureNo == ''){
			    alert('삭제할 대상을 선택하세요.');
			    return false;
		}
		var checkName = $.ajax({
			type : 'GET',
			data : {bloodPressureNo : bloodPressureNo},
			url : '${pageContext.request.contextPath}/bloodPressureNoCountToHealthScreen',
			dataType : 'json',
			contentType: 'application/json; charset=UTF-8',
			success : function(data){
				console.log(data);   
			if(data.count> 0){
				alert('현재 건강설문에서 사용중인 혈압 차트이기 때문에 삭제가 불가능합니다.');
			return count = 0;
			}else if(data.count == 0){
				alert(bloodPressureNo+'번이 삭제가 완료되었습니다.');
				location.href='${pageContext.request.contextPath}/deleteBloodPressure?bloodPressureNo='+bloodPressureNo;
				}
			}
		}); 
		checkName.fail(function(jqXHR, textStatus){
			alert( "Request failed: " + textStatus );
		});   
	  });
	}
	
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
			alert(startDate+'~'+endDate+'기간의 혈압리스트 검색이 완료되었습니다.');
			return true;
		}
	}  
	//혈압등록
	function addBloodPressure(){
		location.href="${pageContext.request.contextPath}/addBloodPressure";
	}	
	//혈압그래프
	function bloodPressureChart(){
		location.href="${pageContext.request.contextPath}/bloodPressureChart";
	}

</script>
<style>
th td{
text-align : center;
}
</style>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
			<h4>혈압리스트</h4>
			<!-- 기간 검색 -->   		
			<form class="form-inline" id="formSearch" name="formSearch" onsubmit="return formSearchcheck()" action="${pageContext.request.contextPath}/bloodPressureSearch" method="POST"> 
					시작일 :
					<input type="text" class="form-control" id="startDate" name="startDate">
				 	 종료일 :
					 <input type="text" class="form-control" id="endDate"name="endDate">
					<input type="submit" class="btn btn-sm btn-default" value="검색">
					<input type="button" class="btn btn-sm btn-default" id="bloodPressureWeek" value="1주일">
				    <input type="button" class="btn btn-sm btn-default" id="bloodPressureMonth" value="1개월">
				    <input type="button" class="btn btn-sm btn-default" id="bloodPressureSixMonth" value="6개월">
			</form>
			 <div id="searchResult">
				<c:choose>
				    <c:when test="${searchresult > 0 }">
						<span>총 ${result }개의 게시물을 찾았습니다.</span>
						<span>${startDate } ~ ${endDate }기간 동안의 혈압 등록 리스트 검색 결과입니다.</span>
				    </c:when>
				    <c:when test="${searchresult eq 0 }">
				 	   <span>${startDate } ~ ${endDate } 기간 동안의 해당하는 혈압 등록 리스트 검색 결과가 없습니다.</span>
				    </c:when>
			    </c:choose>
		    </div>
		    
		    <!-- 혈압리스트 -->
			<table class="table table-hover">		
				<thead>
					<tr>
						<th><input type="checkbox" class="checkbox" name="selectAll" id="selectAll" onclick="checkAll();"></th>
						<th>번호</th>
						<c:if test="${sessionScope.memberSessionLevel == 1 }">
						<th>회원번호</th>
						</c:if>
						<th>수축기</th>
						<th>이완기</th>
						<th>날짜</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bloodPressure" items="${list}">
						<tr>
							<td><input type="checkbox" class="checkbox" name="bloodPressureCheck" value="${bloodPressure.bloodPressureNo }"/></td>
							<td>${bloodPressure.bloodPressureNo}</td>
							<c:if test="${sessionScope.memberSessionLevel == 1 }">
							<td>${bloodPressure.memberNo}</td>
							</c:if>
							<td>${bloodPressure.diastolicPressure}</td>
							<td>${bloodPressure.systolicPressure}</td>
							<td>${bloodPressure.bloodPressureDate}</td>
							<td><a type="button" class="btn btn-sm btn-default" href="${pageContext.request.contextPath}/modifyBloodPressure?bloodPressureNo=${bloodPressure.bloodPressureNo}">수정</a></td>
						</tr>
					</c:forEach>
				</tbody>	
			</table>
				<input type="button" class="btn btn-sm btn-default" onclick="bloodPressureCheckDelete()" value="선택삭제하기">
				<div align="right">
				<c:if test="${sessionScope.memberSessionLevel != 1 }">
					<input type="button" class="btn btn-sm btn-default" onclick="bloodPressureChart()" value="혈압그래프보기">
				</c:if>
				<c:if test="${sessionScope.memberSessionLevel == 1 }">
					<input type="button" class="btn btn-sm btn-default" onclick="bloodPressureChart()" value="혈압그래프보기">
				</c:if>
					<input type="button" class="btn btn-sm btn-default" onclick="addBloodPressure()" value="혈압등록하기">			
				</div>
				<div align="center">
					<nav>
						<ul class="pagination pagination-sm">
							<c:if test="${currentPage > 5}">
								<li>
									<a aria-label="first" href="${pageContext.request.contextPath }/bloodPressure?currentPage=1">&laquo;</a>
								</li>
							</c:if>
							<c:if test="${firstBlockPage > 2}">
								<li>
									<a aria-label="first" href="${pageContext.request.contextPath }/bloodPressure?currentPage=${firstBlockPage-1}">&lsaquo;</a>
								</li>
							</c:if>
								<li>
								<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
									<a href="${pageContext.request.contextPath}/bloodPressure?currentPage=${i}">${i}</a>				
								</c:forEach>		
								</li>
							<c:if test="${lastBlockPage < totalBlock}">
								<li>
									<a aria-label="last" href="${pageContext.request.contextPath}/bloodPressure?currentPage=${lastBlockPage+1}">&rsaquo;</a>
								</li>
							</c:if>
							<c:if test="${currentPage < lastPage}">
								<li>
									<a aria-label="last" href="${pageContext.request.contextPath}/bloodPressure?currentPage=${lastPage}">&raquo;</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</body>
</html>