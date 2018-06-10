<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bloodPressure</title>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
   	function formSearchcheck(){
   		var keyWord = $('#keyWord').val();
   		var keyOption = $('#keyOption').val();
   		var startDate = $('#startDate').val();
   		var endDate = $('#endDate').val();
   		console.log("startDate:"+startDate);
   		console.log("endDate:"+endDate);
/* 		if (keyWord == '' ||keyWord == null) { 
			alert('검색어를 입력하세요.'); 
			formSearch.keyWord.focus();
			return false;
			}else if (startDate == ''||startDate == null) { 
				alert('검색어를 입력하세요.'); 
				formSearch.startDate.focus();
				return false;
			}else if (endDate == ''||endDate == null) { 
				alert('검색어를 입력하세요.'); 
				formSearch.endDate.focus();
				return false;
				}else{ */
		 var checkformSearch = $.ajax({
	            type : "GET",
	            data : {startDate : startDate
	            	, endDate : endDate
/* 	            	, keyWord : keyWord
	            	, keyOption : keyOption */},
	            url : "${pageContext.request.contextPath}/bloodPressureSearch",
	            dataType : "json",
	            contentType: "application/json; charset=UTF-8"
		 });  
		checkformSearch.done(function(data){
			console.log("ajax실행완료");
			console.log(data);
			alert(data.list);
			if(data!=undefined && Array.isArray(data)){
				for(var i=0; i<data.list.lenght; i++){
					var html = '<tr>';
					html += '<td>'+data.list[i].bloodPressureNo+'</td>';
					html += '<td>'+data.list[i].bloodPressureDate+'</td>'; 
					html += '<td>'+data.list[i].systolicPressure+'</td>';
					html += '<td>'+data.list[i].diastolicPressure+'</td>';
				}
				$('#startdate').html('data.startDate');
				$('#enddate').html('data.endDate');
				$('#listDatas').append(html);
			}
			
		});
		checkformSearch.fail(function(jqXHR, textStatus){
			alert( "Request failed: " + textStatus );
		});
	}
  	 	
</script>
</head>
<body>
<h1>bloodPressureList</h1>
   <!-- 검색 -->   		
   <form id="formSearch" name="formSearch"> 
        날짜검색<br>
        <input type="text" id="startDate" name="startDate" placeholder="0000-00-00"> ~ <input type="text" name="endDate" id="endDate" placeholder="0000-00-00"><br>
<%-- 		<select name="keyOption" size="1">
            <option value="systolicPressure" <c:if test="${'systolicPressure'==keyOption }"> selected</c:if>>수축기혈압</option>
            <option value="diastolicPressure" <c:if test="${'diastolicPressure'==keyOption }"> selected</c:if>>이완기혈압</option>
        </select>
		<input type="text" id="keyWord" name="keyWord" value="${keyWord }"/>  --%>
      <button type="submit" onclick="formSearchcheck()">검색</button>
      </form>
      <span id="startdate"></span>
      <span id="enddate"></span>

			<table>		
				<thead>
					<tr>
						<th>번호</th>
						<th>수축기</th>
						<th>이완기</th>
						<th>날짜</th>
						<th>수정</th>
						<th>삭제</th>
	
					</tr>
				</thead>
				<tbody id="listDatas"></tbody>
			</table>

		<table>		
			<thead>
				<tr>
					<th>번호</th>
					<th>수축기</th>
					<th>이완기</th>
					<th>날짜</th>
					<th>수정</th>
					<th>삭제</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="bloodPressure" items="${list}">
					<tr>
						<td>${bloodPressure.bloodPressureNo }</td>
						<td>${bloodPressure.bloodPressureDate}</td>
						<td>${bloodPressure.systolicPressure }</td>
						<td>${bloodPressure.diastolicPressure }</td>
						<td><a type="button" href="${pageContext.request.contextPath}/modifyBloodPressure?bloodPressureNo=${bloodPressure.bloodPressureNo}" id="buttonModify">수정</a></td>
						<td><a type="button" href="${pageContext.request.contextPath}/deleteBloodPressure?bloodPressureNo=${bloodPressure.bloodPressureNo}" id="buttonDelete">삭제</a></td>
					</tr>
				</c:forEach>
			</tbody>	
		</table>
		<a id="addBloodPressure" href="${pageContext.request.contextPath}/addBloodPressure">혈압등록하기</a>
		<a id="bloodPressureChart" href="${pageContext.request.contextPath}/bloodPressureChart?memberNo=member_1">내 혈당 그래프 보기</a>
		<nav>
			<ul class="pagination pagination-sm">
				<c:if test="${currentPage > 10}">
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
</body>
</html>