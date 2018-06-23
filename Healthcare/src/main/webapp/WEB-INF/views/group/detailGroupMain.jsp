<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>detailGroupMain</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="bootstrap-switch.js" ></script>
<!-- jQuery -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript">
	var groupName = $('#groupName').val();
	var groupNo = $('#groupNo').val();
	var memberNo = $('#memberNo').val();
	
		function groupDetail() {
		    location.href="${pageContext.request.contextPath}/groupDetail?groupNo="+groupNo;
		}   
		
		function groupCalendar() {
		    location.href="${pageContext.request.contextPath}/groupMembersList?groupName="+groupName;
		}   
		
		function groupRelation() {
		    location.href="${pageContext.request.contextPath}/groupMemberRelation?groupName="+groupName;
		}   
		
		function groupMemberInvite() {
		    location.href="${pageContext.request.contextPath}/inviteMemberForm?groupNo="+groupNo;
		}   
		
		function inviteGroupMemberList() {
		    location.href="${pageContext.request.contextPath}/inviteMemberList?groupNo="+groupNo;
		}   
		
		function groupMemberList() {
		    location.href="${pageContext.request.contextPath}/groupMembersList?groupName="+groupName;
		}   
		function groupMain() {
		    location.href="${pageContext.request.contextPath}/groupMain?memberNo="+memberNo;
		}   
		function groupMemberOut() {
		    location.href="${pageContext.request.contextPath}/groupOut?memberNo="memberNo;
		}
		$("[name='checkbox1']").change(function() {
			if(!confirm('Do you wanna cancel me!')) {
				this.checked = true;
			}
		});
		$("[name='checkbox1']").bootstrapSwitch();
		
		$("[name='checkbox1']").bootstrapSwitch({
			on: 'On',
			off: 'Off ',
			size: 'md'
		});
//토글버튼 추가하기(자기정보온오프,) 그룹메인 또는 다른곳에 만들기
</script>
<style type="text/css">

</style>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
			<input type="hidden" id="groupNo" value="${detailGroup.groupNo}">
			<input type="hidden" id="groupName" value="${groupName}">
			<input type="hidden" id="memberNo" value="${memberNo}">
			<!-- 개인정보 on/off  -->
			<label class="switch">
			  <input type="checkbox">
			  <span class="slider round"></span>
			</label>
			<p id="">OFF</p><p style="display:none;">ON</p>
			<!--  -->
				<div class="btn-group" role="group" aria-label="...">
					<input type="button" onclick="groupDetail()" class="btn btn-default" value="그룹상세">
					<button onclick="groupCalendar()" class="btn btn-default">그룹캘린더</button>
					<button onclick="groupRelation()" class="btn btn-default">그룹관계도</button>
					<button onclick="groupMemberList()" class="btn btn-default">회원리스트</button>
					<c:if test="${result >0 }">
						<button type="button" onclick="groupMemberInvite()" class="btn btn-default">회원초대하기</button>
						<button type="button" onclick="inviteGroupMemberList()" class="btn btn-default">그룹에초대한멤버</button>
					</c:if>
					<button onclick="groupMemberOut()" class="btn btn-default">탈퇴하기</button>
					<button onclick="groupMain()" class="btn btn-default">그룹메인으로</button>
				</div>
				<div>
					<div class="row">
						<div class='col-sm-10'>
							<div class="panel panel-default">
								<div class="panel-heading"><h3 class="panel-title">그룹소개</h3></div>
								<div class="panel-body">
									${detailGroup.groupInfo }
								</div>
							</div>							  	
						</div>
					</div>
					<div class="row">
					 <div class='col-sm-10'>
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="row">
							<!-- 복약 -->
								  <div class='col-sm-6'>
								  <div class="panel panel-default">
								  	<div class="panel-heading">
								  		<h4 class="panel-title">
								  			<span>복약</span>&nbsp;<span class="badge">42</span>&nbsp;<span><a href="#">more</a></span>
								  		</h4>
								  	</div>
								  	<table class="table">
										<c:if test="${historyMedicineCount>0 }">
											<table class="table">	
												<c:forEach var="addHistoryMedicine" items="${addHistoryMedicine }">
													<tr>
														<td>${addHistoryMedicine.memberName }회원님이  글을 등록하셨습니다.</td>
													</tr>
												</c:forEach>
											</table>
										</c:if >
										<c:if test="${historyMedicineCount==0 }">
											<td>히스토리가 없습니다.</td>
										</c:if>
									</table>
									</div>
			  					</div><!-- 복약 End -->
			  					<!-- 진료 -->
								<div class='col-sm-6'>
								<div class="panel panel-default">
								  	<div class="panel-heading">
								  		<h4 class="panel-title">
								  			<span>진료</span>&nbsp;<span class="badge">42</span>&nbsp;<span><a href="#">more</a></span>
								  		</h4>
								  	</div>
									<table class="table">
										<c:if test="${historyTreatmemtCount>0 }">
											<c:forEach var="addHistoryTreatmemt" items="${addHistoryTreatmemt }">
												<tr>
													<td>${addHistoryTreatmemt.memberName }회원님이  글을 등록하셨습니다.</td>
											</c:forEach>
										</c:if>
											<c:if test="${historyTreatmemtCount == 0 }">
											<td>히스토리가 없습니다.</td>
										</c:if>
									</table>
									</div>
			  					</div><!-- 진료 End -->
			  				</div>
			  				<div class="row">
			  				<!-- 건강검진 -->
			  					<div class='col-sm-6'>
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title">
												<span>건강검진</span>&nbsp;<span class="badge">42</span>&nbsp;<span><a href="#">more</a></span>
											</h4>
										</div>
										<table class="table">
											<c:if test="${historyHealthScreenCount>0 }">
												<c:forEach var="addHistoryHealthScreen" items="${addHistoryHealthScreen }">
													<tr>
														<td>${addHistoryHealthScreen.memberName }회원님이  글을 등록하셨습니다.</td>
													</tr>
												</c:forEach>
											</c:if>
											<c:if test="${historyHealthScreenCount==0 }">
												히스토리가 없습니다.
											</c:if>
										</table>
									</div>
			  					</div><!-- 건강검진 End -->
			  					<!-- 건강설문 -->
			  					<div class='col-sm-6'>
			  						<div class="panel panel-default">
								  		<div class="panel-heading">
								  			<h4 class="panel-title">
								  				<span>건강설문</span>&nbsp;<span class="badge">42</span>&nbsp;<span><a href="#">more</a></span>
								  			</h4>
								  		</div>
				  						<table class="table">
											<c:if test="${historyHealthSurveyCount>0 }">
												<c:forEach var="addHistoryHealthSurvey" items="${addHistoryHealthSurvey }">
													<tr>
														<td>${addHistoryHealthSurvey.memberName }회원님이 글을 등록하셨습니다.</td>
													</tr>
												</c:forEach>
											</c:if>
											<c:if test="${historyHealthSurveyCount==0 }">
												히스토리가 없습니다.
											</c:if>
										</table>
									</div>
			  					</div><!-- 건강설문 End -->
				  			</div>
						</div>
						</div>
					</div>
				</div><!-- groupHistory End -->
			</div>
		</div>
		</div>
	</div>
</body>
</html>