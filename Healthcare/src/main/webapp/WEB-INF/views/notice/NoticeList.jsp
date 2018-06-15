<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BloodsugarList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
         url : "${pageContext.request.contextPath}/noticeSearch",
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
				html += '<td>'+data.list[i].noticeno+'</td>';
				html += '<td>'+data.list[i].memberno+'</td>'; 
				html += '<td>'+data.list[i].noticetitle+'</td>';
				html += '<td>'+data.list[i].noticecontent+'</td>';
				html += '<td>'+data.list[i].noticedate+'</td>';
				html += '<td>'+data.list[i].getNoticeno+'</td>';
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




<!-- <script>
function changehtml(){
	var property = $("#searchOption").val();
	var show = $("#keyword");
		$("#keyword").html('<input type="text" name="keyword">');
}

</script> -->
<!-- 
 <script>
 
    $(document).ready(function(){
    	 $('#searchBtn').click(function(){
			var searchValue = jQuery('#formSearch #searchValue').val(); 
			if (searchValue == '') { 
				alert('검색어를 입력하세요.'); 
				} else { 
					jQuery('#formSearch').submit(); 
				} 
			JQuery('#formSearch #searchType value').val('${mapSearch.searchType}');
		});
	});
</script> -->
</head>
<body>
	<h1>NoticeList</h1>
        <%--  <form action="${pageContext.request.contextPath}/searchNoticeList" method="get">
										<select id="searchOption" name="searchOption" onclick="changehtml();">											
											<option value="notice_title"  <c:out value="${searchOption == 'notice_title'?'selected':''}"/>>제목</option>
											<option value="notice_content"  <c:out value="${searchOption == 'notice_content'?'selected':''}"/>>내용</option>											
											<option value="item_price"  <c:out value="${searchOption == 'item_price'?'selected':''}"/>>상품가격</option>		
										</select>
										<dr id="keyword"></dr>
										<input type="submit" value="검색버튼" >
									</form>
    
    </form>     --%>
	<%-- <form id="NoticeList" action="${pageContext.request.contextPath}/NoticeList" method="POST">
	<!-- 검색 -->
	<form id="formSearch" name="formSearch"  action="${pageContext.request.contextPath}/NoticeSearch" method="post"> 
		<select id="searchType" name="searchType"> 
		<option value="noticetitle" selected="noticetitle">제목으로검색</option> 
		<option value="noticedate" selected="noticedate">입력날짜로검색</option> 
		</select>		
		<input type="text" id="searchValue" name="searchValue" value="${mapSearch.searchType}"/> 
		<button type="button" id="searchBtn">검색</button> 
	</form> --%>
	 
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
						<th>공지번호</th>
						<th>멤버코드</th>
						<th>제목</th>
						<th>내용</th>
						<th>조회수</th>
						<th>등록시간</th>
	
					</tr>
				</thead>
				<tbody>
				<c:forEach var = "notice" items = "${list}">
					<tr>
						<td><a href="${pageContext.request.contextPath}/noticeSearch?noticeno=${notice.noticeno}">${notice.noticecontent}</a></td>
						<td>${notice.memberno}</td>
						<td>${notice.noticetitle}</td>
						<td>${notice.noticecontent }</td>
						<td>${notice.noticecount }</td>
						<td>${notice.noticedate }</td>
						<td></td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
	 
	 
	 
	<table>
		<thead>
			<tr>
				<th>공지사항코드</th>
				<th>회원코드</th>
				<th>제목</th>
				<th>내용</th>
				<th>조회수</th>
				<th>등록시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="notice" items="${list}">
				<tr>
					<td>${notice.noticeno}</td>
					<td>${notice.memberno}</td>
					<td>${notice.noticetitle }</td>
					<td>${notice.noticecontent }</td>
					<td>${notice.noticecount }</td>
					<td>${notice.noticedate }</td>
					 <td><a type="button" href="${pageContext.request.contextPath}/modifyNotice?noticeno=${notice.noticeno}" id="buttonModify">수정</a></td> 
					 <td><a type="button" href="${pageContext.request.contextPath}/deleteNotice?noticeno=${notice.noticeno}" id="buttonDelete">삭제</a></td> 
				</tr>
			</c:forEach>	
		</tbody>
	</table>
	<a id="addNotice" href="${pageContext.request.contextPath}/addNotice">공지 등록하기</a>
	
	

	<nav>
			<ul class="pagination pagination-sm1">
				<c:if test="${currentPage > 10}">
					<li>
						<a aria-label="first" href="${pageContext.request.contextPath }/notice/NoticeList?currentPage=1">&laquo;</a>
					</li>
				</c:if>
				<c:if test="${firstBlockPage > 2}">
					<li>
						<a aria-label="first" href="${pageContext.request.contextPath }/notice/NoticeList?currentPage=${firstBlockPage-1}">&lsaquo;</a>
					</li>
				</c:if>
					<li>
					<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
						<a href="${pageContext.request.contextPath}/Notice/noticeList?currentPage=${i}">${i}</a>				
					</c:forEach>		
					</li>
				<c:if test="${lastBlockPage < totalBlock}">
					<li>
						<a aria-label="last" href="${pageContext.request.contextPath}/Notice/noticeList?currentPage=${lastBlockPage+1}">&rsaquo;</a>
					</li>
				</c:if>
				<c:if test="${currentPage < lastPage}">
					<li>
						<a aria-label="last" href="${pageContext.request.contextPath}/Notice/noticeList?currentPage=${lastPage}">&raquo;</a>
					</li>
				</c:if>
			</ul>
		</nav>


</body>
</html>