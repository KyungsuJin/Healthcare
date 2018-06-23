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

</head>
<body>
	<h1>NoticeList</h1>
     
	<form id="formSearch" name="formSearch"> 
        날짜검색<br>
        <input type="text" id="startDate" name="startDate" placeholder="0000-00-00"> ~ <input type="text" name="endDate" id="endDate" placeholder="0000-00-00"><br>
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
				<td><a href="${pageContext.request.contextPath}/noticeSearch?noticeNo=${notice.noticeNo}">${notice.noticeContent}</a></td>
				<td>${notice.memberNo}</td>
				<td>${notice.noticeTitle}</td>
				<td>${notice.noticeContent }</td>
				<td>${notice.noticeCount }</td>
				<td>${notice.noticeDate }</td>
				<td></td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
	 
	<table>
		<thead>
			<tr>
				<th>제목</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="notice" items="${list}">
				<tr>
					 <td><a href="${pageContext.request.contextPath}/noticeListDetail?noticeNo=${notice.noticeNo}" id="noticeListDetail">${notice.noticeTitle}</a></td>
				</tr>
			</c:forEach>	
		</tbody>
	</table>
	<a id="addNotice" href="${pageContext.request.contextPath}/addNotice">공지 등록하기</a>
	
	<nav>
			<ul class="pagination pagination-sm1">
				<c:if test="${currentPage > 10}">
					<li>
						<a aria-label="first" href="${pageContext.request.contextPath }/notice/noticeList?currentPage=1">&laquo;</a>
					</li>
				</c:if>
				<c:if test="${firstBlockPage > 2}">
					<li>
						<a aria-label="first" href="${pageContext.request.contextPath }/notice/noticeList?currentPage=${firstBlockPage-1}">&lsaquo;</a>
					</li>
				</c:if>
					<li>
					<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
						<a href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${i}">${i}</a>				
					</c:forEach>		
					</li>
				<c:if test="${lastBlockPage < totalBlock}">
					<li>
						<a aria-label="last" href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${lastBlockPage+1}">&rsaquo;</a>
					</li>
				</c:if>
				<c:if test="${currentPage < lastPage}">
					<li>
						<a aria-label="last" href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${lastPage}">&raquo;</a>
					</li>
				</c:if>
			</ul>
		</nav>


</body>
</html>