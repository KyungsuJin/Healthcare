<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>groupMemberList</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript">
var groupNo = $('#groupNo').val();
console.log("groupNo:"+groupNo);
$(document).ready(function(){
    ajaxData();
});	
	function ajaxData() {
	
		var request = $.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/groupMemberRelationChart?groupName="+groupName
	    });   
	//ajax 실행 값 확인
	request.done(function( msg ) {
		//받아온 데이터 값 확인. 
		console.log(msg);
	
	google.charts.load('current', {packages:["orgchart"]});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var createMemb = msg.createMemb;
		var relationMember = msg.groupRelationMember;
		if(relationMember!=undefined && Array.isArray(relationMember)){
			console.log('array 확인');
			console.log(relationMember);
			console.log(relationMember.length);
			for(var i=0; i < relationMember.length; i++){
			console.log("memberId:"+relationMember[i].memberId);
			}
		}else{
			console.log('데이터 없음');
			console.log(msg);
		}
	var data = new google.visualization.DataTable();
	data.addColumn('string', 'Name');//하위그룹
	data.addColumn('string', 'Manager');//상위그룹
	data.addColumn('string', 'ToolTip');
	data.addRow([{v:createMemb , f: '<p>'+createMemb+'</p>'+'<div style=" color:#5D5D5D; font-style:bold">그룹장</div>'},'','그룹장']);
	data.addRow([{v:relationMember[0].memberId , f: '<p>'+relationMember[0].memberName+'</p>'+'<div style=" color:#5D5D5D; font-style:bold">그룹원</div>'},createMemb,'']);
	data.addRow([{v:relationMember[1].memberId , f: '<p>'+relationMember[1].memberName+'</p>'+'<div style=" color:#5D5D5D; font-style:bold">그룹원</div>'},createMemb,'']);
	 for(var i=2; i < relationMember.length; i++){
		 data.addRow([{v:relationMember[i].memberId, f: '<p>'+relationMember[i].memberName+'</p>'+'<div style=" color:#5D5D5D; font-style:bold">그룹원</div>'},relationMember[i-1].memberId,'']);
		 data.addRow([{v:relationMember[1].memberId , f: '<p>'+relationMember[1].memberName+'</p>'+'<div style=" color:#5D5D5D; font-style:bold">그룹원</div>'},relationMember[i-2].memberId,'']);
		} //v: 연결되는 아이디 값. f: 화면에 보여지는 부분, ['하위그룹','상위그룹Id','']
		console.log(data);
	
	// Create the chart.
	var chart = new google.visualization.OrgChart(document.getElementById('chart_div'));
	// Draw the chart, setting the allowHtml option to true for the tooltips.
	chart.draw(data, {allowHtml:true,nodeClass:'maman'});
	}
	});
	
	request.fail(function( jqXHR, textStatus ) {
		  alert( "Request failed: " + textStatus );
		});
	}

	function inviteMemberBtn() {
		location.href="${pageContext.request.contextPath}/inviteMemberForm?groupNo="+groupNo;
	}   
	function groupCalendar() {
		var groupNo = $('#groupNo').val();
		console.log("groupNo:"+groupNo);
		location.href="${pageContext.request.contextPath}/groupCalendar?groupNo="+groupNo;
	}   
	//체크박스 전체선택
	function checkAll(){
	    if( $('#selectAll').is(':checked') ){
	      $('input:checkbox[name=groupMemberCheck]').prop('checked', true);
	    }else{
	      $('input:checkbox[name=groupMemberCheck]').prop('checked', false);
	    }
	}
	//선택해서 삭제하기
	function outGroupMember(){
	  $('input:checkbox[name="groupMemberCheck"]:checked').each(function() {
		var memberNo = $(this).val();
		console.log('memberNo:'+memberNo);
		if(memberNo == ''){
			    alert('추방할 회원을 선택하세요.');
			    return false;
		}else{
			if(confirm('추방하시겠습니까?')){
				alert('회원이 추방 되었습니다.');
				location.href="${pageContext.request.contextPath}/outGroupMember?memberNo="+memberNo;
			}
		}	
	  });
	}

</script>
<style type="text/css">
.maman {
	background : linear-gradient( to bottom, lightgray, white );
	color: black;
	width: 150px;
	height: 80px;
	text-align: center;
	border-radius: 5px;
	font-size: 2.5em;
/* 	border-width: 1px 20px 1px 20px; */
}
div {
    font-size: 15px;
}
p {
    font-size: 24px;
}
.google-visualization-orgchart-lineleft {
	border-left: 1px solid #333!important;
}
.google-visualization-orgchart-linebottom {
	border-bottom: 1px solid #333!important;
}
.google-visualization-orgchart-lineright {
	border-right: 1px solid #333!important;
}
</style>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<div id="chart_div"></div>
				<h1>그룹에 가입한 회원 리스트</h1>
				<c:choose>
					<c:when test="${memberCountResult>0 }">
						총 ${memberCountResult }명의 회원이 있습니다.
						<table class="table table-hober">
							<thead>
								<tr>
									<th><input type="checkbox" name="selectAll" id="selectAll" onclick="checkAll();"></th>
									<th>회원아이디</th>
									<th>회원명</th>
									<th>개인정보공개유무</th>
									<th>가입일</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="groupMember" items="${list }">
								<tr>
									<td><input type="checkbox" name="groupMemberCheck" value="${groupMember.memberNo}"/></td>
									<td>${groupMember.memberId }</td>
									<td>${groupMember.memberName }</td>
									<td>${groupMember.personalInformationApproval }</td>
									<td>${groupMember.groupInviteApprovalDate }</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<div align="left">
							<input type="hidden" id="groupNo" value="${groupNoSend }">
							<input type="button" class="btn btn-primary" onclick="outGroupMember()" value="회원추방하기">
						</div>
						<div align="right">
						<input type="button" class="btn btn-primary" onclick="groupCalendar()" value="그룹캘린더보기">
						<input type="button" class="btn btn-primary" onclick="inviteMemberBtn()" value="회원초대하기">
						</div>
						<div align="center">
						<nav>
							<ul class="pagination pagination-sm">
								<c:if test="${currentPage > 10}">
									<li>
										<a aria-label="first" href="${pageContext.request.contextPath }/groupMemberList?currentPage=1">&laquo;</a>
									</li>
								</c:if>
								<c:if test="${firstBlockPage > 2}">
									<li>
										<a aria-label="first" href="${pageContext.request.contextPath }/groupMemberList?currentPage=${firstBlockPage-1}">&lsaquo;</a>
									</li>
								</c:if>
								<c:forEach var="i" begin="${firstBlockPage}" end="${lastBlockPage}" step="1">
									<c:if test="${currentPage == i}">
									<li class="active">
									</c:if>
									<c:if test="${currentPage != i}">
									<li class="">
									</c:if>
										<a href="${pageContext.request.contextPath}/groupMemberList?currentPage=${i}">${i}</a>	
									</li>
								</c:forEach>	
								<c:if test="${lastBlockPage < totalBlock}">
									<li>
										<a aria-label="last" href="${pageContext.request.contextPath}/groupMemberList?currentPage=${lastBlockPage+1}">&rsaquo;</a>
									</li>
								</c:if>
								<c:if test="${currentPage < lastPage}">
									<li>
										<a aria-label="last" href="${pageContext.request.contextPath}/groupMemberList?currentPage=${lastPage}">&raquo;</a>
									</li>
								</c:if>
							</ul>
						</nav>
						</div>	
					</c:when>
					<c:otherwise>
						<input type="hidden" id="groupNo" value="${groupNoSend }">
						현재 그룹에 회원이 없습니다. 회원을 초대하시겠습니까?
						<input type="button" class="btn btn-primary"  onclick="inviteMemberBtn()" value="회원초대하기">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>